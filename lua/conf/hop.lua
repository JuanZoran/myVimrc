local hop = require("hop")
local M = require('util')
-- place this in one of your configuration file(s)
local directions = require('hop.hint').HintDirection
local opt = {
    silent = true,
}

-- ===================================== key binding ==========================
M.map(
    "",
    opt,
	{ "s", ":HopChar2MW<cr>" },
	-- {"S", ":HopChar2MW<cr>"},
	{ "ej", ":HopPatternBC<CR>" },
	{ "ee", "e" },
	{ "el", ":HopPatternAC<CR>" },
	{ "<Leader>l", ":HopWordAC<CR>" },
	{ "<Leader>i", ":HopVerticalBC<CR>" },
	{ "<Leader>k", ":HopVerticalAC<CR>" },
	{ "<Leader>j", ":HopWordBC<CR>" }
)


vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })
vim.keymap.set("", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, { remap = true })

-- ============================ configuration ======================================
hop.setup{}
