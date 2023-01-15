local set = require("util.map").set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

---@format disable
set {
    mode = 'n',
    -- opt = opt,
    map = {
    -- INFO: tips
        -- INFO  in paragraph
        { "yp",       "yip"   },
        { "dp",       "dip"   },
        -- { "vp",       "vip"   },
        { "cp",       "cip"   },
        -- INFO  in word
        { "yw",       "yiw"   },
        { "dw",       "diw"   },
        { "vw",       "viw"   },
        { "cw",       "ciw"   },
        -- INFO  in ""
        { "d<cr>",    'di"'   },
        { "y<cr>",    'yi"'   },
        { "v<cr>",    'vi"'   },
        { "c<cr>",    'ci"'   },
        -- INFO  in ''
        { "y;", [[yi']] },
        { "c;", [[ci']] },
        { "d;", [[di']] },
        { "v;", [[vi']] },

        -- INFO: resize
        { "<C-Down>",  "<C-w>-" },
        { "<C-Up>",    "<C-w>+" },
        { "<C-Right>", "<C-w>>" },
        { "<C-Left>",  "<C-w><" },

        { "<leader>a", "@" , 'macro' },
        -- { ";", "@" },
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
        { "<A-i>", ":m '<-2<CR>gv" },
        { "<A-k>", ":m '>+1<CR>gv" },
        { ">", ">gv" },
        { "<", "<gv" },
        { "p", [["_dP]] },
    }
}

-- Emacs-like
set {
    mode = 'i',
    map = {
        {'<C-a>', function ()
---@diagnostic disable-next-line: param-type-mismatch, undefined-field
            local s = (vim.fn.getline('.')):find('%S')
            vim.fn.cursor{vim.fn.line('.'), s or 0}
        end},
        {'<C-e>', function ()
            vim.fn.cursor{vim.fn.line('.'), vim.fn.col('$')}
        end},
        {'<C-b>', '<ESC>bi'},
        {'<C-f>', '<ESC>ea'},
        {'<C-n>', '<ESC>o'},
        {'<C-p>', '<ESC>O'},
    }
}
