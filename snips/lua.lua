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
local snips = util.list()
snips:add(s('req', fmt('local {} = require("{}")', {
    l(l._1:match '[^./]*$', 1),
    i(1, 'module'),
})))

snips:add(s('ll', fmt('local {} = {}', {
    l(l._1:match '[^.]*$', 1),
    i(1, 'name'),
})))

snips:add(parse('snip', 'snips:add(${0})'))
snips:add(parse('p', 'print($0)'))


snips:add(parse('lm', [[
    local M = {}

    $0

    return M
]]))
snips:add(parse('parse', "parse('${1:trig}', '$2')"))


snips:add(s('mt', fmta([[
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
    ]], { i(1, 'name') }
)))


snips:add(pos('lo', 'local <++> ='))
snips:add(pos('ps', 'pairs(<++>)'))
snips:add(pos('ip', 'ipairs(<++>)'))
snips:add(pos('C', '---@<++> '))
snips:add(pos('cmd', '<Cmd><++><CR>'))
snips:add(pos('req', 'local <++> = require("<++>")'))

snips:add(s('fe', t '---@format enable'))
snips:add(s('fd', t '---@format disable'))
snips:add(s('fdn', t '---@format disable-next'))
snips:add(s('l', t 'local '))


local function elif()
    local snippet = sn(1, fmta([[

    elseif <> then
        <>]], {
        i(1, 'condition'),
        i(2, 'body'),
    }, { trim_empty = false }))

    return sn(nil, {
        snippet,
        c(2, {
            t '',
            d(nil, elif),
        }),
    })
end

snips:add(s('if', fmta([[
    if <> then
        <><>
    end
]], {
    i(1, 'condition'),
    i(2, 'body'),
    c(3, {
        t '',
        d(nil, elif),
    }),
})))

-- End Snippets --
return snips
