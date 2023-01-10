local set = require("util.map").set
set {
    mode = '',
    map = {
        {'<leader>j', '<Plug>(leap-backward-to)', '⬅️ quick jump backward'},
        {'<leader><leader>l', '<Plug>(leap-cross-window)', '💪quick jump cross window'},
        {'<leader>l', '<Plug>(leap-forward-to)', '➡️ quick jump forward'},
    }
}


vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
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


local cmd = 'normal '
-- TODO figure out this
local function paranormal(targets)
    local input = vim.fn.input(cmd)
    if #input < 1 then
        vim.notify('Operation Aborted')
        return
    end
    local ns = vim.api.nvim_create_namespace("")
    -- Set an extmark as an anchor for each target, so that we can also execute
    -- commands that modify the positions of other targets (insert/change/delete).
    for _, target in ipairs(targets) do
        local line, col = unpack(target.pos)
        -- local id = vim.api.nvim_buf_set_extmark(0, ns, line - 1, col - 1, {})
        -- target.extmark_id = id

        -- Jump to each extmark (anchored to the "moving" targets), and execute the
        -- command sequence.
        -- local id = target.extmark_id
        -- local pos = vim.api.nvim_buf_get_extmark_by_id(0, ns, id, {})
        -- vim.fn.cursor(pos[1] + 1, pos[2] + 1)
        vim.fn.cursor(line, col)
        vim.cmd(cmd .. input)
    end


    -- Clean up the extmarks.
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

vim.keymap.set(
    'n',
    '<leader><leader>s',
    function()
        require('leap').leap {
            target_windows = { vim.fn.win_getid() },
            action = paranormal,
            multiselect = true,
        }
    end,
    { desc = '🔌Select targets to exec normal command' }
)

-- local function get_line_starts(winid)
--     local wininfo = vim.fn.getwininfo(winid)[1]
--     local cur_line = vim.fn.line('.')
--
--     -- Get targets.
--     local targets = {}
--     local lnum = wininfo.topline
--     while lnum <= wininfo.botline do
--         local fold_end = vim.fn.foldclosedend(lnum)
--         -- Skip folded ranges.
--         if fold_end ~= -1 then
--             lnum = fold_end + 1
--         else
--             if lnum ~= cur_line then table.insert(targets, { pos = { lnum, 1 } }) end
--             lnum = lnum + 1
--         end
--     end
--     -- Sort them by vertical screen distance from cursor.
--     local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
--     local function screen_rows_from_cur(t)
--         local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
--         return math.abs(cur_screen_row - t_screen_row)
--     end
--
--     table.sort(targets, function(t1, t2)
--         return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
--     end)
--
--     if #targets >= 1 then
--         return targets
--     end
-- end
--
-- -- Usage:
-- local function leap_to_line()
--     local winid = vim.api.nvim_get_current_win()
--     require('leap').leap {
--         target_windows = { winid },
--         targets = get_line_starts(winid),
--     }
-- end
--
-- vim.keymap.set(
--     'n',
--     '<leader><leader>i',
--     leap_to_line
-- )
