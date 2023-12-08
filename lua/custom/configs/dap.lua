local dap = require('dap')

-- C++
dap.configurations.cpp = {
  -- GTC
  {
    name = "Launch GTC1",
    type = "codelldb",
    request = "launch",
    program = function()
      return "${workspaceFolder}/build/deploy/bin/rsg3000"
    end,
    cwd = '${workspaceFolder}/build/deploy/data',
    args = {
      "--role",
      "gtc1",
      "--data-path",
      "/Users/joshuaweier/dev/rsg1000/data"
    },
    stopOnEntry = false,
  },
  {
    name = "Launch GTC2",
    type = "codelldb",
    request = "launch",
    program = function()
      return "${workspaceFolder}/build/deploy/bin/rsg3000"
    end,
    cwd = '${workspaceFolder}/build/deploy/data',
    args = {
      "--role",
      "gtc2",
      "--data-path",
      "/Users/joshuaweier/dev/rsg1000/data"
    },
    stopOnEntry = false,
  },
  {
    name = "Launch GTC3",
    type = "codelldb",
    request = "launch",
    program = function()
      return "${workspaceFolder}/build/deploy/bin/rsg3000"
    end,
    cwd = '${workspaceFolder}/build/deploy/data',
    args = {
      "--role",
      "gtc3",
      "--data-path",
      "/Users/joshuaweier/dev/rsg1000/data"
    },
    stopOnEntry = false,
  },
  -- PFD
  {
    name = "Launch PFD",
    type = "codelldb",
    request = "launch",
    program = function()
      return "${workspaceFolder}/build/deploy/bin/rsg3000"
    end,
    cwd = '${workspaceFolder}/build/deploy/data',
    args = {
      "--role",
      "pfd",
      "--data-path",
      "/Users/joshuaweier/dev/rsg1000/data"
    },
    stopOnEntry = false,
  },
  -- MFD
  {
    name = "Launch MFD",
    type = "codelldb",
    request = "launch",
    program = function()
      return "${workspaceFolder}/build/deploy/bin/rsg3000"
    end,
    cwd = '${workspaceFolder}/build/deploy/data',
    args = {
      "--role",
      "mfd",
      "--terrain-path",
      "/Users/joshuaweier/dev/aws_dirs/tiledata",
      "--vector-path",
      "/Users/joshuaweier/dev/aws_dirs/vectordata",
      "--data-path",
      "/Users/joshuaweier/dev/rsg1000/data"
    },
    stopOnEntry = false,
  },
  -- AVS
  {
    name = "Launch AVS",
    type = "codelldb",
    request = "launch",
    program = function()
      return "${workspaceFolder}/build/deploy/bin/rsg3000_avionics"
    end,
    cwd = '${workspaceFolder}/build/deploy/data',
    args = {
      "--sim-path",
      "/Users/joshuaweier/Library/Application Support/Steam/steamapps/common/X-Plane 12"
    },
    stopOnEntry = false,
  },
}

-- Don't break on raised exceptions
dap.defaults.fallback.exception_breakpoints = {'raised'}

-- Change the breakpoint sign
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

return dap
