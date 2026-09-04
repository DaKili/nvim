-- LSP Keymaps configuration
local function setup_lsp_keymaps(event)
    local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Core LSP mappings
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gca', require('fzf-lua').lsp_code_actions, '[G]oto [C]ode [A]ction', { 'n', 'x' })
    map('grr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
    map('gri', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
end

-- Document highlighting configuration
local function setup_document_highlighting(event, client)
    if not (client and client:supports_method('textDocument/documentHighlight')) then
        return
    end

    local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
        end,
    })
end

-- Diagnostic configuration
local function setup_diagnostics()
    vim.diagnostic.config({
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '󰅚 ',
                [vim.diagnostic.severity.WARN] = '󰀪 ',
                [vim.diagnostic.severity.INFO] = '󰋽 ',
                [vim.diagnostic.severity.HINT] = '󰌶 ',
            },
        },
        virtual_text = {
            source = 'if_many',
            spacing = 2,
        },
    })
end

-- Individual server configurations
local function setup_server_configs()
    for server, cfg in pairs(require('config.stacks').getLspConfigs()) do
        vim.lsp.config(server, cfg)
    end
end

-- Main plugin configuration
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'j-hui/fidget.nvim',
        'saghen/blink.cmp',
    },
    config = function()
        -- Setup completion capabilities
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- Setup all LSP components
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)

                setup_lsp_keymaps(event)
                setup_document_highlighting(event, client)
            end,
        })

        setup_diagnostics()
        setup_server_configs()
    end,
}
