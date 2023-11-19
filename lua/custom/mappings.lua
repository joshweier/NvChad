local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line", },
    ["<F5>"] = { "<cmd> DapContinue <CR>", "Start or continue debugger", },
  }
}

M.dapui = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle the DAP UI"
    }
  }
}

M.cmake = {
  plugin = true,
  n = {
    ["<F7>"] = { "<cmd> CMakeBuild <CR>", "Build current target", },
    ["<leader><Esc>"] = { "<cmd> CMakeClose <CR>", "Close the terminal window", },
    ["<leader>ci"] = { "<cmd> CMakeInstall <CR>", "Install", },
  }
}

M.tmuxnavigator = {
  plugin = true,
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "TMux Navigate Left", },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "TMux Navigate Right", },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "TMux Navigate Up", },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "TMux Navigate Down", },
  }
}

M.overseer = {
  plugin = true,
  n = {
    ["<leader>rr"] = { "<cmd> OverseerRun <CR>", "Run a task", },
    ["<leader>rt"] = { "<cmd> OverseerToggle <CR>", "Toggle tasks", },
  }
}

M.fugitive = {
  plugin = true,
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
