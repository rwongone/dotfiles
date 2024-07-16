vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- disable some nuisance keys
keymap.set("i", "<ESC>", "<nop>", { desc = "Disable <ESC> in insert mode" })
keymap.set("n", "<F1>", "<nop>", { desc = "Disable F1" })
keymap.set("n", "Q", "<nop>", { desc = "Disable Q" })
keymap.set("n", "K", "<nop>", { desc = "Disable K" })

-- use ; instead of : for command mode
keymap.set("n", ";", ":", { desc = "Use ; instead of :" })
keymap.set("v", ";", ":", { desc = "Use ; instead of :" })


-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sh", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>e", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sw", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tw", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tj", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tk", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", { desc = "Open init.vimrc in vertical split" })
keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "Reload init.vimrc" })
