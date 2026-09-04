return {
    'stevearc/conform.nvim',
    opts = function()
        return {
            async = true,
            formatters = {
                oxfmt = {
                    prepend_args = function()
                        local prettierrc = vim.fs.find({ '.prettierrc', '.prettierrc.json' }, {
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
            formatters_by_ft = require('config.stacks').getFormatters(),
        }
    end,
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
