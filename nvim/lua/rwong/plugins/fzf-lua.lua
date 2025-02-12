return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin", },
  },
  config = function()
    local fzf = require("fzf-lua")

    -- calling `setup` is optional for customization
    fzf.setup(
      { "telescope" }
    )
    fzf.register_ui_select()

    vim.keymap.set("n", "<leader>'", fzf.files, { desc = "Fzf Files" })
    vim.keymap.set("n", "<leader>.", fzf.live_grep, { desc = "Fzf file contents" })
    -- TODO: fuzzy search file contents
  end
}
