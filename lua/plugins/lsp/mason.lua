return {
    'mason-org/mason.nvim',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        require('mason').setup({})

        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'angularls',
                'ts_ls',
                'html',
                'cssls',
                'tailwindcss',
            },
        })

        require('mason-tool-installer').setup({
            ensure_installed = {
                'stylua',
                'prettierd',
                'prettier',
                'eslint',
            },
        })
    end,
}
