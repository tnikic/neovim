vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

-- Line numbering
opt.relativenumber = true
opt.number = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Wrap
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Highlight
opt.cursorline = true

-- Colors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Window management
opt.splitright = true
opt.splitbelow = true
