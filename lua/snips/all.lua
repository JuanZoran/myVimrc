---@diagnostic disable: unused-local, need-check-nil, undefined-global
-- local ls = require "luasnip"
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
-- local c = ls.choice_node
-- local sn = ls.snippet_node
-- local rep = require("luasnip.extras").rep
-- local d = ls.dynamic_node
-- local f = ls.function_node
-- local p = require("luasnip.extras").partial
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local isn = ls.indent_snippet_node
-- local events = require "luasnip.util.events"
-- local types = require "luasnip.util.types"
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local rep = require("luasnip.extras").rep
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local conds = require "luasnip.extras.expand_conditions"

local snips = {}

local function bash(_, snip)
    local file = io.popen(snip.trigger, "r")
    local res = {}
    for line in file:lines() do
        table.insert(res, line)
    end
    file:close()
    return res
end

local bash_command = {
    'pwd',
    -- '',
}


for _, v in ipairs(bash_command) do
    -- s({ trig = "pwd" }, { f(bash, {}) }),
    -- table.insert(snips, s({ trig = v }, { f(bash) }))
    table.insert(snips, s(v, { f(bash) }))
end


return snips
