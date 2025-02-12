vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if there are command-line arguments (files to open)
    if vim.fn.argc() > 0 then
      -- Wait for the files to be opened
      vim.cmd("silent! argdo tabnew %")
      vim.cmd("tabfirst")
    end

    -- Now create the new tab with terminal
    vim.cmd("tabnew")
    vim.cmd("setlocal nonumber norelativenumber")
    vim.cmd("terminal")

    vim.cmd("vsplit | terminal")
    vim.cmd("setlocal nonumber norelativenumber")
    vim.cmd("split | terminal")
    vim.cmd("setlocal nonumber norelativenumber")

    -- Return focus to first split
    vim.cmd("wincmd h")

    -- Optionally, switch back to the first tab
    vim.cmd("tabfirst")
  end
})
