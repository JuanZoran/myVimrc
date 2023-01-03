-- TODO : config gitsigns
require("gitsigns").setup {
}

local set = require("util.map").set

set {
    mode = 'n',
    opt = {},
    map = {
        {'<leader>gi', '<Cmd>Gitsigns preview_hunk_inline<CR>'},
        {'<leader>gd', '<Cmd>Gitsigns diffthis<CR>'},
        {'<leader>gs', '<Cmd>Gitsigns show<CR>'},
        {'<leader>gr', '<Cmd>Gitsigns reset_buffer<CR>'},
    }
}
