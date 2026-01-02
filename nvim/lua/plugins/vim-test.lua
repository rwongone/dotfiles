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
    {
      "<leader>to",
      function()
        -- Find test terminal window
        local term_win = nil
        local current_win = vim.api.nvim_get_current_win()

        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          local bufname = vim.api.nvim_buf_get_name(buf)
          if string.find(bufname, "term://") then
            term_win = win
            break
          end
        end

        if term_win then
          local height = vim.api.nvim_win_get_height(term_win)
          if height <= 1 then
            -- Terminal is hidden, restore it
            vim.api.nvim_win_set_height(term_win, 15)
            vim.api.nvim_set_current_win(term_win)
          else
            -- Terminal is visible, hide it
            vim.api.nvim_win_set_height(term_win, 1)
            if current_win == term_win then
              -- If we're in the terminal, jump back to previous window
              vim.cmd("wincmd p")
            end
          end
        else
          -- No terminal window found, run last test to open it
          vim.cmd("TestLast")
        end
      end,
      desc = "Toggle test output window",
    },
  },
  config = function()
    -- Use Neovim terminal for running tests (sticky = reuses same terminal)
    vim.g["test#strategy"] = {
      nearest = "neovim_sticky",
      file = "neovim_sticky",
      suite = "neovim_sticky",
    }

    -- Use bundle exec rspec for Ruby tests
    vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"

    -- Neovim-specific: Start terminal in normal mode (not insert mode)
    -- This allows you to immediately scroll through test output
    vim.g["test#neovim#start_normal"] = 1

    -- Clear screen from previous run
    vim.g["test#preserve_screen"] = 0

    -- Sticky terminal options
    vim.g["test#neovim_sticky#kill_previous"] = 1 -- Try to abort previous run
    vim.g["test#neovim_sticky#reopen_window"] = 1 -- Reopen terminal split if not visible
    vim.g["test#neovim_sticky#use_existing"] = 1 -- Use manually opened terminal, if exists

    -- Quick close test window with 'q' in normal mode
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "toggleterm" or string.find(vim.api.nvim_buf_get_name(0), "term://") then
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true, desc = "Close terminal window" })
        end
      end,
    })
  end,
}
