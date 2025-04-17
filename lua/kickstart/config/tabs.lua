-- Tab management
vim.keymap.set("n", "<leader>ta", "<cmd>tab split<CR>", { desc = "[t]ab [a]dd: Split current window into a new tab" })
vim.keymap.set("n", "<leader>tA", "<cmd>tabnew<CR>", { desc = "[t]ab [A]dd new: Open a new empty tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "[t]ab [c]lose: Close the current tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "[t]ab [o]nly: Close all other tabs" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "[t]ab [n]ext: Go to the next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "[t]ab [p]revious: Go to the previous tab" })

