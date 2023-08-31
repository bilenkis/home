-- Buffer nav
vim.keymap.set('n', '<S-h>', ':bp<CR>')
vim.keymap.set('n', '<S-l>', ':bn<CR>')

-- Switching windows
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')

-- Vmap for maintain Visual Mode after shifting > and <
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move visual block
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>y', ":let @*=expand('%:p')<cr>", { desc = "Yank current dir name" })
vim.keymap.set('n', '<leader>Y', ":let @*=expand('%:p:h:t')<cr>", { desc = "Yank current dir name" })

-- vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'p', 'p:let @+=@0<CR>')
vim.keymap.set('v', 'p', 'p:let @+=@0<CR>')

vim.keymap.set('n', '<leader>dl', ':diffget //3<cr>')
vim.keymap.set('n', '<leader>dh', ':diffget //2<cr>')

-- Command mode keymap
vim.keymap.set('c', '<M-a>', '<Home>')
vim.keymap.set('c', '<M-e>', '<End>')
vim.keymap.set('c', '<M-d>', '<S-Right><C-w>')
vim.keymap.set('c', '<M-b>', '<S-Left>')
vim.keymap.set('c', '<M-f>', '<S-Right>')
