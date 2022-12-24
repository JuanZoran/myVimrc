local use = require("packer").use
-- NOTE:====================== ui =====================
-- about theme
use { "sainnhe/everforest", opt = true }
use("projekt0n/github-nvim-theme")


use {

    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
        require('colorizer').setup {}
    end
}

-- 状态栏
use({
    "nvim-lualine/lualine.nvim",
    requires = {
        "kyazdani42/nvim-web-devicons",
        'arkav/lualine-lsp-progress'
    },
})

-- -- 文件树
use({
    "nvim-tree/nvim-tree.lua",
    keys = { 'n', 'ww' },
    -- cond = 'not vim.g.vscode',
    config = 'require"conf.nvim_tree"',
    requires = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
})


use {
    'goolord/alpha-nvim',
    config = [[require("plugins.ui.alpha")]],
}

-- tabline
use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

-- smooth scroll animation
use {
    "declancm/cinnamon.nvim",
    config = [[require("plugins.ui.smooth")]]
}

use { 'gen740/SmoothCursor.nvim',
    config = [[require "plugins.ui.SmoothCursor"]]
}

-- nice ui
use({
    "folke/noice.nvim",
    requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "muniftanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
})
