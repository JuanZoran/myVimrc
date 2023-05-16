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
            flavour = 'frappe',
            transparent_background = true,
            custom_highlights = require 'plugins.ui.theme.override',
            -- dim_inactive = {
            --     enabled = true,
            --     shade = 'dark',
            --     percentage = 0.15,
            -- },
            integrations = {
                cmp         = true,
                leap        = true,
                notify      = true,
                neotree     = true,
                gitsigns    = true,
                markdown    = true,
                telescope   = true,
                headlines   = true,
                treesitter  = true,
                telekasten  = true,
                ts_rainbow2 = true,
                lsp_trouble = true,
                native_lsp  = { enabled = true },
                navic       = { enabled = true },
                -- mini        = false,
                -- treesitter_context = true,
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
}


plugins:add {
    import = 'plugins.ui.extra',
}

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
            '📁Toggle File Explorer in buffer dir'
        },
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
