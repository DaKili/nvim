-- Overview of every lsp / tool / formatter, grouped by work area.
-- Enable collections per machine in machine.lua.
-- oxfmt: custom formatter, its definition lives in plugins/conform.lua.

local M = {}

local collections = {
    -- editor
    lua = {
        lsp = {
            'lua_ls',
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { 'vim' } },
                    workspace = {
                        library = { vim.env.VIMRUNTIME, '${3rd}/luv/library' },
                        checkThirdParty = false,
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                    telemetry = { enable = false },
                    completion = { callSnippet = 'Replace' },
                },
            },
        },
        tools = { 'stylua' },
        formatters = { lua = { 'stylua' } },
        treesitter = { 'lua' },
    },

    -- web
    react = {
        lsp = { 'ts_ls', 'html', 'cssls', 'tailwindcss', 'eslint' },
        tools = { 'prettierd' },
        formatters = {
            javascript = { 'oxfmt', 'prettierd', stop_after_first = true },
            typescript = { 'oxfmt', 'prettierd', stop_after_first = true },
            typescriptreact = { 'oxfmt', 'prettierd', stop_after_first = true },
            html = { 'oxfmt', 'prettierd', stop_after_first = true },
            css = { 'oxfmt', 'prettierd', stop_after_first = true },
            scss = { 'oxfmt', 'prettierd', stop_after_first = true },
        },
        treesitter = { 'javascript', 'typescript', 'tsx', 'html', 'css', 'scss', 'json' },
    },
    angular = {
        lsp = { 'angularls', 'ts_ls', 'html', 'cssls', 'tailwindcss', 'eslint' },
        tools = { 'prettierd' },
        formatters = {
            javascript = { 'oxfmt', 'prettierd', stop_after_first = true },
            typescript = { 'oxfmt', 'prettierd', stop_after_first = true },
            html = { 'oxfmt', 'prettierd', stop_after_first = true },
            css = { 'oxfmt', 'prettierd', stop_after_first = true },
            scss = { 'oxfmt', 'prettierd', stop_after_first = true },
        },
        treesitter = { 'angular', 'typescript', 'html', 'css', 'scss' },
    },

    -- backend
    rust = {
        lsp = { 'rust_analyzer' },
        formatters = { rust = { lsp_format = 'prefer' } },
        treesitter = { 'rust' },
    },
    go = {
        lsp = { 'gopls' },
        tools = { 'gofumpt' },
        formatters = { go = { 'gofumpt' } },
        treesitter = { 'go' },
    },
    cs = {
        -- lsp = { 'roslyn' }, installed manually (MasonInstall), set up in plugins/lsp/roslyn.lua
        formatters = { cs = { lsp_format = 'prefer' } },
        treesitter = { 'c_sharp' },
    },
    bicep = {
        treesitter = { 'bicep' },
    },
    -- data / config
    config = {
        lsp = { 'yamlls' },
        tools = { 'prettierd' },
        formatters = {
            json = { 'oxfmt', 'prettierd', stop_after_first = true },
            yaml = { 'oxfmt', 'prettierd', stop_after_first = true },
        },
        treesitter = { 'json', 'yaml' },
    },
}

local machineConfig = require('config.machine')

local function union(field)
    local seen, out = {}, {}
    for _, name in ipairs(machineConfig.enabledCollections) do
        local c = collections[name]
        for _, value in ipairs(c and c[field] or {}) do
            if not seen[value] then
                seen[value] = true
                out[#out + 1] = value
            end
        end
    end
    return out
end

function M.getLsps()
    return union('lsp')
end

function M.getTools()
    return union('tools')
end

function M.getFormatters()
    local out = {}
    for _, name in ipairs(machineConfig.enabledCollections) do
        local c = collections[name]
        for ft, formatters in pairs(c and c.formatters or {}) do
            out[ft] = formatters
        end
    end
    return out
end

function M.getLspConfigs()
    local out = {}
    for _, name in ipairs(machineConfig.enabledCollections) do
        local lsp = collections[name] and collections[name].lsp
        if type(lsp) == 'table' then
            local server = lsp[1]
            local config = {}
            for k, v in pairs(lsp) do
                if k ~= 1 then
                    config[k] = v
                end
            end
            if next(config) then
                out[server] = config
            end
        end
    end
    return out
end

function M.getParsers()
    return union('treesitter')
end

return M
