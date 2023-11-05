vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<Leader>f', '<cmd>lua MiniFiles.open()<CR>')
vim.keymap.set('n', '<Leader>t', '<cmd>Telescope<CR>')
vim.keymap.set('n', '<F5>', '<cmd>lua MiniMap.toggle()<CR>')
vim.keymap.set('n', '<Leader>z', '<cmd>lua MiniMisc.zoom()<CR>')
vim.keymap.set('n', '<Leader>e', '<cmd>Ex<CR>')
vim.keymap.set('n', '<', '<cmd>lua vim.diagnostic.open_float{focusable = false}<CR>')
vim.keymap.set('n', 'bd', '<cmd>bdel<CR>')
vim.keymap.set('n', 'ba', function() vim.ui.input({prompt = "New Buffer"}, function(input) vim.cmd({ cmd = 'badd', args = {input} }) end)end)
vim.keymap.set('n', '<Leader>p', function() vim.ui.select({
	'buf_lines',
	'buffers',
	'cli',
	'commands',
	'diagnostic',
	'explorer',
	'files',
	'git_branches',
	'git_commits',
	'git_files',
	'hit_hunks',
	'grep',
	'grep_live',
	'help',
	'hipatterns',
	'history',
	'hl_groups',
	'keymaps',
	'list',
	'lsp',
	'makrs',
	'oldfiles',
	'options',
	'registers',
	'resume',
	'spellsuggest',
	'treesitter'
},	{ prompt = "Pick " },
function(choice)
	return vim.cmd({ cmd = 'Pick', args = {choice}})
end)end)

-- FIXME:DOesn't work for now.. (see mini-modules/mini.base16)
-- vim.keymap.set('n', '<Leader>c', function() vim.ui.select({
-- 	'oxocarbon',
-- 	'kanagawa'
-- }, { prompt = "Change base16 Colorscheme" },
-- function(choice)
-- 	return colorscheme == choice
-- end)end)
