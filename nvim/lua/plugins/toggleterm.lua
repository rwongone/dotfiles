-- ABOUTME: toggleterm.nvim configuration for multiple persistent terminals
-- ABOUTME: Terminal 1 for specs, Terminal 2 for Claude Code, toggle with <leader>t1/<leader>t2
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<leader>t1",
      "<cmd>1ToggleTerm direction=vertical<cr>",
      desc = "Toggle Terminal 1 (specs)",
    },
    {
      "<leader>t2",
      "<cmd>2ToggleTerm direction=vertical<cr>",
      desc = "Toggle Terminal 2 (Claude Code)",
    },
    {
      "<leader>tt",
      "<cmd>ToggleTerm direction=vertical<cr>",
      desc = "Toggle default terminal",
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
