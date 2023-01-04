local View = vim.api.nvim_create_augroup('View', { clear = true })
vim.api.nvim_create_autocmd('BufRead', {
    group = View,
    command = [[silent! loadview]]
})

vim.api.nvim_create_autocmd('BufWinLeave', {
    group = View,
    command = [[silent! mkview]]
})

-- 设置firenvim的大小
vim.cmd [[
function! OnUIEnter(event) abort
  if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
    set lines=40 columns=120
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
]]

-- Don't auto comment when o
vim.api.nvim_create_autocmd("FileType", { command = [[set formatoptions-=cro]] })


vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank {
            higroup = "IncSearch",
            timeout = 250,
        }
    end,
})


-- NOTE  Snip Utility
local snip = vim.api.nvim_create_augroup("CodeSnip", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = snip,
    pattern = "*/snips/*.lua",
    callback = function()
        vim.keymap.set('n', '<CR>', '/-- End Snippets --<CR>:noh<CR>2<Up>o', { silent = true, buffer = true })
    end,
})


-- INFO 中文输入法切换的问题
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

-- INFO : store Position
-- vim.api.nvim_create_autocmd(
--     "BufReadPost",
--     {
--         group = vim.api.nvim_create_augroup('Position', { clear = true }),
--         command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
--     }
-- )

-- INFO cursorline
-- local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
-- local set_cursorline = function(event, value, pattern)
--     vim.api.nvim_create_autocmd(event, {
--         group = group,
--         pattern = pattern,
--         callback = function()
--             vim.opt_local.cursorline = value
--         end,
--     })
-- end

-- set_cursorline("WinLeave", false)
-- -- set_cursorline("InsertEnter", false)
-- -- set_cursorline("InsertLeave", true)
-- set_cursorline("WinEnter", true)
-- set_cursorline("FileType", false, "TelescopePrompt")
