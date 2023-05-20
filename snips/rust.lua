local snips = util.list()

snips:add(pos('d', 'dbg!(<++>)'))
snips:add(pos('p', 'print!(<++>)'))
snips:add(pos('pl', 'println!(<++>)'))


snips:add(parse('das', 'debug_assert!($1);'))
snips:add(parse('use', 'use $1;'))


snips:add(parse('p', 'print!($0)'))
snips:add(parse('pl', 'println!($0)'))
snips:add(parse('epl', 'eprintln!($0)'))

snips:add(s('l', t 'let '))
snips:add(parse('ll', 'let ${1:name} = ${2:value};'))

-- TODO : Use dynamic snippet for this
local function match_pat()
    local with_braces = sn(nil, fmta([[{
        <>
    }]], { r(1, 'expr') }))

    local pattern_snip = sn(1, fmt('\n\t{} => {},', {
        i(1, 'pattern'),
        c(2, {
            r(1, 'expr'),
            with_braces,
        }),
    }, { trim_empty = false, dedent = false }))

    return sn(nil, {
        pattern_snip,
        c(2, {
            t '',
            d(nil, match_pat),
        }),
    })
end

snips:add(s('ma', fmta([[
match <> {<>
}; ]], {
    i(1, 'value'),
    dyn(2, fmt('\n\t{} => {},', {
        i(1, 'pattern'),
        c(2, {
            r(1, 'expr'),
            sn(nil, fmta([[{
        <>
    }]], { r(1, 'expr') })),
        }),
    }, { trim_empty = false, dedent = false }), true),
}), { stored = { expr = i(1, 'expr') } }))

-- snips:add(parse('test', '#[cfg(test)]'))

-- End Snippets --
return snips
