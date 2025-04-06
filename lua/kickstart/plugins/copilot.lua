-- copilot.vim
-- https://github.com/github/copilot.vim

return {
  "github/copilot.vim",
  -- Optional dependency
  config = function()
    -- use this table to disable/enable copilot file types
    -- vim.g.copilot_filetypes = {
    --   lua = true,
    --   python = true,
    -- }

    -- since most are enable by default you can turn them off
    -- using this table and only enable for a few filetypes
    -- vim.g.copilot_filetypes = { ["*"] = false, lua = true, python = true }

    -- hardcodes a nvm's node version
    vim.g.copilot_node_command = "~/.nvm/versions/node/v22.13.0/bin/node"

    -- Replace default copilot accept suggestion
    -- vim.g.copilot_no_tab_map = true
    -- vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
    --   expr = true,
    --   replace_keycodes = false
    -- })

    vim.keymap.set('i', '<C-a>', '<Plug>(copilot-next)', { desc = "Next LLM suggestion" })
    -- vim.keymap.set('i', '<M-]>', '<Plug>(copilot-dismiss)')
  end,
}
