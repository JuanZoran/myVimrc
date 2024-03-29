local plugins = util.list()
plugins:add {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
}

plugins:add {
    'catppuccin/nvim',
    name = 'catppuccin',
    event = 'VimEnter',
    priority = 1000,
    opts = function()
        return {
            flavour = 'mocha',
            transparent_background = not vim.g.neovide,
            custom_highlights = require 'plugins.ui.theme.override',
            -- dim_inactive = {
            --     enabled = true,
            --     shade = 'dark',
            --     percentage = 0.15,
            -- },
            integrations = {
                cmp                = true,
                notify             = false,
                neotree            = true,
                gitsigns           = true,
                markdown           = true,
                telescope          = true,
                headlines          = true,
                telekasten         = true,
                ts_rainbow2        = true,
                lsp_trouble        = true,
                native_lsp         = { enabled = true },

                treesitter         = true,
                treesitter_context = true,
                dropbar            = { enabled = true, color_mode = true },

                -- navic              = { enabled = true },
                -- leap               = true,
                -- mason = true,
                -- indent_blankline = {
                --     enable = true,
                --     colored_indent_levels = true,
                -- },
            },
        }
    end,
    config = function(_, opts)
        require 'catppuccin'.setup(opts)
        vim.cmd.colorscheme 'catppuccin'
    end,
}


plugins:add {
    import = util.firenvim and 'plugins.ui.extra.smooth' or 'plugins.ui.extra',
}

--- If started by firenvim, then disable some plugins
if util.firenvim then return plugins end

plugins:add {
    'uga-rosa/ccc.nvim',
    cmd = {
        'CccConvert',
    },
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


plugins:add {
    'nvim-zh/colorful-winsep.nvim',
    config = true,
    event = 'WinNew',
}

plugins:add {
    'nvim-neo-tree/neo-tree.nvim',
    cond = not util.firenvim,
    init = function()
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        vim.g.neo_tree_remove_legacy_commands = 1
        if vim.fn.argc() >= 1 then
            ---@diagnostic disable-next-line: param-type-mismatch
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == 'directory' then require 'neo-tree' end
        end
    end,
    cmd = 'Neotree',
    keys = {
        { '<C-w><C-w>', '<Cmd>Neotree toggle<CR>',     desc = '📁Toggle File Explorer' },
        { '<C-w>b',     '<Cmd>Neotree buffers<CR>',    desc = '📁Neo-tree Buffers' },
        { '<C-w>g',     '<Cmd>Neotree git_status<CR>', desc = '📁Neo-tree Git Status' },
        { '<C-w>f',     '<Cmd>Neotree dir=~<CR>',      desc = '📁File Explorer from HOME' },
        {
            '<C-w>d',
            '<Cmd>Neotree reveal_force_cwd dir=%:h toggle<CR>',
            desc =
            '📁Toggle File Explorer in buffer dir',
        },
    },
    branch = 'v2.x',
    opts = function()
        return require 'plugins.ui.neo-tree'
    end,
}

plugins:add {
    's1n7ax/nvim-window-picker',
    keys = {
        {
            '<C-w>w',
            function()
                local picked_window_id = require 'window-picker'.pick_window()
                if not picked_window_id then return end
                vim.api.nvim_set_current_win(picked_window_id)
            end,
            desc = 'Window Picker',
        },
    },
    opts = {
        selection_chars = 'IJKLQWER',
        highlights = {
            statusline = {
                focused = {
                    fg = '#74c7ec',
                    bg = '#7c3aed',
                    bold = true,
                },
                unfocused = {
                    fg = '#74c7ec',
                    bg = '#181831',
                    bold = true,
                },
            },
        },
    },
    config = function(_, opts)
        require 'window-picker'.setup(opts)
    end,
}


plugins:add { -- 标签栏
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


plugins:add {
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

plugins:add {
    'goolord/alpha-nvim',
    cond = vim.fn.argc() == 0,
    config = function() require 'plugins.ui.alpha' end,
}

return plugins
