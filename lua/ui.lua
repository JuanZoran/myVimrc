local vim = vim
vim.opt.termguicolors = true
vim.g.deus_termcolors = 256


-- TODO
-- for non background

vim.g.everforest_background                = "hard"
vim.g.everforest_transparent_background    = 2 -- avaliable : 0, 1, 2
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_line_highlight = 1
vim.g.everforest_diagnostic_virtual_text   = "colored"
vim.g.everforest_better_preformance        = 1
-- vim.g.everforest_ui_contrast               = "high"
vim.g.everforest_current_word = "underline"
vim.g.everforest_spell_foreground = "colored"

-- vim.g.everforest_enable_italic = 1
-- vim.g.everforest_disable_italic_comment = 0
-- vim.g.everforest_show_eob = 0
-- vim.g.everforest_cursor = "red" -- only work for gui


vim.cmd([[colorscheme everforest]])
-- vim.cmd([[hi Todo gui=bold guifg=#2f383e guibg=#83c092]])

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
