local ok, _ = pcall(require, "luasnip")
if not ok then
  return print("LuaSnip failed to load!")
end

require("luasnip.loaders.from_vscode").lazy_load()
