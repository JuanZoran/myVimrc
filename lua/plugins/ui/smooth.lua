local specs = require 'specs'
local show = specs.show_specs

specs.setup {
    show_jumps      = false,
    min_jump        = 30,
    popup           = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10,  -- time increments used for fade/resize effects
        blend = 85,   -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 10,
        winhl = 'Cursor',
        fader = require 'specs'.linear_fader,
        resizer = require 'specs'.shrink_resizer,
    },
    ignore_buftypes = {
        nofile = true,
    },
}

require 'cinnamon'.setup {
    default_keymaps = false,  -- Create default keymaps.
    extra_keymaps = false,
    override_keymaps = false, -- whether to force mapping
    hide_cursor = true,
    default_delay = 4,        -- The default delay (in ms) between each line when scrolling.
}

-- vim.keymap.set({ 'n', 'x' }, 'j', "<Cmd>lua Scroll('h', 0, 1)<CR>")
-- vim.keymap.set({ 'n', 'x' }, 'l', "<Cmd>lua Scroll('l', 0, 1)<CR>")

vim.keymap.set({ 'n', 'x' }, 'I', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR><Cmd>lua require('specs').show_specs()<CR>")
vim.keymap.set({ 'n', 'x' }, 'K', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR><Cmd>lua require('specs').show_specs()<CR>")

-- require('smoothcursor').setup {
--     autostart = true,
--     speed = 50,                   -- max is 100 to stick to your current position
--     intervals = 30,               -- tick intervalI
--     disable_float_win = true,     -- disable on float window
--     linehl = 'CursorLine',
--     disabled_filetypes = {
--         'alpha',
--         'TelescopePrompt'
--     },
--     fancy = {
--         head = { cursor = "▷", texthl = "SmoothCursor", linehl = 'CursorLine' },
--         enable = false
--     },
-- }


local set = require 'util.map'.set
set {
    mode = { 'n', 'x', 'o' }, -- be appended to other operator
    map = {
        { 'i', 'gk' },        -- for better move (warp)
        { 'k', 'gj' },

        { 'j', 'h' },
        { 'h', 'i' },
    },
}

set {
    mode = 'o',
    map = {
        { 'L', '$' },
        { 'J', '^' },
    },
}

local map = vim.keymap.set
local api = vim.api

local function feedkey(key)
    vim.defer_fn(show, 10)
    api.nvim_feedkeys(key, 'n', false)
end

map('n', 'H', function() feedkey 'I' end)
map('n', 'A', function() feedkey 'A' end)
map('n', 'cc', function() feedkey 'cc' end)
map({ 'n', 'x' }, 'G', function() feedkey 'G' end)
map({ 'n', 'x' }, 'gg', function() feedkey 'gg' end)

-- Start/end of line:
map({ 'n', 'x' }, 'J', function()
    local col = (api.nvim_get_current_line()):find '%S'
    if col ~= vim.fn.col '.' then feedkey 'g^' end
end)

map({ 'n', 'x' }, 'L', function()
    local _cur = vim.fn.col '.'
    local _end = vim.fn.col '$' - 1
    if _end ~= 0 and _cur ~= _end then feedkey 'g$' end
end)

api.nvim_create_autocmd('WinEnter', {
    callback = function()
        if vim.bo.filetype ~= 'specs' then show() end
    end,
})
