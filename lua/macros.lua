local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Conform
autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    ---@diagnostic disable-next-line: discard-returns
    require("conform").format({ bufnr = args.bug })
  end,
})

-- Commands
vim.api.nvim_create_user_command("Files", function() MiniFiles.open() end, {})
