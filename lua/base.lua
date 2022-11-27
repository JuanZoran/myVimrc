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

vim.opt.mouse = "a"
-- vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.title = true -- for show current dir
vim.opt.timeoutlen = 500 --default value = 1000
-- vim.opt.showtabline = 2 -- for 标签页面
-- vim.opt.hlsearch = true    default for true
vim.opt.hlsearch = false
-- vim.opt.incsearch = true --default for true

-- vim.opt.clipboard:append ("unnamedplus") -- 使用系统剪贴板

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.wo.signcolumn = "yes"
vim.opt.list = true

vim.opt.cursorline = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
-- vim.opt.autochdir     = true
vim.opt.helplang = "cn"
vim.opt.updatetime = 200

vim.cmd([[set iskeyword+=-]]) -- 将word-word视为一个word, 方便daw
---- disable some native
-- disable menu loading
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
---  SETTINGS  ---
vim.opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l") -- 可以从当前行直接前往上一行
