local map = require("util").map
local vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = {
	silent = true,
}


--- for harpoon keybindings
map("n", opt, {
	"<Leader>hh",
	require("harpoon.ui").toggle_quick_menu,
}, {
	"<Leader>hi",
	require("harpoon.mark").add_file,
}, {
	"<Leader>hj",
	require("harpoon.ui").nav_prev,
}, {
	"<Leader>hl",
	require("harpoon.ui").nav_next,
}, {
	"<Leader>hc",
	require("harpoon.cmd-ui").toggle_quick_menu,
}, { "<leader>hm", "<cmd>Telescope harpoon marks<cr>" })

vim.keymap.set(
	{ "!", "v", "o" }, -- mode
	"<C-s>",
	"<Esc>",
	opt
)

map(
	"", -- global pattern
	opt,
	{ "'", '"' },
	{ "<Leader>sa", ":SaveSession<CR>" },
	{ "<Leader>sr", ":Autosession search<CR>" },
	{ "<Leader>st", ":Telescope session-lens search_session<CR>" },
	{ "<Leader>sd", ":Autosession delete<CR>" },
	{ "h", "i" },
	{ "H", "I" },
	{ "<Leader>=", "<Plug>(EasyAlign)" }
)

map(
	"n", -- 正常模式
	opt, -- 选项
	-- NOTE:窗口相关
	{ "wo", ":vsp<CR>" }, -- 左右分屏
	{ "wu", ":sp<CR>" }, -- 上下分屏
	{ "wj", "<C-w>h" },
	{ "wl", "<C-w>l" },
	{ "wk", "<C-w>j" },
	{ "wi", "<C-w>k" },
	{ "w=", "<C-w>=" },
	{ "w<Down>", "<C-w>J" },
	{ "b<left>", ":BufferLineMovePrev<CR>" },
	{ "b<right>", ":BufferLineMoveNext<CR>" },
	{ "qd", ":bdelete!<CR>" },
	{ "w<Up>", "<C-w>K" },
	{ "w<Right>", "<C-w>L" },
	{ "w<Left>", "<C-w>H" },
	{ "<C-Down>", "<C-w>-" },
	{ "<C-Up>", "<C-w>+" },
	{ "<C-Right>", "<C-w>>" },
	{ "<C-Left>", "<C-w><" },
	{ "wn", ":only<CR>" },
	{ ";", "@" },
	{ ";;", "q" },
	{ "'", '"' },
    -- NOTE: Floaterm
	{ "<Leader>tm", ":FloatermNew<CR>" },
	{ "<Leader>gi", ":FloatermNew lazygit<CR>" },
	{ "<Leader>ra", ":FloatermNew ranger<CR>" },
	{ "<C-d>", ":FloatermToggle<CR>" },
	{ "<C-t>", ":FloatermNew dooit<CR>" },
	{ "<C-g>", ":FloatermNew lazygit<CR>" },
	{ "<C-h>", "<cmd>FloatermHide<CR>" },
	{ "<Leader>df", "<cmd>FloatermKill<cr>" },

	-- TODO: config Bufferline
	{ "<C-j>", ":BufferLineCyclePrev<CR>" },
	{ "<Leader>b", ":BufferLinePickClose<CR>" },
	{ "<C-l>", ":BufferLineCycleNext<CR>" },

	{ "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>" },
	-- for quick yank
	{ "yw", "yiw" }, -- yank a word
	{ "y<cr>", 'yi"' }, -- yank in ""
	{ "yp", "yip" }, -- yank a Paragraph
	{ "dw", "diw" },
	{ "d<cr>", 'di"' }, -- delete ""
	{ "dp", "dip" },
	{ "vw", "viw" },
	{ "vp", "vip" },
	{ "v<cr>", 'vi"' },
	{ "cw", "ciw" },
	{ "cp", "cip" },
	{ "c<cr>", 'ci"' },
	-- 其他
	{ "<C-a>", "/<++><CR>vf>c" }, -- PlaceHolder
	{ "<Leader>w", ":wq<CR>" },
	{ "<Leader>W", ":w<CR>" },
	{ "<C-q>", ":q!<CR>" },
	{ "na", "<c-a>" },
	{ "nh", ":noh<CR>" },
	{ "<Leader>p", ":PackerSync<CR>" }, -- :插件安装
	{ "<Leader>ck", ":set spell!<CR>" }
	-- 	---------------------------
	-- 	-- {"<++>", "<++>"},
	-- 	-- {"<++>", "<++>"},
	-- 	-- {"<++>", "<++>"},
	-- 	-- {"<++>", "<++>"},
)
-- Insert mode
map(
	"i",
	opt,
	{ "<C-f>", ":FloatermNew ranger<CR>" },
	{ "<C-g>", "<Esc><cmd>FloatermNew lazygit<CR>" },
	{ "<C-d>", "<Esc><cmd>FloatermToggle<CR>" },
	{ "<C-a>", "<Esc>/<++><CR>vf>c" },
	-- {"<++>", "<++>"},
	-- 最近跳转的历史"<++>"},
	-- {"<+, "<++>"},
	-- {"<++>", "<++>"},
	-- {"<++>", "<++>"},
	-- {"<++>", "<++>"},
	{ "<C-a>", "<Esc>/<++><CR>vf>c" },
	{ "<C-j>", "<Left>" },
	{ "<C-l>", "<Right>" }
)

map(
	"c", -- command-line mode
	opt,
	{ "<C-q>", "<Esc>" },
	{ "<C-j>", "<Left>" },
	{ "<C-l>", "<Right>" },
	{ "<C-o>", "<cr>" }
)

map(
	"v",
	opt,
	{ ">", ">gv" },
	{ "<", "<gv" }
)

-- vim.keymap.set("n", "<Tab>", '<CMD>lua print([[ Tab is pressed ]])<CR>')
-- vim.keymap.set("n", "<C-i>", '<CMD>lua print([[ Ctr-i is pressed ]])<CR>')
-- 单独情况设置
vim.keymap.set("n", "tx", ":r !figlet ")



-- String value	Help page	Affected modes	Vimscript equivalent
-- '' (an empty string)	mapmode-nvo	Normal, Visual, Select, Operator-pending	:map
-- 'n'	mapmode-n	Normal	:nmap
-- 'v'	mapmode-v	Visual and Select	:vmap
-- 's'	mapmode-s	Select	:smap
-- 'x'	mapmode-x	Visual	:xmap
-- 'o'	mapmode-o	Operator-pending	:omap  意味着是否可以与其他键组合
-- '!'	mapmode-ic	Insert and Command-line	:map!
-- 'i'	mapmode-i	Insert	:imap
-- 'l'	mapmode-l	Insert, Command-line, Lang-Arg	:lmap
-- 'c'	mapmode-c	Command-line	:cmap
-- 't'	mapmode-t	Terminal	:tmap
