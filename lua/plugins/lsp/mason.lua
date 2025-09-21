return {
    "mason-org/mason.nvim",
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function ()
        require('mason').setup({})

        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'angularls',
                'ts_ls',
                'html',
                'cssls',
                'tailwindcss',
                'eslint',
            },
            handlers = {
                -- Default handler for all servers
                function(server_name)
                    vim.lsp.enable(server_name)
                end,
            },
        })

        require('mason-tool-installer').setup({
            ensure_installed = {
                'stylua',
                'prettierd',
                'prettier',
            }
        })

    end
}
