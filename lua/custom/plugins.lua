local plugins = {
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons'      -- optional
        },
    },
    -- Session management
    {
        'tpope/vim-obsession',
        event = "VeryLazy",
        config = function()
        end,
    },
    -- Better completion logic
    {
        'theHamsta/nvim-dap-virtual-text',
        event = "VeryLazy",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
    -- Better quickfix
    {
        'kevinhwang91/nvim-bqf',
        event = "VeryLazy",
        config = function()
            require("bqf").setup({
                auto_enable = true
            })
        end,
    },
    -- Comment highlights
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        }
    },
    {
        "github/copilot.vim",
        event = "VeryLazy"
    },
    -- vim-surround
    {
        "tpope/vim-surround",
        event = "VeryLazy",
    },
    -- Fugitive
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        mappings = function()
            require("core.utils").load_mappings("fugitive")
        end,
    },
    -- quick-scope
    -- {
    --     "unblevable/quick-scope",
    --     event = "VeryLazy",
    -- },
    -- vim-highlightedyank
    {
        "machakann/vim-highlightedyank",
        event = "VeryLazy",
    },
    -- tmux navigation
    {
        "christoomey/vim-tmux-navigator",
        require("core.utils").load_mappings("tmuxnavigator"),
        event = "VeryLazy",
    },
    -- Autosave
    {
        event = "VeryLazy",
        "pocco81/auto-save.nvim",
        config = function()
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
        event = "VeryLazy",
        "cdelledonne/vim-cmake",
        config = function()
            require("custom.configs.vim-cmake")
            require("core.utils").load_mappings("cmake")
        end,
    },
    -- Undotree
    {
        lazy = false,
        "mbbill/undotree",
        config = function(_, _)
            require("core.utils").load_mappings("undotree")
        end
    },
    -- Task running
    {
        event = "VeryLazy",
        'stevearc/overseer.nvim',
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = function()
            require("custom.configs.overseer")
        end,
        config = function(_, _)
            require("core.utils").load_mappings("overseer")
        end
    },
    -- Debugging UI
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            -- Auto opens
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
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
        config = function(_, _)
            require("custom.configs.dap")
            require("core.utils").load_mappings("dap")
        end
    },
    -- Format / linting
    {
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
        event = "VeryLazy",
        config = function()
            -- Setup CPP
            local ft = require('guard.filetype')
            ft('c,cpp,json'):fmt('clang-format')

            require('guard').setup({
                fmt_on_save = false,
                lsp_as_default_formatter = false,
            })
        end,
        mappings = function()
            require("core.utils").load_mappings("guard")
        end,
    },
    -- Only format modifications
    {
        event = "VeryLazy",
        "joechrisellis/lsp-format-modifications.nvim"
    },
    {
        event = "VeryLazy",
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        event = "VeryLazy",
        'ThePrimeagen/harpoon',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- config = true,
        config = function()
            require("telescope").load_extension("harpoon")
        end,
        -- FIXME: Move out to the proper mappings
        keys = {
            { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Mark file with harpoon" },
            { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>",          desc = "Go to next harpoon mark" },
            { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          desc = "Go to previous harpoon mark" },
            { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
            { "<leader>fh", "<cmd> Telescope harpoon marks <CR>",                     desc = "Telescope: Harpoon Marks" },
        },
    }
}

return plugins
