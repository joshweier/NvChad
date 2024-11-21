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

    -- vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', { noremap = true })

-- Guard updater
-- local ft = require('guard.filetype')
-- ft('c,cpp'):fmt('clang-format')

-- change this anywhere in your config, these are the defaults
vim.g.guard_config = {
    -- format on write to buffer
    fmt_on_save = true,
    -- use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
    -- whether or not to save the buffer after formatting
    save_on_fmt = true,
}

end

return M
