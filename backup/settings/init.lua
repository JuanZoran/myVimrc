require("settings.disabled")

vim.wo.relativenumber = true
local o = vim.opt
-- normal settings
o.number        = true
o.mouse         = 'a'
o.ignorecase    = true
o.smartcase     = true
o.hlsearch      = false
o.breakindent   = true
o.tabstop       = 4
o.shiftwidth    = 4
o.softtabstop   = 4
o.wrap          = false
o.expandtab     = true
o.autochdir     = true
o.helplang      = "cn"
o.updatetime    = 100
o.termguicolors = true
o.splitbelow    = true
o.splitright    = true

-- Todo:
o.foldmethod = "expr"
o.foldexpr = "foldexpr=nvim_treesitter#foldexpr()"
o.foldenable = false
o.scrolloff = 10
o.cursorline = true
o.completeopt = {"menu", "menuone", "noselect"}

---
-- Colorscheme
---
vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[filetype on]]
vim.cmd[[set iskeyword+=-]] -- 将word-word视为一个word, 方便daw
vim.cmd[[hi Todo cterm=bold gui=bold guifg=#1d202f guibg=#1abc9c]]
vim.cmd[[hi Visual guifg=#191a21 guibg=#ff6e6e]]

-- vim.cmd[[filetype indent on]]
-- vim.cmd[[filetype plugin on]]
-- vim.cmd[[<++>]]
-- vim.cmd[[<++>]]

-- vim.cmd[[
-- let fcitx5state=system("fcitx5-remote")
-- ]]
-- -- 
-- vim.cmd[[
-- augroup tmp
--     autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
--     autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
-- augroup end
-- ]]
--
-- vim.cmd[[ 
-- if exists('g:started_by_firenvim')
--   set laststatus=0
-- else
--   set laststatus=2
-- endif
-- ]]
--
