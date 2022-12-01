require("session-lens").setup({--[[your custom config--]]
	prompt_title = "历史片段",
	path_display = { "shorten" },
	theme_conf = require("telescope.themes").get_dropdown({}),
	previewer = true,
})
