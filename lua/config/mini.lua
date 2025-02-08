-- Mini::TextEditing
local ok, ai = pcall(require, "mini.ai")
if not ok then
	print("Error loading mini.ai")
	return
end
ai.setup()

local ok, align = pcall(require, "mini.align")
if not ok then
	print("Error loading mini.align")
	return
end
align.setup()

local ok, comment = pcall(require, "mini.comment")
if not ok then
	print("Error loading mini.comment")
	return
end
comment.setup({
	mappings = {
		comment = "cc",
	},
})

local ok, completion = pcall(require, "mini.completion")
if not ok then
	print("Error loading mini.completion")
	return
end
completion.setup()

local ok, move = pcall(require, "mini.move")
if not ok then
	print("Error loading mini.move")
	return
end
move.setup({
	mappings = {
		line_left = "",
		line_right = "",
		line_up = "",
		line_down = "",
	},
})

local ok, operators = pcall(require, "mini.operators")
if not ok then
	print("Error loading mini.operators")
	return
end
operators.setup()

local ok, pairs = pcall(require, "mini.pairs")
if not ok then
	print("Error loading mini.pairs")
	return
end
pairs.setup()

local ok, splitjoin = pcall(require, "mini.splitjoin")
if not ok then
	print("Error loading mini.splitjoin")
	return
end
splitjoin.setup()

local ok, surround = pcall(require, "mini.surround")
if not ok then
	print("Error loading mini.surround")
	return
end
surround.setup()

-- Mini::Workflow
local ok, bracketed = pcall(require, "mini.bracketed")
if not ok then
	print("Error loading mini.bracketed")
	return
end
bracketed.setup()

local ok, clue = pcall(require, "mini.clue")
if not ok then
	print("Error loading mini.clue")
	return
end
clue.setup()

local ok, diff = pcall(require, "mini.diff")
if not ok then
	print("Error loading mini.diff")
	return
end
diff.setup()

local ok, extra = pcall(require, "mini.extra")
if not ok then
	print("Error loading mini.extra")
	return
end
extra.setup()

local ok, files = pcall(require, "mini.files")
if not ok then
	print("Error loading mini.files")
	return
end
files.setup()

local ok, git = pcall(require, "mini.git")
if not ok then
	print("Error loading mini.git")
	return
end
git.setup()

local ok, jump = pcall(require, "mini.jump")
if not ok then
	print("Error loading mini.jump")
	return
end
jump.setup()

local ok, pick = pcall(require, "mini.pick")
if not ok then
	print("Error loading mini.pick")
	return
end
pick.setup()

local ok, sessions = pcall(require, "mini.sessions")
if not ok then
	print("Error loading mini.sessions")
	return
end
sessions.setup()

-- Mini::Appearance
local ok, cursorword = pcall(require, "mini.cursorword")
if not ok then
	print("Error loading mini.cursorword")
	return
end
cursorword.setup()

local ok, hipatterns = pcall(require, "mini.hipatterns")
if not ok then
	print("Error loading mini.hipatterns")
	return
end
hipatterns.setup()

local ok, icons = pcall(require, "mini.icons")
if not ok then
	print("Error loading mini.icons")
	return
end
icons.setup()

local ok, indentscope = pcall(require, "mini.indentscope")
if not ok then
	print("Error loading mini.indentscope")
	return
end
indentscope.setup()

local ok, notify = pcall(require, "mini.notify")
if not ok then
	print("Error loading mini.notify")
	return
end
notify.setup()

local ok, starter = pcall(require, "mini.starter")
if not ok then
	print("Error loading mini.starter")
	return
end
starter.setup()

local ok, statusline = pcall(require, "mini.statusline")
if not ok then
	print("Error loading mini.statusline")
	return
end
statusline.setup()

local ok, tabline = pcall(require, "mini.tabline")
if not ok then
	print("Error loading mini.tabline")
	return
end
tabline.setup()

local ok, fuzzy = pcall(require, "mini.fuzzy")
if not ok then
	print("Error loading mini.fuzzy")
	return
end
fuzzy.setup()
