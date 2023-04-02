local opts = {
    -- you can enable a preset for easier configuration
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        progress = {
            enabled = true,
            format = 'lsp_progress',
            format_done = 'lsp_progress_done',
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = 'mini',
        },
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
        },
    },
    popupmenu = {
        backend = 'cmp', -- backend to use to show regular cmdline completions
        kind_icons = {}, -- set to `false` to disable icons
    },
    presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
        command_palette = {
            views = {
                cmdline_popup = {
                    position = {
                        row = '50%',
                        col = '50%',
                    },
                    size = {
                        min_width = 60,
                        width = 'auto',
                        height = 'auto',
                    },
                },
            },
        },
    },
    views = {
        mini = {
            win_options = {
                winblend = 0,
            },
        },
    },
}


local set_hl = vim.api.nvim_set_hl
for hl, color in pairs {
    NoiceFormatProgressDone = {
        fg = '#cad3f5',
        bg = '#455c6d',
    },
    NoiceLspProgressTitle = {
        fg = '#7ad7f3'
    },
    NoiceLspProgressClient = {
        -- link = 'MoreMsg'
        fg = '#d38aea'
    },
    NoiceLspProgressSpinner = {
        fg = '#d38aea'
    },
    -- NoiceFormatProgressTodo = {
    --     bg = '#599eff',
    --     fg = '#599eff',
    -- },
    -- NoiceFormatConfirm = {
    --     bg = '#599eff',
    --     fg = '#599eff',
    -- },


} do set_hl(0, hl, color) end


return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'muniftanjim/nui.nvim',
        {
            'rcarriga/nvim-notify',
            opts = {
                level = vim.log.levels.INFO,
                stages = 'slide',
                timeout = 1500,
                icons = {
                    ERROR = '🥵',
                    WARN = '🫢',
                    INFO = '🤔',
                },
            },
        },
    },
    opts = opts,
}
