local plugins = require 'util.plugin' ()
plugins:add {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
}


plugins:add {
    'catppuccin/nvim',
    event = 'VimEnter',
    name = 'catppuccin',
    opts = function()
        return {
            flavour = 'macchiato',
            transparent_background = true,
            custom_highlights = require 'plugins.ui.theme.override',
            -- dim_inactive = {

            --     enabled = false,
            --     shade = 'dark',
            --     percentage = 0.15,
            -- },
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                telekasten = true,
                telescope = true,
                notify = true,
                mini = false,
                neotree = true,
                ts_rainbow2 = true,
                lsp_trouble = true,
                markdown = true,
                native_lsp = {
                    enabled = true,
                },
                navic = {
                    enabled = true,
                },
                treesitter_context = true,
                -- noice = true,
                -- illuminate = true,
                -- which_key = true,
                -- mason = true,
                -- indent_blankline = {
                --     enable = true,
                --     colored_indent_levels = true,
                -- },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }
    end,
    config = function(_, opts)
        require 'catppuccin'.setup(opts)
        vim.cmd.colorscheme 'catppuccin'
    end,
    priority = 1000,
}

plugins:add {
    'folke/tokyonight.nvim',
    event = 'VimEnter',
    cond = false,
    config = function()
        vim.cmd.colorscheme 'tokyonight'
    end,
    priority = 1000,
}


plugins:add {
    'declancm/cinnamon.nvim',
    event = 'VeryLazy',
    config = function()
        require 'plugins.ui.smooth'
    end,
    cond = not vim.g.neovide,
    dependencies = {
        'gen740/SmoothCursor.nvim',
        'edluffy/specs.nvim',
        -- 'rainbowhxch/accelerated-jk.nvim',
    },
}

plugins:add {
    'uga-rosa/ccc.nvim',
    cmd = {
        'CccHighlighterToggle',
        'CccPick',
        'CccConvert',
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


plugins:add {
    'nvim-zh/colorful-winsep.nvim',
    config = true,
    event = 'WinNew',
}

plugins:add {
    'nvim-neo-tree/neo-tree.nvim',
    init = function()
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        vim.g.neo_tree_remove_legacy_commands = 1
        if vim.fn.argc() == 1 then
            ---@diagnostic disable-next-line: param-type-mismatch
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == 'directory' then
                require 'neo-tree'
            end
        end
    end,
    cmd = 'Neotree',
    keys = {
        { '<C-w><C-w>', '<Cmd>Neotree toggle<CR>',                          desc = '📁Toggle File Explorer' },
        { '<C-w>b',     '<Cmd>Neotree buffers<CR>',                         desc = '📁Neo-tree Buffers' },
        { '<C-w>g',     '<Cmd>Neotree git_status<CR>',                      desc = '📁Neo-tree Git Status' },
        { '<C-w>f',     '<Cmd>Neotree dir=~<CR>',                           desc = '📁File Explorer from HOME' },
        { '<C-w>d',     '<Cmd>Neotree reveal_force_cwd dir=%:h toggle<CR>', desc = '📁Toggle File Explorer in buffer dir' },
    },
    branch = 'v2.x',
    opts = function()
        return require 'plugins.ui.neo-tree'
    end,
    dependencies = {
        's1n7ax/nvim-window-picker',
        config = true,
    },
}

plugins:add { -- 标签栏
    'akinsho/bufferline.nvim',
    keys = {
        { '<leader>bj', ':BufferLineMovePrev<CR>',                desc = 'Move Buffer to Left' },
        { '<leader>bl', ':BufferLineMoveNext<CR>',                desc = 'Move Buffer to Right' },
        { '<Leader>bb', ':BufferLinePickClose<CR>',               desc = 'Pick a Buffer to delete' },
        { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>' },
        { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>' },
        { '<C-j>',      '<Cmd>BufferLineCyclePrev<CR>' },
        { '<C-l>',      '<Cmd>BufferLineCycleNext<CR>' },
    },
    event = 'VeryLazy',
    opts = function()
        return {
            highlights = require 'catppuccin.groups.integrations.bufferline'.get(),
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
                -- separator_style = "triky", -- slant, padded_slant | triky
                -- offsets = {
                -- },
            },
        }
    end,
}

plugins:add {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function() require 'plugins.ui.alpha' end,
}

plugins:add {
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
    opts = {
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
    },
}

return plugins
