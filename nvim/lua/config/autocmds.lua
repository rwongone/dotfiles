-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set iTerm2 tab title to the basename of nvim's cwd, restore on exit.
-- Disable nvim's own title management so its \e]0; sequences don't clobber our \e]1;.
vim.opt.title = false

local iterm_tab_title = vim.api.nvim_create_augroup("iterm_tab_title", { clear = true })

local function set_tab_title(name)
  vim.fn.chansend(vim.v.stderr, "\027]1;" .. name .. "\007")
end

local function set_to_cwd_basename()
  set_tab_title(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
end

-- VimEnter has already fired by the time LazyVim loads this file (VeryLazy),
-- so set the title immediately and rely on DirChanged for later updates.
set_to_cwd_basename()

vim.api.nvim_create_autocmd("DirChanged", {
  group = iterm_tab_title,
  callback = set_to_cwd_basename,
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = iterm_tab_title,
  callback = function()
    set_tab_title("")
  end,
})
