local function config()
	-- Main branch: setup textobjects plugin
	require("nvim-treesitter-textobjects").setup({
		select = {
			enable = true,
			lookahead = true,
		},
		move = {
			enable = true,
			set_jumps = true,
		},
	})

	-- Textobject descriptions for which-key
	local descriptions = {
		f = "function",
		c = "class",
		C = "comment",
		d = "conditional",
		l = "loop",
		r = "return",
		a = "parameter",
	}

	-- Set up keymaps directly (main branch way)
	for key, capture in pairs({
		f = "@function",
		c = "@class",
		C = "@comment",
		d = "@conditional",
		l = "@loop",
		r = "@return",
		a = "@parameter",
	}) do
		local outer = capture .. ".outer"
		local inner = capture .. ".inner"
		local desc = descriptions[key]

		-- Select outer textobject
		vim.keymap.set({ "x", "o" }, "a" .. key, function()
			require("nvim-treesitter-textobjects.select").select_textobject(outer, "textobjects")
		end, { desc = "Select outer " .. desc })

		-- Select inner textobject
		vim.keymap.set({ "x", "o" }, "h" .. key, function()
			require("nvim-treesitter-textobjects.select").select_textobject(inner, "textobjects")
		end, { desc = "Select inner " .. desc })
	end
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	branch = "main",
	config = config,
}
