-- code snippets
local filetypes = {
    "bash",
    "lua",
    "markdown",
    "cpp",
    "c",
    -- "javascript",
    -- "rust",
}

local MD = {}

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

    table.insert(MD, codesnip)
end

-- table.insert(MD, s(
--   "img",
--   fmt([[ ![{}]({}) ]], {
--     i(1, "imagename"),
--     i(2, "path/to/img"),
--   })
-- ))


return MD
