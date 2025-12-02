return {
    'tadaa/vimade',
    opts = {
        recipe = { 'default', { animate = false } },
        ncmode = 'buffers',
        fadelevel = 0.5,
    },
    config = function(_, opts)
        require('vimade').setup(opts)

        -- Disable vimade for neogit buffers
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'NeogitStatus', 'NeogitCommitView', 'NeogitPopup', 'NeogitLogView' },
            callback = function()
                vim.cmd('VimadeBufDisable')
            end,
        })
    end,
}
