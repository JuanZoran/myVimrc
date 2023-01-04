-- INFO  Config
local template = {}
local template_dir = vim.fn.stdpath('config') .. '/lua/template'
local rule = {
    ['*'] = 'all',
    ['/'] = '-',
}

for file in vim.fs.dir(template_dir) do
    table.insert(template, file)
end


local function toPattern(name)
    for p, n in pairs(rule) do
        name = name:gsub(n, p)
    end
    return name
end

local function toName(pattern)
    for p, n in pairs(rule) do
        pattern = pattern:gsub(p, n)
    end
    return pattern
end

-- INFO Load Template
local template_group = vim.api.nvim_create_augroup('Template', { clear = true })
for _, filename in ipairs(template) do
    vim.api.nvim_create_autocmd('BufNewFile', {
        group = template_group,
        pattern = toPattern(filename),
        command = [[0r ]] .. template_dir .. '/' .. filename,
    })
end

local function OpenSelectTemplate(file)
    vim.cmd ('e ' .. template_dir .. '/' .. file)
end

-- NOTE Edit Template
vim.keymap.set('n', '<leader><leader><CR>', function ()
    vim.ui.select(template, {
        prompt = '请选择一个片段编辑',
        format_item = function (file)
             return toPattern(file)
        end,
    }, OpenSelectTemplate)
end)

-- NOTE Create New Template
vim.keymap.set('n', '<leader><leader>t', function ()
    local newFile = toName(vim.fn.input('请输入模板生效的模式：'))
    OpenSelectTemplate(newFile)
end)
