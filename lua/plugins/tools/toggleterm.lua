require('toggleterm').setup {
    open_mapping = [[<c-d>]],
    -- autochdir = false,
    direction = 'float', --[[ 'vertical' | 'horizontal' | 'tab' | 'float', ]]
    float_opts = {
        border = 'curved'
    }
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

vim.keymap.set({ 'n', 'i' }, '<C-g>', function()
    lazygit:toggle()
end)
