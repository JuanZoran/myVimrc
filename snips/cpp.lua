local snips = util.list()

snips:add(s('formate', { t '// clang-format on' }))
snips:add(s('formatd', { t '// clang-format off' }))

snips:add(parse('inc', '#include <$0>'))
snips:add(parse('au', 'auto $1 = $0;'))
snips:add(parse('once', '#pragma once'))


snips:add(pos('au', 'auto <++> = '))
snips:add(pos('p', 'printf("<++>");'))
snips:add(pos('nsp', 'using namespace <++>;'))
snips:add(pos('us', 'using <++> = '))


snips:add(s('main', fmta([[
    int main(int argc, char *argv[]) {
        <>
        return 0;
    }
    ]], { i(0) })))



snips:add(s('class', fmta(
    [[
    class <1> {
    public:
        <>() = default;
        ~<>() = default;
        <>(<>&&) = default;
        <>(const <>&) = default;
        <>& operator= (<>&&) = default;
        <>& operator= (const <>&) = default;

    private:

    };
    ]], {
        i(1, 'name'),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
    }
)))

snips:add(parse('tmp', 'template <typename ${1:T}>\n$0'))
snips:add(s('#if', fmta(
    [[
    #if <>
    <>
    #endif
    ]], {
        i(1, 'condition'),
        i(2),
    }
)))


snips:add(s('cout',
    { t 'std::cout', dyn(1, { t ' << ', i(1, 'stream') }, true), t ';' }))


snips:add(s('switch', fmta(
    [[
    switch (<>) {<>
        default:
            break;
    }
    ]], {
        i(1, 'value'),
        dyn(2, parse(nil, [[

    case ${1:case}:
        ${2:value}
        break;]], { trim_empty = false, dedent = false }), true),
    }
)))


-- snips:add(s('cout',
--     { t 'std::cout << ', i(1, 'stream'), dyn(2, { t ' << ', i(1, 'stream') }), t ';' }))

-- End Snippets --
return snips
