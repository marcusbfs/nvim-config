M = {}

-- Change directory to stdpath('config') and open init.lua
M.mbfs_nvim_dir = function()
    local config_dir = vim.fn.stdpath("config")
    vim.api.nvim_set_current_dir(config_dir)
    vim.fn.execute(":edit init.lua")
end

-- Telescope nvim-config files
M.mbfs_telescope_nvim_config_find_file = function()
    local config_dir = vim.fn.expand(vim.fn.stdpath("config"))
    require("telescope.builtin").find_files(
        {
            prompt_title = "nvim config - find file",
            cwd = config_dir,
            shorten_path = false
        }
    )
end

M.mbfs_telescope_nvim_config_live_grep = function()
    local config_dir = vim.fn.expand(vim.fn.stdpath("config"))
    require("telescope.builtin").live_grep(
        {
            prompt_title = "nvim config - live grep",
            cwd = config_dir,
            shorten_path = false
        }
    )
end

M.mbfs_trim_whitespace = function()
    vim.fn.execute(":%s/\\s\\+$//e")
end

M.mbfs_remove_carriage_return = function()
    vim.fn.execute(":%s/\\r//e")
end

-- Register functions

local commands = {
    {"MbfsNvimDir", "mbfs_nvim_dir"},
    {"MbfsTelescopeNvimConfigFindFile", "mbfs_telescope_nvim_config_find_file"},
    {"MbfsTelescopeNvimConfigLiveGrep", "mbfs_telescope_nvim_config_live_grep"},
    {"TrimWhitespace", "mbfs_trim_whitespace"}
}

local mbfs_register_functions = function()
    for _, item in ipairs(commands) do
        local command = item[1]
        local fun = item[2]
        vim.fn.execute(":command " .. command .. " lua require('core.functions')." .. fun .. "()")
    end
end

mbfs_register_functions()

return M
