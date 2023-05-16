---@meta
_G.ls = require 'luasnip'
_G.s = require 'luasnip.nodes.snippet'.S
_G.sn = require 'luasnip.nodes.snippet'.SN
_G.t = require 'luasnip.nodes.textNode'.T
_G.f = require 'luasnip.nodes.functionNode'.F
_G.i = require 'luasnip.nodes.insertNode'.I
_G.c = require 'luasnip.nodes.choiceNode'.C
_G.d = require 'luasnip.nodes.dynamicNode'.D
_G.r = require 'luasnip.nodes.restoreNode'.R

_G.events = require 'luasnip.util.events'
_G.ai = require 'luasnip.nodes.absolute_indexer'
_G.fmt = require 'luasnip.extras.fmt'.fmt
_G.fmta = require 'luasnip.extras.fmt'.fmta
_G.conds = require 'luasnip.extras.expand_conditions'
_G.postfix = require 'luasnip.extras.postfix'.postfix
_G.types = require 'luasnip.util.types'
_G.parse = require 'luasnip.util.parser'.parse_snippet
_G.ms = require 'luasnip.nodes.multiSnippet'.new_multisnippet



_G.extras = require 'luasnip.extras'
_G.l = extras.lambda
_G.rep = extras.rep
_G.p = extras.partial
_G.m = extras.match
_G.n = extras.nonempty
_G.dl = extras.dynamic_lambda


---A wrapper for `require 'luasnip.extras.postfix'.postfix`.
---@param trig string|table -- Trigger string or table of trigger strings.
---@param pattern string -- Pattern to replace with. [Placeholder]: `<++>`.
_G.pos = function(trig, pattern)
end
