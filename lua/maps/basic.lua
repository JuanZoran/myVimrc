local set = require("util.map").set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

---@format disable
set {
    mode = 'n',
    -- opt = opt,
    map = {
    -- INFO: tips
        -- INFO: in paragraph
        { "yp",       "yip"   },
        { "dp",       "dip"   },
        { "vp",       "vip"   },
        { "cp",       "cip"   },
        -- INFO: in word
        { "yw",       "yiw"   },
        { "dw",       "diw"   },
        { "vw",       "viw"   },
        { "cw",       "ciw"   },
        -- INFO: in ""
        { "d<cr>",    'di"'   },
        { "y<cr>",    'yi"'   },
        { "v<cr>",    'vi"'   },
        { "c<cr>",    'ci"'   },
        -- INFO: in ''
        { "y<space>", [[yi']] },
        { "c<pace>", [[ci']] },

        -- INFO: resize
        { "<C-Down>",  "<C-w>-" },
        { "<C-Up>",    "<C-w>+" },
        { "<C-Right>", "<C-w>>" },
        { "<C-Left>",  "<C-w><" },

        { ";", "@" },
    }
}
set {
    mode = "",
    map = {
        { "h", "i" },
        { "H", "I" },
    }
}

set {
    mode = "v",
    map = {
        { "<A-i>", ":m .-2<CR>gv" },
        { "<A-k>", ":m .+2<CR>gv" },
        { ">", ">gv" },
        { "<", "<gv" },
    }
}

-- Emacs-like
set {
    mode = 'i',
    map = {
        {'<C-a>', '<ESC>I'},
        {'<C-e>', '<ESC>A'},
        {'<C-b>', '<ESC>ba'},
        {'<C-f>', '<ESC>ea'},
        {'<C-n>', '<ESC>o'},
        {'<C-p>', '<ESC>O'},
    }
}
