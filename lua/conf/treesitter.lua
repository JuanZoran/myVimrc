vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
local ts = require("nvim-treesitter.configs")
ts.setup({
	auto_install = true,
	enable_installed = "cpp, python, go, lua, vim, markdown, bash",
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},
	-- for ts-rainbow plugins
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	indent = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	textobjects = require("conf.textobjects"),
    -- neorg = {
    --     enable = true,
    -- },
    matchup = {
        enable = true,
    },
})

require("nvim-treesitter.install").prefer_git = true
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--     group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--     callback = function()
--         vim.opt.foldmethod = 'expr'
--         vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
--     end
-- })
---ENDWORKAROUND
-- Highlight the @foo.bar capture group with the "Identifier" highlight group
-- vim.api.nvim_set_hl(0, "@foo.bar", { link = "Identifier" })
