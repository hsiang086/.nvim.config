local plugins = {
  -- {
    -- "rcarriga/nvim-dap-ui",
    -- event = "VeryLazy",
    -- dependencies = "mfussenegger/nvim-dap",
    -- config = function()
      -- local dap = require("dap")
      -- local dapui = require("dapui")
      -- dapui.setup()
      -- dap.listeners.after.event_initialized["dapui_config"] = function()
        -- dapui.open()
      -- end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
        -- dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
        -- dapui.close()
      -- end
    -- end
  -- },
  { "nvim-neotest/nvim-nio" },
  -- { "mfussenegger/nvim-dap" },
  {
    'mfussenegger/nvim-dap',
    config = function()
			local dap, dapui = require("dap"), require("dapui")
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
		end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
			require("dapui").setup()
		end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
      dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
  },
  opts = {
    handlers = {},
    ensure_installed = {
      "codelldb",
    },
  },
  },
}

return plugins
