-- format: autocmd- [需要监听的事件] [监听的类型] [需要执行的命令]
-- autogroup 防止重复加载命令
-- autocmd! 清除之前的所有autocmd
-- 记录上一次的位置
vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]])

-- 设置firenvim的大小
vim.cmd([[
function! OnUIEnter(event) abort
  if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
    set lines=20 columns=80
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
]])
