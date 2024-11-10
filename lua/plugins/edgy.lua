return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "toggleterm",
        size = { height = 0.3 },
        -- exclude floating windows
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "lazyterm",
        title = "LazyTerm",
        size = { height = 0.3 },
        filter = function(buf)
          return not vim.b[buf].lazyterm_cmd
        end,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "spectre_panel", size = { height = 0.4 } },
      {
        ft = "dap-repl",
        title = "DAP REPL",
        size = { height = 0.3 },
      },
      {
        ft = "dapui_console",
        title = "DAP Console",
        size = { height = 0.3 },
      },
    },
    left = {
      {
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.6, width = 0.2 },
        pinned = true,
      },
      {
        title = "Neo-Tree Buffers",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        size = { height = 0.2, width = 0.2 },
        pinned = true,
        open = "Neotree position=top buffers",
      },
      {
        title = "Neo-Tree Git",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        size = { height = 0.2, width = 0.2 },
        pinned = true,
        open = "Neotree position=right git_status",
      },
      -- Add DAP UI panels to the left
      {
        ft = "dapui_scopes",
        title = "DAP Scopes",
        size = { height = 0.25, width = 0.2 },
      },
      {
        ft = "dapui_breakpoints",
        title = "DAP Breakpoints",
        size = { height = 0.25, width = 0.2 },
      },
      {
        ft = "dapui_stacks",
        title = "DAP Stacks",
        size = { height = 0.25, width = 0.2 },
      },
      {
        ft = "dapui_watches",
        title = "DAP Watches",
        size = { height = 0.25, width = 0.2 },
      },
    },
  },
}
