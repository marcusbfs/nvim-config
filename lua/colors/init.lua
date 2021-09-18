-- Lua file to manage colorschemes

-- Options
local CS = {
    gruvbox_material = 1,
    tokyonight_storm = 2,
    tokyonight_night = 3,
    tokyonight_day = 4,
    onedark_default = 5,
    onedark_darker = 6,
    onedark_warmer = 7,
    github_default = 8,
    github_dark = 9,
    github_dimmed = 10,
    github_light = 11,
    ayu_mirage = 12,
    ayu_dark = 13,
    ayu_light = 14,
    nord = 15
}

-- Set colorscheme
vim.g.my_colorscheme = CS.tokyonight_storm

-- Set colorscheme basd on time
local based_on_time = function()
    local toggle_hour = 18.5
    local date = os.date("*t")
    local current_time = date.hour + date.min / 59.0

    if current_time < toggle_hour then
        vim.g.my_colorscheme = CS.github_light
    else
        vim.g.my_colorscheme = CS.tokyonight_storm
    end
end

based_on_time()

-- ======================================== --

local cs_contains = function(...)
    local arg = {...}
    for _, v in ipairs(arg) do
        if vim.g.my_colorscheme == v then
            return true
        end
    end
    return false
end

M = {}

M.origin_name = function()
    if cs_contains(CS.tokyonight_storm, CS.tokyonight_day, CS.tokyonight_night) then
        return "folke/tokyonight.nvim"
    elseif cs_contains(CS.gruvbox_material) then
        return "sainnhe/gruvbox-material"
    elseif cs_contains(CS.onedark_default, CS.onedark_darker, CS.onedark_warmer) then
        return "navarasu/onedark.nvim"
    elseif cs_contains(CS.github_default, CS.github_dark, CS.github_dimmed, CS.github_light) then
        return "projekt0n/github-nvim-theme"
    elseif cs_contains(CS.ayu_mirage, CS.ayu_dark, CS.ayu_light) then
        return "ayu-theme/ayu-vim"
    elseif cs_contains(CS.nord) then
        return "arcticicestudio/nord-vim"
    else
        error("origin_name: colorscheme " .. vim.g.my_colorscheme .. " is not valid")
    end
end

M.config = function()
    if cs_contains(CS.tokyonight_storm) then
        vim.g.tokyonight_style = "storm"
        vim.cmd [[colorscheme tokyonight]]
    elseif cs_contains(CS.tokyonight_night) then
        vim.g.tokyonight_style = "night"
        vim.cmd [[colorscheme tokyonight]]
    elseif cs_contains(CS.tokyonight_day) then
        vim.g.tokyonight_style = "day"
        vim.cmd [[colorscheme tokyonight]]
    elseif cs_contains(CS.gruvbox_material) then
        vim.o.background = "dark"
        vim.api.nvim_set_var("gruvbox_material_background", "medium")
        vim.api.nvim_set_var("gruvbox_material_palette", "original")
        vim.fn.execute("colorscheme gruvbox-material")
    elseif cs_contains(CS.onedark_default) then
        vim.cmd [[colorscheme onedark]]
    elseif cs_contains(CS.onedark_darker) then
        vim.fn.execute("let g:onedark_style = 'darker'")
        vim.cmd [[colorscheme onedark]]
    elseif cs_contains(CS.onedark_warmer) then
        vim.fn.execute("let g:onedark_style = 'warmer'")
        vim.cmd [[colorscheme onedark]]
    elseif cs_contains(CS.github_default) then
        require("github-theme").setup()
    elseif cs_contains(CS.github_dark) then
        require("github-theme").setup({theme_style = "dark_default"})
    elseif cs_contains(CS.github_dimmed) then
        require("github-theme").setup({theme_style = "dimmed"})
    elseif cs_contains(CS.github_light) then
        require("github-theme").setup({theme_style = "light_default"})
    elseif cs_contains(CS.ayu_dark) then
        vim.g.ayucolor = "dark"
        vim.cmd [[colorscheme ayu]]
    elseif cs_contains(CS.ayu_light) then
        vim.g.ayucolor = "light"
        vim.cmd [[colorscheme ayu]]
    elseif cs_contains(CS.ayu_mirage) then
        vim.g.ayucolor = "mirage"
        vim.cmd [[colorscheme ayu]]
    elseif cs_contains(CS.nord) then
        vim.cmd [[colorscheme nord]]
    else
        error("config: colorscheme " .. vim.g.my_colorscheme .. " is not valid")
    end
end

return M
