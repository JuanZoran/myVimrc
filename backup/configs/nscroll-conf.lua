require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', -- '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor          = true,     -- Hide cursor while scrolling
    stop_eof             = false,    -- Stop at <EOF> when scrolling downwards
    respect_scrolloff    = false,    -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true,     -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function      = nil,      -- Default easing function
    pre_hook             = nil,      -- Function to run before the scrolling animation starts
    post_hook            = nil,      -- Function to run after the scrolling animation ends
    performance_mode     = false,    -- Disable "Performance Mode" on all buffers.
})

local t = {}
t['I']     = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['K']     = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
t['<C-i>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<C-k>'] = {'scroll', { '0.10', 'false', '100'}}
-- t['<nop>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
-- t['<nop>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
-- t['zt']    = {'zt', {'250'}}
-- t['zz']    = {'zz', {'250'}}
-- t['zb']    = {'zb', {'250'}}
require("neoscroll.config").set_mappings(t)
