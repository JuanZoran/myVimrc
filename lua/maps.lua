local vim = vim
local function keymap(...) -- for better keymap-binding alias
    local maps = { ... }
    local mode = maps[1]
    local option = maps[2]
    for k, v in ipairs(maps) do
        if (k > 2) then
            vim.keymap.set(mode, v[1], v[2], option)
        end
    end
end

vim.g.mapleader = " "
local nopt = {
    silent = true
}
-- 插入模式的选项
local iopt = {
    silent = true
}

-- 选中模式的选项

----Telescope
local builtin = require('telescope.builtin')
keymap(
    "n",
    nopt,
    { "<C-f>", builtin.find_files },
    -- { "<Leader>ff", function() -- with no previewer
    --     require 'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
    -- end },
    -- { "<leader>fb", builtin.buffers },
    { "<leader>rg", builtin.registers },
    { "<leader>fh", builtin.help_tags },
    { "<leader>ft", builtin.live_grep },
    { "<leader>sp", builtin.spell_suggest},
    { "<leader>lt", builtin.treesitter},
    { "<leader>le", builtin.diagnostics },
    { "<leader>fa", builtin.current_buffer_fuzzy_find},
    -- { "<leader>fa", grep_string},
    { "<leader>fp", "<cmd>Telescope packer<cr>" },
    { "<leader>cd", "<cmd>Telescope zoxide list<cr>" },
    { "<leader>fh", "<cmd>Telescope harpoon marks<cr>" },
    { "<leader>sn", "<cmd>Telescope luasnip<cr>" },
    { "<C-e>", builtin.commands},
    { "<C-u>", builtin.oldfiles},
    { "<C-h>", builtin.registers},
    { "<C-i>", builtin.jumplist},
    { "<C-_>", builtin.keymaps}, -- for C-/
    { '<C-p>', function() -- 打开项目
        require 'telescope'.extensions.project.project {}
    end }
)



keymap(
    "n",
    nopt,
    { "<Leader>hk", function()
            require("harpoon.ui").toggle_quick_menu()
        end },
    { "<Leader>hi", function()
            require("harpoon.mark").add_file()
        end },
    { "<Leader>hj", function()
            require("harpoon.ui").nav_next()
        end },
    { "<Leader>hl", function()
            require("harpoon.ui").nav_last()
        end },
    { "<Leader>hh", function()
            require('harpoon.cmd-ui').toggle_quick_menu() 
        end }
)


local vopt = {
    silent = true
}

-- 't'	mapmode-t	Terminal	:tmap

vim.keymap.set(
    { '!', 'v', 'o' }, -- mode
    "<C-s>",
    "<Esc>",
    nopt
)
keymap(
    "", -- global pattern
    nopt,
    { "'", "\"" },
    -- 光标移动
    { "i", "k" },
    { "k", "j" },
    { "j", "h" },

    { "L", "$" },
    { "J", "0" },
    -- 输入
    { "h", "i" },
    { "H", "I" },
    -- { "K", ":lua vim.notify('fuck you nvim')<CR>" },
    { "<Leader>=", "<Plug>(EasyAlign)" },
    -- { "<Leader>cc", ":CommentToggle<CR>" },

    { "nr", "<Plug>SnipClose" },
    { "<Leader>R", "<Plug>SnipRun" }
)

keymap(
    "n", -- 正常模式
    nopt, -- 选项
    -- 光标移动, has done by plugin : neoscorll
    --    {"I", "<C-u>"},
    --    {"K", "<C-d>"},

    -- 窗口相关
    { "wo", ":vsp<CR>" }, -- 左右分屏
    { "wu", ":sp<CR>" }, -- 上下分屏
    { "wj", "<C-w>h" },
    { "wl", "<C-w>l" },
    { "wk", "<C-w>j" },
    { "wi", "<C-w>k" },
    { "w-", "<C-w>-" },
    { "w=", "<C-w>+" },
    { "wn", ":only<CR>" },
    { "ww", "<cmd>NvimTreeToggle<CR>" },

    { "<C-t>", ":FloatermNew<CR>" },
    { "<Leader>ra", ":FloatermNew ranger<CR>" },
    { "<C-d>", ":FloatermToggle<CR>" },
    -- TODO: config Bufferline
    { "<C-j>", ":BufferLineCyclePrev<CR>" },
    { "<Leader>d", ":BufferLinePickClose<CR>" },
    { "<C-l>", ":BufferLineCycleNext<CR>" },

    { "==", function()
        vim.lsp.buf.format({asyn = true})
    end },
    { "<Leader>rn", "<cmd>Lspsaga rename<CR>"},
    { "<Leader>ca", "<cmd>Lspsaga code_action<CR>"},
    { "<Leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>"},
    { "<Leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>"},
    { "<Leader>o", "<cmd>LSoutlineToggle<CR>"},
    --- code referecnce
    -- { "gh", function() 
    --     vim.lsp.buf.hover()
    -- end },
    { "gh", "<cmd>Lspsaga hover_doc<cr>"},
    { "gf", "<cmd>Lspsaga lsp_finder<cr>"},
    { "gd", "<cmd>Lspsaga peek_definition<cr>"},
    -- { "gd", function() 
    --     vim.lsp.buf.definition()
    -- end },
    { "gD", function() 
        vim.lsp.buf.declaration()
    end },
    { "gi", function() 
        vim.lsp.buf.implementation()
    end },
    -- { "gf", function() 
    --     vim.lsp.buf.implementation()
    -- end },
    { "gr", function() 
        vim.lsp.buf.references()
    end },

    -- for text diagnostic
    -- { "<Leader>ej", function()
    --     vim.diagnostic.goto_prev()
    -- end },
    { "<Leader>ej", "<cmd>Lspsaga diagnostic_jump_prev<cr>"},
    { "<Leader>el", "<cmd>Lspsaga diagnostic_jump_next<cr>"},
    -- { "<Leader>el", function()
    --     vim.diagnostic.goto_next()
    -- end },
    { "<Leader>ee", function()
        vim.diagnostic.open_float()
    end },

    ---------------------------
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- 其他
    -- { "nh", ":noh<CR>" },
    { "<C-a>", "/<++><CR>vf>c" }, -- PlaceHolder
    { "<C-w>", ":wq<CR>" },
    { "<C-q>", ":q!<CR>" },
    { "na", "<C-a>" },
    { "<Leader>a", "@" },
    { "<Leader>p", ":PackerSync<CR>" }, -- TODO :插件安装
    -- { "<Leader>w", ":w<CR>:source $MYVIMRC<CR>" }, --TODO
    { "<Leader>ck", ":set spell!<CR>" }
)

keymap(
    "i", -- 插入模式
    iopt,
    { "<C-f>", ":FloatermNew fanger<CR>" },
    --
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    { "<C-a>", "<Esc>/<++><CR>vf>c" }
)


keymap(
    "v", -- 插入模式
    vopt,
    --
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- Move text up and down
    { "<A-k>", ":move '>+1<CR>gv-gv" },
    { "<A-i>", ":move '<-2<CR>gv-gv" },
    { "p", '"_dP' }, --- 选中的东西粘贴后, 不替换当前的寄存器

    { "[", "<" },
    { "]", ">" }
)

keymap(-- for insert and command-Line mode
    "!",
    iopt,
    { "<C-j>", "<Left>" },
    { "<C-l>", "<Right>" }
)

-- 单独情况设置
vim.keymap.set("n", "tx", ":r !figlet ")
vim.keymap.set("n", ";", ":")
-- has been maped by neo-scroll plugin
-- vim.keymap.set("", "I", "<c-u>zz", { noremap = false })
-- vim.keymap.set("", "I", "<c-u>", { noremap = false })
-- vim.keymap.set("", "K", "<c-d>", { noremap = false })


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
