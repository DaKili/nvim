return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    opts = {
        indent = {
            char = '▏',
            tab_char = '▏',
        },
        scope = { enabled = true },
    },
    config = function(_, opts)
        vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#3a3a3a' })
        vim.api.nvim_set_hl(0, 'IblScope', { fg = '#ee5396' })

        require('ibl').setup(opts)
    end,
}
