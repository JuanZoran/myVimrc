local api = vim.api
local autocmd = api.nvim_create_autocmd

local group = api.nvim_create_augroup('UserDefine', { clear = true })
autocmd('BufRead', {
    group = group,
    command = [[silent! loadview]]
})

-- set tabstop size for markdown and html file
-- autocmd("FileType", {
--     group = group,
--     pattern = { "markdown", "html" },
--     command = [[setlocal tabstop=2 shiftwidth=2]],
-- })

autocmd({ 'BufWrite', 'QuitPre' }, {
    group = group,
    command = [[silent! mkview]]
})

-- Don't auto comment when o
autocmd("FileType", { command = [[set formatoptions-=cro]] })

autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank {
            higroup = "IncSearch",
            timeout = 250,
        }
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})


-- NOTE  Snip Utility
autocmd("BufEnter", {
    group = group,
    pattern = "*/snips/*.lua",
    callback = function()
        vim.keymap.set('n', '<CR>', '/-- End Snippets --<CR>:noh<CR>2<Up>o', { silent = true, buffer = true })
    end,
})


-- INFO Fix Input Method Switch
if vim.fn.executable('fcitx5-remote') == 1 then
    local state = ''
    autocmd('InsertLeave', {
        group = group,
        pattern = '*',
        callback = function()
            state = io.popen('fcitx5-remote'):read('*a')
            os.execute('fcitx5-remote -c')
        end,
    })

    autocmd('InsertEnter', {
        group = group,
        pattern = '*',
        callback = function()
            if state == '2\n' then
                os.execute('fcitx5-remote -o')
            end
        end,
    })
end


-- -- go to last loc when opening a buffer
-- autocmd("BufReadPost", {
--   group = augroup("last_loc"),
--   callback = function()
--     local mark = vim.api.nvim_buf_get_mark(0, '"')
--     local lcount = vim.api.nvim_buf_line_count(0)
--     if mark[1] > 0 and mark[1] <= lcount then
--       pcall(vim.api.nvim_win_set_cursor, 0, mark)
--     end
--   end,
-- })

-- -- 设置firenvim的大小
-- vim.cmd [[
-- function! OnUIEnter(event) abort
--   if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
--     set lines=40 columns=120
--   endif
-- endfunction
-- autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
-- ]]
-- Don't auto comment when o
