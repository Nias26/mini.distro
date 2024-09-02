local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return print("Treesitterl failed to load!")
end

---@diagnostic disable-next-line: missing-fields
treesitter.setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
})
