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
        { 'U',                 'VP' },
        { '<S-CR>',            'J' },
        { '<Leader>w',         '<Cmd>w<CR>',          'Save Current Window' },
        { '<Leader><leader>w', '<Cmd>wqa<CR>',        'Save and quit all window' },
        { '<Leader>ck',        '<Cmd>set spell!<CR>', 'Toggle builtin spell checker' },
        { 'qd',                '<Cmd>bdelete!<CR>' },
        { '<Leader>p',         '<Cmd>Lazy<CR>',       'Plugin Manager' },
        { '<C-q>',             '<Cmd>q!<CR>' },

        { 'yp',                'yip' },
        { 'dp',                'dip' },
        -- { "vp",       "vip"   },

        { 'cp',                'cip' },
        -- INFO  in word
        { 'yw',                'yiw' },
        { 'dw',                'diw' },
        { 'vw',                'viw' },
        { 'cw',                'ciw' },
        -- INFO  in ""
        { 'd<cr>',             'di"' },
        { 'y<cr>',             'yi"' },
        { 'v<cr>',             'vi"' },
        { 'c<cr>',             'ci"' },
        -- INFO  in ''
        { 'y;',                [[yi']] },
        { 'c;',                [[ci']] },
        { 'd;',                [[di']] },
        { 'v;',                [[vi']] },

        { 'Z',                 'zf' },
        { '<C-CR>',            '/<++><CR>vf>c' },
        { '<leader>a',         '@',                   'Macro' },
        { '<C-w>o',            '<Cmd>vsp<CR>',        'Split Window' },
        { '<C-w>u',            '<Cmd>sp<CR>',         'Split Window Vertically' },
        { '<C-w>n',            '<Cmd>only<CR>',       'Close Another Window' },
    },
}


set {
    mode = { 'n', 't' },
    map = {
        { '<C-w>j',    '<Cmd>wincmd h<Cr>', 'Left' },
        { '<C-w>l',    '<Cmd>wincmd l<Cr>', 'Right' },
        { '<C-w>k',    '<Cmd>wincmd j<Cr>', 'Down' },
        { '<C-w>i',    '<Cmd>wincmd k<Cr>', 'Up' },
        -- INFO : resize
        { '<C-Down>',  '<Cmd>wincmd -<CR>' },
        { '<C-Up>',    '<Cmd>wincmd +<CR>' },
        { '<C-Right>', '<Cmd>wincmd ><CR>' },
        { '<C-Left>',  '<Cmd>wincmd <<CR>' },

        { '<C-w>K',    '<Cmd>wincmd J<CR>', 'Move Down' },
        { '<C-w>I',    '<Cmd>wincmd K<CR>', 'Move Up' },
        { '<C-w>J',    '<Cmd>wincmd H<CR>', 'Move Left' },
        { '<C-w>L',    '<Cmd>wincmd L<CR>', 'Move Right' },
        { '<C-w>=',    '<Cmd>wincmd =<CR>', 'Resize Window' },
    },
}


set {
    mode = 'i',
    map = {
        { '<C-CR>', '<Esc>/<++><CR>vf>c' },
        { '<C-j>',  '<Left>' },
        { '<C-l>',  '<Right>' },
        { '<C-b>',  '<ESC>bi' },
        { '<C-f>',  '<ESC>ea' },
        { '<C-a>', function()
            ---@diagnostic disable-next-line: param-type-mismatch, undefined-field
            local s = (vim.api.nvim_get_current_line()):find '%S'
            vim.fn.cursor { vim.fn.line '.', s or 0 }
        end, },
        { '<C-e>', function()
            vim.fn.cursor { vim.fn.line '.', vim.fn.col '$' }
        end, },

    },
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
}

set {
    mode = 'x',
    map = {
        { '<A-i>', ":m '<-2<CR>gv=gv" },
        { '<A-k>', ":m '>+1<CR>gv=gv" },
        { '>',     '>gv' },
        { '<',     '<gv' },
        { '<C-c>', [["+y]] },
        { 'p',     'P' },
        { 'za',    'zf' },
    },
}

vim.keymap.set({ 'x', 'o', 'i', 'c' }, '<C-s>', '<Esc>')
