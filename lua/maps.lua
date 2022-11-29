local M = require("util")
local vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local nopt = {
	silent = true,
}
-- 插入模式的选项
local iopt = {
	silent = true,
}

----Telescope
local builtin = require("telescope.builtin")
M.map(
	"n",
	nopt,
	{ "<C-f>", builtin.find_files },
	{ "<leader>tg", builtin.registers },
	{ "<leader>th", builtin.help_tags },
	{ "<leader>gf", builtin.git_files },
	{ "<leader>tt", builtin.live_grep },
	{ "<leader>tf", builtin.current_buffer_fuzzy_find },
	{ "<leader>ts", builtin.spell_suggest },
	{ "<leader>tr", builtin.treesitter },
	{ "<leader>te", builtin.diagnostics },
	{ "<leader>tc", builtin.commands },
	{ "<leader>ti", builtin.jumplist },
	{ "<leader>tu", builtin.oldfiles },
	{ "<leader>tk", builtin.keymaps },

	{ "<C-u>", builtin.oldfiles },
	{ "<leader>cd", "<cmd>Telescope zoxide list<cr>" },
	{ "<C-i>", builtin.jumplist },
	{ "<C-_>", builtin.keymaps }, -- for C-/
	{
		"<C-p>",
		function() -- 打开项目
			require("telescope").extensions.project.project({})
		end,
	}
)

--- for harpoon keybindings
M.map("n", nopt, {
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
	nopt
)

M.map(
	"", -- global pattern
	nopt,
	{ "'", '"' },
	{ "<Leader>sa", ":SaveSession<CR>" },
	{ "<Leader>sr", ":Autosession search<CR>" },
	{ "<Leader>st", ":Telescope session-lens search_session<CR>" },
	{ "<Leader>sd", ":Autosession delete<CR>" },
	{ "h", "i" },
	{ "H", "I" },
	{ "<Leader>=", "<Plug>(EasyAlign)" }
	-- { "<Leader>R", "<Plug>SnipRun" } 
)

M.map(
	"n", -- 正常模式
	nopt, -- 选项
	-- 窗口相关
	{ "wo", ":vsp<CR>" }, -- 左右分屏
	{ "wu", ":sp<CR>" }, -- 上下分屏
	{ "wj", "<C-w>h" },
	{ "wl", "<C-w>l" },
	{ "wk", "<C-w>j" },
	{ "wi", "<C-w>k" },
	{ "w=", "<C-w>=" },
	{ "w<Down>", "<C-w>J" },
	{ "bb", "b" },
	{ "bd", ":Bdelete<CR>" },
	{ "b<left>", ":BufferLineMovePrev<CR>" },
	{ "b<right>", ":BufferLineMoveNext<CR>" },
	{ "qd", ":Bdelete<CR>" },
	{ "w<Up>", "<C-w>K" },
	{ "w<Right>", "<C-w>L" },
	{ "w<Left>", "<C-w>H" },
	{ "<C-Down>", "<C-w>-" },
	{ "<C-Up>", "<C-w>+" },
	{ "<C-Right>", "<C-w>>" },
	{ "<C-Left>", "<C-w><" },
	{ "wn", ":only<CR>" },
	{ "ww", "<cmd>NvimTreeToggle<CR>" },
	{ ";", "@" },
	{ ";;", "q" },
	{ "'", '"' },
	{ "<Leader>tm", ":FloatermNew<CR>" },
	{ "<Leader>gi", ":FloatermNew lazygit<CR>" },
	{ "<Leader>ra", ":FloatermNew ranger<CR>" },
	{ "<C-d>", ":FloatermToggle<CR>" },
	{ "<C-g>", ":FloatermNew lazygit<CR>" },
	{ "<C-h>", "<cmd>FloatermHide<CR>" },
	{ "<Leader>df", "<cmd>FloatermKill<cr>" },
	-- TODO: config Bufferline
	{ "<C-j>", ":BufferLineCyclePrev<CR>" },
	{ "<Leader>b", ":BufferLinePickClose<CR>" },
	{ "<C-l>", ":BufferLineCycleNext<CR>" },
	{ "<Leader><Leader>", "<Plug>TranslateW" },

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
	-- { "<C-w>", ":wq<CR>" },
	{ "<Leader>w", ":wq<CR>" },
	{ "<C-q>", ":q!<CR>" },
	{ "<C-i>", ":Telescope jumplist<CR>" },
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
M.map(
	"i",
	iopt,
	{ "<C-f>", ":FloatermNew fanger<CR>" },
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

M.map(
	"c",
	iopt,
	{ "<C-q>", "<Esc>" },
	{ "<C-j>", "<Left>" },
	-- { "<C-u>", "<Up>" },
	-- { "<C-o>", "<Down>" },
	{ "<C-l>", "<Right>" }
)

M.map(
	"v",
	iopt,
	-- { "<Leader><Leader>", ":TranslateW" },
	{ ">", ">gv" },
	{ "<", "<gv" }
)

-- 单独情况设置
vim.keymap.set("n", "tx", ":r !figlet ")
vim.keymap.set("n", "<Leader>T", ":Telescope ")

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
