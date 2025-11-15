local keymap = {
	preset = "none",
	["<C-p>"] = { "select_prev", "fallback" },
	["<C-n>"] = { "select_next", "fallback" },
	["<C-k>"] = { "select_next", "fallback" },
	["<C-o>"] = { "accept", "fallback" },
	["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

	["<C-e>"] = { "snippet_forward", "fallback" },
	["<C-b>"] = { "snippet_backward", "fallback" },
	-- ["<CR>"] = { "accept", "fallback" },
}



local opts = {
	keymap = keymap,
	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},
	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
		completion = { menu = { auto_show = true } },
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = { documentation = { auto_show = true } },
	snippets = { preset = "luasnip" },
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "Lazydev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
}

return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
	},
	opts = opts,
	event = "InsertEnter",
	-- opts_extend = { "sources.default" }
}
