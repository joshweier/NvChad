local plugins = {
    -- Copilot
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     build = ":Copilot auth",
    --     opts = {
    --         suggestion = { enabled = false },
    --         panel = { enabled = false },
    --         filetypes = {
    --             markdown = true,
    --             help = true,
    --         },
    --     },
    -- },
    -- -- Copilot cmp
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     dependencies = "copilot.lua",
    --     config = function(_, opts)
    --         local copilot_cmp = require("copilot_cmp")
    --         copilot_cmp.setup(opts)
    --         -- attach cmp source whenever copilot attaches
    --         -- fixes lazy-loading issues with the copilot cmp source
    --         require("lazyvim.util").lsp.on_attach(function(client)
    --             if client.name == "copilot" then
    --                 copilot_cmp._on_insert_enter({})
    --             end
    --         end)
    --     end,
    -- },
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
            -- require("core.utils").load_mappings("fugitive")
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
        require("core.utils").load_mappings("tmuxnavigator"),
        lazy = false
    },
    -- Autosave
    {
        lazy = false,
        "pocco81/auto-save.nvim",
        config = function ()
            require("auto-save").setup()
        end,
    },
    -- CMake tools
    -- {
    --     lazy = false,
    --     "civitasv/cmake-tools.nvim",
    --     config = function ()
    --         -- require("cmake-tools").setup()
    --     end,
    -- },
    {
        lazy = false,
        "cdelledonne/vim-cmake",
        config = function ()
            require("custom.configs.vim-cmake")
            require("core.utils").load_mappings("cmake")
        end,
    },
    -- Undotree
    {
        lazy = false,
        "mbbill/undotree",
        config = function (_, _)
            -- require("core.utils").load_mappings("undotree")
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
            -- Auto opens
            dap.listeners.after.event_initialized["dapui_config"] = function ()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function ()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function ()
                dapui.close()
            end

            -- Mapping
            require("core.utils").load_mappings("dapui")
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
            require("custom.configs.dap")
            require("core.utils").load_mappings("dap")
        end
    },
    -- Format / linting
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     event = "VeryLazy",
    --     opts = function ()
    --         return require("custom.configs.null-ls")
    --     end
    -- },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
}

return plugins
