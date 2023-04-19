---@diagnostic disable: unused-local, need-check-nil, undefined-global
local snips = {}
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

for i, v in ipairs(bash_command) do
    -- s({ trig = "pwd" }, { f(bash, {}) }),
    -- table.insert(snips, s({ trig = v }, { f(bash) }))
    snips[i] = s(v, { f(bash) })
end

snips[#snips + 1] = s('zsh', { t '#!/usr/bin/env zsh' })


-- End Snippets --
return snips
