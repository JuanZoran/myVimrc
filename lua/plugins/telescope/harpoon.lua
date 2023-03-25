require 'telescope'.load_extension 'harpoon'

local map = require 'util'.map
local ui = require 'harpoon.ui'
local cui = require 'harpoon.cmd-ui'

--- for harpoon keybindings
---@format disable
map(
    'n',
    { silent = true },
    { '<Leader>hh', ui.toggle_quick_menu, { desc = ' You recored file List' } },
    { '<Leader>hc', cui.toggle_quick_menu, { desc = ' Open Commands List' } },
    { '<Leader>hi', require 'harpoon.mark'.add_file, { desc = ' Add current file to list' } },
    { '<Leader>hj', ui.nav_prev, { desc = 'ﭢ Jump to next file on the list' } },
    { '<Leader>hl', ui.nav_next, { desc = 'ﭠ Jump to last file on the list' } },
    { '<leader>hm', '<cmd>Telescope harpoon marks<cr>', { desc = ' show all the marks by telescope' } }
)
---@format enable
