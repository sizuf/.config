
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
        },
	{
	   "hrsh7th/nvim-cmp", 
    	    event = { "InsertEnter", "CmdlineEnter" },
	   dependencies = {
		 'hrsh7th/cmp-nvim-lsp',
		 'hrsh7th/cmp-buffer',
		 'hrsh7th/cmp-path',
		 'hrsh7th/cmp-cmdline',
		 'hrsh7th/nvim-cmp',
		 'L3MON4D3/LuaSnip',
		 'saadparwaiz1/cmp_luasnip'
	   }
	},
	{
	   	'nvim-treesitter/nvim-treesitter', 
	    	run = ':TSUpdate',
	},
	{
		"tpope/vim-fugitive"
	},
	{
		'stevearc/conform.nvim',
		 opts = {},
	},
	{
    		"nvim-telescope/telescope-file-browser.nvim",
    		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},

	--------------- COLORSCHEMES ----------------
	{
	 	 'marko-cerovac/material.nvim'
        },
	{
		'devsjc/vim-jb'
	},
	{
		"catppuccin/nvim",
		name = "catppuccin", 
		priority = 1000 
	},
	
	{
		"briones-gabriel/darcula-solid.nvim", dependencies = {  "rktjmp/lush.nvim" }
	},
	{
    		"xiantang/darcula-dark.nvim",
	},
	{
		"mhartington/oceanic-next"
	},
	{
		"sainnhe/sonokai"
	},	
	{ 	"bluz71/vim-moonfly-colors",
	         name = "moonfly",
		lazy = false,
		priority = 1000 
	},
}
)


require("mason").setup()
require("mason-lspconfig").setup()

--- LSP setup --- 
require('lsp')

--- REMAPS of keys ---
require('remaps')

--- TELESCOPE --- 
require("telescopee")

--- TELESCOPE-FILE-BROSER ---
vim.keymap.set("n", "<leader>fd", function()
	require("telescope").extensions.file_browser.file_browser()
end)

require('treesitter')
require('formatters')
-- Set the background color of the popup to a slightly less bright pink
--vim.cmd[[highlight Pmenu guibg=#d787af ctermbg=23]]

-- Set the foreground color of the popup
--vim.cmd[[highlight PmenuSel guifg=#282c34 ctermfg=5987163]]

vim.cmd[[set background=dark]]
--vim.cmd('hi Comment ctermfg=LightGrey')

-- this material_style definition has to be before setting the colorscheme
-- absolute non sense. 
--vim.g.material_style = "darker"
--vim.cmd [[colorscheme material]]
--vim.cmd("colorscheme catppuccin-mocha")

vim.cmd("set termguicolors")
vim.cmd("syntax enable")
--decent dracula one
--there is one more dracula-solid that looks quite like classical one
--vim.cmd("colorscheme darcula-solid")
--vim.cmd("colorscheme OceanicNext")
--good high contrast
--vim.cmd("colorscheme sonokai")
--vim.g.sonokai_style = 'maia'
vim.cmd("colorscheme  moonfly")
 
