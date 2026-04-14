-- If noice causes nvim to exit upon opening the cmdline,
-- run `:TSUninstall all` and restart neovim.
return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { enabled = true },
    },
  },
}
