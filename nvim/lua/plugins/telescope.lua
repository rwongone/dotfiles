-- ABOUTME: Telescope configuration and custom keybindings
-- ABOUTME: Adds keybindings for searching word under cursor and project-wide text search
return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
    }
  end,
  keys = {
    -- Search for the exact word under cursor
    {
      "<leader>k",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Search word under cursor",
    },
    -- Search project contents with fuzzy search
    {
      "<leader>.",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Search project contents",
    },
  },
}
