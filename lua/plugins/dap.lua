return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup({})
      require("nvim-dap-virtual-text").setup()

      local dap, dapui = require("dap"), require("dapui")

      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F6>", dap.restart)
      vim.keymap.set("n", "<F7>", dap.terminate)

      local function open_dapui()
        dapui.open()
        vim.cmd("Neotree close")
      end

      local function close_dapui()
        dapui.close()
        vim.cmd("Neotree show")
      end

      dap.listeners.before.event_initialized["dapui_config"] = open_dapui
      dap.listeners.before.event_terminated["dapui_config"] = close_dapui
      dap.listeners.before.event_exited["dapui_config"] = close_dapui

      require("dapui").setup()
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dap-go").setup()
    end,
  },
}
