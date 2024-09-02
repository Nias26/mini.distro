local ok, telescope = pcall(require, "telescope")
if not ok then
  return print("Telescope failed to load!")
end

telescope.setup({
  extensions = {
    file_browser = {
      hidden = { file_browser = true, folder_browse = true },
      follow_symlinks = true,
      gruped = false,
    },
  },
})
telescope.load_extension("file_browser")
