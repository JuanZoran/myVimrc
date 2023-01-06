require("neoclip").setup {
    history = 400,
    enable_persistent_history = true,
    enable_macro_history = false,
    keys = {
        telescope = {
            i = {
                select = '<cr>',
                paste = '<c-o>',
                paste_behind = '<c-p>',
                replay = '<c-r>', -- replay a macro
                delete = '<c-d>', -- delete an entry
                custom = {},
            },
            n = {
                select = '<cr>',
                paste = 'p',
                --- It is possible to map to more than one key.
                -- paste = { 'p', '<c-p>' },
                paste_behind = 'P',
                replay = 'r',
                delete = 'd',


                custom = {},
            },
        },
    },
}

require("telescope").load_extension "neoclip"
vim.keymap.set('n', '<leader><C-p>', '<cmd>Telescope neoclip<cr>', { desc = '📋Clipboard History' })
