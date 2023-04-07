local nxo = { 'n', 'x', 'o' }
local nx = { 'n', 'x' }
util.map {
    { mode = nxo, 'i', 'gk' },
    { mode = nxo, 'k', 'gj' },
    { mode = nxo, 'j', 'h' },
    { mode = nxo, 'h', 'i' },
    { mode = 'o', 'L', 'g$' },
    { mode = 'o', 'J', 'g^' },
    { mode = 'o', 'I', '<C-u>zz' },
    { mode = 'o', 'K', '<C-d>zz' },
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
            blend    = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width    = 13,
            winhl    = 'Cursor',
            fader    = require 'specs'.exp_fader,
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
        { 'H',  feedkey 'I' },
        { 'A',  feedkey 'A' },
        { 'cc', feedkey('cc', long_jump) },
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
    {
        'JuanZoran/specs.nvim',
        config = config,
    },
    {
        'declancm/cinnamon.nvim',
        opts = {
            default_keymaps = false, -- Create default keymaps.
            extra_keymaps = false,
            override_keymaps = false, -- whether to force mapping
            hide_cursor = true,
            default_delay = 4,    -- The default delay (in ms) between each line when scrolling.
        },
        keys = {
            { 'I', "<Cmd>lua Scroll('<C-u>', 1, 0)<CR><Cmd>lua require('specs').show_specs()<CR>", mode = nx },
            { 'K', "<Cmd>lua Scroll('<C-d>', 1, 0)<CR><Cmd>lua require('specs').show_specs()<CR>", mode = nx },
        },
    },
}
