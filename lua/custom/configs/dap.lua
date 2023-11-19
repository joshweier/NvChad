local dap = require('dap')

-- C++
dap.configurations.cpp = {
  -- GTC
  {
    name = "Launch GTC",
    type = "codelldb",
    request = "launch",
    program = function()
      return "${workspaceFolder}/build/deploy/bin/rsg3000"
    end,
    cwd = '${workspaceFolder}/build/deploy/data',
    args = {
      "--role",
      "gtc2",
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

return dap
