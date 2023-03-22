function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

imap('jk', '<Esc>')
vmap('jk', '<Esc>')
tmap('jk', '<Esc>')

-- Movement
nmap('H', '^')
nmap('L', '$')
nmap('J', '<C-d>')
nmap('K', '<C-u>')

-- Line Manipulation
nmap('<C-d>', 'dd')
nmap('-', 'ddp')
nmap('+', 'ddkP')

nmap('<leader><space>', '<cmd>nohlsearch<cr>')

-- View the current file as raw binary
nmap('<leader>b', '<cmd>%!xxd<cr>')

-- Open a terminal in a floating window
nmap('<C-t>', '<cmd>ToggleTerm direction=float<cr>')

tmap('<C-h>', '<C-\\><C-n><C-w>h')
tmap('<C-l>', '<C-\\><C-n><C-w>l')
tmap('<C-j>', '<C-\\><C-n><C-w>j')
tmap('<C-k>', '<C-\\><C-n><C-w>k')

-- Plugins
vim.cmd('noremap <C-z> <cmd>NERDTreeToggle<cr>')
vim.cmd('noremap <C-f> <cmd>Files<cr>')
vim.cmd('noremap <C-b> <cmd>Buffers<cr>')

-- Unmaps
imap('<Esc>', 'nop')
vmap('<Esc>', 'nop')
nmap('^', '<nop>')
nmap('$', '<nop>')
nmap('0', '<nop>')
nmap('<Up>', '<nop>')
nmap('<Down>', '<nop>')
nmap('<Left>', '<nop>')
nmap('<Right>', '<nop>')
