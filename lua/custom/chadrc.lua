---@type ChadrcConfig
local M = {}

M.ui = { theme = 'catppuccin' }
M.plugins = 'custom.plugins'
M.mappings = require("custom.mappings")

-- require("overseer").setup()

return M

