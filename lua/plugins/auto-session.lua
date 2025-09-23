return {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    },
    keys = {
        {
            '<leader>rs',
            ':AutoSession search<CR>',
            desc = 'Format current file',
        }
    }
}
