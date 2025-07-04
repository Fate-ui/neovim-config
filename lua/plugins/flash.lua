return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = {
    ---@type table<string, Flash.Config>
    modes = {
      char = {
        enabled = false,
      },
    },
  },
}
