local M = {}

function M.setup()
  vim.opt.nu = true
  vim.opt.relativenumber = true

  vim.opt.hlsearch = false
  vim.opt.incsearch = true

  vim.opt.termguicolors = true

  vim.opt.scrolloff = 8

  vim.g.mapleader = " "
end

return M
