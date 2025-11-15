return { -- 标签栏
    'akinsho/bufferline.nvim',
    keys = {
        { '<C-,>',      '<Cmd>BufferLineMovePrev<CR>',            desc = 'Move Buffer to Left' },
        { '<C-.>',      '<Cmd>BufferLineMoveNext<CR>',            desc = 'Move Buffer to Right' },
        { '<Leader>bb', '<Cmd>BufferLinePickClose<CR>',           desc = 'Pick a Buffer to delete' },
        { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>' },
        { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>' },
        { '<C-j>',      '<Cmd>BufferLineCyclePrev<CR>' },
        { '<C-l>',      '<Cmd>BufferLineCycleNext<CR>' },
    },
    event = 'VeryLazy',
    opts = function()
        return {
            highlights = require 'catppuccin.special.bufferline'.get_theme(),
            options = {
                diagnostics = 'nvim_lsp',
                always_show_bufferline = true,
                diagnostics_indicator = function(_, _, diagnostics_dict)
                    local s = ' '
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == 'error' and ' '
                            or (e == 'warning' and ' ' or '')
                        s = s .. n .. sym
                    end
                    return vim.trim(s)
                end,
                show_buffer_close_icons = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                modified_icon = '💌',
                numbers = function(opts)
                    return string.format('%s·%s', opts.lower(opts.ordinal), opts.raise(opts.id))
                end,
                hover = { enabled = false },
                enforce_regular_tabs = true,
                -- separator_style = "triky", -- slant, padded_slant | triky
                -- offsets = {
                -- },
            },
        }
    end,
}
