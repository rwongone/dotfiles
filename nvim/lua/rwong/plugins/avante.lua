return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = "ws_ai",
    vendors = {
      ws_ai = {
        __inherited_from = "openai",
        endpoint = "https://llm.w10e.com/api",
        api_key_name = "LLM_API_KEY",
        model = "bedrock-claude-3.7-sonnet", -- your desired model
	      disable_tools = true, --this is because our LLM gateway does not yet accept Tools calls in OpenAI API
      },
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  },
}
