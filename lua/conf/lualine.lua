local navic = require("nvim-navic")
require("lualine").setup({
	options = { theme = "everforest" },
	sections = {
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
			-- { require("auto-session-library").current_session_name },
		},
		lualine_x = {
			-- {
			-- 	require("noice").api.status.message.get_hl,
			-- 	cond = require("noice").api.status.message.has,
			-- },
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
				color = { fg = "#a7c080" },
			},
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "#a7c080" },
			},
			{
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
				color = { fg = "#a7c080" },
			},
		},
	},
})
