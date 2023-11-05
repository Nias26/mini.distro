return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependenices = {
			{
				"williamboman/mason.nvim",
				"neovim/nvim-lspconfig",
			},
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			require("mason-lspconfig").setup_handlers{
				function (server_name)
					require("lspconfig")[server_name].setup{}
				end,
			}
		end
	}
}
