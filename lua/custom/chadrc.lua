---@type ChadrcConfig
local M = {}

M.ui = { theme = 'kanagawa' }
M.plugins = 'custom.plugins'
M.mappings = require("custom.mappings")

require("custom.colors").setup()
require("custom.settings").setup()

return M

