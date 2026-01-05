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

        local base = require('config.machine')

        local ok, machine_local = pcall(require, 'config.machine_local')
        local enabled_lsp = ok and machine_local.enabled_lsp or base.enabled_lsp
        local enabled_tools = ok and machine_local.enabled_tools or base.enabled_tools

        local lsp_servers = {}
        for _, key in ipairs(enabled_lsp) do
            table.insert(lsp_servers, base.available.lsp[key])
        end

        local tools = {}
        for _, key in ipairs(enabled_tools) do
            table.insert(tools, base.available.tools[key])
        end

        require('mason-lspconfig').setup({
            ensure_installed = lsp_servers,
        })

        require('mason-tool-installer').setup({
            ensure_installed = tools,
        })
    end,
}
