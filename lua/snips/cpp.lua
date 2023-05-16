---@diagnostic disable: undefined-global
local snips = util.list()

snips:add(s('formate', { t '// clang-format on' }))
snips:add(s('formatd', { t '// clang-format off' }))

snips:add(parse('inc', '#include <$1>'))
snips:add(parse('once', '#pragma once'))


snips:add(pos('.au', 'auto <++> = '))
snips:add(pos('.p', 'printf("<++>");'))
snips:add(pos('.nsp', 'using namespace <++>;'))
snips:add(pos('.us', 'using <++> = '))


snips:add(s('main', fmta(
    [[
    int main(int argc, char *argv[]) {
        <>
        return 0;
    }
    ]], { i(1) }
)))


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


-- End Snippets --
return snips
