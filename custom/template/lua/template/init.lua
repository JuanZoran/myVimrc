local M = {}
M.opts = {
    rule = {
        ['*'] = '__all__',
        ['/'] = '-',
    },
}

local function get_templates()
    local templates = {}
    for file in vim.fs.dir(M.opts.template_dir) do
        templates[#templates + 1] = file
    end
    return templates
end

---@param name string
---@return string
local function toPattern(name)
    for p, n in pairs(M.opts.rule) do
        name = name:gsub(n, p)
    end
    return name
end

local function toName(pattern)
    for p, n in pairs(M.opts.rule) do
        pattern = pattern:gsub(p, n)
    end
    return pattern
end


function M.setup(opt)
    if opt then M.opts = vim.tbl_extend('force', M.opts, opt) end
    -- INFO Load Template
    for _, filename in ipairs(get_templates()) do
        vim.api.nvim_create_autocmd('BufNewFile', {
            pattern = toPattern(filename),
            command = [[silent! 0r ]] .. M.opts.template_dir .. '/' .. filename,
        })
    end
end

function M.select()
    vim.ui.select(get_templates(), {
        prompt = '请选择一个片段编辑',
        format_item = toPattern,
    }, function(file)
        if #file > 0 then
            vim.cmd('e ' .. M.opts.template_dir .. '/' .. file)
        end
    end)
end

function M.delete()
    vim.ui.select(get_templates(), {
        prompt = '请选择一个片段删除',
        format_item = toPattern,
    }, function(file)
        local exit = os.execute(('rm %s/%s'):format(M.opts.template_dir, file))
        if exit ~= 0 then
            vim.notify '删除失败'
            return
        end

        vim.notify '删除成功'
    end)
end

function M.create()
    local input = vim.fn.input '请输入模板生效的模式：'
    if #input > 0 then
        vim.cmd('e ' .. M.opts.template_dir .. '/' .. toName(input))
    end
end

return M
