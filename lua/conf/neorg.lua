M = {}
function M.setup()
	require("neorg").setup({
		load = {
			["core.defaults"] = {},
			["core.norg.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.norg.dirman"] = {
				config = {
					workspaces = {
						work = "~/todos/work",
						home = "~/todos/home",
					},
					index = "index.norg", -- The name of the main (root) .norg file
				},
			},
			["core.integrations.treesitter"] = {},
			-- ["core.keybinds"] = {
			-- 	config = {
			-- 		default_keybinds = false,
			-- 	},
			-- },
		},
	})
	vim.notify("Hello Neorg!")
end
return M
