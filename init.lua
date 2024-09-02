-- Enable loader
vim.loader.enable()

-- Set options
local globals = {
  mapleader = " ",           -- Set leader key
  maplocalleader = ",",      -- Set localleader
  loaded_netrw = 1,          -- Disable netrw
  loaded_netrwPlugin = 1,    -- Disable netrw
  showcmdloc = "statusline", -- Show command message location
}

for k, v in pairs(globals) do
  vim.g[k] = v
end

local options = {
  relativenumber = true,      -- Set Relative Number line
  number = true,              -- Set Number line
  inccommand = "split",       -- Command preview (eg. `%s/.../...`)
  ignorecase = true,          -- Ignore uppercase and lowercase in commands
  laststatus = 3,             -- Set global statusbar
  scrolloff = 999,            -- Set scrolloff
  updatetime = 300,           -- Set updatetime for events
  showmode = false,           -- Hide --INSERT-- messages etc...
  splitbelow = true,          -- Always split below
  splitright = true,          -- Always split right
  undofile = true,            -- Enable persistent undo
  cursorline = true,          -- Enable cursorline
  termguicolors = true,       -- Enable termguicolors
  tabstop = 2,                -- Set tabstop
  shiftwidth = 2,             -- Set shiftwidth
  expandtab = true,           -- Expand tabs into spaces
  autochdir = true,           -- Auto change directory
  clipboard = "unnamedplus",  -- Sync with system clipboard
  wrap = false,               -- Disable line wrap
  grepprg = "rg --vimgrep",   -- Use ripgrep instead of grep
  grepformat = "%f:%l:%c:%m", -- Grep formatting
  formatexpr = "v:lua.require'conform'.formatexpr()",
  mousemodel = "extend",      -- Right click extend selection
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

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

-- Setup mini.deps
require("mini.deps").setup({ path = { package = path_package } })
require("plugins")
require("keybinds")
require("macros")
