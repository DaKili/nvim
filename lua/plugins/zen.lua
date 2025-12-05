return {
    'folke/zen-mode.nvim',
    opts = {
        window = {
            backdrop = 0.95,
            width = 120,
            height = 1,
        },
    },
    keys = {
        {
            '<leader>z',
            function()
                require('zen-mode').toggle()
            end,
            desc = 'Toggle Zen Mode',
        },
    },
}
