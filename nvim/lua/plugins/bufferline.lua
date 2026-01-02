-- ABOUTME: Bufferline configuration for buffer tab bar
-- ABOUTME: Excludes terminal buffers from showing in the tab bar
return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      -- Don't show terminal buffers in bufferline
      custom_filter = function(buf_number)
        local bufname = vim.api.nvim_buf_get_name(buf_number)
        -- Filter out terminal buffers
        if string.find(bufname, "term://") then
          return false
        end
        return true
      end,
    },
  },
}
