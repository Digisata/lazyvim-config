return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
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

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

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
