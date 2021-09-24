local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

npairs.setup({map_bs = false})

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap("i", "<Esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], {expr = true, noremap = true})
remap("i", "<C-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], {expr = true, noremap = true})
remap("i", "<Tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], {expr = true, noremap = true})
remap("i", "<S-Tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], {expr = true, noremap = true})

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({"selected"}).selected ~= -1 then
            print("case 1")
            return npairs.esc("<c-y>")
        else
            print("case 2")
            return npairs.esc("<c-e>") .. npairs.autopairs_cr()
        end
    else
        print("case 3")
        return npairs.autopairs_cr()
    end
end
remap("i", "<cr>", "v:lua.MUtils.CR()", {expr = true, noremap = true})

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({"mode"}).mode == "eval" then
        return npairs.esc("<c-e>") .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end
remap("i", "<bs>", "v:lua.MUtils.BS()", {expr = true, noremap = true})
