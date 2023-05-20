local keymap = vim.keymap
--vim.keymap.set({'n','x'},'x','"_x"')

keymap.set({ "n", "x" }, "x", '"_x')
keymap.set("i", "jj", "<esc>")
