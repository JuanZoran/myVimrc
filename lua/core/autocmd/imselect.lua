local im = 'fcitx5-remote'
if vim.fn.executable(im) == 0 then
    return print('WARN: ' .. im .. ' is not executable!')
end

local autocmd = util.autocmd
local state = ''
autocmd('InsertLeave', {
    callback = function()
        state = io.popen (im):read '*a'
        os.execute 'fcitx5-remote -c'
    end,
})


autocmd('InsertEnter', {
    callback = function()
        if state == '2\n' then
            os.execute 'fcitx5-remote -o'
        end
    end,
})
