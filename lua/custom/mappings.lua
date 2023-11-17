local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line", },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue debugger", },
  }
}

M.overseer = {
  plugin = true,
  n = {
    ["<leader>rr"] = { "<cmd> OverseerRun <CR>", "Run a task", },
    ["<leader>rt"] = { "<cmd> OverseerToggle <CR>", "Toggle tasks", },
  }
}

M.undotree = {
  n = {
    ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "Toggle UndoTree" },
  }
}

M.fugitive = {
  n = {
    ["<leader>gs"] = { "<cmd> Git <CR>", "Fugitive" },
  }
}

M.general = {
  x = {
    ["<leader>p"] = { "\"_dP", "Paste over highlight" },
  },
  n = {
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Change word under cursor" },
    ["Q"] = { "<nop>", "Never do this!" },
    ["<leader>d"] = { "\"_d", "Delete word" },
    ["<leader>p"] = { "viwP", "Paste over word" },
    ["<leader>y"] = { "yiw", "Yank word" },
    ["<leader>c"] = { "ciw", "Change word" },
    ["<leader>o"] = { "O<ESC>", "Add line above" },
    ["<leader>;"] = { "m'A;<ESC>`", "Add semi-colon at EOL" },
    ["<leader>,"] = { "m'A,<ESC>`", "Add comma at EOL" },
    ["J"] = { "mzJ`z", "Join line" },
    ["<C-d>"] = { "<C-d>zz", "Move half page down" },
    ["<C-u>"] = { "<C-u>zz", "Move half page up" },
    ["n"] = { "nzzzv", "Search forward" },
    ["N"] = { "Nzzzv", "Search backward" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move visual block up" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move visual block down" },
    ["<leader>d"] = { "\"_d", "Delete word" },
  },
}

return M
