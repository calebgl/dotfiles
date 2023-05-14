local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<Esc>"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
  }
}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },

    ["<A-j>"] = { "<cmd>m .+1<cr>==", "move down" },
    ["<A-k>"] = { "<cmd>m .-2<cr>==", "move up" }
  },

  i = {
    ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", "move down" },
    ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", "move up" }
  },

  v = {
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", "move down" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", "move up" },

    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  }
}

M.dap = {
  plugin = true,

  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint<CR>", "toggle breakpoint" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "open debugging sidebar"
    }
  }
}

M.telescope = {
  n = {
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
  }
}

return M
