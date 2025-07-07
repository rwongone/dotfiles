local opt = vim.opt

opt.numberwidth = 3

-- line numbering
opt.relativenumber = true
opt.number = true

-- relative line numbers in insert mode, normal line numbers in normal mode
vim.api.nvim_create_autocmd({"InsertEnter"}, {
  command = "set norelativenumber",
})
vim.api.nvim_create_autocmd({"InsertLeave"}, {
  command = "set relativenumber",
})
