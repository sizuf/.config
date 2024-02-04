local cmp = require'cmp'
local ls = require("luasnip")

vim.opt.completeopt = "menu,menuone,noinsert"
--- Sets the maximum items shown in the popup 
vim.opt.pumheight = 5

cmp.setup({
	mapping = cmp.mapping.preset.insert({ -- Preset: ^n, ^p, ^y, ^e, you know the drill..
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping(function(fallback)
                  -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
     			 if cmp.visible() then
        			local entry = cmp.get_selected_entry()
				if not entry then
	  				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
	  				cmp.confirm()
				end
      			  else
       				 fallback()
      			   end
    end, {"i","s","c",})
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer", keyword_length = 3 },
		-- still not sure do i need this? 
		--{ name = "buffer", max_item_count = 3 },
	}),
	view = {
		-- disables the docs when suggestion popup 
		-- check https://github.com/hrsh7th/nvim-cmp/pull/1647/files if you want shortuct to enable it
		docs = {
			auto_open = false
		}
	}
})
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Keymaps for Luasnip
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)


return  require('cmp_nvim_lsp').default_capabilities()
