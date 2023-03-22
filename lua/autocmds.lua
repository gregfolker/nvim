local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace when writing to a file
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Exit vim if NERDTree is the only window open
autocmd('BufEnter', {
  pattern = '',
  command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
})

autocmd('TermOpen', {
  command = "setlocal listchars= nonumber norelativenumber nocursorline"
})

-- Seamlessly close a terminal when the `exit` command is run
autocmd('TermClose', {
  command = "if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif"
})

-- Enter insert mode when moving to a terminal
autocmd('TermOpen', {
  pattern = 'term://*toggleterm#*',
  command = "startinsert"
})

-- Exit insert mode when leaving a terminal
autocmd('BufLeave', {
  pattern = 'term://*toggleterm#*' ,
  command = "stopinsert"
})

-- Fix highlighting of floating windows
-- https://github.com/nvim-telescope/telescope.nvim/issues/2145#issuecomment-1264323345
autocmd('BufEnter', {
  command = ":hi NormalFloat ctermfg=LightGrey"
})

augroup('binary_files', { clear = true })
autocmd('FileType', {
  group = 'binary_files',
  pattern = { 'bin', 'hex', 'elf', 'crt' },
  command = ":!xxd"
})
autocmd('FileType', {
  group = 'binary_files',
  pattern = { 'bin', 'hex', 'elf', 'crt' },
  command = "setlocal binary"
})

autocmd('FileType', {
  pattern = { 'c', 'cpp', 'py', 'sh' },
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4"
})

autocmd('FileType', {
  pattern = { 'lua', 'vim' },
  command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2"
})
