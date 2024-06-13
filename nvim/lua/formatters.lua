
--- taken from  https://github.com/stevearc/conform.nvim
-- the idea taken from https://www.reddit.com/r/neovim/comments/17h11wg/did_you_migrate_from_nullls/
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { {  "prettier" } },
    typescript = { {  "prettier" } },
    javascriptreact = { {  "prettier" } },
    typescriptreact = { {  "prettier" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    lsp_fallback = true,
  },
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
})
