local add = MiniDeps.add

add({
  source = "neovim/nvim-lspconfig",
  depends = { "williamboman/mason.nvim" },
})

add({
  source = "nvim-treesitter/nvim-treesitter",
  checkout = "master",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})

add({
  source = "nvimdev/lspsaga.nvim",
  depends = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
})

add({
  source = "stevearc/conform.nvim",
})

add({
  source = "folke/neodev.nvim",
})

add({
  source = "hrsh7th/nvim-cmp",
  depends = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "onsails/lspkind.nvim",
  },
})

add({
  source = "SmiteshP/nvim-navic",
  depends = { "neovim/nvim-lspconfig" },
})

add({
  source = "L3MON4D3/LuaSnip",
  depends = { "rafamadriz/friendly-snippets" },
})

add({
  source = "mbbill/undotree",
})

add({
  source = "MagicDuck/grug-far.nvim",
})

add({
  source = "stevearc/dressing.nvim",
})

add({
  source = "akinsho/toggleterm.nvim",
  monitor = "main",
})

add({
  source = "nvim-telescope/telescope.nvim",
  checkout = "0.1.8",
  monitor = "master",
  depends = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
})

-- Source configurations
require("config.mini-modules")
require("config.dressing")
require("config.neodev") -- IMPORTANT: Load before lspconfig
require("config.nvim-lspconfig")
require("config.mason")
require("config.nvim-treesitter")
require("config.lspsaga")
require("config.conform")
require("config.navic")
require("config.nvim-cmp")
require("config.luasnip")
require("config.toggleterm")
-- Undotree
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_DiffAutoOpen = 0
require("config.grug-far")
require("config.telescope")
