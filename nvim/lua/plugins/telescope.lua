-- ABOUTME: Telescope configuration and custom keybindings
-- ABOUTME: Adds keybindings for searching word under cursor and project-wide text search
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Search for the exact word under cursor
    {
      "K",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Search word under cursor",
    },
    -- Search project contents with fuzzy search
    {
      "<leader>ss",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Search project contents",
    },
  },
}
