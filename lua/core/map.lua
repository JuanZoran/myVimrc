local function set(map)
    local s = vim.keymap.set
    local opt = { silent = true }
    for _, v in ipairs(map.map) do
        opt.desc = v[3]
        s(map.mode, v[1], v[2], opt)
    end
end

set {
    mode = 'n',
    map = {
        { 'U',                 'Vp', },
        -- INFO : command
        { "<Leader>w",         ":w<CR>",          ' Save Current Window' },
        { "<Leader><leader>w", ":wqa<CR>",        ' close all window' },
        { "qw",                ":close<CR>" },
        { "qd",                ":bdelete!<CR>" },
        { "<S-CR>",            "J", },
        { "<C-q>",             '<Cmd>q!<CR>' },
        { "<Leader>p",         "<Cmd>Lazy<CR>",   '痢[Sync | Install] Plugin' },
        { "<Leader>ck",        ":set spell!<CR>", '暈Toggle vim builtin spell checker' },

        { "yp",                "yip" },
        { "dp",                "dip" },
        -- { "vp",       "vip"   },
        { "cp",                "cip" },
        -- INFO  in word
        { "yw",                "yiw" },
        { "dw",                "diw" },
        { "vw",                "viw" },
        { "cw",                "ciw" },
        -- INFO  in ""
        { "d<cr>",             'di"' },
        { "y<cr>",             'yi"' },
        { "v<cr>",             'vi"' },
        { "c<cr>",             'ci"' },
        -- INFO  in ''
        { "y;",                [[yi']] },
        { "c;",                [[ci']] },
        { "d;",                [[di']] },
        { "v;",                [[vi']] },

        { "Z",                 'zf' },
        { "<leader>a",         "@",               'macro' },
        { "<C-CR>",            "/<++><CR>vf>c" },
        { "<C-w>o",            ":vsp<CR>",        ' Split Window' },
        { "<C-w>u",            ":sp<CR>",         ' Split Window Vertically' },
        { "<C-w>n",            ":only<CR>",       ' Close Another Window' },
    }
}

set {
    mode = { 'n', 't' },
    map = {
        { "<C-w>j", "<Cmd>wincmd h<Cr>", ' Jump Left' },
        { "<C-w>l", "<Cmd>wincmd l<Cr>", ' Jump Right' },
        { "<C-w>k", "<Cmd>wincmd j<Cr>", ' Jump Down' },
        { "<C-w>i", "<Cmd>wincmd k<Cr>", ' Jump Up' },
        -- INFO: resize
        { "<C-Down>",     "<Cmd>wincmd -<CR>" },
        { "<C-Up>",       "<Cmd>wincmd +<CR>" },
        { "<C-Right>",    "<Cmd>wincmd ><CR>" },
        { "<C-Left>",     "<Cmd>wincmd <<CR>" },

        { "<C-w><Down>",  "<Cmd>wincmd J<CR>", ' Move Down' },
        { "<C-w><Up>",    "<Cmd>wincmd K<CR>", ' Move Up' },
        { "<C-w><Left>",  "<Cmd>wincmd H<CR>", ' Move Left' },
        { "<C-w><Right>", "<Cmd>wincmd L<CR>", ' Move Right' },
        { "<C-w>=",       "<Cmd>wincmd =<CR>", '屢Resize Window' },
    }
}


set {
    mode = 'i',
    map = {
        { "<C-CR>", "<Esc>/<++><CR>vf>c" },
        { "<C-j>",  "<Left>" },
        { "<C-l>",  "<Right>" },
        { '<C-b>',  '<ESC>bi' },
        { '<C-f>',  '<ESC>ea' },
        { '<C-a>', function()
            ---@diagnostic disable-next-line: param-type-mismatch, undefined-field
            local s = (vim.api.nvim_get_current_line()):find('%S')
            vim.fn.cursor { vim.fn.line('.'), s or 0 }
        end },
        { '<C-e>', function()
            vim.fn.cursor { vim.fn.line('.'), vim.fn.col('$') }
        end },
        { '<C-v>', '"+p' }
    }
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
}


-- set {
--     mode = 'c',
--     map = {
--         { "<C-j>",  "<Left>" },
--         { "<C-l>",  "<Right>" },
--     }
-- }

set {
    mode = "x",
    map = {
        { "<A-i>", ":m '<-2<CR>gv=gv" },
        { "<A-k>", ":m '>+1<CR>gv=gv" },
        { ">",     ">gv" },
        { "<",     "<gv" },
        { "<C-c>", [["+y]] },
        { "p",     [["_dP]] },
        { "za",    "zf" },
    },
}


vim.keymap.set({ "x", "o", "i", "c" }, "<C-s>", "<Esc>")
