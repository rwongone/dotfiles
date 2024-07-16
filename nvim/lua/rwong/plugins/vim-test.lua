return {
  "vim-test/vim-test",
  config = function()
    vim.g["test#strategy"] = "neovim"
    vim.g["test#neovim#term_opener"] = "tabedit"
    vim.g["test#neovim#term_quit"] = "delete"
    vim.g["test#neovim#term_options"] = {
      "set nonumber",
      "set norelativenumber",
    }
    vim.g["test#ruby#use_binstubs"] = 0
    vim.g["test#javascript#runner"] = "jest"

    vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>", { silent = true })
    vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", { silent = true })
    vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<cr>", { silent = true })
    vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>", { silent = true })
  end,
}
