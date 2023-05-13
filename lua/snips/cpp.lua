---@diagnostic disable: undefined-global
local snips = util.list()

snips:add(s('formate', { t '// clang-format on' }))
snips:add(s('formatd', { t '// clang-format off' }))



-- End Snippets --
return snips
