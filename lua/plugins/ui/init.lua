return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require 'plugins.ui.theme.kanagawa'
        end,
        priority = 1000, -- make sure to load this before all the other start plugins
    },

    { "catppuccin/nvim", lazy = true },

    {
        'gen740/SmoothCursor.nvim',
        config = function()
            require 'plugins.ui.smooth'
        end,
        cond = function()
            return not vim.g.neovide
        end,
        dependencies = {
            'declancm/cinnamon.nvim',
            'edluffy/specs.nvim',
        },
    },

    {

        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = true,
    },


    { -- 状态栏
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require "plugins.ui.lualine"
        end,
    },


    { -- 文件树
        "nvim-tree/nvim-tree.lua",
        keys = {
            { 'ww', '<Cmd>NvimTreeToggle<CR>', desc = ' 触发文件树' }
        },
        config = function()
            require "plugins.ui.nvim_tree"
        end,
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    },


    { -- 标签栏
        "akinsho/bufferline.nvim",
        requires = "nvim-tree/nvim-web-devicons",
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
    },

    {
        'goolord/alpha-nvim',
        config = function() require("plugins.ui.alpha") end,
    },

    {
        "folke/noice.nvim",
        dependencies = {
            "muniftanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = {
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
    },

    -- { "sainnhe/everforest", config = function() require 'plugins.ui.theme.everforest' end, opt = true, },
    -- { "projekt0n/github-nvim-theme", config = function() require 'plugins.ui.theme.github' end, opt = true },
    -- { "Mofiqul/dracula.nvim", config = function() require 'plugins.ui.theme.dracula' end, opt = true },
    -- { "AlexvZyl/nordic.nvim", config = function() require 'plugins.ui.theme.nordic' end, opt = true },
}
