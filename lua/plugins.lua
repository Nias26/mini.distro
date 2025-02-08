local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
	source = "nyoom-engineering/oxocarbon.nvim",
})
now(function()
	vim.cmd("colorscheme oxocarbon")
end)
