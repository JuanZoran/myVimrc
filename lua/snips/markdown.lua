---@diagnostic disable: undefined-global
-- code snippets
local filetypes = {
    'bash',
    'lua',
    'markdown',
    'cpp',
    'c',
    'json',
    'html',
}

local snips = {}
for index, value in ipairs(filetypes) do
    -- TODO :
    snips[index] = s(value, fmt(([[
    ```%s
    {}
    ```
    ]]):format(value), i(1)))
end

return snips
