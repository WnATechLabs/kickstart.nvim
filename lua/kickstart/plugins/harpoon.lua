-- harpoon
-- https://github.com/ThePrimeagen/harpoon

return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader><leader>a", mark.add_file)
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    -- TODO: fix harpoon remaps
    vim.keymap.set("n", "<leader><leader>j", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader><leader>k", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader><leader>l", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader><leader>;", function() ui.nav_file(4) end)
  end,
}
