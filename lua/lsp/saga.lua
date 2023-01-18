-- import lspsaga safely
local ok, saga = pcall(require, "lspsaga")
if not ok then
    return vim.notify("saga not found")
end

saga.setup {
    finder = {
        edit = { 'o', '<CR>' },
        vsplit = 'v',
        split = 's',
        tabe = 't',
        quit = { 'q', '<ESC>' },
    },
    definition = {
        edit = '<C-d>o',
        vsplit = '<C-d>v',
        split = '<C-d>i',
        tabe = '<C-d>t',
        quit = 'q',
        close = '<Esc>',
    },
    code_action = {
        num_shortcut = true,
        keys = {
            quit = 'q',
            exec = '<CR>',
        },
    },
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    rename = {
        quit = '<C-q>',
        exec = '<CR>',
        in_select = true,
    },
    outline = {
        win_position = 'left',
        win_with = '',
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            jump = 'o',
            expand_collaspe = 'u',
            quit = 'q',
        },
    },
    callhierarchy = {
        show_detail = true,
        keys = {
            edit = 'e',
            vsplit = 'v',
            split = 's',
            tabe = 't',
            jump = 'o',
            quit = 'q',
            expand_collaspe = 'u',
        },
    },
    symbol_in_winbar = {
        enable = false,
        separator = ' ',
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
    },
    ui = {
        -- currently only round theme
        theme = 'round',
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
        expand = '',
        collaspe = '',
        preview = ' ',
        code_action = '💡',
        diagnostic = '🐞',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal bakcground color
            normal_bg = '#1d1536',
            --title background color
            title_bg = '#afd700',
            red = '#e95678',
            magenta = '#b33076',
            orange = '#FF8700',
            yellow = '#f7bb3b',
            green = '#afd700',
            cyan = '#36d0e0',
            blue = '#61afef',
            purple = '#CBA6F7',
            white = '#d1d4cf',
            black = '#1c1c19',
        },
        kind = {},
    },
}
