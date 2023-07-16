local M = {}

M.disabled = {
  i = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
  },
  n = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-n>"] = "",
    ["<leader>n"] = "",
    ["<leader>x"] = "",
    ["<leader>b"] = "",
    ["<leader>ls"] = "",
    ["<leader>ra"] = "",
    ["<leader>ma"] = "",
    ["<leader>gt"] = "",
    ["<leader>cm"] = "",
  },
}

M.general = {
  i = {
    ["jk"] = {"<ESC>", "Leave insert mode" },
  },
  n = {
    -- Switch Between Windows
    ["<leader>h"] = { "<C-w>h", "Window left" },
    ["<leader>l"] = { "<C-w>l", "Window right" },
    ["<leader>j"] = { "<C-w>j", "Window down" },
    ["<leader>k"] = { "<C-w>k", "Window up" },

    -- Toggle Line Numbers
    ["<leader>nn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>nr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Buffer Management
    ["<leader>tn"] = { "<cmd> enew <CR>", "New buffer" },

    -- Window Management
    ["<leader>v"] = { "<C-w>v", "Split windows vertically" },
    ["<leader>x"] = { "<C-w>s", "Split windows horizontally" },
    ["<leader>b"] = { "<C-w>=", "Balance open windows" },
    ["<leader>wr"] = { ":close<CR>", "Close current window" },
    ["<leader>m"] = { ":MaximizerToggle<CR>", "Maximize current window" },
  },
}

-- Buffer Management
M.tabufline = {
  plugin = true,
  n = {
    -- close buffer + hide terminal buffer
    ["<leader>tr"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>sh"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "LSP rename",
    },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    -- Git Commands
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gfc"] = { "<cmd> Telescope git_bcommits <CR>", "Git commits for current file" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git Branches" },
    -- Colorsheme switcher
    ["<leader>cs"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

M.nvterm = {
  plugin = true,
  n = {
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

M.gitsigns = {
  plugin = true,
  n = {
    -- Actions
    ["<leader>bl"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint for the Debugger",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run the Debugger",
    }
  }
}

return M
