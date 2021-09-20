local origin_name = require("colors").origin_name()
local color_info_file = vim.fn.stdpath("data") .. "/mbfs_colorscheme.dat"

local write_to_file = function(content, filename)
    local file = io.open(filename, "w")
    file:write(content)
    file:close()
end

local read_from_file = function(filename)
    local file = io.open(filename, "r")
    local color = file:read()
    file:close()
    return color
end

local file_exists = function(filename)
    local f = io.open(filename, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

if file_exists(color_info_file) then
    local color_from_file = read_from_file(color_info_file)
    if color_from_file ~= origin_name then
        print("colorscheme changed reposistory")
        write_to_file(origin_name, color_info_file)
        vim.fn.execute("PackerSync")
    end
else
    print("creating file " .. color_info_file .. " with content " .. origin_name)
    write_to_file(origin_name, color_info_file)
end
