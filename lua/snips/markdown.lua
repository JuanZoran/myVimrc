---@diagnostic disable: undefined-global
-- code snippets
local filetypes = {
    "bash",
    "lua",
    "markdown",
    "cpp",
    "c",
    'json',
}

local snips = {}

for _, value in pairs(filetypes) do
    local codesnip = s(
        value,
        fmt(
            string.format(
[[```%s
	{}
```]]            ,
                value),
            { i(1, "") }
        )
    )

    table.insert(snips, codesnip)
end

-- table.insert(MD, s(
--   "img",
--   fmt([[ ![{}]({}) ]], {
--     i(1, "imagename"),
--     i(2, "path/to/img"),
--   })
-- ))


return snips
