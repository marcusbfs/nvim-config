M = {}

-- Change directory to stdpath('config') and open init.lua
M.mbfs_nvim_dir = function()
    local config_dir = vim.fn.stdpath("config")
    vim.api.nvim_set_current_dir(config_dir)
    vim.fn.execute(":edit init.lua")
end

-- Register functions
M.mbfs_register_functions = function()
    vim.fn.execute(":command MbfsNvimDir lua require('core.functions').mbfs_nvim_dir()")
end

M.mbfs_register_functions()

return M
