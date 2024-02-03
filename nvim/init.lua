
--- PLUGIN MANAGEMENT --
--
 local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- MAPPINGS
--
-- same as 'set nu'
vim.o.number = true
-- map leader to space
vim.g.mapleader = " "

require("lazy").setup({
	"williamboman/mason.nvim",
        "williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
}
)


require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").rust_analyzer.setup {}

--- LSP keybindings --- 
require('lsp')
--
