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

-- TODO: util for keymap lazyload
function M.plugin(keys, cmd)
    local set = vim.keymap.set
    for k, v in ipairs(keys) do
        opt.desc = cmd[k][2]
        set(v[1], v[2], cmd[k][1], opt)
    end
end

return M
