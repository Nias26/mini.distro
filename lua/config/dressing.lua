local ok, dressing = pcall(require, "dressing")
if not ok then
  return print("Dressing failed to load!")
end

dressing.setup({
  input = {
    prefer_width = 65,
    width = 65,
    max_width = 90,
    min_width = 20,
  },
  select = {
    fzf = {
      window = {
        width = 65,
      },
    },
    fzf_lua = {
      winopts = {
        width = 65,
      },
    },
  },
  width = 65,
  height = 40,
})
