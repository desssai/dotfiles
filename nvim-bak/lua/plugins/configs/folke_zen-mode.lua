local plugin = {
  "folke/zen-mode.nvim",
  cmd = { "ZenMode" },
  init = function()
    require("core.mappings").set("mappings.folke_zen-mode")
  end,
  opts = {
    window = {
      backdrop = 0.9, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 180, -- width of the Zen window
      height = 1,  -- height of the Zen window
      options = {},
    },
    plugins = {
      -- disable some global vim options (vim.o...)
      options = {
        laststatus = 3,            -- turn off the statusline in zen mode
      },
      twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = false }, -- disables git signs
    },
  },
}

return plugin
