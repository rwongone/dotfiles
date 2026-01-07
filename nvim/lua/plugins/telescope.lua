-- ABOUTME: Telescope configuration and custom keybindings
-- ABOUTME: Adds keybindings for searching word under cursor and project-wide text search
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
        },
      },
    },
  },
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
