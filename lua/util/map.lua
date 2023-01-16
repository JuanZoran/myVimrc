local M = {}
local opt = { silent = true }

function M.set(map)
    local s = vim.keymap.set
    for _, v in ipairs(map.map) do
        opt.desc = v[3]
        s(map.mode, v[1], v[2], opt)
    end
end

function M.map(map)
    local s = vim.keymap.set
    for _, v in ipairs(map.map) do
        s(map.mode, v[1], v[2])
    end
end

return M
