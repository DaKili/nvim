return {
    'ibhagwan/fzf-lua',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
        require('fzf-lua').register_ui_select()
    end,
    opts = {
        files = {
            rg_opts = '--color=never --files --hidden --follow '
                .. '-g "!.git/" '
                .. '-g "!node_modules/" '
                .. '-g "!.git" '
                .. '-g "!node_modules"',
        },
        grep = {
            rg_opts = '--color=never --line-number --hidden --follow '
                .. '--column --smart-case '
                .. '-g "!.git/" '
                .. '-g "!node_modules/" '
                .. '-g "!.git" '
                .. '-g "!node_modules"',
            silent = true,
        },
    },
    keys = {
        {
            '<C-o>',
            function()
                require('fzf-lua').files()
            end,
            desc = 'Find files in project directory.',
        },
        {
            '<C-b>',
            function()
                require('fzf-lua').buffers()
            end,
            desc = 'Find files in open buffers.',
        },
        {
            '<leader>fg',
            function()
                require('fzf-lua').live_grep()
            end,
            desc = '[f]ind files by [g]repping project directory.',
        },
        {
            '<leader>fc',
            function()
                require('fzf-lua').files({ cwd = '~/.config' })
            end,
            desc = 'Find files within my .config.',
        },
        {
            '<leader>fh',
            function()
                require('fzf-lua').helptags()
            end,
            desc = 'Find within neovim help.',
        },
        {
            '<leader>fk',
            function()
                require('fzf-lua').keymaps()
            end,
            desc = 'Find keymaps.',
        },
        {
            '<leader>fb',
            function()
                require('fzf-lua').builtin()
            end,
            desc = 'Find builtin fuzzy finders.',
        },
        {
            '<leader>fw',
            function()
                require('fzf-lua').grep_cword()
            end,
            desc = 'Find word.',
        },
        {
            '<leader>fW',
            function()
                require('fzf-lua').grep_cWORD()
            end,
            desc = 'Find Word.',
        },
        {
            'gd',
            function()
                local fzf = require('fzf-lua')
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                local offset_encoding = clients[1] and clients[1].offset_encoding or 'utf-16'
                local params = vim.lsp.util.make_position_params(0, offset_encoding)
                local current_uri = vim.uri_from_bufnr(0)
                local current_line = params.position.line

                local function jump_to_location(loc)
                    local uri = loc.uri or loc.targetUri
                    local range = loc.range or loc.targetSelectionRange
                    local bufnr = vim.uri_to_bufnr(uri)
                    vim.bo[bufnr].buflisted = true
                    vim.api.nvim_set_current_buf(bufnr)
                    vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
                end

                local function show_references()
                    local ref_params = {
                        textDocument = { uri = current_uri },
                        position = params.position,
                        context = { includeDeclaration = false },
                    }

                    vim.lsp.buf_request(0, 'textDocument/references', ref_params, function(err, result)
                        if err or not result or #result == 0 then
                            vim.notify('No references found', vim.log.levels.INFO)
                            return
                        end

                        if #result == 1 then
                            jump_to_location(result[1])
                        else
                            fzf.lsp_references()
                        end
                    end)
                end

                vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result)
                    if err or not result or vim.tbl_isempty(result) then
                        show_references()
                        return
                    end

                    local defs = vim.islist(result) and result or { result }

                    for _, def in ipairs(defs) do
                        local uri = def.uri or def.targetUri
                        local range = def.range or def.targetSelectionRange

                        if uri == current_uri and range then
                            if current_line >= range.start.line and current_line <= range['end'].line then
                                show_references()
                                return
                            end
                        end
                    end

                    if #defs == 1 then
                        jump_to_location(defs[1])
                    else
                        fzf.lsp_definitions()
                    end
                end)
            end,
            desc = 'Smart go to definition/references',
        },
    },
}
