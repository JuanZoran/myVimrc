return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        popup_mappings = {
            scroll_up = '<c-i>',   -- binding to scroll up inside the popup
            scroll_down = '<c-k>', -- binding to scroll down inside the popup
        },
        layout = {
            height = { min = 4, max = 25 },                                                      -- min and max height of the columns
            width = { min = 20, max = 50 },                                                      -- min and max width of the columns
            spacing = 3,                                                                         -- spacing between columns
            align = 'left',                                                                      -- align columns left, center or right
        },
        hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ', 'require' }, -- hide mapping boilerplate
        triggers_blacklist = {
            i = { 'i', 'k' },
            v = { 'i', 'k' },
        },
        window = {
            border = 'single', -- none, single, double, shadow
        },
        -- operators = {
        --     gc = "Comments",
        -- },
        plugins = {
            marks = true,         -- shows a list of your marks on ' and `
            registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true,     -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true,       -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = true,       -- default bindings on <c-w>
                nav = true,           -- misc bindings to work with windows
                z = true,             -- bindings for folds, spelling and others prefixed with z
                g = true,             -- bindings for prefixed with g
            },
        },
        disable = {
            filetypes = {},
            buftypes = { 'TelescopePrompt' },
        },
    },
}
