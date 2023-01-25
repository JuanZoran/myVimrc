local use = require("packer").use
-- NOTE :====================== ui =====================
-- smooth scroll animation

if vim.g.neovide then
    use { "catppuccin/nvim", as = "catppuccin", config = [[require 'plugins.ui.theme.catp']] }
else
-- NOTE : Theme
    use {
        { "rebelot/kanagawa.nvim", config = [[require 'plugins.ui.theme.kanagawa']], opt = false, },
        { "sainnhe/everforest", config = [[require 'plugins.ui.theme.everforest']], opt = true, },
        { "projekt0n/github-nvim-theme", config = [[require 'plugins.ui.theme.github']], opt = true },
        { "Mofiqul/dracula.nvim", config = [[require 'plugins.ui.theme.dracula']], opt = true },
        { "AlexvZyl/nordic.nvim", config = [[require 'plugins.ui.theme.nordic']], opt = true },
        { "catppuccin/nvim", as = "catppuccin" }
        -- { "catppuccin/nvim", as = "catppuccin", config = [[require 'plugins.ui.theme.catp']], opt = true }
    }
    use {
        'gen740/SmoothCursor.nvim',
        config = [[require 'plugins.ui.smooth']],
        cond = function ()
            return not vim.g.neovide
        end,
        requires = {
            'declancm/cinnamon.nvim',
            'edluffy/specs.nvim',
        },
    }
end


use {

    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function() -- don't change this
        require('colorizer').setup {}
    end
}


use {
    { -- 状态栏
        "nvim-lualine/lualine.nvim",
        event = 'VimEnter',
        requires = { "kyazdani42/nvim-web-devicons" },
        config = [[require "plugins.ui.lualine"]],
    },
    { -- 文件树
        "nvim-tree/nvim-tree.lua",
        config = [[require "plugins.ui.nvim_tree"]],
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    },

    { -- 标签栏
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        events = 'VimEnter',
        requires = "nvim-tree/nvim-web-devicons",
        config = [[require "plugins.ui.bufferline"]],
    },
}


use {
    'goolord/alpha-nvim',
    config = [[require("plugins.ui.alpha")]],
}

-- nice ui
use {
    "folke/noice.nvim",
    requires = {
        { "muniftanjim/nui.nvim", module = 'nui' },
        { "rcarriga/nvim-notify", config = [[require "plugins.ui.notify"]], module = 'notify' },
    },
    config = [[require "plugins.ui.noice"]]
}
