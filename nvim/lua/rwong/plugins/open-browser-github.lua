return {
  "tyru/open-browser-github.vim",
  dependencies = {
    "tyru/open-browser.vim"
  },
  config = function()
    vim.keymap.set("n", "<leader>gp", "<Cmd>OpenGithubProject<CR>", { desc = "Open GitHub project" })
    vim.keymap.set("n", "<leader>gf", "<Cmd>OpenGithubFile<CR>", { desc = "Open GitHub file" })
    vim.keymap.set("v", "<leader>gf", ":OpenGithubFile<CR>", { desc = "Open GitHub file" })
  end
}
