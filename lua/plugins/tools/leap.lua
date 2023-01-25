vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Linenr' })
vim.api.nvim_set_hl(0, 'LeapMatch', {
    fg = '#599eff',
    bold = true,
    nocombine = true,
})

vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
    link = 'PmenuSel',
    bold = true,
    nocombine = true,
})

require('leap').opts.highlight_unlabeled_phase_one_targets = true

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
