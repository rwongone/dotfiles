-- ABOUTME: toggleterm.nvim configuration for persistent terminals
-- ABOUTME: <leader>tt for default terminal, <leader>tc for Claude Code
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<leader>tt",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local default_term = Terminal:new({
          direction = "vertical",
          hidden = false,
          count = 1,
          on_open = function(term)
            vim.cmd("startinsert!")
          end,
        })
        default_term:toggle()
      end,
      desc = "Toggle default terminal",
    },
    {
      "<leader>tc",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local claude_term = Terminal:new({
          cmd = "claude",
          direction = "vertical",
          hidden = false,
          count = 2,
          on_open = function(term)
            vim.cmd("startinsert!")
          end,
        })
        claude_term:toggle()
      end,
      desc = "Toggle Claude Code terminal",
    },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.3
      end
    end,
    open_mapping = false, -- We'll use our own keybindings
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = false,
    terminal_mappings = true,
    persist_size = false, -- Always reset to configured size
    persist_mode = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
  },
}
