require("keymaps/terminal")
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

------ Telescope
local builtin = require('telescope.builtin')
keymap(
    "n",
    nopt,
    -- { "<Leader>ff", builtin.find_files },
    { "<Leader>ff", function() -- with no previewer
        require 'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
    end },
    { "<leader>fg", builtin.live_grep },
    { "<leader>fb", builtin.buffers },
    { "<leader>fh", builtin.help_tags },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>" },
    { '<C-p>', function() -- 打开项目
        require 'telescope'.extensions.project.project {}
    end }
)


local vopt = {
    silent = true
}

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
    { "<Leader>=", "<Plug>(EasyAlign)" },
    { "<Leader>cc", ":CommentToggle<CR>" },

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

    { "<C-f>", ":FloatermNew ranger<CR>" },
    -- TODO: config Bufferline
    { "<C-j>", ":BufferLineCyclePrev<CR>" },
    { "<C-l>", ":BufferLineCycleNext<CR>" },

    { "==", function()
        vim.lsp.buf.format({asyn = true})
    end },
    { "<Leader>rn", function()
        vim.lsp.buf.rename()
    end },
    --- code referecnce
    { "gh", function() -- change name [the r used]
        vim.lsp.buf.hover()
    end },
    { "gd", function() -- change name [the r used]
        vim.lsp.buf.definition()
    end },
    { "gD", function() -- change name [the r used]
        vim.lsp.buf.declaration()
    end },
    { "gi", function() -- change name [the r used]
        vim.lsp.buf.implementation()
    end },
    { "gr", function() -- change name [the r used]
        vim.lsp.buf.references()
    end },

    -- for text diagnostic
    { "<Leader>ej", function()
        vim.diagnostic.goto_prev()
    end },
    { "<Leader>el", function()
        vim.diagnostic.goto_next()
    end },
    { "<Leader>ee", function()
        vim.diagnostic.open_float()
    end },

    ---------------------------
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
    -- 其他
    { "nh", ":noh<CR>" },
    { "<C-a>", "/<++><CR>vf>c" }, -- PlaceHolder
    { "<C-w>", ":wq<CR>" },
    { "<C-q>", ":q!<CR>" },
    { "na", "<C-a>" },
    { "<Leader>a", "@" },
    { "<Leader>p", ":PackerSync<CR>" }, -- TODO :插件安装
    { "<Leader>w", "<++>" }, --TODO
    { "<Leader>ck", ":set spell!<CR>" }
)

keymap(
    "i", -- 插入模式
    iopt,
    -- {"<C-i>", "<Up>"},
    { "<C-f>", ":FloatermNew ranger<CR>" },
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
vim.keymap.set("", "I", "<c-u>", { noremap = false })
vim.keymap.set("", "K", "<c-d>", { noremap = false })
