local use = require("packer").use

-- NOTE: ====================== syntax =====================

-- lsp function parse in statusline winbar
use({
    "smiteshp/nvim-navic",
    requires = {
        "neovim/nvim-lspconfig",
    },
})

use("rrethy/vim-illuminate") -- cursor-word highlighting
use("lukas-reineke/indent-blankline.nvim")


-- high-performance language parser
use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    requires = { "p00f/nvim-ts-rainbow" }, -- rainbow pairs
})

-- make neovim has modernize folder
use({
    "kevinhwang91/nvim-ufo",
    keys = {
        { 'n', 'zR' },
        { 'n', 'zM' },
        { 'v', 'za' },
    },
    requires = { "kevinhwang91/promise-async", opt = true },
    config = 'require "conf.ufo"',
})

-- -- ====================== completion =====================
-- mason | lspconfig | mason-lspconfig
use({
    "williamboman/mason.nvim", -- lsp manager
    "williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
    "neovim/nvim-lspconfig", -- official lspconfig
    "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
})

use {
    "L3mon4d3/luasnip",
    requires = {
        "rafamadriz/friendly-snippets"
    },
    event = {'insertenter', 'cmdlineenter'},
    after = 'nvim-cmp',
    config = function()
        require('snips').setup()
    end
}

-- NOTE: a super powerful completion engine for neovim
use({
    "hrsh7th/nvim-cmp",
    requires = {
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "tzachar/cmp-tabnine", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "luasnip" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
    },
    event = 'InsertEnter', -- lazy-load
    -- event = { "cmdlineenter", "insertenter" }, -- lazy-load
    config = function()
        require("conf.cmp")
    end,
})
