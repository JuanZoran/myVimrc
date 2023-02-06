local function set(map)
    local s = vim.keymap.set
    local opt = { silent = true }
    for _, v in ipairs(map.map) do
        opt.desc = v[3]
        s(map.mode, v[1], v[2], opt)
    end
end

if vim.g.neovide then
    set {
        mode = { 'n', 'x', 'o' }, -- be appended to other operator
        map = {
            { "i", "k" },
            { "k", "j" },
            { "j", "h" },
            { "h", "i" },
            { 'L', '$' },
            { 'J', '0' },
            { 'I', '<C-u>zz' },
            { 'K', '<C-d>zz' },
        }
    }
end

set {
    mode = 'n',
    map = {
        { 'U', 'Vp', },
        { "wo", ":vsp<CR>", ' Split Window' },
        { "wu", ":sp<CR>", ' Split Window Vertically' },
        { "wj", "<C-w>h", ' Jump Left' },
        { "wl", "<C-w>l", ' Jump Right' },
        { "wk", "<C-w>j", ' Jump Down' },
        { "wi", "<C-w>k", ' Jump Up' },
        { "wn", ":only<CR>", ' Close Another Window' },
        { "w=", "<C-w>=", '屢Resize Window' },
        { "w<Down>", "<C-w>J", ' Move Down' },
        { "w<Up>", "<C-w>K", ' Move Up' },
        { "w<Left>", "<C-w>H", ' Move Left' },
        { "w<Right>", "<C-w>L", ' Move Right' },
        { "wd", ":close<CR>", ' Close Current Window' },

        -- INFO : command
        { "<Leader>w", ":w<CR>", ' Save Current Window' },
        { "<Leader><leader>w", ":wqa<CR>", ' close all window' },
        { "qw", ":close<CR>" },
        { "qd", ":bdelete!<CR>" },
        { "<S-CR>", "J", },

        { "<leader>b<left>", ":BufferLineMovePrev<CR>", '[]Move Buffer to Left' },
        { "<leader>b<right>", ":BufferLineMoveNext<CR>", '[]Move Buffer to Right' },
        { "<Leader>bb", ":BufferLinePickClose<CR>", '﫧 Pick a Buffer to delete' },

        { "<C-j>", "<Cmd>BufferLineCyclePrev<CR>" },
        { "<C-l>", "<Cmd>BufferLineCycleNext<CR>" },

        { "<C-q>", '<Cmd>q!<CR>' },

        { "<Leader>p", "<Cmd>Lazy<CR>", '痢[Sync | Install] Plugin' },
        { "<Leader>ck", ":set spell!<CR>", '暈Toggle vim builtin spell checker' },

        { "yp", "yip" },
        { "dp", "dip" },
        -- { "vp",       "vip"   },
        { "cp", "cip" },
        -- INFO  in word
        { "yw", "yiw" },
        { "dw", "diw" },
        { "vw", "viw" },
        { "cw", "ciw" },
        -- INFO  in ""
        { "d<cr>", 'di"' },
        { "y<cr>", 'yi"' },
        { "v<cr>", 'vi"' },
        { "c<cr>", 'ci"' },
        -- INFO  in ''
        { "y;", [[yi']] },
        { "c;", [[ci']] },
        { "d;", [[di']] },
        { "v;", [[vi']] },

        -- INFO: resize
        { "<C-Down>", "<C-w>-" },
        { "<C-Up>", "<C-w>+" },
        { "<C-Right>", "<C-w>>" },
        { "<C-Left>", "<C-w><" },
        { "Z", 'zf' },

        { "<leader>a", "@", 'macro' },
        { "<C-CR>", "/<++><CR>vf>c" },
    }
}


set {
    mode = 'i',
    map = {
        { "<C-CR>", "<Esc>/<++><CR>vf>c" },
        { "<C-j>", "<Left>" },
        { "<C-l>", "<Right>" },
        { '<C-b>', '<ESC>bi' },
        { '<C-f>', '<ESC>ea' },
        { '<C-a>', function()
            ---@diagnostic disable-next-line: param-type-mismatch, undefined-field
            local s = (vim.api.nvim_get_current_line()):find('%S')
            vim.fn.cursor { vim.fn.line('.'), s or 0 }
        end },
        { '<C-e>', function()
            vim.fn.cursor { vim.fn.line('.'), vim.fn.col('$') }
        end },
    }
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
}


set {
    mode = "x",
    map = {
        { "<A-i>", ":m '<-2<CR>gv" },
        { "<A-k>", ":m '>+1<CR>gv" },
        { ">", ">gv" },
        { "<", "<gv" },
        { "<C-c>", [["+y]] },
        { "p", [["_dP]] },
        { "za", "zf" },
    },
}

vim.keymap.set(
    { "x", "o", "i" }, -- mode
    "<C-s>",
    "<Esc>",
    { silent = true }
)
