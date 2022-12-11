---@diagnostic disable: unused-local
local M = {}
local ls = require "luasnip"
local extras = require "luasnip.extras"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local fmt = extras.fmt
local m = extras.m
local l = extras.l
local postfix = require "luasnip.extras.postfix".postfix

M.snip = {
    s = ls.snippet,
    sn = ls.snippet_node,
    isn = ls.indent_snippet_node,
    t = ls.text_node,
    i = ls.insert_node,
    f = ls.function_node,
    c = ls.choice_node,
    d = ls.dynamic_node,
    r = ls.restore_node,
    events = require "luasnip.util.events",
    ai = require "luasnip.nodes.absolute_indexer",
    fmt = extras.fmt,
    m = extras.m,
    l = extras.l,
    postfix = require "luasnip.extras.postfix".postfix,
}

return M
