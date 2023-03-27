return {
    diagnostic = {
        on_insert = false,
    },
    finder = {
        keys = {
            jump_to = 'g',
            expand_or_jump = 'o',
            -- expand_or_jump = { 'o', '<CR>' },
            vsplit = 'wo',
            split = 'wu',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>'
        },
    },
    definition = {
        -- keys = {
        edit = '<C-o>',
        vsplit = '<C-v>',
        split = '<C-h>',
        tabe = '<C-t>',
        quit = '<C-q>',
        close = '<Esc>',
        -- },
    },
    code_action = {
        num_shortcut = true,
        keys = {
            quit = '<C-q>',
            exec = { '<CR>', '<C-o>' },
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
        mark = 'm',
        confirm = '<CR>',
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
            quit = '<C-q>',
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
            quit = '<C-q>',
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
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
    },
}
