local ok, cmp = pcall(require, "cmp")
if not ok then
  return print(print("nvim-cmp failed to load!"))
end

local ok_2, lspkind = pcall(require, "lspkind")
if not ok_2 then
  return print(print("Lspkind failed to load!"))
end

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local ok_3, luasnip = pcall(require, "luasnip")
if not ok_3 then
  return print(print("Luasnip failed to load!"))
end
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = {
      border = "none",
      side_padding = 1,
      scrollbar = false,
    },
    documentation = {
      border = nil,
      scrollbar = "|",
    },
  },
  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      return lspkind.cmp_format()(entry, vim_item)
    end,
    lspkind.cmp_format({
      mode = "text_symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      symbol_map = { String = "§" },
    }),
  },
  mapping = cmp.mapping({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["|"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- that way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
        else
          fallback()
        end
      end,
    }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "path" },
  }),
  enabled = function()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "prompt" then
      return false
    end
    return true
  end,
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  view = {
    entries = { name = "wildmenu", separator = "|" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
    { name = "fuzzy_path", option = { fd_timeout_msec = 1500 } },
  }),
})
