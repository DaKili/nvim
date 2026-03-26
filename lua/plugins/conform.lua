return {
    'stevearc/conform.nvim',
    opts = {
        async = true,
        formatters = {
            oxfmt = {
                prepend_args = function()
                    local prettierrc = vim.fs.find('.prettierrc', {
                        upward = true,
                        path = vim.fn.expand('%:p:h'),
                    })[1]
                    if prettierrc then
                        return { '-c', prettierrc }
                    end
                    return {}
                end,
            },
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            javascript = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
            typescript = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
            typescriptreact = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
            json = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
            html = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
            css = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
            scss = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
            go = { 'gofumpt' },
            rust = { 'rustfmt' },
            cs = { 'roslyn' },
        },
    },
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format({ async = true })
            end,
            desc = 'Format current file',
        },
    },
}
