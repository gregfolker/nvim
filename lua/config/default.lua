vim.g.mapleader = ","

vim.opt.mouse = ""
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.vb = true
vim.opt.wildmenu = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- insert mode
map("i", "jk", "<Esc>", opts)
-- visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "H", "<gv", opts)
map("v", "L", ">gv", opts)
-- normal mode
map("n", "H", "^", opts)
map("n", "L", "$", opts)
map("n", "J", "<C-d>", opts)
map("n", "K", "<C-u>", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader><space>", "<cmd>nohlsearch<cr>", opts)
map("n", "<Return>", "o<esc>", opts)
map("n", ";", ":", opts)
map("n", "<C-d>", "dd", opts)
map("n", "<C-n>", "<cmd>set number!<cr>", opts)
-- map("n", "<tab>", "vip", opts)
map("n", "<S-Up>", "<cmd>resize -2<cr>", opts)
map("n", "<S-Down>", "<cmd>resize +2<cr>", opts)
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<S-Right>", "<cmd>vertical +2<cr>", opts)
map("n", "gt", "<cmd>bnext<cr>", opts)
map("n", "gT", "<cmd>bprev<cr>", opts)
-- terminal mode
map("t", "<C-h>", "<cmd>wincmd h<cr>", opts)
map("t", "<C-j>", "<cmd>wincmd j<cr>", opts)
map("t", "<C-k>", "<cmd>wincmd k<cr>", opts)
map("t", "<C-l>", "<cmd>wincmd l<cr>", opts)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
    pattern = { "gitcommit" },
    callback = function(ev)
        vim.api.nvim_set_option_value("textwidth", 72, { scope = "local" })
    end
})

autocmd("FileType", {
    pattern = { "Makefile" },
    callback = function(ev)
        vim.api.nvim_set_option_value("softtabstop", 0, { scope = "local" })
        vim.api.nvim_set_option_value("expandtab", false, { scope = "local" })
    end
})

augroup("AutoFormat", {})
autocmd("BufWritePost", {
    pattern = { "*.py" },
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent !black --quiet %")
        vim.cmd("edit")
    end
})

-- remove all trailing white space when writing to a file
autocmd("BufWritePre", {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})
