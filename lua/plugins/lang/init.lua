local use = require("packer").use

-- NOTE: ====================== syntax =====================


-- cursor-word highlighting
use {
    "rrethy/vim-illuminate",
}


use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require 'plugins.lang.indent']],
}


-- high-performance language parser
use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "p00f/nvim-ts-rainbow",
    }, -- rainbow pairs
    config = [[require("plugins.lang.treesitter")]]
}

-- make neovim has modernize folder
use {
    "kevinhwang91/nvim-ufo",
    -- keys = {
    --     { 'n', 'zR' },
    --     { 'n', 'zM' },
    --     { 'v', 'za' },
    -- },
    requires = { "kevinhwang91/promise-async", module = 'promise-async' },
    config = [[require 'plugins.lang.ufo']],
}


-- -- ====================== completion =====================
-- mason | lspconfig | mason-lspconfig
use {
    "williamboman/mason.nvim", -- lsp manager
    "williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
    "neovim/nvim-lspconfig", -- official lspconfig
    "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
}

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
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "luasnip" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        { "lukas-reineke/cmp-rg", after = "nvim-cmp" },
    },
    event = { "cmdlineenter", "insertenter" }, -- lazy-load
    config = [[require "plugins.lang.cmp"]]
}
