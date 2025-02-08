vim.g.mapleader = " "

local opts = {
	tabstop = 2,
	shiftwidth = 2,
}

for k,v in pairs(opts) do
	vim.opt[k] = v
end

local map = vim.keymap.set

map('n', 'Q', "<cmd>bd!<CR>", { desc = "Close current buffer" })
