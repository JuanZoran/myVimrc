local set = util.map_opt_with_desc
set {
    mode = 'n',
    map = {

        { 'U',                 'VP' },
        -- INFO : command
        { '<Leader><leader>w', '<Cmd>wqa<CR>',        'Save and quit all window' },
        { '<Leader>ck',        '<Cmd>set spell!<CR>', 'Toggle builtin spell checker' },
        { '<Leader>p',         '<Cmd>Lazy<CR>',       'Plugin Manager' },
        { 'qq',                '<C-^>',               'Toggle Recent Buffer' },
        { 'qd',                '<Cmd>bdelete!<CR>' },
        { 'qw',                '<Cmd>close<CR>' },
        { '<leader>J',         'J' },
        { '<S-CR>',            'J' },
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
        { 'yq',                [[yi']] },
        { 'cq',                [[ci']] },
        { 'dq',                [[di']] },
        { 'vq',                [[vi']] },

        { 'Z',                 'zf' },
        { '<C-CR>',            '/<++><CR>vf>c' },
        { '<leader>a',         '@',                   'Macro' },
        { '<C-w>o',            '<Cmd>vsp<CR>',        'Split Window' },
        { '<C-w>u',            '<Cmd>sp<CR>',         'Split Window Vertically' },
        { '<C-w>n',            '<Cmd>only<CR>',       'Close Another Window' },

        { '<Leader>w', function()
            if vim.api.nvim_buf_get_name(0) == '' then
                local filename = vim.fn.input 'Save as: '
                if filename ~= '' then vim.cmd('w ' .. filename) end
            else
                vim.cmd 'w'
            end
        end, 'Save Current Buffer', },
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

local feedkey = function(key)
    return function()
        vim.api.nvim_buf_call(0, function()
            vim.cmd([[norm! ]] .. key)
        end)
    end
end

set {
    mode = 'i',
    map = {
        { '<C-CR>', '<Esc>/<++><CR>vf>c' },
        { '<C-b>',  feedkey 'b' },
        { '<C-f>',  feedkey 'w' },
        { '<C-a>',  feedkey '^' },
        { '<C-e>',  function() vim.fn.cursor { vim.fn.line '.', vim.fn.col '$' } end },
        -- { '<C-e>',  feedkey '$' },
        -- { '<C-a>', function()
        --     ---@diagnostic disable-next-line: param-type-mismatch, undefined-field
        --     local s = (vim.api.nvim_get_current_line()):find '%S'
        --     vim.fn.cursor { vim.fn.line '.', s or 0 }
        -- end, },
        { '<C-v>',  '<C-r>+' },
    },
    -- {"<++>", "<++>"},
    -- {"<++>", "<++>"},
}

set {
    mode = 'x',
    map = {
        { '<A-i>', "<Cmd>m '<-2<CR>gv=gv" },
        { '<A-k>', "<Cmd>m '>+1<CR>gv=gv" },
        { '>',     '>gv' },
        { '<',     '<gv' },
        { '<C-c>', [["+y]] },
        { 'p',     'P' },
        { 'za',    'zf' },
    },
}

local map = vim.keymap.set
map({ 'x', 'o', 'i', 'c' }, '<C-s>', '<Esc>')
map({ 'c', 't' }, '<C-x>', '<Cmd>stopinsert<CR>')
map({ 'i', 'c' }, '<C-j>', '<Left>')
map({ 'i', 'c' }, '<C-l>', '<Right>')


map('', '0', '%', { remap = true })


map({ 'n', 'x' }, '<C-h>', [[:s/\v]])

map('c', '<C-a>', '<Home>')
