return {
    'chrisgrieser/nvim-justice',
    keys = {
        {
            'gj',
            function()
                require('justice').select()
            end,
            desc = 'Run just recipe',
        },
    },
}
