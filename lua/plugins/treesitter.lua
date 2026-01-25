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
            '<leader>f',
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
                'angular',
                'css',
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

        -- Enable folding via Treesitter
        vim.api.nvim_create_autocmd('BufEnter', {
            callback = function()
                if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
                    vim.opt_local.foldmethod = 'expr'
                    vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.opt_local.foldenable = true
                    vim.opt_local.foldlevel = 99
                end
            end,
        })
    end,
}
