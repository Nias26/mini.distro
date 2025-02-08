local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
	source = "nyoom-engineering/oxocarbon.nvim",
})

now(function()
	vim.cmd("colorscheme oxocarbon")
end)

add({
	source = "nvim-treesitter/nvim-treesitter",
})

add({
	source = "neovim/nvim-lspconfig",
})

add({
	source = "williamboman/mason.nvim",
	depends = { "neovim/nvim-lspconfig" },
})

add({
	source = "nvimdev/lspsaga.nvim",
	depends = {
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
})

later(function()
	require("mason").setup()
end)

later(function()
	local lspconfig = require("lspconfig")
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end)

later(function()
	require("lspsaga").setup()
end)
