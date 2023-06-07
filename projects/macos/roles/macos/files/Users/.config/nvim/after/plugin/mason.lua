require("mason").setup()
require("mason-lspconfig").setup({
  -- see lsp.lua
  ensure_installed = Servers
})
