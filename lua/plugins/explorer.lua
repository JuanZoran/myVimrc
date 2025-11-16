local opts = {
	window = {
		position = "float", -- left, right, top, bottom, float, current
		width = 40, -- applies to left and right positions
		height = 15, -- applies to top and bottom positions
		auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
		popup = {
			-- settings that apply to float position only
			size = {
				height = "80%",
				width = "50%",
			},
			position = "50%", -- 50% means center it
			-- you can also specify border here, if you want a different setting from
			-- the global popup_border_style.
		},

		mappings = {
			["i"] = "none",
			["<space>"] = "none",
			["<cr>"] = "open",
			["o"] = "open",
			["<esc>"] = "revert_preview",
			["P"] = { "toggle_preview", config = { use_float = true } },
			["l"] = "focus_preview",
			["O"] = "open_split",
			["S"] = "split_with_window_picker",
			["U"] = "open_vsplit",
			["s"] = "vsplit_with_window_picker",
			["t"] = "open_tabnew",
			["w"] = "open_with_window_picker",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["Z"] = "expand_all_nodes",
			["R"] = "refresh",
			["a"] = { "add", config = { show_path = "none" } },
			["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
			["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
			["e"] = "toggle_auto_expand_width",
			["q"] = "close_window",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
		},
	},
}

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	keys = {
		{ "<C-w><C-w>", "<Cmd>Neotree toggle<CR>", desc = "📁Toggle File Explorer" },
		{ "<C-w>b", "<Cmd>Neotree buffers<CR>", desc = "📁Neo-tree Buffers" },
		{ "<C-w>g", "<Cmd>Neotree git_status<CR>", desc = "📁Neo-tree Git Status" },
		{ "<C-w>f", "<Cmd>Neotree dir=~<CR>", desc = "📁File Explorer from HOME" },
		{
			"<C-w>d",
			"<Cmd>Neotree reveal_force_cwd dir=%:h toggle<CR>",
			desc = "📁Toggle File Explorer in buffer dir",
		},
	},
	lazy = false, -- neo-tree will lazily load itself
    opts = opts,
}
