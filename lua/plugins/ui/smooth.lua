require('cinnamon').setup {
    default_keymaps = false, -- Create default keymaps.
    extra_keymaps = false,
    override_keymaps = false, -- whether to force mapping
    -- max_length = 500,
    -- scroll_limit = 200,
}


-- local distance = 10
local specs = require('specs')
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
    ignore_filetypes = {},
    -- ignore_buftypes  = {
    --     nofile = true,
    -- },
}

-- require('smoothcursor').setup {
--     fancy = {
--         enable = true,
--     }
-- }

local show = specs.show_specs


local set = require('util').tmap
set {
    mode = "", -- be appended to other operator
    opt = nil,
    map = {
        { "J", "0" },
        { "L", "$" },
        { "k", "j" },
        { "i", "k" },
        { "j", "h" },
    }
}

-- DEFAULT_KEYMAPS:
-- Half-window movements:
-- vim.keymap.set({ 'n', 'x' }, 'I', function()
--     vim.defer_fn(show, 10)
--     -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>'), 'n', true)
--     -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-u>zz', true, false, true), 'n', false)
--     -- vim.
--     vim.cmd[[lua Scroll('<C-u>', 1, 1)]]
--     -- Scroll('<C-u>', 1, 1)
-- end)

-- vim.keymap.set({ 'n', 'x' }, 'K', function()
--     vim.defer_fn(show, 10)
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>zz', true, false, true), 'n', false)
--     -- vim.cmd[[lua Scroll('<C-d>', 1, 1)]]
-- end)


-- vim.keymap.set({ 'n', 'x' }, 'I', "<C-u>")
-- vim.keymap.set({ 'n', 'x' }, 'K', "<C-d>")

-- vim.keymap.set({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
-- vim.keymap.set({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

vim.keymap.set({ 'n', 'x' }, 'I', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR><Cmd>lua require('specs').show_specs()<CR>")
vim.keymap.set({ 'n', 'x' }, 'K', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR><Cmd>lua require('specs').show_specs()<CR>")

vim.keymap.set('n', 'n', function()
    Scroll('n', 1)
    show()
end)

vim.keymap.set('n', 'N', function()
    Scroll('N', 1)
    show()
end)


vim.keymap.set('n', 'A', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('A', 'n', false)
end)


vim.keymap.set('n', 'cc', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('cc', 'n', false)
end)

vim.keymap.set('n', 'H', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('I', 'n', false)
end)

-- EXTRA_KEYMAPS:
-- Start/end of file and line number movements:
-- vim.keymap.set({ 'n', 'x' }, 'gg', "<Cmd>lua Scroll('gg')<CR>")
-- vim.keymap.set({ 'n', 'x' }, 'G', "<Cmd>lua Scroll('G', 0, 1)<CR>")


vim.keymap.set({ 'n', 'x' }, 'G', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('G', 'n', false)

end)

-- vim.api.nvim_set_keymap('n', '<leader>v', ':lua require("specs").show_specs({width = 97, winhl = "Search", delay_ms = 610, inc_ms = 21})<CR>', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'x' }, 'gg', function()
    vim.defer_fn(show, 10)
    vim.api.nvim_feedkeys('gg', 'n', false)
end)


-- Start/end of line:
vim.keymap.set({ 'n', 'x' }, 'J', function()
    vim.api.nvim_feedkeys('0', 'n', false)
    if vim.fn.col('.') ~= 1 then
        vim.defer_fn(show, 10)
    end
end)

vim.keymap.set({ 'n', 'x' }, 'L', function()
    vim.api.nvim_feedkeys('$', 'n', false)
    if vim.fn.col('.') ~= vim.fn.col('$') - 1 then
        vim.defer_fn(show, 10)
    end
end)


-- Paragraph movements:
-- vim.keymap.set({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{')<CR>")
-- vim.keymap.set({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:

vim.api.nvim_create_autocmd('WinEnter', {
    callback = function()
        if vim.bo.filetype ~= 'specs' then
            show()
        end
    end
})

-- vim.keymap.set('n', '*', "<Cmd>lua Scroll('*', 1)<CR>")
-- vim.keymap.set('n', '#', "<Cmd>lua Scroll('#', 1)<CR>")
-- vim.keymap.set('n', 'g*', "<Cmd>lua Scroll('g*', 1)<CR>")
-- vim.keymap.set('n', 'g#', "<Cmd>lua Scroll('g#', 1)<CR>")
--
-- Previous/next cursor location:
-- vim.keymap.set('n', '<C-o>', "<Cmd>lua Scroll('<C-o>', 1)<CR>")


-- Screen scrolling:
-- vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
-- vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
-- vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
-- vim.keymap.set('n', 'z.', "<Cmd>lua Scroll('z.', 0, 1)<CR>")
-- vim.keymap.set('n', 'z<CR>', "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
-- vim.keymap.set('n', 'z-', "<Cmd>lua Scroll('z-', 0, 1)<CR>")
-- vim.keymap.set('n', 'z^', "<Cmd>lua Scroll('z^', 0, 1)<CR>")
-- vim.keymap.set('n', 'z+', "<Cmd>lua Scroll('z+', 0, 1)<CR>")
-- vim.keymap.set('n', '<C-y>', "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
-- vim.keymap.set('n', '<C-e>', "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

-- Horizontal screen scrolling:
-- vim.keymap.set('n', 'zH', "<Cmd>lua Scroll('zH')<CR>")
-- vim.keymap.set('n', 'zL', "<Cmd>lua Scroll('zL')<CR>")
-- vim.keymap.set('n', 'zs', "<Cmd>lua Scroll('zs')<CR>")
-- vim.keymap.set('n', 'ze', "<Cmd>lua Scroll('ze')<CR>")
-- vim.keymap.set('n', 'zh', "<Cmd>lua Scroll('zh', 0, 1)<CR>")
-- vim.keymap.set('n', 'zl', "<Cmd>lua Scroll('zl', 0, 1)<CR>")

-- EXTENDED_KEYMAPS:

-- Up/down movements:

-- -- SCROLL_WHEEL_KEYMAPS:

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
