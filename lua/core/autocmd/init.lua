local api = vim.api
local autocmd = api.nvim_create_autocmd
local group = api.nvim_create_augroup('ZoranDefine', { clear = true })

local function load_cmd(name)
    require ('core.autocmd.' .. name)
end

---@class util
---@field autocmd fun(event: string, opts: table|fun()) auto set ZoranDefine augroup
util.autocmd = function(event, opt)
    if type(opt) == 'function' then
        opt = { callback = opt }
    end

    opt.group = group
    autocmd(event, opt)
end


vim.diagnostic.config({ virtual_text = { current_line = true }})


load_cmd('fmtopt')
load_cmd('view')
load_cmd('cursorline')
load_cmd('imselect')


autocmd('TextYankPost', {
    group = group,
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 250,
        }
    end,
})

-- resize splits if window got resized
autocmd('VimResized', {
    callback = function()
        vim.cmd 'tabdo wincmd ='
    end,
})
