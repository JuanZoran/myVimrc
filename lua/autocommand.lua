vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]])

-- 设置firenvim的大小
vim.cmd([[
function! OnUIEnter(event) abort
  if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
    set lines=40 columns=120
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
]])

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

vim.cmd([[
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
]])


-- NOTE: lazy load
local sniprun = vim.api.nvim_create_augroup("SnipRun", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = sniprun,
	pattern = { "cpp", "python", "go" },
	callback = function()
		require("conf.sniprun").setup()
		vim.keymap.set("n", "nr", "<Plug>SnipClose", { silent = true })
		vim.keymap.set("n", "<Leader>R", "<Plug>SnipRun", { silent = true })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 250,
		})
	end,
})

-- NOTE: can create a autocmd for autoclose nvim_tree [see nvim_tree wiki]
