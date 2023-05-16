---@diagnostic disable:  undefined-global
-- =========== builtin function for luasnip ===================
-- s      = require("luasnip.nodes.snippet").S
-- sn     = require("luasnip.nodes.snippet").SN
-- t      = require("luasnip.nodes.textNode").T
-- f      = require("luasnip.nodes.functionNode").F
-- i      = require("luasnip.nodes.insertNode").I
-- c      = require("luasnip.nodes.choiceNode").C
-- d      = require("luasnip.nodes.dynamicNode").D
-- r      = require("luasnip.nodes.restoreNode").R
-- l      = require("luasnip.extras").lambda
-- rep    = require("luasnip.extras").rep
-- p      = require("luasnip.extras").partial
-- m      = require("luasnip.extras").match
-- n      = require("luasnip.extras").nonempty
-- dl     = require("luasnip.extras").dynamic_lambda
-- fmt    = require("luasnip.extras.fmt").fmt
-- fmta   = require("luasnip.extras.fmt").fmta
-- conds  = require("luasnip.extras.expand_conditions")
-- types  = require("luasnip.util.types")
-- events = require("luasnip.util.events")
-- parse  = require("luasnip.util.parser").parse_snippet
-- ai     = require("luasnip.nodes.absolute_indexer")

local snips = {
    s(
        'require',
        fmt('local {} = require("{}")', {
            l(l._1:match '[^./]*$', 1),
            i(1, 'module'),
        })
    ),

    parse('lm', [[
        local M = {}

        $1

        return M
    ]]),


    s(
        'mt',
        fmta([[
        (function ()
            ---@class <>
            local mt = {

            }
            mt.__index = mt

            return function()
                return setmetatable({
                }, mt)
            end
        end)()
        ]], {
            i(1, 'name'),
        })
    ),
    parse('parse', [[parse("${1:trig}", "$2")]]),
    parse('snip', [[snips:add(${1})]]),


    pos('.lo', 'local <++> ='),
    pos('.ps', 'pairs(<++>)'),
    pos('.ip', 'ipairs(<++>)'),
    pos('.co', '---@<++> '),
    pos('.cmd', '<Cmd><++><CR>'),
    pos('.req', 'local <++> = require("<++>")'),



    s('formate', { t '---@format enable' }),
    s('formatd', { t '---@format disable' }),
    s('formatdn', { t '---@format disable-next' }),
    -- s('nodis', { t '---@nodiscard' }),
}

-- s(
--     'local',
--     fmt('local {} = {}', {
--         l(l._1:match '[^.]*$', 1),
--         i(1, 'name'),
--     })
-- ),
-- parse('s', "s('$1', $2)"),
-- s(
--     'return',
--     fmt('---@return {} {}', {
--         i(1, 'type'),
--         i(2, 'message'),
--     })
-- ),



-- End Snippets --
return snips
