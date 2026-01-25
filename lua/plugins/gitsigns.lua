return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {},
    keys = {
        {
            'ghl',
            function() require('gitsigns').next_hunk() end,
            desc = 'Next git hunk'
        },
        {
            'ghh',
            function() require('gitsigns').prev_hunk() end,
            desc = 'Previous git hunk'
        },
        {
            'gsh',
            function() require('gitsigns').stage_hunk() end,
            desc = 'Stage hunk'
        },
        {
            'grh',
            function() require('gitsigns').reset_hunk() end,
            desc = 'Reset hunk'
        },
        {
            'gph',
            function() require('gitsigns').preview_hunk() end,
            desc = 'Preview hunk'
        },
        {
            'ghb',
            function() require('gitsigns').blame_line() end,
            desc = 'Blame line'
        },
        {
            'ghd',
            function() require('gitsigns').diffthis() end,
            desc = 'Diff this'
        },
        {
            'gtb',
            function() require('gitsigns').toggle_current_line_blame() end,
            desc = 'Toggle line blame'
        },
        {
            'gtw',
            function() require('gitsigns').toggle_word_diff() end,
            desc = 'Toggle word diff'
        },
    },
}
