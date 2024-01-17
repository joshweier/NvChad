local M = {}

function M.setup()
    vim.opt.nu = true
    vim.opt.relativenumber = true

    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.smartindent = false
    vim.opt.wrap = false
    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.updatetime = 750
    vim.opt.signcolumn = "yes"

    vim.opt.hlsearch = false
    vim.opt.incsearch = true
    vim.opt.smartcase = true

    vim.opt.termguicolors = true

    vim.opt.cursorline = true
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 4

    vim.g.mapleader = " "

    vim.lsp.set_log_level("off")

    vim.opt.formatoptions:remove { "c", "r", "o" }

    vim.g.octo_viewer = "joshweier"

    vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward)')
end

return M
