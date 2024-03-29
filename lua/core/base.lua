local opt          = vim.opt
opt.termguicolors  = true
opt.autoread       = true
opt.number         = true
opt.relativenumber = true
-- lualine did
opt.showmode       = false
opt.ruler          = false

-- opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.grepprg        = 'rg --vimgrep'
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer

opt.encoding       = 'utf-8'
opt.fileencoding   = 'utf-8'

-- opt.smarttab = false
opt.scrolloff      = 10
opt.sidescrolloff  = 10
opt.swapfile       = false

opt.mouse          = 'a'

opt.cmdheight      = 0
opt.pumheight      = 10
opt.ignorecase     = true
opt.smartcase      = true

-- opt.hidden = true
-- opt.title = true -- for show current dir
opt.timeoutlen     = 400 --default value = 1000
opt.ttimeout       = true
opt.ttimeoutlen    = 100 --default value = 1000
opt.hlsearch       = false


-- Cool floating window popup menu for completion on command line
opt.tabstop     = 4
opt.softtabstop = 4
opt.shiftwidth  = 4
opt.textwidth   = 80
opt.expandtab   = true
opt.whichwrap:append '<,>,[,],h,l' -- 可以从当前行直接前往上一行


opt.cursorline     = true
-- opt.foldcolumn     = "1" -- '0' is not bad
opt.foldlevel      = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable     = true

-- opt.formatoptions:remove('cro')

opt.splitbelow     = true
opt.splitright     = true
opt.wrap           = false
-- opt.autochdir     = true
opt.helplang       = 'cn'
opt.updatetime     = 200
-- opt.equalalways = true -- auto resize window
opt.undofile       = true
opt.cindent        = true
opt.smartindent    = true
opt.cpoptions:append '>' -- :help cpoptions

opt.showmatch = true
---@diagnostic disable-next-line: assign-type-mismatch
opt.undodir = os.getenv 'HOME' .. '/.vim'

---  SETTINGS  ---
opt.spelllang:append 'cjk' -- disable spellchecking for asian characters (VIM algorithm does not support it)
-- vim.wo.signcolumn = 'auto'
vim.wo.signcolumn           = 'yes'

-- opt.iskeyword:append '-' -- 将word-word视为一个word, 方便daw

opt.viewoptions             = 'cursor,folds'
-----================ disabled some native =====================

local g                     = vim.g
-- vim.o.showmode = false
g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.no_man_maps               = true
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


-- vim.opt.showtabline = 2 -- for 标签页面
-- opt.clipboard:append ("unnamedplus") -- 使用系统剪贴板
-- vim.opt.pumblend = 17
-- vim.opt.hidden = true -- I like having buffers stay around

-- opt.guicursor='n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
-- \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
-- \,sm:block-blinkwait175-blinkoff150-blinkon175
vim.filetype.add {
    extension = {
        rasi = 'rasi', -- For Rofi configuration file
        -- haskell = 'haskell',
    },
}


if g.neovide then
    opt.guifont = 'JetBrainsMono Nerd Font,得意黑:h12'
    g.neovide_transparency = 0.8
    g.neovide_refresh_rate = 100
end
