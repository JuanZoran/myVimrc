local hop = require("hop")
local map = require('util').map
-- place this in one of your configuration file(s)
-- local directions = require('hop.hint').HintDirection
local opt = {
    silent = true,
}


-- ===================================== key binding ==========================
map(
    { "n", "v", "o" },
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

-- vim.keymap.set({"n" ,'v', 'o'}, "f", function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
-- end, { remap = true })
-- vim.keymap.set({"n" ,'v', 'o'}, "F", function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
-- end, { remap = true })
-- vim.keymap.set({"n" ,'v', 'o'}, "t", function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
-- end, { remap = true })
-- vim.keymap.set({"n" ,'v', 'o'}, "T", function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
-- end, { remap = true })

-- ============================ configuration ======================================
hop.setup {
    -- jump_on_sole_occurrences = true,
    -- hint_position =
    -- require 'hop.hint'.HintPosition.END,
    -- require 'hop.hint'.HintPosition.BEING

    -- hint_position = require 'hop.hint'.HintPosition.MIDDLE,
}
