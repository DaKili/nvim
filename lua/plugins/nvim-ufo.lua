return {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufReadPost',
    opts = {
        provider_selector = function()
            return { 'treesitter', 'indent' }
        end,
    },
    init = function()
        vim.o.foldcolumn = '0'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
    end,
    keys = {
        {
            '<C-f>',
            function()
                local line = vim.fn.line('.')
                if vim.fn.foldlevel(line) == 0 then return end
                if vim.fn.foldclosed(line) ~= -1 then
                    vim.cmd('foldopen')
                else
                    vim.cmd('foldclose')
                end
            end,
            desc = 'Toggle fold at cursor',
        },
        {
            'zR',
            function()
                require('ufo').openAllFolds()
            end,
            desc = 'Open all folds',
        },
        {
            'zK',
            function()
                require('ufo').peekFoldedLinesUnderCursor()
            end,
            desc = 'Peek fold',
        },
    },
}
