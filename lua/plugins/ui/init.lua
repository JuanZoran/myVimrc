local catppuccin = {
    "JuanZoran/catppuccin",
    lazy = true,
    dev = true,
}

local kanagawa = {
    "rebelot/kanagawa.nvim",
    -- lazy = true,
    config = function()
        require 'plugins.ui.theme.kanagawa'
    end,
    priority = 1000,
}

local smooth = {
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

local colorize = {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
}

local lualine = { -- 状态栏
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
        require "plugins.ui.lualine"
    end,
}

local nvim_tree = { -- 文件树
    "nvim-tree/nvim-tree.lua",
    keys = {
        { 'ww', '<Cmd>NvimTreeToggle<CR>', desc = ' 触发文件树' }
    },
    config = function()
        require "plugins.ui.nvim_tree"
    end,
    tag = "nightly", -- optional, updated every week. (see issue #1193)
}

local bufferline = { -- 标签栏
    "akinsho/bufferline.nvim",
    opts = {
        -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
            show_buffer_close_icons = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            modified_icon = "💌",
            separator_style = "slant", -- slant, padded_slant | triky
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

local alpha = {
    'goolord/alpha-nvim',
    cond = false,
    config = function() require("plugins.ui.alpha") end,
}

---@format disable
local dash = {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    opts = {
        -- config
        theme = 'hyper',
        config = {
            header = {
                "    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ",
                "    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ",
                "   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ",
                "   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ",
                "  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ",
                "  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ",
                " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ",
                " ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ",
                " ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ",
                " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ",
                "  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ",
                "   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ",
                "     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ",
                "        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ",
                " ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ",
            },
            shortcut = {
                { desc = ' Update',        group = 'MoreMsg', action = 'Lazy update',          key = 'u'  },
                { desc = '📄 Find File',    group = 'MoreMsg', action = 'Telescope find_files', key = 'f', },
                { desc = '🥂 Recent File',  group = 'MoreMsg', action = 'Telescope oldfiles',   key = 'r', },
                { desc = '💻 Load Session', group = 'MoreMsg', action = 'SessionLoad',          key = 's', },
                { desc = '🏓 Quit',         group = 'MoreMsg', action = 'q',                    key = 'q', },
            },
            mru = {
                limit = 5,
                icon = '🌳',
            },
            -- week_header = {
            --     enable = true,
            -- },
        },
    },
}
---@format enable

local noice = {
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

return {
    kanagawa,
    catppuccin,
    ---- Corlorscheme
    smooth,
    colorize,
    lualine,
    nvim_tree,
    bufferline,
    alpha,
    dash,
    noice,
    -- { "sainnhe/everforest", config = function() require 'plugins.ui.theme.everforest' end, opt = true, },
    -- { "projekt0n/github-nvim-theme", config = function() require 'plugins.ui.theme.github' end, opt = true },
    -- { "Mofiqul/dracula.nvim", config = function() require 'plugins.ui.theme.dracula' end, opt = true },
    -- { "AlexvZyl/nordic.nvim", config = function() require 'plugins.ui.theme.nordic' end, opt = true },
}
