return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
        { 'ghl', ':Gitsigns next_hunk<CR>', desc = 'Next git hunk' },
        { 'ghh', ':Gitsigns prev_hunk<CR>', desc = 'Previous git hunk' },
        { 'gsh', ':Gitsigns stage_hunk<CR>', desc = 'Stage hunk' },
        { 'grh', ':Gitsigns reset_hunk<CR>', desc = 'Reset hunk' },
        { 'gph', ':Gitsigns preview_hunk<CR>', desc = 'Preview hunk' },
        { 'ghb', ':Gitsigns blame_line<CR>', desc = 'Blame line' },
        { 'ghB', ':Gitsigns blame<CR>', desc = 'Blame' },
        { 'ghd', ':Gitsigns diffthis<CR>', desc = 'Diff this' },
        { 'gtb', ':Gitsigns toggle_current_line_blame<CR>', desc = 'Toggle line blame' },
        { 'gtw', ':Gitsigns toggle_word_diff<CR>', desc = 'Toggle word diff' },
    },
}
