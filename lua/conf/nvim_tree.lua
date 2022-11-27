local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

vim.g.nvim_tree_auto_close = 1

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	ignore_ft_on_setup = {
		-- "startify",
		-- "dashboard",
		"alpha",
	},
	-- sort_by = "name",
	-- auto_close = true, has been removed
	open_on_tab = false,
	-- hijack_cursor = false,
	update_cwd = true,
	-- hijack_directories = {
	-- enable = true,
	-- auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		-- width = 30,
		-- height = 30,
		-- hide_root_folder = false,
		-- side = "left",
		-- auto_resize = true,
		adaptive_size = true,
		mappings = {
			-- custom_only = true, -- 只用自定义的按键
			list = {
				{ key = "u", action = "parent_node" },
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") }, -- 打开文件
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
		-- number = false,
		-- relativenumber = false,
	},
	-- actions = {
	--     quit_on_open = true,
	--     window_picker = { enable = true },
	-- },
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		highlight_opened_files = "icon", -- can be [icon, name, all, none]
		icons = {
			-- show = {
			--     file = true,
			--     folder = true,
			--     folder_arrow = true,
			--     git = true,
			-- },
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
		special_files = {
			"README.md",
			"readme.md",
			"xmake.lua",
			"CMakeLists.txt",
		},
	},
	-- tab = {
	-- sync = {
	-- open = false,
	-- close = false,
	-- ignore = {},
	-- },
	-- },
}) -- view.mappings.list = { -- BEGIN_DEFAULT_MAPPINGS
--   { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
--   { key = "<C-e>",                          action = "edit_in_place" },
--   { key = "O",                              action = "edit_no_picker" },
--   { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
--   { key = "<C-v>",                          action = "vsplit" },
--   { key = "<C-x>",                          action = "split" },
--   { key = "<C-t>",                          action = "tabnew" },
--   { key = "<",                              action = "prev_sibling" },
--   { key = ">",                              action = "next_sibling" },
--   { key = "P",                              action = "parent_node" },
--   { key = "<BS>",                           action = "close_node" },
--   { key = "<Tab>",                          action = "preview" },
--   { key = "K",                              action = "first_sibling" },
--   { key = "J",                              action = "last_sibling" },
--   { key = "I",                              action = "toggle_git_ignored" },
--   { key = "H",                              action = "toggle_dotfiles" },
--   { key = "U",                              action = "toggle_custom" },
--   { key = "R",                              action = "refresh" },
--   { key = "a",                              action = "create" },
--   { key = "d",                              action = "remove" },
--   { key = "D",                              action = "trash" },
--   { key = "r",                              action = "rename" },
--   { key = "<C-r>",                          action = "full_rename" },
--   { key = "x",                              action = "cut" },
--   { key = "c",                              action = "copy" },
--   { key = "p",                              action = "paste" },
--   { key = "y",                              action = "copy_name" },
--   { key = "Y",                              action = "copy_path" },
--   { key = "gy",                             action = "copy_absolute_path" },
--   { key = "[e",                             action = "prev_diag_item" },
--   { key = "[c",                             action = "prev_git_item" },
--   { key = "]e",                             action = "next_diag_item" },
--   { key = "]c",                             action = "next_git_item" },
--   { key = "-",                              action = "dir_up" },
--   { key = "s",                              action = "system_open" },
--   { key = "f",                              action = "live_filter" },
--   { key = "F",                              action = "clear_live_filter" },
--   { key = "q",                              action = "close" },
--   { key = "W",                              action = "collapse_all" },
--   { key = "E",                              action = "expand_all" },
--   { key = "S",                              action = "search_node" },
--   { key = ".",                              action = "run_file_command" },
--   { key = "<C-k>",                          action = "toggle_file_info" },
--   { key = "g?",                             action = "toggle_help" },
--   { key = "m",                              action = "toggle_mark" },
--   { key = "bmv",                            action = "bulk_move" },
-- } -- END_DEFAULT_MAPPINGS
--
