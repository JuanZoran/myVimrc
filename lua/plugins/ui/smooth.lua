require('cinnamon').setup {
    default_keymaps = false, -- Create default keymaps.
    extra_keymaps = false,
    override_keymaps = false, -- whether to force mapping
    hide_cursor = true,
    -- max_length = 500,
    -- scroll_limit = 200,
}

-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
-- Use the "circular" easing function
-- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
-- t['<C-y>'] = {'scroll', {'-0.10', 'false', '100', nil}}
-- t['<C-e>'] = {'scroll', { '0.10', 'false', '100', nil}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
-- t['zt']    = {'zt', {'300'}}
-- t['zz']    = {'zz', {'300'}}
-- t['zb']    = {'zb', {'300'}}

-- local distance = 10
local specs = require('specs')
local show = specs.show_specs
specs.setup {
    show_jumps       = true,
    min_jump         = 30,
    popup            = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects
        blend = 85, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 10,
        winhl = "Visual",
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_buftypes  = {
        nofile = true,
    },
}

local set = require('util').tmap
set {
    mode = {'n', 'x', 'o'}, -- be appended to other operator
    opt = nil,
    map = {
        { "i", "k" },
        { "k", "j" },
        { "j", "h" },
        -- { "h", "i" },
        -- { "H", "I" },
    }
}

vim.keymap.set('n', 'H', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('I', 'n', false)
end)

vim.keymap.set('n', 'A', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('A', 'n', false)
end)

vim.keymap.set({ 'n', 'x' }, 'I', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR><Cmd>lua require('specs').show_specs()<CR>")
vim.keymap.set({ 'n', 'x' }, 'K', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR><Cmd>lua require('specs').show_specs()<CR>")


vim.keymap.set('n', 'cc', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('cc', 'n', false)
end)


vim.keymap.set({ 'n', 'x' }, 'G', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('G', 'n', false)

end)

vim.keymap.set({ 'n', 'x' }, 'gg', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('gg', 'n', false)
end)

-- Start/end of line:
vim.keymap.set({ 'n', 'x' }, 'J', function()
    if vim.fn.col('.') ~= 1 then
        vim.defer_fn(show, 10)
    end
    vim.fn.cursor { vim.fn.line('.'), 1 }
end)

vim.keymap.set({ 'n', 'x' }, 'L', function()
    if vim.fn.col('.') ~= vim.fn.col('$') - 1 then
        vim.defer_fn(show, 10)
    end
    vim.fn.cursor { vim.fn.line('.'), vim.fn.col('$') }
end)


vim.api.nvim_create_autocmd('WinEnter', {
    callback = function()
        if vim.bo.filetype ~= 'specs' then
            show()
        end
    end
})


-- LSP_KEYMAPS:
-- LSP go-to-definition:
-- vim.keymap.set('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")

-- LSP go-to-declaration:
-- vim.keymap.set('n', 'gD', "<Cmd>lua Scroll('declaration')<CR>")
-- require("smoothcursor").setup {
--     fancy = {
--         enable = true,
--     },
--     -- type = "exp",         -- define cursor movement calculate function, "default" or "exp" (exponential).
--     -- enabled_filetypes = {
--     --     'lua',
--     -- },
--     disabled_filetypes = {
--         'specs',
--     }
-- }
-- vim.keymap.set('n', 'n', function()
--     Scroll('n', 1)
--     show()
-- end)
--
-- vim.keymap.set('n', 'N', function()
--     Scroll('N', 1)
--     show()
-- end)
