return {
	"stevearc/conform.nvim",
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	keys = {
		{
			"==",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},

	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Customize formatters
		formatters = {
			shfmt = {
				append_args = { "-i", "2" },
			},
		},
	},
}
