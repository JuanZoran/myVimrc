-- ╭─────────────────────────────────────────────────────────╮
-- │                 修复中文输入法切换问题                  │
-- ╰─────────────────────────────────────────────────────────╯

local im = 'im-select.exe'
local obtain_mode = im
local english_output = 'English'
local switch_to_Chinese = im .. ' Chinese'
local switch_to_English = im .. ' English'
-- linux 
-- local im = 'fcitx5-remote'

if vim.fn.executable(im) == 0 then
    return print'WARN: im is not executable!'
end


local autocmd = util.autocmd
local state = ''
autocmd('InsertLeave', {
    callback = function()
        state = vim.fn.system(obtain_mode):gsub('%s+$', '')
        if state == english_output then return end
        vim.fn.system (switch_to_English)
    end,
})

autocmd('InsertEnter', {
    callback = function()
        if state ~= english_output then vim.fn.system(switch_to_Chinese) end
    end,
})
