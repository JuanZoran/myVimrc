local api = vim.api

local group = api.nvim_create_augroup('UserDefine', { clear = true })
api.nvim_create_autocmd('BufRead', {
    group = group,
    command = [[silent! loadview]]
})

api.nvim_create_autocmd({ 'BufWrite', 'QuitPre' }, {
    group = group,
    command = [[silent! mkview | SessionSave]]
})

-- Don't auto comment when o
api.nvim_create_autocmd("FileType", { command = [[set formatoptions-=cro]] })


api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank {
            higroup = "IncSearch",
            timeout = 250,
        }
    end,
})


-- NOTE  Snip Utility
api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*/snips/*.lua",
    callback = function()
        vim.keymap.set('n', '<CR>', '/-- End Snippets --<CR>:noh<CR>2<Up>o', { silent = true, buffer = true })
    end,
})


-- INFO 中文输入法切换的问题
local times = 0
if vim.fn.executable('fcitx5-remote') then
    local state = ''
    api.nvim_create_autocmd('InsertLeave', {
        group = group,
        pattern = '*',
        callback = function()
            vim.cmd [[SmoothCursorStart]]
            state = io.popen('fcitx5-remote'):read('*a')
            os.execute('fcitx5-remote -c')
        end,
    })

    api.nvim_create_autocmd('InsertEnter', {
        group = group,
        pattern = '*',
        callback = function()
            if times > 1 then
                if state == '2\n' then
                    os.execute('fcitx5-remote -o')
                end
                -- vim.opt_local.cursorline = false
                vim.cmd [[SmoothCursorStop]]

            else
                times = times + 1
            end
        end,
    })
end
vim.opt.cursorline = false


-- INFO cursorline
-- api.nvim_create_autocmd('FileType', {
--     group = group,
--     pattern = "TelescopePrompt",
--     callback = function()
--         vim.opt_local.cursorline = false
--     end,
-- })

-- INFO : store Position
-- api.nvim_create_autocmd(
--     "BufReadPost",
--     {
--         group = api.nvim_create_augroup('Position', { clear = true }),
--         command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
--     }
-- )

-- -- 设置firenvim的大小
-- vim.cmd [[
-- function! OnUIEnter(event) abort
--   if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
--     set lines=40 columns=120
--   endif
-- endfunction
-- autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
-- ]]
