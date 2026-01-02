-- ABOUTME: other.nvim configuration for switching between implementation and test files
-- ABOUTME: Handles both standard Rails structure and component-based monorepo structure
return {
  "rgroli/other.nvim",
  keys = {
    {
      "<C-n>",
      "<cmd>Other<CR>",
      desc = "Switch to alternate file (test/implementation)",
      mode = "n",
    },
  },
  config = function()
    require("other-nvim").setup({
      mappings = {
        -- Standard Rails: app/models/user.rb <-> spec/models/user_spec.rb
        {
          pattern = "/app/(.*).rb$",
          target = "/spec/%1_spec.rb",
          context = "spec",
        },
        {
          pattern = "/spec/(.*)_spec.rb$",
          target = "/app/%1.rb",
          context = "implementation",
        },
        -- Component-based: components/funding_intents/app/models/x.rb <-> components/funding_intents/spec/models/x_spec.rb
        {
          pattern = "/components/(.*)/app/(.*).rb$",
          target = "/components/%1/spec/%2_spec.rb",
          context = "spec",
        },
        {
          pattern = "/components/(.*)/spec/(.*)_spec.rb$",
          target = "/components/%1/app/%2.rb",
          context = "implementation",
        },
      },
    })
  end,
}
