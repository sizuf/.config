
--- taken from  https://github.com/stevearc/conform.nvim
-- the idea taken from https://www.reddit.com/r/neovim/comments/17h11wg/did_you_migrate_from_nullls/
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    lsp_fallback = true,
  },
})
