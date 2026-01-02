-- ABOUTME: vim-test configuration for running Ruby RSpec tests
-- ABOUTME: Simpler test runner with better monorepo path handling than neotest
return {
  "vim-test/vim-test",
  keys = {
    {
      "<leader>tf",
      "<cmd>TestFile<cr>",
      desc = "Run tests in current file",
    },
    {
      "<leader>tn",
      "<cmd>TestNearest<cr>",
      desc = "Run nearest test",
    },
    {
      "<leader>ts",
      "<cmd>TestSuite<cr>",
      desc = "Run entire test suite",
    },
    {
      "<leader>tl",
      "<cmd>TestLast<cr>",
      desc = "Re-run last test",
    },
    {
      "<leader>tv",
      "<cmd>TestVisit<cr>",
      desc = "Visit last test file",
    },
  },
  config = function()
    -- Use Neovim terminal for running tests
    vim.g["test#strategy"] = "neovim"

    -- Use bundle exec rspec for Ruby tests
    vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"

    -- Neovim-specific: Start terminal in normal mode (not insert mode)
    -- This allows you to immediately scroll through test output
    vim.g["test#neovim#start_normal"] = 1

    -- Neovim-specific: Preserve screen on multiple runs
    vim.g["test#preserve_screen"] = 0
  end,
}
