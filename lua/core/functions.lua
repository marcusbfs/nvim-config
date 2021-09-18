M = {}

-- Change directory to stdpath('config') and open init.lua
M.mbfs_nvim_dir = function()
    local config_dir = vim.fn.stdpath("config")
    vim.api.nvim_set_current_dir(config_dir)
    vim.fn.execute(":edit init.lua")
end

-- Telescope nvim-config files
M.mbfs_telescope_nvim_config = function()
    local config_dir = vim.fn.expand(vim.fn.stdpath("config"))
    require("telescope.builtin").find_files(
        {
            cwd = config_dir,
            search_dirs = {config_dir},
            hidden = false
        }
    )
end

-- Register functions

local commands = {
    {"MbfsNvimDir", "mbfs_nvim_dir"},
    {"MbfsTelescopeNvimConfig", "mbfs_telescope_nvim_config"}
}

M.mbfs_register_functions = function()
    for _, item in ipairs(commands) do
        local command = item[1]
        local fun = item[2]
        vim.fn.execute(":command " .. command .. " lua require('core.functions')." .. fun .. "()")
    end
end

M.mbfs_register_functions()

return M
