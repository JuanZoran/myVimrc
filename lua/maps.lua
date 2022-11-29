local vim = vim
local function keymap(mode, option, ...) -- for better keymap-binding alias
	local maps = { ... }
	for _, v in ipairs(maps) do
		vim.keymap.set(mode, v[1], v[2], option)
	end
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local nopt = {
	silent = true,
}
-- 插入模式的选项
local iopt = {
	silent = true,
}

-- 选中模式的选项

----Telescope
local builtin = require("telescope.builtin")
keymap(
	"n",
	nopt,
	{ "<C-f>", builtin.find_files },
	-- { "<Leader>ff", function() -- with no previewer
	--     require 'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
	-- end },
	-- { "<leader>fb", builtin.buffers },
	{ "<leader>tg", builtin.registers },
	{ "<leader>th", builtin.help_tags },
	{ "<leader>gf", builtin.git_files },
	{ "<leader>tt", builtin.live_grep },
	{ "<leader>tf", builtin.current_buffer_fuzzy_find },
	-- { "<leader>tp", "<cmd>Telescope packer<cr>" },
	{ "<leader>hm", "<cmd>Telescope harpoon marks<cr>" },
	{ "<leader>ts", builtin.spell_suggest },
	{ "<leader>tr", builtin.treesitter },
	{ "<leader>te", builtin.diagnostics },
	{ "<leader>tc", builtin.commands },
	{ "<leader>ti", builtin.jumplist },
	{ "<leader>tu", builtin.oldfiles },
	{ "<leader>tk", builtin.keymaps },
	{
		"==",
		function()
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
				-- bufnr = bufnr,
				async = true,
			})
		end,
	},

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

keymap("n", nopt, {
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
})

local vopt = {
	silent = true,
}

vim.keymap.set(
	{ "!", "v", "o" }, -- mode
	"<C-s>",
	"<Esc>",
	nopt
)
keymap(
	"", -- global pattern
	nopt,
	{ "'", '"' },
	-- 光标移动
    -- BACK:
	-- { "i", "k" },
	-- { "k", "j" },
	-- { "j", "h" },
	{ "s", ":HopChar2MW<cr>" },
	-- {"S", ":HopChar2MW<cr>"},

	{ "ej", ":HopPatternBC<CR>" },
	{ "ee", "e" },
	{ "el", ":HopPatternAC<CR>" },
	{ "<Leader>l", ":HopWordAC<CR>" },
	{ "<Leader>i", ":HopVerticalBC<CR>" },
	{ "<Leader>k", ":HopVerticalAC<CR>" },
	{ "<Leader>j", ":HopWordBC<CR>" },
	{ "<Leader>sa", ":SaveSession<CR>" },
	{ "<Leader>sr", ":Autosession search<CR>" },
	{ "<Leader>st", ":Telescope session-lens search_session<CR>" },
	{ "<Leader>sd", ":Autosession delete<CR>" },
	{ "L", "$" },
	{ "J", "0" },
	{ "h", "i" },
	{ "H", "I" },
	-- 输入
	-- { "K", ":lua vim.notify('fuck you nvim')<CR>" },
	{ "<Leader>=", "<Plug>(EasyAlign)" },
	{ "<space>", "<Nop>" },
	-- { "<Leader>cc", ":CommentToggle<CR>" },
	{ "nr", "<Plug>SnipClose" },
	{ "<Leader>R", "<Plug>SnipRun" }
)




keymap(
	"n", -- 正常模式
	nopt, -- 选项
	-- 光标移动, has done by plugin : neoscorll
	--    {"I", "<C-u>"},
	--    {"K", "<C-d>"},
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
	-- TODO: config Bufferline
	{ "<C-j>", ":BufferLineCyclePrev<CR>" },
	{ "<Leader>b", ":BufferLinePickClose<CR>" },

	{ "<C-l>", ":BufferLineCycleNext<CR>" },
	{ "<Leader>rn", "<cmd>Lspsaga rename<CR>" },
	{ "<Leader>ca", "<cmd>Lspsaga code_action<CR>" },
	{ "<Leader>df", "<cmd>FloatermKill<cr>" },
	{ "<Leader>dd", "<cmd>Lspsaga show_line_diagnostics<CR>" },
	{ "<Leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
	{
		"<Leader>dm",
		vim.diagnostic.setqflist,
	},
	{ "<Leader>o", "<cmd>LSoutlineToggle<CR>" },
	{ "<Leader><Leader>", "<Plug>TranslateW" },
	{ "gh", "<cmd>Lspsaga hover_doc<cr>" },
	{ "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>" },
	{ "gf", "<cmd>Lspsaga lsp_finder<cr>" },
	{ "gd", "<cmd>Lspsaga peek_definition<cr>" },
	{ "yw", "yiw" },
	{ 'y"', 'yi"' },
	{ "yp", "yip" },
	{ "dw", "diw" },
	{ "dp", "dip" },
	{ 'd"', 'di"' },
	{ "vw", "viw" },
	{ "vp", "vip" },
	{ 'v"', 'vi"' },
	{ "cw", "ciw" },
	{ "cp", "cip" },
	{ 'c"', 'ci"' },
	{
		"gD",
		vim.lsp.buf.declaration,
	},
	{
		"gi",
		vim.lsp.buf.implementation,
	},
	{
		"gr",
		vim.lsp.buf.references,
	},

	-- for text diagnostic
	{ "<Leader>dj", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
	{ "<Leader>dl", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
	{
		"<Leader>de",
		vim.diagnostic.open_float,
	},
	-- 	---------------------------
	-- 	-- {"<++>", "<++>"},
	-- 	-- {"<++>", "<++>"},
	-- 	-- {"<++>", "<++>"},
	-- 	-- {"<++>", "<++>"},
	-- 其他
	{ "<C-a>", "/<++><CR>vf>c" }, -- PlaceHolder
	-- { "<C-w>", ":wq<CR>" },
    {"<Leader>w", ":wq<CR>" },
	{ "<C-q>", ":q!<CR>" },
	{ "<C-i>", ":Telescope jumplist<CR>" },
	{ "na", "<c-a>" },
	{ "nh", ":noh<CR>" },
	{ "<Leader>p", ":PackerSync<CR>" }, -- :插件安装
	{ "<Leader>ck", ":set spell!<CR>" }
)
--
keymap(
	"i", -- 插入模式
	iopt,
	{ "<C-f>", ":FloatermNew fanger<CR>" },
	{ "<C-g>", "<Esc><cmd>FloatermNew lazygit<CR>" },
	{ "<C-d>", "<Esc><cmd>FloatermToggle<CR>" },
	-- {"<++>", "<++>"},
	-- 最近跳转的历史"<++>"},
	-- {"<+, "<++>"},
	-- {"<++>", "<++>"},
	-- {"<++>", "<++>"},
	-- {"<++>", "<++>"},
	{ "<C-a>", "<Esc>/<++><CR>vf>c" }
)

keymap(
	"v", -- 插入模式
	vopt,
	--
	-- {"<++>", "<++>"},
	-- {"<++>", "<++>"},
	-- {"<++>", "<++>"},
	-- {"<++>", "<++>"},
	-- Move text up and down
	{ "<A-k>", ":move '>+1<CR>gv-gv" },
	{ "<A-i>", ":move '<-2<CR>gv-gv" },
	{ "<Leader><Leader>", "<Plug>TranslateWV" },
	{ "p", '"_dP' }, --- 选中的东西粘贴后, 不替换当前的寄存器
	{ "[", "<gv" },
	{ "]", ">gv" }
)

keymap( -- for insert and command-Line mode
	"!",
	iopt,
	{ "<C-j>", "<Left>" },
	{ "<C-l>", "<Right>" }
)

-- place this in one of your configuration file(s)
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })
vim.keymap.set("", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, { remap = true })

-- 单独情况设置
vim.keymap.set("n", "tx", ":r !figlet ")
vim.keymap.set("n", "<Leader>T", ":Telescope ")
vim.keymap.set("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", nopt)
vim.keymap.set("x", "m", ":lua require('tsht').nodes()<CR>", nopt)

-- vim.keymap.set("n", "<Tab>", '<CMD>lua print([[ Tab is pressed ]])<CR>')
-- vim.keymap.set("n", "<C-i>", '<CMD>lua print([[ Ctr-i is pressed ]])<CR>')
-- vim.keymap.set("n", "<C-i>", '<C-i>')

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
