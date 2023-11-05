vim.g.mapleader = ' '
vim.o.scrolloff = 999
vim.o.tabstop = 3
vim.o.shiftwidth = 3

function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
   	if vim.api.nvim_win_get_config(winid).zindex then
      	return
      end
   end
   -- THIS IS FOR BUILTIN LSP
   vim.diagnostic.open_float(0, {
   	scope = "cursor",
      focusable = false,
      close_events = {
      	"CursorMoved",
      	"CursorMovedI",
      	"BufHidden",
      	"InsertCharPre",
      	"WinLeave",
      },
   })
end
-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
   command = "lua OpenDiagnosticIfNoFloat()",
   group = "lsp_diagnostics_hold",
})
