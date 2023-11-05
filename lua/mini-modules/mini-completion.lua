require("mini.completion").setup()

vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

vim.api.nvim_set_keymap('i', '<Down>',   [[pumvisible() ? "<C-o>j" : "\<Down>"]],   { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<Up>', [[pumvisible() ? "<C-o>k" : "\<Up>"]], { expr = true , noremap = true})
