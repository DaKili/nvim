-- Create splits
vim.keymap.set('n', '<Leader>N', '<cmd>rightbelow new<CR>', { desc = 'Create new split below', silent = true })
vim.keymap.set('n', '<Leader>n', '<cmd>rightbelow vnew<CR>', { desc = 'Create new split to the right', silent = true })

-- Navigate splits
vim.keymap.set('n', '<Leader>h', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<Leader>j', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<Leader>k', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<Leader>l', '<C-w>l', { desc = 'Move to right window' })

-- Resize splits
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Center screen when jumping
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Move lines
vim.keymap.set('n', '<A-J>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-K>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-J>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-K>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Code navigation
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<C-O>', { desc = 'Jump one back in list' })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-I>', { desc = 'Jump one forward in list' })
vim.keymap.set('n', '<Esc>', function()
    vim.cmd('nohlsearch')
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
end, { desc = 'Clear search highlighting' })

-- Netrw
vim.keymap.set('n', '-', '<cmd>Explore<CR>', { desc = 'Open parent directory in netrw' })

-- Copy to clipboard
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, desc = 'Copy to system clipboard' })

-- Misc
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc><cmd>update<CR>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>cb', '<cmd>BufCleanup<CR>', { desc = 'Close all saved buffers', silent = true })
vim.keymap.set('n', '<leader>U', '<cmd>UpdateAll<CR>', { desc = 'Update all plugins and tools' })
vim.keymap.set('n', '<C-k>', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
-- C-w is delete word like in normal text editors
