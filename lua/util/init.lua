local M = {}

local keymap = vim.keymap.set
function M.tmap(arg) -- for better keymap-binding alias
    for _, v in ipairs(arg.map) do
        if v[3] then
            keymap(arg.mode, v[1], v[2], vim.tbl_extend('force', arg.opt, v[3]))
        else
            keymap(arg.mode, v[1], v[2], arg.opt)
        end
    end
end


function M.map(mode, option, ...) -- for better keymap-binding alias
    local maps = { ... }
    for _, v in ipairs(maps) do
        if v[3] then
            keymap(mode, v[1], v[2], vim.tbl_extend('force', option, v[3]))
        else
            keymap(mode, v[1], v[2], option)
        end
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
