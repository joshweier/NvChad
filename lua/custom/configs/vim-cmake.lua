-- Setup our build config options
vim.g.cmake_build_dir_location = "./build/"
vim.g.cmake_generate_options = "-G Ninja"

local cmakeGroup = vim.api.nvim_create_augroup("cmakeGroup", {})

-- Close the terminal automatically when we succeed
vim.api.nvim_create_autocmd("User", {
    pattern = 'CMakeBuildSucceeded',
    callback = function()
        print("Build succeeded")
        vim.cmd("CMakeInstall")
        vim.cmd("CMakeClose")
    end,
    group = cmakeGroup
})

-- Open the quickfix window when we fail
vim.api.nvim_create_autocmd("User", {
    pattern = 'CMakeBuildFailed',
    callback = function()
        vim.cmd("CMakeClose")
        vim.cmd("copen")
    end,
    group = cmakeGroup
})

local config = {}
return config
