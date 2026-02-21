-- Update title to show unsaved buffer count
local function update_title()
    local unsaved = 0
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified then
            unsaved = unsaved + 1
        end
    end
    local indicator = unsaved == 0 and 'N' or unsaved == 1 and 'N+' or ('N+' .. unsaved)
    vim.opt.titlestring = '[' .. indicator .. '] ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

local grp = vim.api.nvim_create_augroup('UserCommands', { clear = true })

vim.api.nvim_create_autocmd({ 'BufModifiedSet', 'BufWritePost', 'BufAdd', 'BufDelete' }, {
    group = grp,
    callback = update_title,
})
vim.api.nvim_create_autocmd('VimEnter', {
    group = grp,
    callback = function() vim.defer_fn(update_title, 0) end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = grp,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd('BufWritePre', {
    group = grp,
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

-- Close all saved buffers not visible in any split
vim.api.nvim_create_user_command('BufCleanup', function()
    local visible_buffers = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        visible_buffers[buf] = true
    end

    local closed = 0
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if not visible_buffers[buf] and vim.api.nvim_buf_is_valid(buf) then
            if vim.bo[buf].buftype == '' and not vim.bo[buf].modified then
                vim.api.nvim_buf_delete(buf, { force = false })
                closed = closed + 1
            end
        end
    end
    require('fidget').notify('Closed ' .. closed .. ' saved buffer(s)')
end, {})

-- Log updates to a file
local function log_update(message)
    local log_file = vim.fn.stdpath('data') .. '/update.log'
    local timestamp = os.date('%Y-%m-%d %H:%M:%S')
    local log_entry = string.format('[%s] %s\n', timestamp, message)

    local dir = vim.fn.fnamemodify(log_file, ':h')
    vim.fn.mkdir(dir, 'p')

    local file = io.open(log_file, 'a')
    if file then
        file:write(log_entry)
        file:close()
    else
        print('Failed to write to log: ' .. log_file)
    end
end

-- Check for updates on startup
vim.api.nvim_create_autocmd('VimEnter', {
    group = grp,
    callback = function()
        vim.defer_fn(function()
            require('lazy').check({ show = false })

            local lazy_updates = require('lazy.status').has_updates()
            if lazy_updates then
                require('fidget').notify('Plugin updates available.')
            end
        end, 1000)
    end,
})

-- Update command with logging
vim.api.nvim_create_user_command('UpdateAll', function()
    local lazy_plugins = require('lazy').plugins()
    local updated_plugins = {}

    for _, plugin in pairs(lazy_plugins) do
        if plugin._.updates then
            table.insert(updated_plugins, plugin.name)
        end
    end

    require('lazy').update({
        wait = true,
        show = false,
    })

    if #updated_plugins > 0 then
        log_update('Updated plugins: ' .. table.concat(updated_plugins, ', '))
        require('fidget').notify('Log: ' .. vim.fn.stdpath('data') .. '/update.log')
        for _, updated_plugin in pairs(updated_plugins) do
            require('fidget').notify('Updated: ' .. updated_plugin)
        end
    else
        require('fidget').notify('No plugin updates')
    end
end, {})
