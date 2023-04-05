local nxo = { 'n', 'x', 'o' }
util.map {
    { mode = nxo, 'i', 'gk' },
    { mode = nxo, 'k', 'gj' },
    { mode = nxo, 'j', 'h' },
    { mode = nxo, 'h', 'i' },
    { mode = nxo, 'I', '<C-u>zz' },
    { mode = nxo, 'K', '<C-d>zz' },
    { mode = 'o', 'L', 'g$' },
    { mode = 'o', 'J', 'g^' },
}

local function keys()
    local show = function() require 'specs'.show_specs() end
    local api = vim.api
    local fn = vim.fn
    local function feedkey(key)
        return function()
            -- api.nvim_feedkeys(api.nvim_replace_termcodes(key, true, true, true), 'n', false)
            api.nvim_feedkeys(key, 'n', false)
            vim.defer_fn(show, 10)
        end
    end
    local nx = { 'n', 'x' }
    return {
        { 'H',  feedkey 'I' },
        { 'A',  feedkey 'A' },
        { 'cc', feedkey 'cc' },
        { 'G',  feedkey 'G',  mode = nx },
        { 'gg', feedkey 'gg', mode = nx },
        {
            mode = nx,
            'J',
            function()
                local col = (api.nvim_get_current_line()):find '%S'
                if col ~= vim.fn.col '.' then feedkey(vim.wo.wrap and 'g^' or '^')() end
            end,
        },
        {
            mode = nx,
            'L',
            function()
                local _cur = fn.col '.'
                local _end = fn.col '$' - 1
                if _end ~= 0 and _cur ~= _end then feedkey(vim.wo.wrap and 'g$' or '$')() end
            end,
        },
    }
end

return {
    'JuanZoran/specs.nvim',
    keys = keys,
    opts = function()
        return {
           show_jumps      = false,
            popup           = {
                delay_ms = 0,  -- delay before popup displays
                inc_ms   = 8,  -- time increments used for fade/resize effects
                blend    = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
                width    = 13,
                winhl    = 'Cursor',
                fader    = require 'specs'.linear_fader,
                resizer  = require 'specs'.shrink_resizer,
            },
            ignore_buftypes = { nofile = true },
        }
    end,
    dependencies = {
        {
            'gen740/SmoothCursor.nvim',
            keys = {
                { 'I', '<C-u>zz' },
                { 'K', '<C-d>zz' },
            },
            opts = {
                autostart = true,
                speed = 30,               -- max is 100 to stick to your current position
                intervals = 30,           -- tick intervalI
                disable_float_win = true, -- disable on float window
                -- linehl = 'CursorLine',
                disabled_filetypes = {
                    'alpha',
                    'TelescopePrompt'
                },
                fancy = {
                    head = { cursor = '▷', texthl = 'SmoothCursor', linehl = nil },
                    enable = true,
                },
            },
        },
    },
}
