local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local lspconfig = require("lspconfig")

-- lspconfig.ccls.setup(
--     {
--         init_options = {
--             compilationDatabaseDirectory = "build";
--             index = {
--                 threads = 0;
--             };
--             clang = {
--                 excludeArgs = { "-frounding-math"} ;
--             };
--         }
--     }
-- )

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}

