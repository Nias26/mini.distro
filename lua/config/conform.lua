local ok, conform = pcall(require, "conform")
if not ok then
  return print("Conform failed to load!")
end

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
