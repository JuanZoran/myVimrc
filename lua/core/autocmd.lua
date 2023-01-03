local View = vim.api.nvim_create_augroup('View', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
    group = View,
    command = [[silent! loadview]]
})

-- TODO : config this
vim.api.nvim_create_autocmd('VimLeavePre', {
    group = View,
    command = [[mkview]]
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

-- for cursorline
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
        end,
    })
end


set_cursorline("WinLeave", false)
-- set_cursorline("InsertEnter", false)
-- set_cursorline("InsertLeave", true)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")


-- Don't auto comment when o
-- vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })


vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank {
            higroup = "IncSearch",
            timeout = 250,
        }
    end,
})

-- TODO : setup automatically setup template
local template = {}
for file in vim.fs.dir(vim.fn.stdpath('config') .. '/lua/template') do
    table.insert(template, file)
end

local template_group = vim.api.nvim_create_augroup('Template', { clear = true })
for _, filename in ipairs(template) do
    vim.api.nvim_create_autocmd('BufNewFile', {
        group = template_group,
        pattern = filename:gsub('all', '*'):gsub('-', '/'),
        command = [[0r ~/.config/nvim/lua/template/]] .. filename,
    })
end


local snip = vim.api.nvim_create_augroup("CodeSnip", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = snip,
    pattern = "*/snips/*.lua",
    callback = function()
        vim.keymap.set('n', '<CR>', '/-- End Snippets --<CR>:noh<CR>2<Up>o', { silent = true, buffer = true })
    end,
})


-- 中文输入法切换的问题
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

-- INFO : vim script for input switch
-- vim.cmd[[
-- let fcitx5state=system("fcitx5-remote")
-- autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
-- autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
-- ]]

-- INFO : store Position
-- vim.api.nvim_create_autocmd(
--     "BufReadPost",
--     {
--         group = vim.api.nvim_create_augroup('Position', { clear = true }),
--         command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
--     }
-- )
-- go to last loc when opening a buffer
