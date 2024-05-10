-- Require Options
require("opts")

-- Bootstral lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
   "git",
   "clone",
   "--filter=blob:none",
   "https://github.com/folke/lazy.nvim.git",
   "--branch=stable", -- latest stable release
   lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{import = "mini"},
	{import = "plugins"}
}

local opts = {}

require("lazy").setup(plugins, opts)

-- Source every lua file in mini-modules
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/mini-modules', [[v:val =~ '\.lua$']])) do
  require('mini-modules.'..file:gsub('%.lua$', ''))
end

-- Require keybinds
require("keybinds")
