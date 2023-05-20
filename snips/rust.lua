local snips = util.list()

snips:add(pos('d', 'dbg!(<++>)'))
snips:add(pos('p', 'print!(<++>)'))
snips:add(pos('pl', 'println!(<++>)'))


snips:add(hida('p', 'print!($0)'))
snips:add(hida('pl', 'println!($0)'))
snips:add(hida('epl', 'eprintln!($0)'))

snips:add(hida('ll', 'let ${1:name} = ${2:value};'))
snips:add(hid('l', t 'let '))

snips:add(parse('das', 'debug_assert!($1);'))
snips:add(parse('use', 'use $1;'))


snips:add(s('ma', fmta([[
match <> {<>
}; ]], {
    i(1, 'value'),
    dyn(2, fmt('\n\t{} => {},', {
        i(1, 'pattern'),
        c(2, {
            r(nil, 'expr'),
            sn(nil, fmta([[{
        <>
    }]], { r(1, 'expr') })),
        }),
    }, { trim_empty = false, dedent = false }), true),
}), { stored = { expr = i(1, 'expr') } }))

-- End Snippets --
return snips
