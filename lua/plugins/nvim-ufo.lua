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
                if vim.fn.foldclosed(vim.fn.line('.')) == -1 then
                    vim.cmd('foldclose')
                else
                    vim.cmd('foldopen')
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
