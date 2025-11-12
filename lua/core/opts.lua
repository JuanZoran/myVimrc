local opt          = vim.opt

opt.termguicolors  = true
opt.autoread       = true
opt.number         = true
opt.relativenumber = true
opt.scrolloff      = 10
opt.sidescrolloff  = 10
opt.swapfile       = false
opt.mouse          = 'a'

opt.grepprg        = 'rg --vimgrep'
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer

opt.cmdheight      = 0
opt.pumheight      = 10

opt.timeoutlen     = 400 --default value = 1000
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
opt.foldlevel      = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable     = true


opt.splitbelow     = true
opt.splitright     = true
opt.wrap           = false
-- opt.autochdir     = true
opt.helplang       = 'cn'
opt.undofile       = true
opt.cindent        = true
opt.smartindent    = true

opt.undodir = os.getenv 'HOME' .. '/.vim'

-- opt.iskeyword:append '-' -- 将word-word视为一个word, 方便daw
opt.viewoptions = 'cursor,folds'
opt.signcolumn = 'yes:2' -- for diagnose signcolumn
