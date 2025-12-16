return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim', -- required
        'sindrets/diffview.nvim',
        'ibhagwan/fzf-lua', -- optional
    },
    keys = {
        {
            '<leader>g',
            function()
                require('neogit').open()
            end,
            desc = 'Open Neogit'
        },
    },
}
