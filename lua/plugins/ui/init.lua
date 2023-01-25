return {
    {
        "rebelot/kanagawa.nvim", config = function()
            require 'plugins.ui.theme.kanagawa'
        end
    },

    {
        'gen740/SmoothCursor.nvim',
        config = function()
            require 'plugins.ui.smooth'
        end,
        dependencies = {
            'declancm/cinnamon.nvim',
            'edluffy/specs.nvim',
        },
    },

    {

        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require('colorizer').setup {}
        end
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
        config = function()
            require "plugins.ui.nvim_tree"
        end,
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    },


    { -- 标签栏
        "akinsho/bufferline.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require "plugins.ui.bufferline"
        end,
    },
    {
        'goolord/alpha-nvim',
        config = function() require("plugins.ui.alpha") end,
    },

    {
        "folke/noice.nvim",
        dependencies = {
            "muniftanjim/nui.nvim",
            { "rcarriga/nvim-notify", config = function()
                require "plugins.ui.notify"
            end, },
        },
        config = function() require "plugins.ui.noice" end
    },
    -- { "rebelot/kanagawa.nvim", config = function() require 'plugins.ui.theme.kanagawa' end, opt = false, },
    -- { "sainnhe/everforest", config = function() require 'plugins.ui.theme.everforest' end, opt = true, },
    -- { "projekt0n/github-nvim-theme", config = function() require 'plugins.ui.theme.github' end, opt = true },
    -- { "Mofiqul/dracula.nvim", config = function() require 'plugins.ui.theme.dracula' end, opt = true },
    -- { "AlexvZyl/nordic.nvim", config = function() require 'plugins.ui.theme.nordic' end, opt = true },
    "catppuccin/nvim",
}
