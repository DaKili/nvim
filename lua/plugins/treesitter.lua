return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    cond = function() -- Only load if a C compiler is available
        local compilers = { 'cc', 'gcc', 'clang', 'cl', 'zig' }
        for _, compiler in ipairs(compilers) do
            if vim.fn.executable(compiler) == 1 then
                return true
            end
        end
        return false
    end,
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
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
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end,
}
