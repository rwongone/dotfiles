-- ABOUTME: Disable noice.nvim - it was causing vim to exit when typing : or ;
-- ABOUTME: Using default vim cmdline instead
return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { enabled = true },
    },
  },
}
