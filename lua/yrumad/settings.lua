-- [[ Setting options ]]
-- See `:help vim.o`

vim.o.hlsearch = true                   -- Set highlight on search
vim.wo.number = true                    -- Make line numbers default
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 20
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"

vim.o.mouse = 'a'                       -- Enable mouse mode
vim.o.undofile = true                   -- Save undo history

vim.o.ignorecase = true                 -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true

vim.o.updatetime = 50                   -- Decrease update time
vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true              -- Set colorscheme
vim.cmd.colorscheme "oxocarbon"
vim.opt.background = "dark"

vim.o.completeopt = 'menuone,noselect'  -- Set completeopt to have a better completion experience

