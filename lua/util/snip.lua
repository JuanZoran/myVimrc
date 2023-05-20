---@class util
---@field snip snippet_env

local s       = require 'luasnip.nodes.snippet'.S
local t       = require 'luasnip.nodes.textNode'.T
local c       = require 'luasnip.nodes.choiceNode'.C
local d       = require 'luasnip.nodes.dynamicNode'.D
local sn      = require 'luasnip.nodes.snippet'.SN
local f       = require 'luasnip.nodes.functionNode'.F
local postfix = require 'luasnip.extras.postfix'.postfix
local parse   = require 'luasnip.util.parser'.parse_snippet



---@class snippet_env
local M = {}

---A wrapper for `require 'luasnip.extras.postfix'.postfix`.
---@param trig string|table -- Trigger string or table of trigger strings.
---@param pattern string -- Pattern to replace with. [Placeholder]: `<++>`.
M.pos   = function(trig, pattern)
    return postfix(':' .. trig, {
        f(function(_, parent)
            return pattern:gsub('<%+%+>', parent.snippet.env.POSTFIX_MATCH)
        end),
    })
end

---A simple wrapper for `luasnip.nodes.choiceNode.C`.
---@param jump_index? integer
---@param node any
---@return any
local function optional(jump_index, node)
    return c(jump_index, {
        t '',
        node,
    })
end

M.opt = optional

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
            optional(2, d(nil, fun)),
        })
    end

    return optional(jump_index, d(nil, fun))
end



local tbl = {
    hidden = true,
}
---A simple wrapper for hidden snippets
---@param trig string -- Trigger string.
---@param ... any other arguments
M.hid = function(trig, ...)
    tbl.trig = trig
    return s(tbl, ...)
end

---A simple wrapper for hidden snippets
---@param trig string -- Trigger string.
---@param ... any other arguments
M.hida = function(trig, ...)
    tbl.trig = trig
    return parse(tbl, ...)
end

return M
