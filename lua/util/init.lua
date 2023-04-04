---@class util
local M = setmetatable({}, {
    __index = function(tbl, key)
        local res = require('util.' .. key)
        tbl[key] = res
        return res
    end,
})

---@alias mode
---|'n'
---|'v'
---|'x'
---|'s'
---|'o'
---|'i'
---|'l'
---|'c'
---|'t'
---|'!'

---@class keymap
---@field [1] string @lhs
---@field [2] string|function @rhs
---@field mode? mode|mode[]
---@field noremap? boolean
---@field silent? boolean
---@field expr? boolean
---@field nowait? boolean
---@field script? boolean
---@field unique? boolean
---@field buffer? boolean


local set = vim.keymap.set

---Load single keymap
---@param keymap keymap
local function load_keymap(keymap)
    local mode = keymap.mode or 'n'
    local lhs = keymap[1]
    local rhs = keymap[2]

    keymap[1] = nil
    keymap[2] = nil
    keymap.mode = nil
    set(mode, lhs, rhs, keymap)
end

---Lazy Kyemap-like load utility
---@param keymaps keymap|keymap[]
function M.map(keymaps)
    if type(keymaps[1]) == 'string' then
        load_keymap(keymaps)
    else
        ---@cast keymaps keymap[]
        for _, keymap in ipairs(keymaps) do load_keymap(keymap) end
    end
end

return M
