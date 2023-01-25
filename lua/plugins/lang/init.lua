return {
    {
        "rrethy/vim-illuminate",
        config = function() require 'plugins.lang.illuminate' end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require 'plugins.lang.indent' end,
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        keys = {
            '<leader><C-r>',
            { '<C-r>', mode = 'x' },
        },
        config = function() require("plugins.lang.sniprun") end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "mrjones2014/nvim-ts-rainbow",
            "RRethy/nvim-treesitter-endwise",
        }, -- rainbow pairs
        config = function() require("plugins.lang.treesitter") end
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function() require 'plugins.lang.ufo' end,
    },

    "williamboman/mason.nvim", -- lsp manager
    "williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
    "neovim/nvim-lspconfig", -- official lspconfig
    "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
    'p00f/clangd_extensions.nvim',

    -- NOTE  Dap
    'jayp0521/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',

    {
        "folke/neodev.nvim",
        config = function()
            require('neodev').setup {
                library = {
                    plugins = false,
                }
            }
        end
    },

    {
        "L3mon4d3/luasnip",
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        config = function()
            require('snips').setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            { "tzachar/cmp-tabnine", build = 'bash install.sh' },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-cmdline",
        },
        config = function() require "plugins.lang.cmp" end
    }
}
