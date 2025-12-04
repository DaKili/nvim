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
    keys = {
        {
            '<C-f>',
            function()
                if vim.fn.foldclosed(vim.fn.line('.')) == -1 then
                    vim.cmd('foldclose')
                else
                    vim.cmd('foldopen')
                end
            end,
            desc = 'Toggle fold at cursor',
        },
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'lua',
                'javascript',
                'typescript',
                'tsx',
                'html',
                'css',
                'json',
                'yaml',
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            folding = { enable = true },
        })
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt.foldenable = false
    end,
}
