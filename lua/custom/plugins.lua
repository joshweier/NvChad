local plugins = {
  -- vim-surround
  {
    "tpope/vim-surround",
    lazy = false
  },
  -- Fugitive
  {
    "tpope/vim-fugitive",
    lazy = false,
    mappings = function ()
      require("core.utils").load_mappings("fugitive")
    end,
  },
  -- quick-scope
  {
    "unblevable/quick-scope",
    lazy = false
  },
  -- vim-highlightedyank
  {
    "machakann/vim-highlightedyank",
    lazy = false
  },
  -- tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  -- CMake tools
  {
    lazy = false,
    "cdelledonne/vim-cmake",
    config = function ()
      require("custom.configs.vim-cmake")
    end,
  },
  -- Undotree
  {
    lazy = false,
    "mbbill/undotree",
    config = function (_, _)
      require("core.utils").load_mappings("undotree")
    end
  },
  -- Task running
  {
    lazy = false,
    'stevearc/overseer.nvim',
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = function ()
     require("custom.configs.overseer")
    end,
    config = function (_, _)
      require("core.utils").load_mappings("overseer")
    end
  },
  -- Debugging UI
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  -- Debugger integration
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    }
  },
  -- Debugger integration
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
      require('dap').defaults.fallback.exception_breakpoints = {'raised'}
    end
  },
  {
   "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
     return require("custom.configs.null-ls")
    end
  },
}

return plugins
