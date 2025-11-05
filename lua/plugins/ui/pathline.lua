
return {
    'medwatt/tabulous',
    event = 'BufWinEnter',
    keys = {
        { '<leader><C-o>', '<Cmd>TabulousCreateNewTab<Cr>' },
        { '<leader><C-d>', '<Cmd>TabulousDeleteTab<Cr>' },
        { '<leader><C-j>', '<Cmd>tabnext<Cr>' },
        { '<leader><C-l>', '<Cmd>tabprevious<Cr>' },
    },
    cmd = {
        'TabulousSaveSession',
        'TabulousLoadSession',
    },
    opts = {
    },
}
