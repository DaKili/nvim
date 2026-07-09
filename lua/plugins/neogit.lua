return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim', -- required
        'sindrets/diffview.nvim',
        'ibhagwan/fzf-lua', -- optional
    },
    opts = {},
    keys = {
        {
            '<leader>gg',
            function()
                require('neogit').open()
            end,
            desc = 'Open Neogit',
        },
    },
}
