local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return print("Lspconfig failed to load!")
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
