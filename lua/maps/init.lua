local set = require("util.map").set
vim.keymap.set(
    { "x", "o", "i" }, -- mode
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
        { "wo",       ":vsp<CR>",   ' Split Window'            },
        { "wj",       "<C-w>h",     ' Jump Left'               },
        { "wl",       "<C-w>l",     ' Jump Right'              },
        { "wk",       "<C-w>j",     ' Jump Down'               },
        { "wi",       "<C-w>k",     ' Jump Up'                 },
        { "wn",       ":only<CR>",  ' Close Another Window'    },
        { "w=",       "<C-w>=",     '屢Resize Window'           },
        { "w<Down>",  "<C-w>J",     ' Move Down'               },
        { "w<Up>",    "<C-w>K",     ' Move Up'                 },
        { "w<Left>",  "<C-w>H",     ' Move Left'               },
        { "w<Right>", "<C-w>L",     ' Move Right'              },
        { "wu",       ":sp<CR>",    ' Split Window Vertically' },

    -- INFO : command
        { "wd",        ":close<CR>",        ' Close Current Window' },
        { "<Leader>w", ":w<CR>",            ' Save Current Window'  },
        { "<Leader><leader>w", ":wqa<CR>" , ' close all window'     },
        { "qw",        ":close<CR>"    },
        { "qd",        ":bdelete!<CR>" },
        { "<S-CR>",   "J",  },
    -- INFO : Bufferline
        { "<leader>b<left>",   ":BufferLineMovePrev<CR>",   '[]Move Buffer to Left'      },
        { "<leader>b<right>",  ":BufferLineMoveNext<CR>",   '[]Move Buffer to Right'     },
        { "<Leader>bb", ":BufferLinePickClose<CR>" , '﫧 Pick a Buffer to delete' },

        { "<C-j>", ":BufferLineCyclePrev<CR>" },
        { "<C-l>", ":BufferLineCycleNext<CR>" },

        -- 其他
        { "<C-q>", '<Cmd>q!<CR>'}, -- smart quit
        { "<Leader>p", ":PackerSync<CR>",  '痢[Sync | Install] Plugin'          },
        { "<Leader>ck", ":set spell!<CR>", '暈Toggle vim builtin spell checker' },
        -- { "na",        "<c-a>"         },
        -- { "nh",        ":noh<CR>"      },
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

-- 单独情况设置
vim.keymap.set("n", "tx", ":r !figlet ")
vim.keymap.set("x", "<C-c>", '"+y')
vim.keymap.set("x", "<C-v>", '"+y')

-- vim.keymap.set("n", "<Tab>", function ()
--     print('tab')
-- end)
-- vim.keymap.set("i", "<C-i>", function ()
--     print('<C-i>')
-- end)
-- vim.keymap.set("n", "<CR>", '/<++><CR>vf>c', {silent = true})


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
