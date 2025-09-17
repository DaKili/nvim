return {
    'ibhagwan/fzf-lua',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
        files = {
            rg_opts = "--color=never --files --hidden -g '!.git' -g '!node_modules'",
        },
        grep = {
            rg_opts = "--color=never --hidden -g '!.git' -g '!node_modules'",
        },
    },

    keys = {
        {
            '<C-o>',
            function()
                require('fzf-lua').files()
            end,
            desc = 'Find files in project directory.',
        },
        {
            '<C-b>',
            function()
                require('fzf-lua').buffers()
            end,
            desc = 'Find files in open buffers.',
        },
        {
            '<leader>fg',
            function()
                require('fzf-lua').live_grep()
            end,
            desc = '[f]ind files by [g]repping project directory.',
        },
        {
            '<leader>fc',
            function()
                require('fzf-lua').files({ cwd = '~/.config' })
            end,
            desc = 'Find files within my .config.',
        },
        {
            '<leader>fh',
            function()
                require('fzf-lua').helptags()
            end,
            desc = 'Find within neovim help.',
        },
        {
            '<leader>fk',
            function()
                require('fzf-lua').keymaps()
            end,
            desc = 'Find keymaps.',
        },
        {
            '<leader>fb',
            function()
                require('fzf-lua').builtin()
            end,
            desc = 'Find builtin fuzzy finders.',
        },
        {
            '<leader>fw',
            function()
                require('fzf-lua').grep_cword()
            end,
            desc = 'Find word.',
        },
        {
            '<leader>fW',
            function()
                require('fzf-lua').grep_cWORD()
            end,
            desc = 'Find Word.',
        },
    },
}
