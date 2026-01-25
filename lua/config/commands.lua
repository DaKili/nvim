-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

-- Close all saved buffers
vim.api.nvim_create_user_command('BufCleanup', function()
    local current = vim.api.nvim_get_current_buf()
    local closed = 0
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current and vim.api.nvim_buf_is_valid(buf) then
            if vim.bo[buf].buftype == '' and not vim.bo[buf].modified then
                vim.api.nvim_buf_delete(buf, { force = false })
                closed = closed + 1
            end
        end
    end
    print('Closed ' .. closed .. ' saved buffer(s)')
end, { desc = 'Close all saved buffers except current' })

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
    log_update('=== Update started ===')

    local lazy_plugins = require('lazy').plugins()
    local updated_plugins = {}

    for _, plugin in pairs(lazy_plugins) do
        if plugin._.updates then
            table.insert(updated_plugins, plugin.name)
        end
    end

    require('fidget').notify('Updating plugins...')
    require('lazy').update({
        wait = true,
        show = false,
    })

    -- Log updated plugins
    if #updated_plugins > 0 then
        log_update('Updated plugins: ' .. table.concat(updated_plugins, ', '))
    else
        log_update('No plugin updates')
    end

    -- Update Mason tools
    require('fidget').notify('Updating Mason tools...')
    vim.cmd('MasonToolsUpdate')

    require('fidget').notify('Updates complete! Log: ' .. vim.fn.stdpath('data') .. '/update.log')
end, {})
