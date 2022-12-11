local M = {}

local keymap = vim.keymap.set
function M.map(mode, option, ...) -- for better keymap-binding alias
    local maps = { ... }
    for _, v in ipairs(maps) do
        keymap(mode, v[1], v[2], option)
    end
end

M.icon = {
    Error = "🥵",
    Warn = "🫢",
    Info = "🤔",
    Hint = "👿",
    VirtualText = "🧐",
    LSPFloat = "🤓",
    Debug = "🥴",
    Trace = "🤠",
    Todo = "🥰",
    Hack = "🥲",
    Perf = "🤯",
    Note = "👹",
    Test = "🤒",
    CodeAction = "🥳",
    code_icon = {
        Text = "",
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
        Snippet = "",
    },
}


return M
