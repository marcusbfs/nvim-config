-- Lua file to manage colorschemes

local helpers = require("colors.helpers")

-- Options
local CS = {
    gruvbox_material_dark_medium = 1,
    gruvbox_material_dark_hard = 2,
    gruvbox_material_light_medium = 3,
    gruvbox_material_light_hard = 4,
    tokyonight_storm = 5,
    tokyonight_night = 6,
    tokyonight_day = 7,
    onedark_default = 8,
    onedark_darker = 9,
    onedark_warmer = 10,
    github_default = 11,
    github_dark = 12,
    github_dimmed = 13,
    github_light = 14,
    ayu_mirage = 15,
    ayu_dark = 16,
    ayu_light = 17,
    nord = 18,
    papercolor_dark = 19,
    papercolor_light = 20,
    nightfox = 21,
    nordfox = 22,
    palefox = 23,
    randfox = 24
}

-- Set colorscheme
vim.g.my_colorscheme = CS.tokyonight_storm

-- Set colorscheme basd on time
local based_on_time = function()
    local toggle_hour = 17.5
    local date = os.date("*t")
    local current_time = date.hour + date.min / 59.0

    if current_time < toggle_hour then
        vim.g.my_colorscheme = CS.github_light
    else
        vim.g.my_colorscheme = CS.github_dark
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
    elseif
        cs_contains(
            CS.gruvbox_material_dark_medium,
            CS.gruvbox_material_dark_hard,
            CS.gruvbox_material_light_medium,
            CS.gruvbox_material_light_hard
        )
     then
        return "sainnhe/gruvbox-material"
    elseif cs_contains(CS.onedark_default, CS.onedark_darker, CS.onedark_warmer) then
        return "navarasu/onedark.nvim"
    elseif cs_contains(CS.github_default, CS.github_dark, CS.github_dimmed, CS.github_light) then
        return "projekt0n/github-nvim-theme"
    elseif cs_contains(CS.ayu_mirage, CS.ayu_dark, CS.ayu_light) then
        return "ayu-theme/ayu-vim"
    elseif cs_contains(CS.nord) then
        return "arcticicestudio/nord-vim"
    elseif cs_contains(CS.papercolor_dark, CS.papercolor_light) then
        return "NLKNguyen/papercolor-theme"
    elseif cs_contains(CS.nightfox, CS.nordfox, CS.palefox, CS.randfox) then
        return "EdenEast/nightfox.nvim"
    else
        error("origin_name: colorscheme " .. vim.g.my_colorscheme .. " is not valid")
    end
end

M.config = function()
    if cs_contains(CS.tokyonight_storm) then
        helpers.tokyonight("storm")
    elseif cs_contains(CS.tokyonight_night) then
        helpers.tokyonight("night")
    elseif cs_contains(CS.tokyonight_day) then
        helpers.tokyonight("day")
    elseif cs_contains(CS.gruvbox_material_dark_medium) then
        helpers.gruvbox("dark", "medium")
    elseif cs_contains(CS.gruvbox_material_dark_hard) then
        helpers.gruvbox("dark", "hard")
    elseif cs_contains(CS.gruvbox_material_light_medium) then
        helpers.gruvbox("light", "medium")
    elseif cs_contains(CS.gruvbox_material_light_hard) then
        helpers.gruvbox("light", "hard")
    elseif cs_contains(CS.onedark_default) then
        helpers.onedark("default")
    elseif cs_contains(CS.onedark_darker) then
        helpers.onedark("darker")
    elseif cs_contains(CS.onedark_warmer) then
        helpers.onedark("warmer")
    elseif cs_contains(CS.github_default) then
        require("github-theme").setup()
    elseif cs_contains(CS.github_dark) then
        require("github-theme").setup({theme_style = "dark_default"})
    elseif cs_contains(CS.github_dimmed) then
        require("github-theme").setup({theme_style = "dimmed"})
    elseif cs_contains(CS.github_light) then
        require("github-theme").setup({theme_style = "light_default"})
    elseif cs_contains(CS.ayu_dark) then
        helpers.ayu("dark")
    elseif cs_contains(CS.ayu_light) then
        helpers.ayu("light")
    elseif cs_contains(CS.ayu_mirage) then
        helpers.ayu("mirage")
    elseif cs_contains(CS.nord) then
        vim.cmd [[colorscheme nord]]
    elseif cs_contains(CS.papercolor_dark) then
        helpers.papercolor("dark")
    elseif cs_contains(CS.papercolor_light) then
        helpers.papercolor("light")
    elseif cs_contains(CS.nightfox) then
        helpers.nightfox("nightfox")
    elseif cs_contains(CS.nordfox) then
        helpers.nightfox("nordfox")
    elseif cs_contains(CS.palefox) then
        helpers.nightfox("palefox")
    elseif cs_contains(CS.randfox) then
        helpers.nightfox("randfox")
    else
        error("config: colorscheme " .. vim.g.my_colorscheme .. " is not valid")
    end
end

return M
