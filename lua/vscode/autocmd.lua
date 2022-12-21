-- input switch
local fcitx = vim.api.nvim_create_augroup("Fcitx5", { clear = true })
local state = ''
vim.api.nvim_create_autocmd('InsertLeave', {
    group = fcitx,
    pattern = '*',
    callback = function()
        state = vim.fn.system('fcitx5-remote')
        os.execute('fcitx5-remote -c')
    end,
})

vim.api.nvim_create_autocmd('InsertEnter', {
    group = fcitx,
    pattern = '*',
    callback = function()
        if state == '2\n' then
            os.execute('fcitx5-remote -o')
        end
    end,
})
