return {
    {
        "rrethy/vim-illuminate",
        opts = {
            providers = { 'lsp', 'treesitter', },
            delay = 200,
        },
        config = function(_, opts)
            require('illuminate').configure(opts)
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
        build = ':TSUpdate',
        event = 'BufReadPost',
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
        dependencies = { "kevinhwang91/promise-async", lazy = true },
        config = function() require 'plugins.lang.ufo' end,
    },

    {
        "neovim/nvim-lspconfig", -- official lspconfig
        dependencies = {
            "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
            'p00f/clangd_extensions.nvim',
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        border = "rounded",
                        keymaps = {
                            -- Keymap to expand a package
                            toggle_package_expand = "o",
                            -- Keymap to install the package under the current cursor position
                            install_package = "<Leader>i",
                            -- Keymap to reinstall/update the package under the current cursor position
                            update_package = "u",
                            -- Keymap to check for new version for the package under the current cursor position
                            check_package_version = "c",
                            -- Keymap to update all installed packages
                            update_all_packages = "U",
                            -- Keymap to check which installed packages are outdated
                            check_outdated_packages = "C",
                            -- Keymap to uninstall a package
                            uninstall_package = "d",
                            -- Keymap to cancel a package installation
                            cancel_installation = "<C-c>",
                            -- Keymap to apply language filter
                            apply_language_filter = "<C-f>",
                        },
                    },
                }
            },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    automatic_installation = false,
                }
            },
        }
    }, -- lsp manager



    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'jayp0521/mason-nvim-dap.nvim',
            'rcarriga/nvim-dap-ui',
        },
        lazy = true,
    },

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
        event = {'InsertEnter', 'CmdlineEnter'},
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-cmdline",
            { "jcdickinson/codeium.nvim", config = true },
            {
                "L3mon4d3/luasnip",
                init = function()
                    require('snips')
                end,
            },
            "rafamadriz/friendly-snippets"
        },
        config = function() require "plugins.lang.cmp" end
    }
}
