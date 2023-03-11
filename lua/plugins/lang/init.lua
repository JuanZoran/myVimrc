local plugins = require("util.plugin")()


local exclude_ft = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" }
local indent = {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        -- char = "▏",
        char = "│",
        filetype_exclude = exclude_ft,
        show_trailing_blankline_indent = false,
        show_current_context = false,
    },
    dependencies = {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        opts = {
            mappings = {
                object_scope = 'hi',
            },
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = exclude_ft,
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
        config = function(_, opts)
            require("mini.indentscope").setup(opts)
        end,
    },
}


plugins:add {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "mrjones2014/nvim-ts-rainbow",
        "RRethy/nvim-treesitter-endwise",
        { 'nvim-treesitter/nvim-treesitter-context', config = true },

        indent,
        {
            "kevinhwang91/nvim-ufo",
            dependencies = "kevinhwang91/promise-async",
            config = function() require 'plugins.lang.ufo' end,
        },

        {
            "rrethy/vim-illuminate",
            config = function()
                require('illuminate').configure {
                    providers = { 'lsp', 'treesitter', },
                    delay = 200,
                }
            end,
        },
    }, -- rainbow pairs
    config = function() require("plugins.lang.treesitter") end
}

local frontend = { 'html', 'css' }
plugins:add {
    "windwp/nvim-ts-autotag",
    config = function(plugin)
        require('nvim-ts-autotag').setup {
            filetypes = plugin.ft
        }
    end,
    ft = frontend,
}

plugins:add {
    "folke/trouble.nvim",
    keys = {
        { '<leader>df', '<Cmd>TroubleToggle <CR>', desc = 'Toggle QuickFix' }
    },
    opts = {
        action_keys = {
                                                 -- key mappings for actions in the trouble list
            close = "q",                         -- close the list
            cancel = "<esc>",                    -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r",                       -- manually refresh
            jump = { "<cr>", "<tab>", '<C-o>' }, -- jump to the diagnostic or open / close folds
            open_split = { "do" },               -- open buffer in new split
            open_vsplit = { "du" },              -- open buffer in new vsplit
            open_tab = { "dk" },                 -- open buffer in new tab
            jump_close = { "o" },                -- jump to the diagnostic and close the list
            toggle_mode = "m",                   -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = "P",                -- toggle auto_preview
            hover = "gh",                        -- opens a small popup with the full multiline message
            preview = "p",                       -- preview the diagnostic location
            close_folds = { "zM", "zm" },        -- close all folds
            open_folds = { "zR", "zr" },         -- open all folds
            toggle_fold = { "zA", "za" },        -- toggle fold of current file
            previous = "i",                      -- previous item
            next = "k"                           -- next item
        },
    },
}


plugins:add {
    "L3mon4d3/luasnip",
    lazy = true,
    build = 'make install_jsregexp',
    keys = {
        { mode = 'x', '<C-q>', [["ec<cmd>lua require('luasnip.extras.otf').on_the_fly()<cr>]] },
        { mode = 'i', '<C-q>', [[<cmd>lua require('luasnip.extras.otf').on_the_fly("e")<cr>]] },
    },
    config = function()
        local snippets_folder = vim.fn.stdpath "config" .. "/lua/snips"
        local ls = require "luasnip"
        local types = require "luasnip.util.types"
        ls.config.set_config {
            history = true,
            updateevents = { "TextChanged", "TextChangedI" },
            region_check_events = { "CursorHold", "InsertLeave" },
            delete_check_events = { "TextChanged", "InsertEnter" },
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
    dependencies = "rafamadriz/friendly-snippets",
}

plugins:add {
    "hrsh7th/nvim-cmp",
    event = { 'InsertEnter', 'CmdlineEnter' },
    version = false,
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",

        -- { "jcdickinson/codeium.nvim", config = true },
        {
            "zbirenbaum/copilot.lua",
            opts = {
                panel = { enabled = false },
                auto_refresh = true,
                suggestion = {
                    enable = true,
                    auto_trigger = true,
                    keymap = false,
                },
                filetypes = {
                    markdown = true,
                },
            },
        },
    },
    config = function() require "plugins.lang.cmp" end
}

return plugins
