-- Mofiqul/adwaita.nvim
-- https://github.com/Mofiqul/adwaita.nvim

return {
    "Mofiqul/adwaita.nvim",
    config = function()
        vim.g.adwaita_darker = true     -- for darker version
        vim.g.adwaita_disable_cursorline = false -- to disable cursorline
        vim.g.adwaita_transparent = true -- makes the background transparent
    end,
}
