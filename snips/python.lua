local snips = util.list()

snips:add(s('env', t '#!/usr/bin/env python3'))

snips:add(s('def', fmt([[
def {name} ({arg}{extra}):
    {body}
]], {
    name  = i(1, 'name'),
    arg   = i(2, 'arg'),
    extra = dyn(3, { t ', ', i(1, 'arg') }),
    body  = i(4, 'body'),
})
))

-- End Snippets --
return snips
