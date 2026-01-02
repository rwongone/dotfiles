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
        -- Find test terminal window (horizontal split below)
        local term_win = nil
        local current_win = vim.api.nvim_get_current_win()

        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          local bufname = vim.api.nvim_buf_get_name(buf)
          local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
          -- Find terminal that's not toggleterm
          if string.find(bufname, "term://") and filetype ~= "toggleterm" then
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
    -- Use bundle exec rspec for Ruby tests
    vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"

    -- Use custom strategy to always open below in left column only
    vim.g["test#custom_strategies"] = {
      bottom_split = function(cmd)
        -- Create new buffer for terminal
        local buf = vim.api.nvim_create_buf(false, true)
        -- Open horizontal split below current window (not full width)
        vim.cmd("belowright split")
        vim.api.nvim_win_set_buf(0, buf)
        -- Set height to 15 lines
        vim.api.nvim_win_set_height(0, 15)
        -- Open terminal with the command in the new buffer
        vim.fn.termopen(cmd)
        -- Start in normal mode
        vim.cmd("stopinsert")
      end,
    }

    vim.g["test#strategy"] = "bottom_split"

    -- Clear screen from previous run
    vim.g["test#preserve_screen"] = 0

    -- Quick close test window with 'q' in normal mode
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        -- Only for vim-test terminals (not toggleterm)
        if string.find(bufname, "term://") and not vim.bo.filetype == "toggleterm" then
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true, desc = "Close terminal window" })
        end
      end,
    })
  end,
}
