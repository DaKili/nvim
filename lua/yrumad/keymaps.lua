-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

local km = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
km.set( 'n', '<leader>p', vim.cmd.Ex)
km.set( 'n', 'C-d', '<C-d>zz')
km.set( 'n', 'C-u', '<C-u>zz')
km.set( 'n', 'n', 'nzzzv')
km.set( 'n', 'N', 'Nzzzv')
km.set( 'n', '<leader>v', ':vs<CR><C-w>l:Ex<CR>')
km.set( 'n', '<leader>h', '<C-w>h')
km.set( 'n', '<leader>j', '<C-w>j')
km.set( 'n', '<leader>k', '<C-w>k')
km.set( 'n', '<leader>l', '<C-w>l')
km.set({ 'n', 'v' }, '<leader>n', ':noh<CR>')

-- Diagnostic keymaps
km.set('n', '[d', vim.diagnostic.goto_prev)
km.set('n', ']d', vim.diagnostic.goto_next)
km.set('n', '<leader>e', vim.diagnostic.open_float)
km.set('n', '<leader>q', vim.diagnostic.setloclist)


