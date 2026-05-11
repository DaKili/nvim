return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
        vim.env.CC = 'gcc'
        require('nvim-treesitter').install({
            'angular',
            'css',
            'scss',
            'html',
            'javascript',
            'json',
            'go',
            'lua',
            'tsx',
            'typescript',
            'yaml',
        })
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                pcall(vim.treesitter.start, ev.buf)
            end,
        })
    end,
}
