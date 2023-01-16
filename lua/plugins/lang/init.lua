local use = require("packer").use

-- NOTE : ====================== Syntax =====================
-- cursor-word highlighting
-- Pretty Indent
use {
    {
        "rrethy/vim-illuminate",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require 'plugins.lang.indent']],
    },
}

use {
    'michaelb/sniprun',
    run = 'bash ./install.sh',
    keys = {
        { 'n', '<leader><C-r>' },
        { 'v', '<C-r>' },
    },
    config = [[require("plugins.lang.sniprun")]],
}



-- Treesitter
use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "p00f/nvim-ts-rainbow",
        "RRethy/nvim-treesitter-endwise",
    }, -- rainbow pairs
    config = [[require("plugins.lang.treesitter")]]
}

-- INFO make neovim has modernize folder
use {
    "kevinhwang91/nvim-ufo",
    requires = { "kevinhwang91/promise-async", module = 'promise' },
    config = [[require 'plugins.lang.ufo']],
}

-- mason | lspconfig | mason-lspconfig
use {
    "williamboman/mason.nvim", -- lsp manager
    "williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
    "neovim/nvim-lspconfig", -- official lspconfig
    "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
    -- NOTE  Dap
    'jayp0521/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
}

-- NOTE :====================== Completion =====================


use {
    "folke/neodev.nvim",
    config = function()
        require('neodev').setup {
            library = {
                plugins = false,
            }
        }
    end
}

-- LuaSnip
use {
    "L3mon4d3/luasnip",
    requires = {
        "rafamadriz/friendly-snippets"
    },
    event = { 'insertenter', 'cmdlineenter' },
    after = 'nvim-cmp',
    config = function()
        require('snips').setup()
    end
}

-- NOTE : a super powerful completion engine for neovim
use {
    "hrsh7th/nvim-cmp",
    requires = {
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "tzachar/cmp-tabnine", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "luasnip" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
    },
    event = { "cmdlineenter", "insertenter" }, -- lazy-load
    config = [[require "plugins.lang.cmp"]]
}
