vim.opt.termguicolors = true
vim.g.deus_termcolors = 256

-- https://zhuanlan.zhihu.com/p/20718108
-- hi 样式名称 guifg=Gvim字体颜色 guibg=Gvim背景颜色 ctermfg=终端Vim字体颜色 ctermbg=终端Vim背景颜色 gui=Gvim字体样式 cterm=终端Vim字体样式
-- hi 的意思是 highlight，也就是它的缩写。 Normal 代表初始化时候的样式，
-- 常规样式， guifg 意思是，在 GVim 中（带有图形界面的Vim） ，字体的颜色是#990808 ，
-- 而 guibg 意思就是 背景色是black黑色，
-- ctermfg 代表了 vim 在 Linux 下的 terminal 终端里的字体配色，
-- terminal 只有 256色， 所以具体， 你需要查询 256 色值表，每个数字具体代表了什么颜色，
-- 而最后的 gui cterm 则是代表了字体的样式，你可以设置为bold(粗体) , 也可以设置为none(常规)

-- 在使用完colorscheme后再使用，若在之前使用，则会被colorscheme覆盖
-- 定义一些高亮组的颜色 see :h highlight
-- vim.cmd([[
--     highlight NonText ctermfg=gray guifg=grey50
--     hi SignColumn ctermbg=None guibg=None
--     hi VertSplit ctermfg=None ctermbg=None cterm=None guibg=None guifg=None
--     ]])

-- TODO
-- for non background
vim.cmd([[colorscheme everforest]])
-- vim.nvim_set_hl(0, 'Normal', {})
vim.cmd([[highlight Normal guibg=None ctermbg=None]])
-- vim.cmd([[highlight Visual guibg=#e9dcb6 ctermbg=16]])
vim.cmd([[highlight EndOfBuffer guibg=None ctermbg=None]])
vim.cmd([[hi Todo gui=bold guifg=#2f383e guibg=#83c092]])
vim.cmd([[hi NonText guibg=None]])
-- NonTextxxx ctermfg=239 guifg=#525c62
-- vim.cmd([[highlight FidgetTitle ctermfg=None guifg=None]])

-- vim.api.nvim_set_hl(0, "Normal", { guibg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { guibg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
