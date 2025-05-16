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