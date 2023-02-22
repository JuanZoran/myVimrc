local plugins = require("util.plugin")()
plugins:add {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
}

plugins:add {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
        flavour = 'macchiato',
        transparent_background = true,
        custom_highlights = function()
            return require('plugins.ui.theme.override')
        end,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            telescope = true,
            notify = true,
            mini = false,
            noice = true,
            ts_rainbow = true,
            lsp_trouble = true,
            markdown = true,
            native_lsp = {
                enabled = true,
            },
            navic = {
                enabled = true,
            },
            -- illuminate = true,
            -- which_key = true,
            -- mason = true,
            -- indent_blankline = {
            --     enable = true,
            --     colored_indent_levels = true,
            -- },
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme 'catppuccin'
    end,
    priority = 1000,
}

plugins:add {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
        require 'plugins.ui.theme.kanagawa'
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
    },
}

plugins:add {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
}

plugins:add { -- 状态栏
    "nvim-lualine/lualine.nvim",
    event = 'VeryLazy',
    dependencies = {
        {
            'SmiteshP/nvim-navic',
            opts = {
                separator = " >> ",
                highlight = true,
                depth_limit = 5,
            },
            init = function()
                -- vim.g.navic_silence = true
                require("plugins.lsp.handlers").attach(function(client, buffer)
                    if client.server_capabilities.documentSymbolProvider then
                        require("nvim-navic").attach(client, buffer)
                    end
                end)
            end,
        },
    },
    config = function()
        require('plugins.ui.lualine')
    end,
}

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.g.neo_tree_remove_legacy_commands = 1
plugins:add {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    keys = {
        { '<C-w><C-w>', '<Cmd>Neotree reveal toggle<CR>',     desc = '📁Toggle File Explorer' },
        { '<C-w>b',     '<Cmd>Neotree buffers<CR>',    desc = '📁Neo-tree Buffers' },
        { '<C-w>g',     '<Cmd>Neotree git_status<CR>', desc = '📁Neo-tree Git Status' },
        { '<C-w>d',     '<Cmd>Neotree dir=./<CR>',     desc = '📁File Explorer in buffer dir' },
        { '<C-w>f',     ':Neotree dir=~/',             desc = '📁File Explorer from HOME' },
    },
    branch = "v2.x",
    opts = function()
        return require('plugins.ui.neo-tree')
    end
}

plugins:add { -- 标签栏
    "akinsho/bufferline.nvim",
    keys = {
        { "<leader>b<left>",  ":BufferLineMovePrev<CR>",                desc = '[]Move Buffer to Left' },
        { "<leader>b<right>", ":BufferLineMoveNext<CR>",                desc = '[]Move Buffer to Right' },
        { "<Leader>bb",       ":BufferLinePickClose<CR>",               desc = '﫧 Pick a Buffer to delete' },
        { "<leader>bp",       "<Cmd>BufferLineTogglePin<CR>" },
        { "<leader>bP",       "<Cmd>BufferLineGroupClose ungrouped<CR>" },
        { "<C-j>",            "<Cmd>BufferLineCyclePrev<CR>" },
        { "<C-l>",            "<Cmd>BufferLineCycleNext<CR>" },
    },
    event = 'VeryLazy',
    opts = function()
        return {
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
            options = {
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                diagnostics_indicator = function(_, _, diagnostics_dict)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                            or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return vim.trim(s)
                end,
                show_buffer_close_icons = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                modified_icon = "💌",
                -- separator_style = "triky", -- slant, padded_slant | triky
                -- offsets = {
                -- },
            },
        }
    end
}


plugins:add {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    cond = true,
    config = function() require("plugins.ui.alpha") end,
}

plugins:add {
    "folke/noice.nvim",
    event = 'VeryLazy',
    dependencies = {
        "muniftanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                level = vim.log.INFO,
                stages = "slide",
                timeout = 3000,
                icons = {
                    ERROR = "🥵",
                    WARN = "🫢",
                    INFO = "🤔",
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
                -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                -- See the section on formatting for more details on how to customize.
                format = "lsp_progress",
                format_done = "lsp_progress_done",
                throttle = 1000 / 30, -- frequency to update lsp progress message
                view = "mini",
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
            command_palette = {
                views = {
                    cmdline_popup = {
                        position = {
                            row = "50%",
                            col = "50%",
                        },
                        size = {
                            min_width = 60,
                            width = "auto",
                            height = "auto",
                        },
                    },
                },
            },
        },
    }
}

if vim.env.TERM == 'xterm-kitty' then
    plugins:add {
        "giusgad/pets.nvim",
        event = 'BufReadPre',
        dependencies = "edluffy/hologram.nvim",
        keys = {
            { '<leader><leader>n', '<Cmd>PetsHideToggle<CR>', desc = '🛀 Toggle Pets' }
        },
        opts = {
            -- col = 10,
            row = 5,
            popup = {
                avoid_statusline = true,
            },
        },
        config = function(_, opts)
            require("pets").setup(opts)
            vim.cmd [[PetsNew cat]]
        end,
    }
end


plugins:add {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    },
}

-- plugins:add {
--     "echasnovski/mini.indentscope",
--     version = false, -- wait till new 0.7.0 release to put it back on semver
--     event = { "BufReadPre", "BufNewFile" },
--     opts = {
--         -- symbol = "▏",
--         symbol = "│",
--         options = { try_as_border = true },
--     },
--     config = function(_, opts)
--         vim.api.nvim_create_autocmd("FileType", {
--             pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
--             callback = function()
--                 vim.b.miniindentscope_disable = true
--             end,
--         })
--         require("mini.indentscope").setup(opts)
--     end,
-- }


-- plugins:add '                                '
-- -@format disable
-- plugins:add {
--     'glepnir/dashboard-nvim',
--     event = 'VimEnter',
--     opts = {
--         -- config
--         -- theme = 'hyper',
--         theme = 'doom',
--         config = {
--             header = {
--                 "    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ",
--                 "    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ",
--                 "   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ",
--                 "   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ",
--                 "  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ",
--                 "  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ",
--                 " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ",
--                 " ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ",
--                 " ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ",
--                 " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ",
--                 "  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ",
--                 "   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ",
--                 "     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ",
--                 "        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ",
--                 " ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ",
--             },
--             -- shortcut = {
--             --     { desc = ' Update',        group = 'MoreMsg', action = 'Lazy update',          key = 'u'  },
--             --     { desc = '📄 Find File',    group = 'MoreMsg', action = 'Telescope find_files', key = 'f', },
--             --     { desc = '🥂 Recent File',  group = 'MoreMsg', action = 'Telescope oldfiles',   key = 'r', },
--             --     { desc = '💻 Load Session', group = 'MoreMsg', action = 'SessionLoad',          key = 's', },
--             --     { desc = '🏓 Quit',         group = 'MoreMsg', action = 'q',                    key = 'q', },
--             -- },
--             center = {
--                 {
--                     icon = '📄',
--                     icon_hl = 'Title',
--                     desc = '> Find File' .. indent,
--                     desc_hl = 'MoreMsg',
--                     key = 'f',
--                     keymap = 'SPC t f',
--                     key_hl = 'Number',
--                     action = 'Telescope find_files'
--                 },
--                 {
--                     icon = '🥂',
--                     desc = '> Recent File' .. indent,
--                     desc_hl = 'MoreMsg',
--                     key = 'r',
--                     keymap = '<C-u>',
--                     key_hl = 'Number',
--                     action = 'Telescope oldfiles'
--                 },
--                 {
--                     icon = '🏓',
--                     desc_hl = 'MoreMsg',
--                     desc = '> Quit' .. indent,
--                     action = 'q',
--                     key = 'q',
--                 },
--                 {
--                     icon = '💻',
--                     desc_hl = 'MoreMsg',
--                     desc = '> Session' .. indent,
--                     action = 'SessionLoad',
--                     key = 's',
--                 },
--             },
--             mru = {
--                 limit = 5,
--                 icon = '🌳',
--             },
--             -- week_header = {
--             --     enable = true,
--             -- },
--         },
--     },
-- }


return plugins
