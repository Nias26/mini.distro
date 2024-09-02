local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
	return print("Lspsaga failed to load!")
end

lspsaga.setup({
	diagnostic = {
		show_code_action = true,
		jump_num_shortcut = true,
		diagnostic_only_current = false,
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
	ui = {
		code_action = "󰌵",
		border = "solid",
		expand = "",
		collapse = "",
	},
	symbol_in_winbar = {
		enable = true,
	},
	lightbulb = {
		enable = true,
		sign = false,
	},
	implement = {
		enable = false,
	},
})
