-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 8
vim.loader.enable()
vim.opt.updatetime = 200
vim.opt.title = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Case sensitive search if uppercase in search

-- Visual settings
vim.opt.winborder = 'single'
vim.opt.termguicolors = true
vim.opt.colorcolumn = '120'
vim.opt.completeopt = 'menuone,noinsert,noselect,preview' -- ignored when blink is used
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.list = true
vim.opt.listchars = { trail = '·', nbsp = '␣', tab = '  ' }
vim.opt.signcolumn = 'yes'

-- File handling
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')

-- Behavior settings
vim.opt.errorbells = false
vim.opt.path:append('**')
vim.opt.splitright = true

-- Command-line completion
vim.opt.wildmode = 'full'

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
