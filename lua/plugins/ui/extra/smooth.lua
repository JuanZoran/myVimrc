local nxo = { 'n', 'x', 'o' }
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
    return {
        { 'H',  feedkey 'I' },
        { 'A',  feedkey 'A' },
        { 'cc', feedkey 'cc' },
        { 'G',  feedkey 'G',  mode = { 'n', 'x' } },
        { 'gg', feedkey 'gg', mode = { 'n', 'x' } },
        {
            mode = { 'n', 'x' },
            'J',
            function()
                local col = (api.nvim_get_current_line()):find '%S'
                if col ~= vim.fn.col '.' then feedkey(vim.wo.wrap and 'g^' or '^')() end
            end,
        },
        {
            mode = { 'n', 'x' },
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
            show_jumps = false,
            popup      = {
                delay_ms = 0,  -- delay before popup displays
                inc_ms   = 8,  -- time increments used for fade/resize effects
                blend    = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
                width    = 13,
                winhl    = 'Cursor',
                fader    = require 'specs'.linear_fader,
                resizer  = require 'specs'.shrink_resizer,
            },
            -- ignore_buftypes = { nofile = true },
        }
    end,
    dependencies = {
        'declancm/cinnamon.nvim',
        opts = {
            default_keymaps = false,  -- Create default keymaps.
            extra_keymaps = false,
            override_keymaps = false, -- whether to force mapping
            hide_cursor = true,
            default_delay = 4,        -- The default delay (in ms) between each line when scrolling.
        },
        keys = {
            { 'I', "<Cmd>lua Scroll('<C-u>', 1, 0, 3)<CR><Cmd>lua require('specs').show_specs()<CR>", mode = { 'n', 'x' } },
            { 'K', "<Cmd>lua Scroll('<C-d>', 1, 0, 3)<CR><Cmd>lua require('specs').show_specs()<CR>", mode = { 'n', 'x' } },
        },
    },
}
