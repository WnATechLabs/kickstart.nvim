-- codecompanion.nvim
-- https://github.com/olimorris/codecompanion.nvim

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        },
        slash_commands = {
          buffer = {
            provider = "telescope", -- must be one of: "telescope", "fzf_lua", "mini_pick", or "snacks"
          },
        },
      },
    })
  end,
}
