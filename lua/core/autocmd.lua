local api = vim.api
local autocmd = api.nvim_create_autocmd
local group = api.nvim_create_augroup('UserDefine', { clear = true })



-- Go to last loc when opening a buffer
-- autocmd('BufReadPost', {
--     group = group,
--     callback = function()
--         local mark = vim.api.nvim_buf_get_mark(0, '"')
--         local lcount = vim.api.nvim_buf_line_count(0)
--         if mark[1] > 0 and mark[1] <= lcount then
--             pcall(vim.api.nvim_win_set_cursor, 0, mark)
--         end
--     end,
-- })

autocmd('BufRead', {
    group = group,
    callback = function()
        vim.cmd [[silent! loadview]]
        vim.opt_local.hlsearch = false
    end,
})

autocmd({ 'BufWrite', 'QuitPre' }, {
    group = group,
    callback = function()

        if vim.opt.foldmethod == 'diff' then
            vim.opt.foldmethod = 'manual'
        end

        vim.cmd [[silent! mkview]]
    end,
})

vim.keymap.set({ 'n', 'v' }, '=', 'gq')
-- see :help fo-table
-- Neovim中的`formatoptions`是用于控制文本格式化行为的设置选项。以下是`formatoptions`中常见选项的作用：
--
-- - `a`：在段落之间保留注释符号。
-- - `c`：在注释行中也进行格式化。
-- - `q`：在引用文本中保留换行符。
-- - `r`：在插入新行时继承前一行的缩进。
-- - `n`：自动识别编号列表并进行格式化。
-- - `t`：自动识别文本块并进行格式化。
-- - `2`：在列表项或注释行中使用反斜杠加注释符号。
-- - `3`：在新行之前保留双字母标签的缩进。
-- - `l`：在插入新行时在注释行中继承当前行的缩进级别。
-- - `j`：合并文本行时删除换行符。
-- - `b`：在段落之间保留空白行。
-- - `p`：在段落之间保留空行。
-- - `s`：在段落之间压缩多余的空格。
--
-- 通过设置适当的`formatoptions`值，您可以控制Neovim在文本编辑过程中的自动格式化行为，以满足您的偏好和需求。
autocmd('LspAttach', { command = [[set formatoptions=jql]] })

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


-- NOTE  Snip Utility
-- autocmd('BufEnter', {
--     group = group,
--     pattern = '*/snips/*.lua',
--     callback = function()
--         vim.keymap.set('n', '<CR>', '/-- End Snippets --<CR>:noh<CR>2<Up>o', { silent = true, buffer = true })
--     end,
-- })


-- INFO Fix Input Method Switch
if vim.fn.executable 'fcitx5-remote' == 1 then
    local state = ''
    autocmd('InsertLeave', {
        group = group,
        callback = function()
            state = io.popen 'fcitx5-remote':read '*a'
            os.execute 'fcitx5-remote -c'
        end,
    })

    autocmd('InsertEnter', {
        group = group,
        callback = function()
            if state == '2\n' then
                os.execute 'fcitx5-remote -o'
            end
        end,
    })
end

-- INFO cursorline
local set_cursorline = function(event, value, pattern)
    autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            local filetype = vim.bo.filetype
            if filetype ~= 'TelescopePrompt' and filetype ~= 'alpha'
            then
                vim.opt_local.cursorline = value
            end
        end,
    })
end
-- set_cursorline("WinLeave", false)
-- set_cursorline("WinEnter", true)
set_cursorline('InsertEnter', false)
set_cursorline('InsertLeave', true)

-- 设置firenvim的大小
-- vim.cmd [[
-- function! OnUIEnter(event) abort
--   if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
--     set lines=40 columns=120
--   endif
-- endfunction
-- autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
-- ]]
