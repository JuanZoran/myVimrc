local function init()
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = function()
			_G.dd = function(...)
				Snacks.debug.inspect(...)
			end
			_G.bt = function()
				Snacks.debug.backtrace()
			end

			-- Override print to use snacks for `:=` command
			if vim.fn.has("nvim-0.11") == 1 then
				vim._print = function(_, ...)
					dd(...)
				end
			else
				vim.print = _G.dd
			end

			Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader><leader>s")
			Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader><leader>r")
			Snacks.toggle.inlay_hints():map("<leader><leader>h")
			Snacks.toggle.diagnostics():map("<leader><leader>d")
			Snacks.toggle.dim():map("<leader><leader>D")
		end,
	})
end

return {
	"folke/snacks.nvim",
	lazy     = false,
	priority = 1000,
	opts = {
		bigfile   = { enabled = true },
		quickfile = { enabled = true },
		indent    = { enabled = true },
		notifier  = { enabled = true }, -- lightweight backend for vim.notify
		picker    = require("plugins.snack.picker"),
		dashboard = require("plugins.snack.dashboard"),
	},
	init = init,
}
