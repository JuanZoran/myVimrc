local opt = vim.opt
opt.termguicolors = true
opt.autoread = true
opt.number = true
opt.relativenumber = true

-- lualine did
opt.showmode = false
opt.ruler = false

-- opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.grepprg = "rg --vimgrep"
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- opt.smarttab = false
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.swapfile = false

opt.mouse = "a"

opt.cmdheight = 0
opt.pumheight = 10
opt.ignorecase = true
opt.smartcase = true

-- opt.hidden = true
-- opt.title = true -- for show current dir
opt.timeoutlen = 500 --default value = 1000
opt.ttimeout = true
opt.ttimeoutlen = 50 --default value = 1000
opt.hlsearch = false

-- Cool floating window popup menu for completion on command line
opt.tabstop     = 4
opt.softtabstop = 4
opt.shiftwidth  = 4
opt.expandtab   = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.whichwrap:append("<,>,[,],h,l") -- 可以从当前行直接前往上一行


opt.cursorline     = true
-- opt.foldcolumn     = "1" -- '0' is not bad
opt.foldlevel      = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable     = true

-- opt.formatoptions:remove('cro')

opt.splitbelow = true
opt.splitright = true
opt.wrap       = false
-- opt.autochdir     = true
opt.helplang   = "cn"
opt.updatetime = 200
-- opt.equalalways = false -- I don't like my windows changing all the time
opt.undofile   = true
opt.undodir    = vim.fn.expand('~/.vim/')

---  SETTINGS  ---
opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.wo.signcolumn = "yes"

opt.iskeyword:append('-') -- 将word-word视为一个word, 方便daw

-----================ disabled some native =====================

-- vim.o.showmode = false
local g = vim.g
g.did_install_default_menus = 1
g.did_install_syntax_menu = 1

-- -- use termux clipboard
-- g.clipboard = {
--   name = "termux",
--   copy = {
--     ["+"] = "termux-clipboard-set",
--     ["*"] = "termux-clipboard-set",
--   },
--   paste = {
--     ["+"] = "termux-clipboard-get",
--     ["*"] = "termux-clipboard-get",
--   },
--   cache_enabled = 0,
-- }

----============  disable end  ===========-------


-- vim.opt.formatoptions:remove("o")
-- 	- "a" -- Auto formatting is BAD.
-- 	- "t" -- Don't auto format my code. I got linters for that.
-- 	+ "c" -- In general, I like it when comments respect textwidth
-- 	+ "q" -- Allow formatting comments w/ gq
-- 	- "o" -- O and o, don't continue comments
-- 	+ "r" -- But do continue when pressing enter.
-- 	+ "n" -- Indent past the formatlistpat, not underneath it.
-- 	+ "j" -- Auto-remove comments if possible.
-- 	- "2" -- I'm not in gradeschool anymore

-- opt.list = true
-- opt.listchars = "tab:▸ " -- Show tabs as '▸   ▸   '
-- opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.sessionoptions = "buffers,curdir,folds,winsize,winpos,help"

-- vim.opt.showtabline = 2 -- for 标签页面
-- opt.clipboard:append ("unnamedplus") -- 使用系统剪贴板
-- vim.opt.pumblend = 17
-- vim.opt.hidden = true -- I like having buffers stay around
