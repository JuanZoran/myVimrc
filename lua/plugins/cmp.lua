local keymap = {
	preset = "none",
	["<C-p>"] = { "select_prev", "fallback" },
	["<C-n>"] = { "select_next", "fallback" },
	["<C-k>"] = { "select_next", "fallback" },
	["<C-o>"] = { "accept", "fallback" },
	["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

	["<C-e>"] = { "snippet_forward", "fallback" },
	["<C-b>"] = { "snippet_backward", "fallback" },

	["<C-u>"] = { "scroll_documentation_up", "fallback" },
	["<C-d>"] = { "scroll_documentation_down", "fallback" },
	["<C-c>"] = { "hide", "fallback" },
}

local opts = {
	keymap = keymap,
	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
		completion = { menu = { auto_show = true } },
	},

	snippets = { preset = "luasnip" },
	completion = {
		documentation = {
			auto_show = true,
			window = {
				border = "rounded",
			},
		},
		menu = {
			border = "rounded",
			winhighlight = "CursorLine:PmenuSel",
		},
	},
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "Lazydev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
			-- supermaven = {
			-- 	name = "supermaven",
			-- 	module = "blink-cmp-supermaven",
			-- 	async = true,
			-- },
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
}

local ai = {
	"milanglacier/minuet-ai.nvim",
	opts = {
        provider = 'gemini',
		cmp = { enable_auto_complete = false },
		virtualtext = {
			auto_trigger_ft = { },
			keymap = {
				accept = "<A-a>",
			},
		},
	},
}

return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
	},
	opts = opts,
	event = {"InsertEnter", 'CmdlineEnter'},
}
