return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup()

    -- Add keybinding to toggle Claude Code with current file as context
    vim.keymap.set('n', '<leader>cc', function()
      vim.cmd('ClaudeCode')
    end, { desc = 'Toggle Claude Code' })
  end
}
