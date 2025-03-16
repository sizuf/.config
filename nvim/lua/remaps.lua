
-- same as 'set nu'
vim.o.number = true
-- map leader to space
--vim.g.mapleader = " "

vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'yg', '"+yy')  -- Yank line to system clipboard
vim.keymap.set('n', 'pg', '"+p')   -- Paste from system clipboard

vim.keymap.set('v', 'yg', '"+y')   -- Yank selection to system clipboard
vim.keymap.set('v', 'pg', '"+p')   -- Paste from system clipboard
