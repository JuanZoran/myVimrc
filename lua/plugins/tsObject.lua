local function config()
	require("nvim-treesitter-textobjects").setup({
		mode = {
			enable = true,
			set_jumps = true,
		},
	})

	local goto_next = {}
	local goto_next_start = {}
	local goto_next_end = {}
	local goto_previous = {}
	local goto_previous_start = {}
	local goto_previous_end = {}

	local xo = { "x", "o" }
	local nxo = { "n", "x", "o" }
	local keymaps = {}
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

		-- SELECT:
		local select = require("nvim-treesitter-textobjects.select").select_textobject
		util.map_opt_with_desc({
			mode = xo,
			map = {
				["a" .. key] = function()
					select(outer, "textobjects")
				end,
				["h" .. key] = function()
					select(inner, "textobjects")
				end,
			},
		})
		-- goto_next[']' .. key]            = outer
		-- goto_next_start['][' .. key]     = outer
		-- goto_next_end[']]' .. key]       = outer
		-- goto_previous['[' .. key]        = outer
		-- goto_previous_start['[[' .. key] = outer
		-- goto_previous_end['[]' .. key]   = outer
	end
end


-- FIXME :
return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	enabled = false,
	branch = "main",
	config = config,
}
