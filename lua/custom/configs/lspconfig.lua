local configs = require("plugins.configs.lspconfig")
local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(
            bufnr,
            "FormatModifications",
            function()
                print("Format")
                local lsp_format_modifications = require("lsp-format-modifications")
                lsp_format_modifications.format_modifications(client, bufnr)
            end,
            {}
        )
        configs.on_attach(client, bufnr)
    end,
    capabilities = configs.capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}

