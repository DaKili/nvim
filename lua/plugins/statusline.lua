return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            section_separators = '',
            component_separators = '|',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics', 'filename' },
            lualine_c = {},
            lualine_x = {
                'fileformat', -- remove in the future
                { 'filetype', icon_only = false, colored = true, icon = { align = 'left' } },
                'progress',
            },
            lualine_y = { { 'location', color = 'lualine_a_normal' } },
            lualine_z = {},
        },
    },
}
