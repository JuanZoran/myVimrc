return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	keys = {
		{
			"<leader><leader>j",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({ search = { forward = false, wrap = false, multi_window = true } })
			end,
		},
		{
			"<leader><leader>l",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({ search = { forward = true, wrap = false, multi_window = true } })
			end,
		},
		{
			"<leader>j",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
			end,
		},
		{
			"<leader>l",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } })
			end,
		},
	},
	config = function(_, opts)
		require("flash").setup(opts)
		vim.api.nvim_set_hl(0, "FlashLabel", {
			bg = "#ff007c",
			fg = "#c8d3f5",
		})
		vim.api.nvim_set_hl(0, "FlashMatch", {
			bg = "#5377da",
			fg = "#b6c5f0",
		})
	end,
}
