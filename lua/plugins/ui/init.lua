local plugins = require("util.plugin")()
plugins:add {
    "rebelot/kanagawa.nvim",
    -- lazy = true,
    config = function()
        require 'plugins.ui.theme.kanagawa'
    end,
    priority = 1000,
}


plugins:add {
    'declancm/cinnamon.nvim',
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
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
        require "plugins.ui.lualine"
    end,
}

plugins:add { -- 文件树
    "nvim-tree/nvim-tree.lua",
    keys = {
        { 'ww', '<Cmd>NvimTreeToggle<CR>', desc = ' 触发文件树' }
    },
    config = function()
        require "plugins.ui.nvim_tree"
    end,
    tag = "nightly", -- optional, updated every week. (see issue #1193)
}

plugins:add { -- 标签栏
    "akinsho/bufferline.nvim",
    keys = {
        { "<leader>b<left>",  ":BufferLineMovePrev<CR>",  desc = '[]Move Buffer to Left' },
        { "<leader>b<right>", ":BufferLineMoveNext<CR>",  desc = '[]Move Buffer to Right' },
        { "<Leader>bb",       ":BufferLinePickClose<CR>", desc = '﫧 Pick a Buffer to delete' },
        { "<C-j>", "<Cmd>BufferLineCyclePrev<CR>" },
        { "<C-l>", "<Cmd>BufferLineCycleNext<CR>" },
    },
    lazy = false,
    opts = {
        -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
            show_buffer_close_icons = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            modified_icon = "💌",
            separator_style = "triky", -- slant, padded_slant | triky
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
            hover = {
                enabled = true,
                delay = 200,
                reveal = { 'close' }
            },
        },
    }
}


plugins:add {
    'goolord/alpha-nvim',
    cond = true,
    config = function() require("plugins.ui.alpha") end,
}

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
plugins:add {
    "folke/noice.nvim",
    dependencies = {
        "muniftanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                level = vim.log.INFO,
                stages = "slide",
                timeout = 2000,
                icons = {
                    ERROR = "🥵",
                    WARN = "🫢",
                    INFO = "🤔",
                }
            },
        },
    },
    config = function() require "plugins.ui.noice" end
}
return plugins
