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

			-- Toggle terminal with C-t (floating window)
			-- Pass nil as cmd to use default shell, but override position to float
			-- Use fixed count to ensure same terminal instance for toggle
			-- Set in both normal and terminal modes to override shell bindings
			local toggle_terminal = function()
				Snacks.terminal(nil, {
					count = 1, -- Fixed count to ensure same terminal instance
					win = {
						position = "float",
						width = 0.8,
						height = 0.8,
						border = "rounded",
					},
					interactive = true, -- Keep terminal open
				})
			end
			vim.keymap.set("n", "<C-t>", toggle_terminal, { desc = "Toggle Terminal" })
			vim.keymap.set("t", "<C-t>", function()
				-- Send C-\ to exit terminal mode, then toggle
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
				vim.schedule(toggle_terminal)
			end, { desc = "Toggle Terminal", silent = true})-- -- -- -- -- -- -- -- -- 
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
		terminal  = {
			win = {
				position = "float",
				width = 0.8,
				height = 0.8,
				border = "rounded",
			},
		},
	},
	init = init,
}
