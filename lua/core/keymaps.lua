local keymap = vim.keymap
--vim.keymap.set({'n','x'},'x','"_x"')

local opts = { noremap = true, silent = true }

keymap.set({ "n", "x" }, "x", '"_x')
keymap.set("i", "jj", "<esc>")

keymap.set("n", "<A-h>", "<C-w>h", opts)
keymap.set("n", "<A-j>", "<C-w>j", opts)
keymap.set("n", "<A-k>", "<C-w>k", opts)
keymap.set("n", "<A-l>", "<C-w>l", opts)
