-- ABOUTME: Scratchpad configuration using snacks.nvim
-- ABOUTME: Quick access to temporary scratch buffer for notes
return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>,",
      function()
        require("snacks").scratch()
      end,
      desc = "Open scratchpad",
    },
  },
}
