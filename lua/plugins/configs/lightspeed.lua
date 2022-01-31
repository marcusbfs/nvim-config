local lightspeed = require "lightspeed"

lightspeed.setup {
    limit_ft_matches = 5,
    substitute_chars = {["\r"] = "¬"},
    instant_repeat_fwd_key = nil,
    instant_repeat_bwd_key = nil,
    -- If no values are given, these will be set at runtime,
    -- based on `jump_to_first_match`.
    labels = nil,
    cycle_group_fwd_key = nil,
    cycle_group_bwd_key = nil
}

-- force reload of lightspeed highlightning
vim.cmd [[ autocmd ColorScheme * lua require'lightspeed'.init_highlight(true) ]]
