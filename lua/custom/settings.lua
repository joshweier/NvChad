local M = {}

function M.setup()
    vim.opt.nu = true
    vim.opt.relativenumber = true

    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    vim.opt.smartindent = false
    vim.opt.wrap = false
    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.updatetime = 750
    vim.opt.signcolumn = "yes"

    vim.opt.hlsearch = false
    vim.opt.incsearch = true

    vim.opt.termguicolors = true

    vim.opt.scrolloff = 8

    vim.g.mapleader = " "

    vim.opt.formatoptions:remove{ "c", "r", "o" }
    -- vim.opt.switchbuf = "useopen"

    -- vim.g.copilot_assume_mapped = true
    vim.g.octo_viewer = "joshweier"
end

return M
