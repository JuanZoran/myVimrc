local set = require("util.map").set

set {
    mode = '',
    map = {
        { '<leader>j', '<Plug>(leap-backward-to)', '⬅️ quick jump backward' },
        { '<leader><leader>l', '<Plug>(leap-cross-window)', '💪quick jump cross window' },
        { '<leader>l', '<Plug>(leap-forward-to)', '➡️ quick jump forward' },
    }
}


vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Linenr' })
vim.api.nvim_set_hl(0, 'LeapMatch', {
    fg = '#599eff',
    bold = true,
    nocombine = true,
})

vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
    -- fg = 'black',
    link = 'PmenuSel',
    bold = true,
    nocombine = true,
})

require('leap').opts.highlight_unlabeled_phase_one_targets = true

require('flit').setup {
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    -- A string like "nv", "nvo", "o", etc.
    labeled_modes = "v",
    multiline = true,
    -- Like `leap`s similar argument (call-specific overrides).
    -- E.g.: opts = { equivalence_classes = {} }
    opts = {}
}


-- {
--   ft = true,
--   inclusive_op = true,
--   opts = {
--     labels = {},
--     safe_labels = {},
--     special_keys = {
--       multi_accept = "<enter>",
--       multi_revert = "<backspace>",
--       next_group = "<space>",
--       next_phase_one_target = "<enter>",
--       next_target = { "<enter>", ";", "f" },
--       prev_group = "<tab>",
--       prev_target = { "<tab>", ",", "F" },
--       repeat_search = "<enter>"
--     }
--   },
--   targets = <function 1>
-- }

--- TODO : match multi target then select
-- local function align(target)
--     vim.pretty_print(target)
-- end

-- local function align(target)
--
-- end




-- local cmd = 'normal '
-- TODO figure out this
-- local function paranormal(targets)
--     ---@diagnostic disable-next-line: param-type-mismatch
--     local input = vim.fn.input(cmd)
--     if #input < 1 then
--         vim.notify('Operation Aborted')
--         return
--     end
--
--     for _, target in ipairs(targets) do
--         local line, col = unpack(target.pos)
--         vim.fn.cursor({ line, col })
--         vim.cmd(cmd .. input)
--     end
-- end
--
-- vim.keymap.set(
--     'n',
--     '<leader><leader>s',
--     function()
--         require('leap').leap {
--             target_windows = { vim.fn.win_getid() },
--             action = paranormal,
--             multiselect = true,
--         }
--     end,
--     { desc = '🔌Select targets to exec normal command' }
-- )
