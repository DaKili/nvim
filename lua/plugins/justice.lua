return {
    'chrisgrieser/nvim-justice',
    keys = {
        {
            '<leader>j',
            function()
                require('justice').select()
            end,
            desc = 'Run just recipe',
        },
    },
}
