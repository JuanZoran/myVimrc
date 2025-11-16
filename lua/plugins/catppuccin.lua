return {
	"catppuccin/nvim",
	name = "catppuccin",
	event = "VimEnter",
	opts = function()
		return {
			flavour = "mocha",
			transparent_background = true,
			custom_highlights = require("core.colors"),
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.3,
			},
			auto_integrations = true,
		}
	end,
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
