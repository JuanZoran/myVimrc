local api = vim.api
local autocmd = api.nvim_create_autocmd

local group = api.nvim_create_augroup('UserDefine', { clear = true })

-- Go to last loc when opening a buffer
-- autocmd("BufReadPost", {
--     group = group,
--     callback = function()
--         local mark = vim.api.nvim_buf_get_mark(0, '"')
--         local lcount = vim.api.nvim_buf_line_count(0)
--         if mark[1] > 0 and mark[1] <= lcount then
--             pcall(vim.api.nvim_win_set_cursor, 0, mark)
--         end
--     end,
-- })


autocmd('BufReadPost', {
    group = group,
    command = [[silent! loadview]],
})

autocmd({ 'BufWrite', 'QuitPre' }, {
    group = group,
    command = [[silent! mkview]],
})


-- Don't auto comment when o
autocmd('FileType', { command = [[set formatoptions-=cro]] })

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
autocmd('BufEnter', {
    group = group,
    pattern = '*/snips/*.lua',
    callback = function()
        vim.keymap.set('n', '<CR>', '/-- End Snippets --<CR>:noh<CR>2<Up>o', { silent = true, buffer = true })
    end,
})


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
