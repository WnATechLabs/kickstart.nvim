-- Split management
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "[s]plit [v]ertical: Open a vertical split" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "[s]plit [h]orizontal: Open a horizontal split" })
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "[s]plit [c]lose: Close the current split" })
vim.keymap.set("n", "<leader>so", "<cmd>only<CR>", { desc = "[s]plit [o]nly: Close all other splits" })
vim.keymap.set("n", "<leader>ss", "<C-w>R", { desc = "[s]plit [s]wap: Rotate splits" })
vim.keymap.set("n", "<leader>sV", "<C-w>_", { desc = "[s]plit maximize [V]ertically" })
vim.keymap.set("n", "<leader>sH", "<C-w>|", { desc = "[s]plit maximize [H]orizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "[s]plit [e]qualize: Equalize split sizes" })

vim.keymap.set("n", "<C-Up>", "<cmd>resize -3<CR>", { desc = "Resize split Up" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +3<CR>", { desc = "Resize split Down" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -3<CR>", { desc = "Resize split Left" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +3<CR>", { desc = "Resize split Right" })
