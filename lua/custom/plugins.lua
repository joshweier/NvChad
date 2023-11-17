local plugins = {
  {
    "tpope/vim-surround",
    lazy = false
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    mappings = function ()
      require("core.utils").load_mappings("fugitive")
    end,
  },
  {
    "unblevable/quick-scope",
    lazy = false
  },
  {
    "machakann/vim-highlightedyank",
    lazy = false
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    lazy = false,
    "cdelledonne/vim-cmake",
    config = function ()
      require("custom.configs.vim-cmake")
    end,
  },
  {
    lazy = false,
    "mbbill/undotree",
    config = function (_, _)
      require("core.utils").load_mappings("undotree")
    end
  },
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
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
     return require("custom.configs.null-ls")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb"
      }
    }
  }
}

return plugins
