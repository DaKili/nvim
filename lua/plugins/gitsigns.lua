return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {},
    keys = {
        {
            '<leader>hl',
            function() require('gitsigns').next_hunk() end,
            desc = '[H]unk: next'
        },
        {
            '<leader>hh',
            function() require('gitsigns').prev_hunk() end,
            desc = '[H]unk: previous'
        },
        {
            '<leader>hs',
            function() require('gitsigns').stage_hunk() end,
            desc = '[H]unk: stage'
        },
        {
            '<leader>hr',
            function() require('gitsigns').reset_hunk() end,
            desc = '[H]unk: reset'
        },
        {
            '<leader>hp',
            function() require('gitsigns').preview_hunk() end,
            desc = '[H]unk: preview'
        },
        {
            '<leader>hb',
            function() require('gitsigns').blame_line() end,
            desc = '[H]unk: blame line'
        },
        {
            '<leader>hd',
            function() require('gitsigns').diffthis() end,
            desc = '[H]unk: diff this'
        },
        {
            '<leader>hA',
            function()
                require('gitsigns').setqflist('all', { open = false }, function()
                    require('fzf-lua').quickfix()
                end)
            end,
            desc = '[H]unk: [A]ll (project-wide) in fzf'
        },
        {
            '<leader>tb',
            function() require('gitsigns').toggle_current_line_blame() end,
            desc = '[T]oggle line [b]lame'
        },
        {
            '<leader>tw',
            function() require('gitsigns').toggle_word_diff() end,
            desc = '[T]oggle [w]ord diff'
        },
    },
}
