local plugins = {
    -- Repeatable motions
    {
        "tpope/vim-repeat",
        event = "VeryLazy",
    },
    -- New command line
    {
        "utilyre/barbecue.nvim",
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },
    {
        'VonHeikemen/fine-cmdline.nvim',
        event = "VeryLazy",
        dependencies = { 'MunifTanjim/nui.nvim' },
        config = function()
            require('fine-cmdline').setup({})
        end,
    },
    -- Leap movement
    {
        'ggandor/leap.nvim',
        event = "VeryLazy",
        config = function()
            require('leap').add_default_mappings()
        end,
    },
    -- Flit (Leap extension)
    {
        'ggandor/flit.nvim',
        event = "VeryLazy",
        config = function()
            require('flit').setup {
                labeled_modes = "nvo"
            }
        end,
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
    -- Copilot
    {
        "github/copilot.vim",
        event = "VeryLazy"
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- Fugitive
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        mappings = function()
            require("core.utils").load_mappings("fugitive")
        end,
    },
    -- Highlighted yank
    {
        "machakann/vim-highlightedyank",
        event = "VeryLazy",
    },
    -- TMUX Navigation
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
        require("core.utils").load_mappings("tmuxnavigator"),
    },
    -- Autosave
    {
        "pocco81/auto-save.nvim",
        event = "VeryLazy",
        config = function()
            require("auto-save").setup()
        end,
    },
    -- CMake
    {
        "cdelledonne/vim-cmake",
        event = "VeryLazy",
        config = function()
            require("custom.configs.vim-cmake")
            require("core.utils").load_mappings("cmake")
        end,
    },
    -- Undotree
    {
        "mbbill/undotree",
        event = "VeryLazy",
        config = function(_, _)
            require("core.utils").load_mappings("undotree")
        end
    },
    -- Task running
    {
        'stevearc/overseer.nvim',
        event = "VeryLazy",
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
                -- dapui.open()
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
        event = "VeryLazy",
        config = function(_, _)
            require("custom.configs.dap")
            require("core.utils").load_mappings("dap")
        end
    },
    -- Format / linting
    {
        "nvimdev/guard.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvimdev/guard-collection",
        },
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
    -- LSP Helper
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    -- Mark handling in Telescope
    {
        "chentoast/marks.nvim",
        event = "BufReadPre",
        lazy = false,
        opts = {}
    },
    -- Close buffers
    {
        "chrisgrieser/nvim-early-retirement",
        config = true,
        event = "VeryLazy",
    },
    -- {
    --     "axkirillov/hbac.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         autoclose = true,
    --         threshold = 10,
    --     },
    -- },
    -- Force better Vim discipline
    -- {
    --     "m4xshen/hardtime.nvim",
    --     enabled = false,
    --     event = "VeryLazy",
    --     -- enabled = false,
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = {}
    -- },
    -- Show undo
    {
        "tzachar/highlight-undo.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- Diff view
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- Notifications
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require "notify".setup({
                background_colour = "#000000",
            })
            vim.notify = require("notify")
        end,
    },
    -- Github Issue / PR integration
    {
        "pwntester/octo.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require "octo".setup({
                enable_builtin = true
            })
        end,
        keys = {
            { "<leader>to", "<cmd>Octo<cr>" },
        },
    },
    {
        "debugloop/telescope-undo.nvim",
        event = "VeryLazy",
        dependencies = { -- note how they're inverted to above example
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            { -- lazy style key map
                "<leader>tu",
                "<cmd>Telescope undo<cr>",
                desc = "undo history",
            },
        },
        opts = {
            -- don't use `defaults = { }` here, do this in the main telescope spec
            extensions = {
                undo = {
                    -- telescope-undo.nvim config, see below
                },
                -- no other extensions here, they can have their own spec too
            },
        },
        config = function(_, opts)
            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- Error helper
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
        },
    },
    -- Git search with history
    {
        "aaronhallaert/advanced-git-search.nvim",
        event = "VeryLazy",
        config = function()
            require("telescope").load_extension("advanced_git_search")
        end,
    },
    -- Add text objects from treesitter
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    lsp_interop = {
                        enable = true,
                        peek_definition_code = {
                            ["<leader>df"] = "@function.outer",
                            ["<leader>dF"] = "@class.outer",
                        },
                    },

                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

                            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                            ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
                            ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

                            ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
                            ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

                            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                        },
                    },
                },
            })
        end,
    },
}

return plugins
