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


M.dyn = function(jump_index, node)
    -- TODO :
end

return M
