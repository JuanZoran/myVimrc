local set = require("util.map").set

vim.keymap.set(
    { "v", "o", "i" }, -- mode
    "<C-s>",
    "<Esc>",
    { silent = true }
)

require("maps.basic")

---@format disable
set {
    mode = 'n',
    map = {
    -- INFO : about window
        {'w', '<cmd>WhichKey w<cr>'},
        { "wo",       ":vsp<CR>",       ' 左右分屏'         },
        { "wu",       ":sp<CR>",        ' 上下分屏'         },
        { "wj",       "<C-w>h",         ' 跳转到左边窗口'   },
        { "wl",       "<C-w>l",         ' 跳转到右边窗口'   },
        { "wk",       "<C-w>j",         ' 跳转到下方窗口'   },
        { "wi",       "<C-w>k",         ' 跳转到上方窗口'   },
        { "wn",       ":only<CR>",      ' 关闭所有窗口'     },
        { "w=",       "<C-w>=",         '屢恢复原来窗口尺寸' },
        { "w<Down>",  "<C-w>J",         ' 窗口向下移动'     },
        { "w<Up>",    "<C-w>K",         ' 窗口向上移动'     },
        { "w<Left>",  "<C-w>H",         ' 窗口向左移动'     },
        { "w<Right>", "<C-w>L",         ' 窗口向右移动'     },

    -- INFO : command
        { "wd",        ":close<CR>",    '[] 关闭当前窗口' },
        { "<Leader>w", ":w<CR>"                       },
        { "<Leader><leader>w", ":wqa<CR>" ,     '[] 保存关闭所有窗口'},
        { "qw",        ":close<CR>"                   },
        { "qd",        ":bdelete!<CR>"                },

        { "<S-CR>",   "J",  },
    -- INFO : Bufferline
        { "<leader>b<left>",   ":BufferLineMovePrev<CR>",   '[]Move Buffer to Left'      },
        { "<leader>b<right>",  ":BufferLineMoveNext<CR>",   '[]Move Buffer to Right'     },
        { "<Leader>bb", ":BufferLinePickClose<CR>" , '﫧 Pick a Buffer to delete' },

        { "<C-j>", ":BufferLineCyclePrev<CR>" },
        { "<C-l>", ":BufferLineCycleNext<CR>" },

        -- 其他
        { "<C-q>",     function () -- smart quit
            vim.cmd(vim.bo.modifiable and 'wq' or 'q') 
        end },
        { "<leader>q",     ":q!<CR>"       },
        { "na",        "<c-a>"         },
        -- { "nh",        ":noh<CR>"      },
        { "<Leader>p", ":PackerSync<CR>",  'מּ [Sync/Install] Plugin'            },
        { "<Leader>ck", ":set spell!<CR>", '暈Toggle vim builtin spell checker' }
        ---------------------------
        -- {"<++>", "<++>"},
        -- {"<++>", "<++>"},
    }
}

---@format enable

-- Insert mode
set{
    mode = 'i',
    map = {
        -- { "<C-f>", ":FloatermNew ranger<CR>", { desc = ' Ranger' } },
        -- { "<C-g>", "<Esc><cmd>FloatermNew lazygit<CR>" },
        -- { "<C-d>", "<Esc><cmd>FloatermToggle<CR>"      },
        -- { "<C-;>", "<Esc>/<++><CR>vf>c" },
        { "<C-CR>", "<Esc>/<++><CR>vf>c" },
        { "<C-j>", "<Left>" },
        { "<C-l>", "<Right>" },
    }
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
}

-- map(
--     "c", -- command-line mode
--     opt,
--     -- { "<C-q>", "<Esc>" },
--     -- { "<C-j>", "<Left>" },
--     -- { "<C-l>", "<Right>" },
--     { "<C-o>", "<cr>" }
-- )

-- 单独情况设置
vim.keymap.set("n", "tx", ":r !figlet ")
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-v>", '"+y')
vim.keymap.set("n", "<CR>", '/<++><CR>vf>c', {silent = true})



-- String value	Help page	Affected modes	Vimscript equivalent
-- '' (an empty string)	mapmode-nvo	Normal, Visual, Select, Operator-pending	:map
-- 'n'	mapmode-n	Normal	:nmap
-- 'v'	mapmode-v	Visual and Select	:vmap
-- 's'	mapmode-s	Select	:smap
-- 'x'	mapmode-x	Visual	:xmap
-- 'o'	mapmode-o	Operator-pending	:omap  意味着是否可以与其他键组合
-- '!'	mapmode-ic	Insert and Command-line	:map!
-- 'i'	mapmode-i	Insert	:imap
-- 'l'	mapmode-l	Insert, Command-line, Lang-Arg	:lmap
-- 'c'	mapmode-c	Command-line	:cmap
-- 't'	mapmode-t	Terminal	:tmap
