-- Different indentation for different file types
local indent_group = vim.api.nvim_create_augroup('IndentSettings', { clear = true })

-- 2 spaces for web files
vim.api.nvim_create_autocmd('FileType', {
    group = indent_group,
    pattern = {
        'typescript',
        'typescriptreact',
        'javascript',
        'javascriptreact',
        'html',
        'css',
        'scss',
        'json',
        'yaml',
        'yml',
    },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})
