return {
    {
        "rrethy/vim-illuminate",
        config = function()
            require('illuminate').configure {
                providers = { 'lsp', 'treesitter', },
                delay = 100,
            }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
        },
    },

    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        opts = {
            display = {
                "TempFloatingWindow", --# display results in a floating window
                "LongTempFloatingWindow", --# same as above, but only long results. To use with VirtualText[Ok/Err]
            },
            snipruncolors = {
                SniprunVirtualTextOk  = { bg = "#89e051", fg = '#1d202f' },
                SniprunFloatingWinOk  = { fg = "#599eff" },
                SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", cterfg = "Black" },
                SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
            },
            borders = 'rounded', --# display borders around floating windows
        },

        keys = {
            { '<leader><C-r>', '<Cmd>SnipRun<CR>', desc = '💪Execute Snippet' },
            { '<C-r>', mode = 'x', '<Esc><Cmd>SnipRun<CR>', desc = '💪Execute Snippet' },
        },
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
        --- TODO :
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function() require 'plugins.lang.ufo' end,
    },


    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
            "neovim/nvim-lspconfig", -- official lspconfig
            "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
            'p00f/clangd_extensions.nvim',

            -- NOTE  Dap
            'jayp0521/mason-nvim-dap.nvim',
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
        }
    }, -- lsp manager

    {
        "folke/neodev.nvim",
        opts = {
            library = {
                plugins = false,
            }
        },
    },


    {
        "hrsh7th/nvim-cmp",
        event = { 'InsertEnter', 'CmdlineEnter' },
        dependencies = {
            "hrsh7th/cmp-buffer",
            { "tzachar/cmp-tabnine", build = 'bash install.sh' },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-cmdline",
            {
                "L3mon4d3/luasnip",
                init = function()
                    require('snips').setup()
                end,
            },
            "rafamadriz/friendly-snippets"
        },
        config = function() require "plugins.lang.cmp" end
    }
}
