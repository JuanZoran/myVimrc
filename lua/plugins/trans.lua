return {
    'JuanZoran/Trans.nvim',
    keys = {
        { 'mm', mode = { 'n', 'x' },       '<Cmd>Translate<CR>',             desc = 'Translate' },
        { 'mk', mode = { 'n', 'x' },       '<Cmd>TransPlay<CR>',             desc = 'Auto Play' },
        { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
    },
    opts = {
        frontend = {
            hover = {
                spinner = 'moon',
                keymaps = {
                    -- pageup       = '<C-u>',
                    -- pagedown     = '<C-d>',
                    pageup       = '[[',
                    pagedown     = ']]',
                    pin          = '<leader>[',
                    close        = '<leader>]',
                    toggle_entry = '<leader>;',
                },
            },
        },
        -- offline = {debug = true},
        dir = os.getenv 'HOME' .. '/.vim/dict',
    },
    dev = true,
}
