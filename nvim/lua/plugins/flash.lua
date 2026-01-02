-- ABOUTME: flash.nvim configuration to enhance / search with labels
-- ABOUTME: After searching with /, flash shows labels on matches for quick jumping
return {
  "folke/flash.nvim",
  opts = {
    modes = {
      search = {
        enabled = true, -- Enable flash for / and ? searches
      },
      char = {
        enabled = false, -- Disable flash for f, t, F, T motions
      },
    },
  },
  keys = {
    -- Disable default s and S keybindings (restore default Vim behavior)
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
  },
}
