local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

local ok, deps = pcall(require, "mini.deps")
if not ok then
	print("Error loading mini.deps")
	return
end
deps.setup({ path = { package = path_package } })

require("options")
require("plugins")
require("config.mini")
