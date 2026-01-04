return {
    'rmagatti/auto-session',
    lazy = false,
    init = function()
        vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    },
    keys = {
        {
            '<leader>rs',
            ':AutoSession search<CR>',
            desc = 'Search recent sessions',
        },
    },
}
