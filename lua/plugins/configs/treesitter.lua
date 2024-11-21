local options = {
    ensure_installed = {
        "lua",
        "cpp",
        "c",
        "javascript",
        "css",
        "html"
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = {
        enable = false
    },
}

return options
