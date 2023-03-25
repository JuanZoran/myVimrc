local M

---In-place dedents strings in lines.
---@diagnostic disable-next-line: undefined-doc-name
---@param lines string[].
local function dedent(lines)
    local ind_size = math.huge
    for i, _ in ipairs(lines) do
        local i1, i2 = lines[i]:find '^%s*[^%s]'
        if i1 and i2 < ind_size then
            ind_size = i2
        end
    end
    for i, _ in ipairs(lines) do
        lines[i] = lines[i]:sub(ind_size, -1)
    end
end

function M.dedent(s)
    local lst = vim.split(s, '\n')
    dedent(lst)
    return table.concat(lst, '\n')
end

return M
