local o = vim.opt
o.number         = true
o.relativenumber = true
o.scrolloff      = 10
o.sidescrolloff  = 10 
o.swapfile       = false
o.mouse          = "a"

o.cmdheight   = 2
o.pumheight   = 10
o.ignorecase  = true
o.smartcase   = true
o.hidden      = true
o.title       = true -- for show current dir
o.timeoutlen  = 500 --default value = 1000
o.ttimeoutlen = 10 --default value = 1000
o.hlsearch    = false

-- TODO: w, {v, b, l}
o.formatoptions = o.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore

-- Cool floating window popup menu for completion on command line
-- vim.opt.autochdir     = true
o.termguicolors = true
-- o.background = "dark"
o.tabstop = 4
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.foldenable = false
o.completeopt = { "menu", "menuone", "noselect" }
o.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
o.shortmess:append("I") -- don't show the default intro message
o.whichwrap:append("<,>,[,],h,l") -- 可以从当前行直接前往上一行
o.list = true
o.listchars = "tab:▸ " -- Show tabs as '▸   ▸   '
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.wrap = false
o.helplang = "cn"
o.shortmess:append("c")
o.updatetime = 200

---  SETTINGS  ---
vim.wo.signcolumn = "yes"

vim.cmd([[set iskeyword+=-]]) -- 将word-word视为一个word, 方便daw

-----================ disabled some native =====================
local g = vim.g
g.loaded_matchit            = 1
g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
-- Uncomment this if you define your own filetypes in `after/ftplugin`
g.did_load_filetypes        = 1
-- Do not load spell files
g.loaded_spellfile_plugin   = 1
-- Do not load native syntax completion
g.loaded_syntax_completion  = 1
g.loaded_gzip               = 1
g.loaded_zip                = 1
g.loaded_zipPlugin          = 1
g.loaded_tar                = 1
g.loaded_tarPlugin          = 1
g.loaded_getscript          = 1
g.loaded_getscriptPlugin    = 1
g.loaded_netrw              = 1
g.loaded_netrwPlugin        = 1
g.loaded_netrwSettings      = 1
----============  disable end  ===========-------

require 'settings.theme'
