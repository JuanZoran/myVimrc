local vim = vim
vim.opt.autoread = true
vim.bo.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
-- vim.opt.smarttab = false
vim.opt.fileencoding = "utf-8"

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.swapfile = false

vim.opt.mouse = "a"

-- vim.opt.cmdheight = 2
vim.opt.pumheight = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.title = true -- for show current dir
vim.opt.timeoutlen = 500 --default value = 1000
vim.opt.ttimeoutlen = 10 --default value = 1000
vim.opt.hlsearch = false

-- TODO: w, {v, b, l}
-- vim.opt.formatoptions = vim.opt.formatoptions
-- 	- "a" -- Auto formatting is BAD.
-- 	- "t" -- Don't auto format my code. I got linters for that.
-- 	+ "c" -- In general, I like it when comments respect textwidth
-- 	+ "q" -- Allow formatting comments w/ gq
-- 	- "o" -- O and o, don't continue comments
-- 	+ "r" -- But do continue when pressing enter.
-- 	+ "n" -- Indent past the formatlistpat, not underneath it.
-- 	+ "j" -- Auto-remove comments if possible.
-- 	- "2" -- I'm not in gradeschool anymore

-- Cool floating window popup menu for completion on command line
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.foldenable = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l") -- 可以从当前行直接前往上一行
vim.opt.list = true
vim.opt.listchars = "tab:▸ " -- Show tabs as '▸   ▸   '

vim.opt.cursorline   = true
vim.o.foldcolumn     = "1" -- '0' is not bad
vim.o.foldlevel      = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable     = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
-- vim.opt.autochdir     = true
vim.opt.helplang = "cn"
vim.opt.shortmess:append("c")
vim.opt.updatetime = 200
-- vim.opt.equalalways = false -- I don't like my windows changing all the time

---  SETTINGS  ---
-- vim.opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.wo.signcolumn = "yes"

vim.cmd([[set iskeyword+=-]]) -- 将word-word视为一个word, 方便daw

-----================ disabled some native =====================
vim.o.showmode = false
vim.g.loaded_matchit = 1
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1
vim.g.loaded = 1
vim.g.loaded_netrwPlugins = 1
-- Uncomment this if you define your own filetypes in `after/ftplugin`
vim.g.did_load_filetypes = 1
-- Do not load spell files
vim.g.loaded_spellfile_plugin = 1
-- Do not load native syntax completion
vim.g.loaded_syntax_completion = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
----============  disable end  ===========-------

-- vim.opt.showtabline = 2 -- for 标签页面
-- vim.opt.incsearch = true --default for true
-- vim.opt.clipboard:append ("unnamedplus") -- 使用系统剪贴板
-- vim.opt.pumblend = 17
-- vim.opt.hidden = true -- I like having buffers stay around
-- vim.opt.foldenable       = true
-- vim.opt.foldlevel       = 99
-- vim.opt.undofile = true
-- vim.opt.undodir = "~/.vim/undodir"
