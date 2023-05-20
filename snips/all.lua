---@diagnostic disable: unused-local, need-check-nil, undefined-global
local snips = util.list()
local function bash(_, snip)
    local file = io.popen(snip.trigger, 'r')
    local res = {}
    for line in file:lines() do
        table.insert(res, line)
    end
    file:close()
    return res
end

local bash_command = {
    'pwd',
}

for _, v in ipairs(bash_command) do
    -- s({ trig = "pwd" }, { f(bash, {}) }),
    -- table.insert(snips, s({ trig = v }, { f(bash) }))
    snips:add(s(v, { f(bash) }))
end

snips:add(s('zsh', { t '#!/usr/bin/env zsh' }))

-- INFO :Add pairs utility
-- local pair_snip = {
--     ['q'] = "'<++>'",
--     ['p'] = '(<++>)',
--     ['b'] = '[<++>]',
--     ['B'] = '{<++>}',
-- }

-- for trig, pattern in pairs(pair_snip) do
-- end

-- snips:add(postfix '.q', { f(function(_, parent)

--     return
-- end), })

-- End Snippets --
return snips
