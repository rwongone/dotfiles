return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "junegunn/fzf",
      build = "./install --bin",
    }
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})

    vim.keymap.set("n", "<leader>'", require('fzf-lua').files, { desc = "Fzf Files" })
    -- TODO: fuzzy search file contents
  end
}
