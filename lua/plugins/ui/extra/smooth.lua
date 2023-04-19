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


local function config()
    local api = vim.api
    local fn = vim.fn
    local specs = require 'specs'
    specs.setup {
        show_jumps = false,
        popup      = {
            delay_ms = 0,  -- delay before popup displays
            inc_ms   = 8,  -- time increments used for fade/resize effects
            blend    = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width    = 13,
            winhl    = 'Cursor',
            fader    = require 'specs'.linear_fader,
            resizer  = require 'specs'.slide_resizer,
        },
    }

    local show = specs.show_specs
    local feedkey = function(key, func)
        func = func or show
        return function()
            -- api.nvim_feedkeys(api.nvim_replace_termcodes(key, true, true, true), 'n', false)
            api.nvim_feedkeys(key, 'n', true)
            vim.defer_fn(func, 10)
        end
    end

    local nx = { 'n', 'x' }
    local long_jump = function()
        specs.show_specs {
            -- delay_ms = 10, -- delay before popup displays
            inc_ms  = 8,  -- time increments used for fade/resize effects
            blend   = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width   = 25,
            winhl   = 'Cursor',
            fader   = specs.linear_fader,
            resizer = specs.shrink_resizer,
        }
    end

    util.map {
        { 'H', feedkey 'I', mode = nx },
        { 'A', feedkey 'A', mode = nx },
        { 'cc', feedkey('cc', function()
            specs.show_specs {
                -- delay_ms = 10, -- delay before popup displays
                inc_ms  = 13, -- time increments used for fade/resize effects
                blend   = 0,  -- starting blend, between 0-100 (fully transparent), see :h winblend
                width   = 15,
                winhl   = 'Cursor',
                fader   = specs.empty_fader,
                resizer = specs.shrink_resizer,
            }
        end), },
        { 'G',  feedkey('G', long_jump),  mode = nx },
        { 'gg', feedkey('gg', long_jump), mode = nx },
        {
            mode = nx,
            'J',
            function()
                local col = (api.nvim_get_current_line()):find '%S'
                if col and col ~= vim.fn.col '.' then
                    api.nvim_feedkeys(vim.wo.wrap and 'g^' or '^', 'n', true)
                    vim.defer_fn(show, 10)
                end
            end,
        },
        {
            mode = nx,
            'L',
            function()
                local _cur = fn.col '.'
                local _end = fn.col '$' - 1
                if _end ~= 0 and _cur ~= _end then
                    api.nvim_feedkeys(vim.wo.wrap and 'g$' or '$', 'n', true)
                    vim.defer_fn(show, 10)
                end
            end,
        },
    }
end



return {
    'JuanZoran/specs.nvim',
    config = config,
    dependencies = {
        'gen740/SmoothCursor.nvim',
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
}
