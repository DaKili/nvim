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
