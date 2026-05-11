return {
    'khoido2003/roslyn-filewatch.nvim',
    build = 'nvim -l build.lua --',
    config = function()
        require('roslyn_filewatch').setup()
    end,
}
