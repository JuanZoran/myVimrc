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
        { "vp",       "vip"   },
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
        { "y<space>", [[yi']] },
        { "c<space>", [[ci']] },

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
            -- FIXME : not this first cols which has character
            -- local text = 
            local line = vim.fn.line('.')
            vim.fn.cursor(line, 1)
        end},
        {'<C-e>', function ()
            local line = vim.fn.line('.')
            local e = vim.fn.col('$')
            vim.fn.cursor(line, e)
        end},
        {'<C-b>', '<ESC>bi'},
        {'<C-f>', '<ESC>ea'},
        {'<C-n>', '<ESC>o'},
        {'<C-p>', '<ESC>O'},
    }
}
