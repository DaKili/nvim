--[[
    Each machine enables what it needs in machine_local.lua
    For specific configurations create 'lua/config/machine_local.lua' and specify what you want installed.

    ```
    local M = {}
    local global_list = require("config.machine")

    -- For specifics (keys of the tables in this files):
    M.enabled_lsp = { 'lua', 'rust', 'go' }
    M.enabled_tools = { 'prettier', 'rustfmt', 'gofmt' }

    -- For everything:
    M.enabled_lsp = vim.tbl_keys(global_list.available.lsp)
    M.enabled_tools = vim.tbl_keys(global_list.available.tools)

    return M
    ```
--]]

local M = {}

M.available = {
    lsp = {
        lua = 'lua_ls',
        typescript = 'ts_ls',
        html = 'html',
        css = 'cssls',
        eslint = 'eslint',
        tailwind = 'tailwindcss',
        yaml = 'yamlls',
        angular = 'angularls',
        rust = 'rust_analyzer',
        go = 'gopls',
        zig = 'zls',
        -- csharp = 'roslyn' -- Must be installed manually via MasonInstall
    },
    tools = {
        lua = 'stylua',
        csharp = 'csharpier',
        prettier = 'prettierd',
        prettier_fallback = 'prettier',
        gofmt = 'gofumpt',
    },
}

-- Defaults
M.enabled_lsp = { 'lua', 'typescript', 'html', 'css', 'eslint' }
M.enabled_tools = { 'lua', 'prettier', 'prettier_fallback' }

return M
