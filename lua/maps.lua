local map = require("util").map
local vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = {
    silent = true,
}

vim.keymap.set(
    { "!", "v", "o" }, -- mode
    "<C-s>",
    "<Esc>",
    opt
)

map(
    "", -- global pattern
    opt,
    { "'", '"' },
    { "h", "i" },
    { "H", "I" }
)

---@format disable
map(
    "n", -- 正常模式
    opt, -- 选项
    -- NOTE:窗口相关
    {'w', '<cmd>WhichKey w<cr>'},
    { "wo",       ":vsp<CR>",  { desc = ' 左右分屏'         }},
    { "wu",       ":sp<CR>",   { desc = ' 上下分屏'         }},
    { "wj",       "<C-w>h",    { desc = ' 跳转到左边窗口'   }},
    { "wl",       "<C-w>l",    { desc = ' 跳转到右边窗口'   }},
    { "wk",       "<C-w>j",    { desc = ' 跳转到下方窗口'   }},
    { "wi",       "<C-w>k",    { desc = ' 跳转到上方窗口'   }},
    { "wn",       ":only<CR>", { desc = ' 关闭所有窗口'     }},
    { "w=",       "<C-w>=",    { desc = '屢恢复原来窗口尺寸' }},
    { "w<Down>",  "<C-w>J",    { desc = ' 窗口向下移动'     }},
    { "w<Up>",    "<C-w>K",    { desc = ' 窗口向上移动'     }},
    { "w<Left>",  "<C-w>H",    { desc = ' 窗口向左移动'     }},
    { "w<Right>", "<C-w>L",    { desc = ' 窗口向右移动'     }},

    -- NOTE: Bufferline
    {'b', '<cmd>WhichKey b<cr>'},
    { "b<left>", ":BufferLineMovePrev<CR>",     { desc = '[]Move Buffer to Left'      }},
    { "b<right>", ":BufferLineMoveNext<CR>",    { desc = '[]Move Buffer to Right'     }},
    -- TODO: config Bufferline
    { "<Leader>b", ":BufferLinePickClose<CR>" , { desc = '﫧 Pick a Buffer to delete' }},
    { "<C-j>", ":BufferLineCyclePrev<CR>"       },
    { "<C-l>", ":BufferLineCycleNext<CR>" },

    { "qd", "<cmd>bdelete!<CR>" },
    { "qw", "<cmd>close<CR>" },
    { "<C-Down>", "<C-w>-" },
    { "<C-Up>", "<C-w>+" },
    { "<C-Right>", "<C-w>>" },
    { "<C-Left>", "<C-w><" },
    { ";", "@" },
    { ";;", "q" },
    -- NOTE: Floaterm
    { "<Leader>tm", ":FloatermNew<CR>" },
    { "<Leader>gi", ":FloatermNew lazygit<CR>" },
    { "<Leader>ra", ":FloatermNew ranger<CR>" },
    { "<C-d>", ":FloatermToggle<CR>" },
    { "<C-t>", ":FloatermNew dooit<CR>" },
    { "<C-g>", ":FloatermNew lazygit<CR>" },
    { "<C-h>", "<cmd>FloatermHide<CR>" },
    { "<Leader>fd", "<cmd>FloatermKill<cr>" },

    { "<Leader>sa", ":SaveSession<CR>" },
    { "<Leader>sr", ":Autosession search<CR>" },
    { "<Leader>st", ":Telescope session-lens search_session<CR>" },
    { "<Leader>sd", ":Autosession delete<CR>" },


    { "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>" },
    -- for quick yank
    { "yw", "yiw" }, -- yank a word
    { "y<cr>", 'yi"' }, -- yank in ""
    { "y<space>", [[yi']] }, -- yank in ""
    { "yp", "yip" }, -- yank a Paragraph
    { "dw", "diw" },
    { "d<cr>", 'di"' }, -- delete ""
    { "dp", "dip" },
    { "d<space>", [[di']] }, -- yank in ""
    { "vw", "viw" },
    { "vp", "vip" },
    { "v<cr>", 'vi"' },
    { "v<space>", [[vi']] }, -- yank in ""
    { "cw", "ciw" },
    { "cp", "cip" },
    { "c<cr>", 'ci"' },
    { "c<space>", [[ci']] }, -- yank in ""

    -- 其他
    { "<C-a>", "/<++><CR>vf>c" }, -- PlaceHolder
    { "<Leader>w", ":wq<CR>" },
    { "<Leader>W", ":w<CR>" },
    { "<C-q>", ":q!<CR>" },
    { "na", "<c-a>" },
    { "nh", ":noh<CR>" },
    { "<Leader>p", ":PackerSync<CR>",  { desc = 'מּ [Sync/Install] Plugin'            }},
    { "<Leader>ck", ":set spell!<CR>", { desc = '暈Toggle vim builtin spell checker' }}
 	---------------------------
 	-- {"<++>", "<++>"},
 	-- {"<++>", "<++>"},
 	-- {"<++>", "<++>"},
 	-- {"<++>", "<++>"},
)
---@format enable


-- Insert mode
map(
    "i",
    opt,
    { "<C-f>", ":FloatermNew ranger<CR>", { desc = ' Ranger' } },
    { "<C-g>", "<Esc><cmd>FloatermNew lazygit<CR>" },
    { "<C-d>", "<Esc><cmd>FloatermToggle<CR>" },
    { "<C-a>", "<Esc>/<++><CR>vf>c" },
    -- {"<++>", "<++>"},
    -- 最近跳转的历史"<++>"},
    -- {"<+, "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    { "<C-a>", "<Esc>/<++><CR>vf>c" },
    { "<C-j>", "<Left>" },
    { "<C-l>", "<Right>" }
)

map(
    "c", -- command-line mode
    opt,
    { "<C-q>", "<Esc>" },
    { "<C-j>", "<Left>" },
    { "<C-l>", "<Right>" },
    { "<C-o>", "<cr>" }
)

map(
    "v",
    opt,
    { "<A-i>", ":move '<-2<CR>gv-gv" },
    { "<A-k>", ":move '>+1<CR>gv-gv" },
    { ">", ">gv" },
    { "<", "<gv" }
)

-- vim.keymap.set("n", "<Tab>", '<CMD>lua print([[ Tab is pressed ]])<CR>')
-- vim.keymap.set("n", "<C-i>", '<CMD>lua print([[ Ctr-i is pressed ]])<CR>')
-- 单独情况设置
vim.keymap.set("n", "tx", ":r !figlet ")



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
