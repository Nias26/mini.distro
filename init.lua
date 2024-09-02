-- Require Options
require("opts")

end

}


-- Source every lua file in mini-modules
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/mini-modules', [[v:val =~ '\.lua$']])) do
  require('mini-modules.'..file:gsub('%.lua$', ''))
-- Bootstrap mini.nvim
local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch",
    "stable",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
end

-- Require keybinds
-- Setup mini.deps
require("mini.deps").setup({ path = { package = path_package } })
require("keybinds")
