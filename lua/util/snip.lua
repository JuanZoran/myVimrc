---@class util
---@field snip snippet_env

---@class snippet_env
local M = {}

---A wrapper for `require 'luasnip.extras.postfix'.postfix`.
---@param trig string|table -- Trigger string or table of trigger strings.
---@param pattern string -- Pattern to replace with. [Placeholder]: `<++>`.
M.pos = function(trig, pattern)
    return require 'luasnip.extras.postfix'.postfix('\\' .. trig, {
        require 'luasnip.nodes.functionNode'.F(function(_, parent)
            return pattern:gsub('<%+%+>', parent.snippet.env.POSTFIX_MATCH)
        end),
    })
end


local t = require 'luasnip.nodes.textNode'.T
local c = require 'luasnip.nodes.choiceNode'.C
local d = require 'luasnip.nodes.dynamicNode'.D
local sn = require 'luasnip.nodes.snippet'.SN

---Generate a dynamic snippet.
---@param jump_index? integer
---@param nodes any[]
---@param extend? boolean
---@return any
M.dyn = function(jump_index, nodes, extend)
    local function fun()
        local snippet = sn(1, vim.deepcopy(nodes))
        return sn(nil, {
            snippet,
            c(2, {
                t '',
                d(nil, fun),
            }),
        })
    end
    if extend then
        return sn(jump_index, {
            sn(1, nodes),
            c(2, {
                t '',
                d(nil, fun),
            }),
        })
    end

    return c(jump_index, {
        t '',
        d(nil, fun),
    })
end

return M
