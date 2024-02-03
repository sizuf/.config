
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


require("lazy").setup({
	"williamboman/mason.nvim",
        "williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
 	{
         'nvim-telescope/telescope.nvim', tag = '0.1.5',
          dependencies = { 'nvim-lua/plenary.nvim' }
        }
}
)


require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").rust_analyzer.setup {}

--- LSP keybindings --- 
require('lsp')

--- REMAPS of keys ---
require('remaps')

--- TELESCOPE --- 
require('telescope')
