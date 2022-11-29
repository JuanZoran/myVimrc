local wk = require("which-key")
local builtin = require("telescope.builtin")
wk.register({
	["<Leader>"] = {
		["t"] = {
			name = " Telescope",
			g = { builtin.registers, " Check out all register" },
			h = { builtin.help_tags, " Check out all tags" },
			t = { builtin.live_grep, " Search text in cucurrent directory" },
			f = { builtin.current_buffer_fuzzy_find, " Search text in current buffer" },
			s = { builtin.spell_suggest, "益spell suggestions about cursor word" },
			r = { builtin.treesitter, "滑Have a look at the tags provided by 滑" },
			e = { builtin.diagnostics, " take a look" },
			c = { builtin.commands, "גּ Check out commands" },
			u = { builtin.oldfiles, " Check out edited files[C-u]" },
			i = { builtin.jumplist, " Get jumplist[C-i]" },
			k = { builtin.keymaps, " Check out keymaps[C-/]" },
		},
		["h"] = {
			name = " Harpoon",
			h = {
				require("harpoon.ui").toggle_quick_menu,
				" You recored file List",
			},
			c = {
				require("harpoon.cmd-ui").toggle_quick_menu,
				" Open Commands List",
			},
			i = {
				require("harpoon.mark").add_file,
				" Add current file to list",
			},
			j = {
				require("harpoon.ui").nav_prev,
				"ﭢ Jump to next file on the list",
			},
			l = {
				require("harpoon.ui").nav_next,
				"ﭠ Jump to last file on the list",
			},
			m = { "<cmd>Telescope harpoon marks<CR>", " show all the marks by telescope" },
		},
		["="] = { "<Plug>(EasyAlign)", "ﱓ EasyAlign" },
		["R"] = { "<Plug>SnipRun", " Run the code snip" },
		["o"] = { "<cmd>LSoutlineToggle<CR>", " Show the variables window" },
		["b"] = { ":BufferLinePickClose<CR>", "﫧 Pick a Buffer to delete" },
		["<space>"] = { "<Plug>TranslateW", " Translate" },
		["p"] = { ":PackerSync<CR>", "מּ [Sync/Install] Plugin" },
		-- ["u"] = { ":PackerSync<CR>", "מּ [Sync/Install] Plugin" },
		["r"] = {
			name = "凜ranger/rename",
			a = { ":FloatermNew ranger<CR>", " Ranger" },
			n = { "<cmd>Lspsaga rename<CR>", "凜 Rename" },
		},
		["c"] = {
			name = " spell/code_action/cd",
			k = { ":set spell!<CR>", "暈Toggle vim builtin spell checker" },
			a = { "<cmd>Lspsaga code_action<CR>", " Code Action" },
			d = { "<cmd>Telescope zoxide list<CR>", " Cd recently directory" },
		},
		-- ["d"] = {
		-- 	name = " Diagnostic",
		-- 	d = { "<cmd>Lspsaga show_line_diagnostics<CR>", " " },
		-- 	c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", " 查看光标处诊断信息" },
		-- 	j = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", " 跳转到上一个诊断信息处" },
		-- 	l = { "<cmd>Lspsaga diagnostic_jump_next<CR>", " 跳转到下一个诊断信息处" },
		-- 	m = {
		-- 		function()
		-- 			vim.diagnostic.setqflist()
		-- 		end,
		-- 		" 打开诊断列表",
		-- 	},
		-- 	e = {
		-- 		function()
		-- 			vim.diagnostic.open_float()
		-- 		end,
		-- 		" 查看详细诊断信息",
		-- 	},
		-- },
	-- },
	["w"] = {
		name = " 窗口操作",
		o = { ":vsp<CR>", " 左右分屏" },
		u = { ":sp<CR>", " 上下分屏" },
		j = { "<C-w>h", " 跳转到左边窗口" },
		l = { "<C-w>l", " 跳转到右边窗口" },
		k = { "<C-w>j", " 跳转到下方窗口" },
		i = { "<C-w>k", " 跳转到上方窗口" },
		n = { ":only<CR>", " 关闭所有窗口" },
		w = { "<cmd>NvimTreeToggle<CR>", " 触发文件树" },
		["="] = { "<C-w>=", "屢恢复原来窗口尺寸" },
		["<Down>"] = { "<C-w>J", " 窗口向下移动" },
		["<Up>"] = { "<C-w>K", " 窗口向上移动" },
		["<Left>"] = { "<C-w>H", " 窗口向左移动" },
		["<Right>"] = { "<C-w>L", " 窗口向右移动" },
	},
	-- ["g"] = {
	-- 	name = " 跳转操作",
	-- 	h = { "<cmd>Lspsaga hover_doc<cr>", " 查看悬浮文档" },
	-- 	f = { "<cmd>Lspsaga lsp_finder<cr>", " 查看相关信息" },
	-- 	d = { "<cmd>Lspsaga peek_definition<cr>", " 查看定义" },
	-- 	D = {
	-- 		function()
	-- 			vim.lsp.buf.declaration()
	-- 		end,
	-- 		" 查看声明",
	-- 	},
	-- 	i = {
	-- 		function()
	-- 			vim.lsp.buf.implementation()
	-- 		end,
	-- 		" 查看实现",
	-- 	},
	-- 	r = {
	-- 		function()
	-- 			vim.lsp.buf.references()
	-- 		end,
	-- 		" 查看所有引用",
	-- 	},
	},
})

-- TODO:
-- wk.register({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})
-- wk.registers({
--     <++> = <++>
-- }, {prefix = '<++>'})

wk.setup({
	{
		plugins = {
			marks = false, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 30, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = false, -- default bindings on <c-w>
				nav = false, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		operators = { gc = "Comments" },
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "", -- symbol used between a key and it's label
			group = "", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<c-k>", -- binding to scroll down inside the popup
			scroll_up = "<c-i>", -- binding to scroll up inside the popup
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
		triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specify a list manually
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			-- most people should not need to change this
			i = { "i", "k" },
			v = { "i", "k" },
			-- n = { "<C-w>" },
		},
		-- disable the WhichKey popup for certain buf types and file types.
		-- Disabled by deafult for Telescope
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	},
})
