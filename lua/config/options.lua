-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true        -- Case sensitive search if uppercase in search
-- vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"
vim.opt.showmatch = true
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect,preview"
vim.opt.showmode = false
vim.opt.pumheight = 10

-- File handling
vim.opt.autoread = true

-- Behavior settings
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.path:append("**")
vim.opt.mouse = "a"
vim.opt.encoding = "UTF-8"

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj"})

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
-- vim.g.netrw_liststyle = 3 -- show tree style directory

