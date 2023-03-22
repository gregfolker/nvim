HOME = os.getenv("HOME")
SHELL = os.getenv("SHELL")
RUNTIME_PATH = os.getenv("")

vim.g.mapleader = ","

vim.o.nocompatible = true

vim.o.mouse = ""
vim.o.encoding = "utf-8"
vim.o.number = true
vim.o.syntax = true
vim.o.wildmenu = true
vim.o.swapfile = false
vim.o.wrap = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hidden = true
vim.o.smartcase = true

-- Tabs and spaces
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.copyindent = true

-- Appearance
vim.o.termguicolors = true
vim.o.background = "dark"
-- TODO: This font may need to be set dynamically based on the current os
vim.o.guifont = "DroidSansMono_Nerd_Font:h11"
