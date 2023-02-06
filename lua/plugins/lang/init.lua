local plugins = require("util.plugin")()
plugins:add {
    'michaelb/sniprun',
    build = 'bash ./install.sh',
    keys = {
        { '<leader><C-r>', '<Cmd>SnipRun<CR>', desc = '💪Execute Snippet' },
        { '<C-r>', mode = 'x', '<Esc><Cmd>SnipRun<CR>', desc = '💪Execute Snippet' },
    },
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
        borders = 'rounded',
    } --# display borders around floating windows
}

plugins:add {
    "rrethy/vim-illuminate",
    config = function()
        require('illuminate').configure {
            providers = { 'lsp', 'treesitter', },
            delay = 200,
        }
    end,
}

plugins:add {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    },
}

plugins:add {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    event = 'BufReadPost',
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "mrjones2014/nvim-ts-rainbow",
        "RRethy/nvim-treesitter-endwise",
    }, -- rainbow pairs
    config = function() require("plugins.lang.treesitter") end
}

plugins:add {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", lazy = true },
    config = function() require 'plugins.lang.ufo' end,
}

plugins:add {
    "folke/neodev.nvim",
    opts = {
        library = {
            plugins = {
                'nvim-dap-ui',
            },
            types = true,
        }
    },
}

plugins:add {
    "folke/trouble.nvim",
    keys = {
        { '<leader>df', '<Cmd>TroubleToggle <CR>', desc = 'Toggle QuickFix' }
    },
    opts = {
        action_keys = { -- key mappings for actions in the trouble list
            close = "q", -- close the list
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            jump = { "<cr>", "<tab>", '<C-o>' }, -- jump to the diagnostic or open / close folds
            open_split = { "do" }, -- open buffer in new split
            open_vsplit = { "du" }, -- open buffer in new vsplit
            open_tab = { "dk" }, -- open buffer in new tab
            jump_close = { "o" }, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = "P", -- toggle auto_preview
            hover = "gh", -- opens a small popup with the full multiline message
            preview = "p", -- preview the diagnostic location
            close_folds = { "zM", "zm" }, -- close all folds
            open_folds = { "zR", "zr" }, -- open all folds
            toggle_fold = { "zA", "za" }, -- toggle fold of current file
            previous = "i", -- previous item
            next = "k" -- next item
        },
    },
}


plugins:add {
    "neovim/nvim-lspconfig", -- official lspconfig
    dependencies = {
        "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
        'p00f/clangd_extensions.nvim',
    }
}

plugins:add {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'VeryLazy',
    config = function()
        local nl = require("null-ls")
        nl.setup {
            sources = {
                -- nl.builtins.code_actions.gitsigns,
                nl.builtins.formatting.prettier,
                nl.builtins.formatting.shfmt,
                -- nl.builtins.code_actions.refactoring,
                -- nl.builtins.code_actions.shellcheck,
            },
        }
    end,
}

plugins:add {
    "ThePrimeagen/refactoring.nvim",
    keys = {
        { mode = 'x', '<Leader>rr', function()
            require('telescope').extensions.refactoring.refactors()
        end, desc = '🎈Refactoring Operations' },
    },
    config = function()
        require("refactoring").setup()
        require('telescope').load_extension('refactoring')
    end,
}

plugins:add {
    "L3mon4d3/luasnip",
    lazy = true,
    config = function()
        local snippets_folder = vim.fn.stdpath "config" .. "/lua/snips"
        local ls = require "luasnip"
        local types = require "luasnip.util.types"
        ls.config.set_config {
            history = true,
            updateevents = "TextChanged,TextChangedI",
            region_check_events = "CursorHold,InsertLeave",
            delete_check_events = "TextChanged,InsertEnter",
            -- enable_autosnippets = true,
            -- store_selection_keys = "<C-q>",
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { " Your Choice", "Title" } }, -- yellow
                    },
                },
                [types.insertNode] = {
                    active = {
                        virt_text = { { " Insert", "Function" } }, -- purple
                    },
                },
            },
        }
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }
        vim.keymap.set('n', '<leader><cr>', require "luasnip.loaders.from_lua".edit_snippet_files)
    end,
    dependencies = {
        "rafamadriz/friendly-snippets",
    }
}


plugins:add {
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
    },
    dependencies = {
        { "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = false, } },
    }
}

plugins:add {
    "hrsh7th/nvim-cmp",
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",
        { "jcdickinson/codeium.nvim", config = true },
    },
    config = function() require "plugins.lang.cmp" end
}

return plugins
