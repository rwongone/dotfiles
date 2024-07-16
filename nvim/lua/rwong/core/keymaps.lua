vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>qq", ":qa!<CR>", { desc = "Full exit" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- disable some nuisance keys
keymap.set("i", "<ESC>", "<nop>", { desc = "Disable <ESC> in insert mode" })
keymap.set("n", "<F1>", "<nop>", { desc = "Disable F1" })
keymap.set("n", "Q", "<nop>", { desc = "Disable Q" })
keymap.set("n", "K", "<nop>", { desc = "Disable K" })
keymap.set("n", "<Right>", "<nop>", { desc = "Disable <Right>" })
keymap.set("n", "<Left>", "<nop>", { desc = "Disable <Left>" })
keymap.set("n", "<Up>", "<nop>", { desc = "Disable <Up>" })
keymap.set("n", "<Down>", "<nop>", { desc = "Disable <Down>" })

-- use ; instead of : for command mode
keymap.set("n", ";", ":", { desc = "Use ; instead of :" })
keymap.set("v", ";", ":", { desc = "Use ; instead of :" })


-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>th", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>tv", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>teh", ":vsplit | term<CR>", { desc = "Split window vertically and open a terminal" }) -- split window horizontally and open a terminal
keymap.set("n", "<leader>tev", ":split | term<CR>", { desc = "Split window horizontally and open a terminal" }) -- split window horizontally and open a terminal
keymap.set("n", "<leader>e", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>tw", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" }) -- move to left split
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" }) -- move to bottom split
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" }) -- move to top split
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" }) -- move to right split
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move to left split from a terminal" }) -- move to left split
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom split from a terminal" }) -- move to bottom split
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move to top split from a terminal" }) -- move to top split
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move to right split from a terminal" }) -- move to right split

keymap.set("n", "<leader>n", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>w", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<S-L>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-H>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<S-T>", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", { desc = "Open init.vimrc in vertical split" })
keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "Reload init.vimrc" })
