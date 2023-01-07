local use = require("packer").use
-- NOTE :====================== ui =====================

-- NOTE : Theme
use {
    { "rebelot/kanagawa.nvim",       config = [[require 'plugins.ui.theme.kanagawa']],   opt = false, },
    { "marko-cerovac/material.nvim", config = [[require 'plugins.ui.theme.material']],   opt = true, },
    { "sainnhe/everforest",          config = [[require 'plugins.ui.theme.everforest']], opt = true, },
    { "projekt0n/github-nvim-theme", config = [[require 'plugins.ui.theme.github']],     opt = true },
}


use {

    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
        require('colorizer').setup {}
    end
}


use {
    { -- 状态栏
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", 'arkav/lualine-lsp-progress' },
        config = [[require "plugins.ui.lualine"]],
    },

    { -- 文件树
        "nvim-tree/nvim-tree.lua",
        keys = { 'n', 'ww' },
        config = [[require "plugins.ui.nvim_tree"]],
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    },

    { -- 标签栏
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        requires = "nvim-tree/nvim-web-devicons",
        config = [[require "plugins.ui.bufferline"]],
    },
}


use {
    'goolord/alpha-nvim',
    config = [[require("plugins.ui.alpha")]],
}


-- smooth scroll animation
use {
    'gen740/SmoothCursor.nvim',
    config = [[require 'plugins.ui.smooth']],
    requires = {
        'declancm/cinnamon.nvim',
        'edluffy/specs.nvim',
    },
}



-- nice ui
use {
    "folke/noice.nvim",
    requires = {
        { "muniftanjim/nui.nvim" , module = 'nui' },
        { "rcarriga/nvim-notify", config = [[require "plugins.ui.notify"]], module = 'notify' },
    },
    config = [[require "plugins.ui.noice"]]
}
