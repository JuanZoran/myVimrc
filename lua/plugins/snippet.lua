local function config()
	local types = require("luasnip.util.types")

	require("luasnip").setup({
		region_check_events = { "CUrsorMoved", "CursorHold", "InsertEnter" },
		delete_check_events = { "TextChanged", "InsertEnter" },
		store_selection_keys = "<C-e>",
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "<- Choice", "character" } }, -- yellow
				},
			},
			[types.insertNode] = {
				active = {
					virt_text = { { "<- Insert", "MoreMsg" } }, -- purple
				},
			},
		},
		-- snip_env = require("snippet_lua"),
	})
end

return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
    lazy = true,
	config = config,
}
