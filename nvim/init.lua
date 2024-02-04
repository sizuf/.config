
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
	}
}
)


require("mason").setup()
require("mason-lspconfig").setup()

--- LSP setup --- 
require('lsp')

--- REMAPS of keys ---
require('remaps')

--- TELESCOPE --- 
require('telescope')


-- Set the background color of the popup to a slightly less bright pink
vim.cmd[[highlight Pmenu guibg=#d787af ctermbg=23]]

-- Set the foreground color of the popup
--vim.cmd[[highlight PmenuSel guifg=#282c34 ctermfg=5987163]]

vim.cmd[[set background=dark]]
vim.cmd('hi Comment ctermfg=LightGrey')
