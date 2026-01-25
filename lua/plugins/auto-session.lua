return {
    'rmagatti/auto-session',
    lazy = false,
    init = function()
        vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        pre_save_cmds = {
            -- Close any buffers without names before saving
            function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) == '' then
                        vim.api.nvim_buf_delete(buf, { force = true })
                    end
                end
            end,
        },
        log_level = 'error',
    },
    keys = {
        {
            '<leader>rs',
            ':AutoSession search<CR>',
            desc = 'Search recent sessions',
        },
    },
}
