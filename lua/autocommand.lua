-- format: autocmd- [需要监听的事件] [监听的类型] [需要执行的命令]
-- autogroup 防止重复加载命令
-- autocmd! 清除之前的所有autocmd
-- 记录上一次的位置
-- vim.cmd([[
-- if has("autocmd")
--   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
-- endif
-- ]])


-- 设置firenvim的大小
vim.cmd([[
function! OnUIEnter(event) abort
  if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
    set lines=20 columns=80
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
]])


-- Cursorline highlighting control
--  Only have it on in the active buffer
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
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- for solve input method switch
vim.cmd([[
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
]])
