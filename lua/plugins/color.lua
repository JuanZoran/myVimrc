return {
    'uga-rosa/ccc.nvim',
    keys = {
        { '<leader>hl', '<Cmd>CccHighlighterToggle<CR>', desc = 'Buffer Color highlight' },
        { '<leader>hp', '<Cmd>CccPick<CR>',              desc = 'Color Picker' },
    },
    ft = { 'css', 'html' },
    config = function(plugin)
        local ccc = require 'ccc'
        local mapping = ccc.mapping
        ccc.setup {
            highlighter = {
                auto_enable = true,
                filetypes = plugin.ft,
            },
            mappings = {
                j = mapping.decrease1,
                h = mapping.toggle_input_mode,
                i = 'k',
                ['<C-q>'] = mapping.quit,
            },
        }
    end,
}

