-- Cheat sheet for helpful default neovim commands.
-- *: highlight current word
-- gd: go to definition


vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
keymap.set("n", "<Right>", "<nop>", { desc = "Disable <Right>" })
keymap.set("n", "<Left>", "<nop>", { desc = "Disable <Left>" })
keymap.set("n", "<Up>", "<nop>", { desc = "Disable <Up>" })
keymap.set("n", "<Down>", "<nop>", { desc = "Disable <Down>" })

keymap.set("n", "j", "gj", { desc = "Move down visual line" })
keymap.set("n", "k", "gk", { desc = "Move up visual line" })

-- use ; instead of : for command mode
keymap.set("n", ";", ":", { desc = "Use ; instead of :" })
keymap.set("v", ";", ":", { desc = "Use ; instead of :" }) 

keymap.set("n", "<leader>th", function()
  vim.fn.VSCodeNotify('workbench.action.splitEditorRight')
end, { desc = "Split editor vertically (VSCode)" })

keymap.set("n", "<leader>tv", function()
  vim.fn.VSCodeNotify('workbench.action.splitEditorDown')
end, { desc = "Split editor horizontally (VSCode)" })

vim.keymap.set('n', '<C-h>', function() 
    vim.fn.VSCodeNotify('workbench.action.focusLeftGroup') 
end, { silent = true })
vim.keymap.set('n', '<C-j>', function() vim.fn.VSCodeNotify('workbench.action.focusBelowGroup') end, { silent = true })
vim.keymap.set('n', '<C-k>', function() vim.fn.VSCodeNotify('workbench.action.focusAboveGroup') end, { silent = true })
vim.keymap.set('n', '<C-l>', function() vim.fn.VSCodeNotify('workbench.action.focusRightGroup') end, { silent = true })

-- Normal mode: <leader>ff to open VSCode file search
vim.keymap.set('n', '<leader>\'', function()
    vim.fn.VSCodeNotify('workbench.action.quickOpen')
end, { desc = "Open file search" })

-- Use K to highlight current word and search globally
vim.keymap.set('n', 'K', function()
    vim.fn.VSCodeNotify('editor.action.addSelectionToNextFindMatch')
    vim.fn.VSCodeNotify('workbench.action.findInFiles')
end, { desc = "Highlight word and search globally" })
