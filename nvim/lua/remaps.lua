
-- same as 'set nu'
vim.o.number = true
-- map leader to space
--vim.g.mapleader = " "

vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'yg', '"*yy')
vim.keymap.set('n', 'pg', '"*p')



vim.keymap.set('v', 'yg', '"*yy')
vim.keymap.set('v', 'pg', '"*p')


