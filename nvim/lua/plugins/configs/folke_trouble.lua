local plugin = {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    require("core.mappings").set("mappings.folke_trouble")
  end,
  opts = {
    action_keys = { -- key mappings for actions in the trouble list
      close = "q", -- close the list
    },
  },
}

return plugin
