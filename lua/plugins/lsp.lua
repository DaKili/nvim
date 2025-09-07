return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        'saghen/blink.cmp',
    },
    config = function()
        -- Setup capabilities for blink.cmp
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- LSP Attach autocommand
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- Core LSP mappings
                map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('gra', require('fzf-lua').lsp_code_actions, '[G]oto Code [A]ction', { 'n', 'x' })
                map('grr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
                map('gri', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
                map('grd', require('fzf-lua').lsp_typedefs, 'Type [D]efinition')
                map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('gO', require('fzf-lua').lsp_live_workspace_symbols, 'Workspace Symbols')

                local client = vim.lsp.get_client_by_id(event.data.client_id)

                -- Document highlighting
                if client and client.supports_method('textDocument/documentHighlight') then
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
            end,
        })

        -- Diagnostic configuration
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
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
            update_in_insert = false,
        })

        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'angularls',
            },
            automatic_enable = true, -- Mason-LSPConfig v2 auto-enables servers by default
        })

        -- Ensure tools are installed
        require('mason-tool-installer').setup({
            ensure_installed = {
                'stylua',
                'prettierd',
                'prettier',
            }
        })

        -- Global LSP settings (applies to all clients)
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- Configure individual LSP servers using the new vim.lsp.config API
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                            "${3rd}/luv/library",
                        },
                        checkThirdParty = false,
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                    telemetry = { enable = false },
                    completion = { callSnippet = 'Replace' },
                },
            },
        })

        vim.lsp.config('angularls', {})

    end,
}
