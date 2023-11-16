local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue debugger",
    },
  }
}

M.overseer = {
  plugin = true,
  n = {
    ["<leader>rr"] = {
      "<cmd> OverseerRun <CR>",
      "Run a task",
    },
    ["<leader>rt"] = {
      "<cmd> OverseerToggle <CR>",
      "Toggle tasks",
    },
  }
}

M.general = {
  n = {
    ["<leader>d"] = {
      "viwd",
      "Delete word"
    },
    ["<leader>p"] = {
      "viwP",
      "Paste over word"
    },
    ["<leader>y"] = {
      "yiw",
      "Yank word"
    },
    ["<leader>c"] = {
      "ciw",
      "Change word"
    },
    ["<leader>o"] = {
      "O<ESC>",
      "Add line above"
    },
    ["<leader>;"] = {
      "m'A;<ESC>`",
      "Add semi-colon at EOL"
    },
    ["<leader>,"] = {
      "m'A,<ESC>`",
      "Add comma at EOL"
    },
  }
}

return M
