return {
    'mason-org/mason.nvim',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        require('mason').setup({
            registries = {
                'github:mason-org/mason-registry',
                'github:Crashdummyy/mason-registry',
            },
        })
        local stacks = require('config.stacks')

        require('mason-lspconfig').setup({
            ensure_installed = stacks.getLsps(),
        })

        require('mason-tool-installer').setup({
            ensure_installed = stacks.getTools(),
        })
    end,
}
