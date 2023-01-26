return {
    {
        "nvim-telescope/telescope.nvim",
        -- cmd = 'Telescope',
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy finder
            'nvim-telescope/telescope-ui-select.nvim'
        },
        branch = '0.1.x',
        config = function() require 'plugins.telescope.base' end
    },

    {
        "jvgrootveld/telescope-zoxide", -- powerful cd
        keys = {
            { '<leader>cd', '<cmd>Telescope zoxide list<cr>', desc = ' Cd recently directory' },
        },
    },

    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            { mode = 'x', '<Leader>rr', function()
                require('telescope').extensions.refactoring.refactors()
            end, desc = '🎈Refactoring Operations' },
        },
        config = function()
            require('telescope').load_extension("refactoring")
        end,
    }, --

    {
        "AckslD/nvim-neoclip.lua",
        event = 'VeryLazy',
        opts = {
            history = 500,
            enable_persistent_history = true,
            enable_macro_history = false,
            keys = {
                telescope = {
                    i = {
                        select = '<cr>',
                        paste = '<c-o>',
                        paste_behind = '<c-p>',
                        replay = '<c-r>', -- replay a macro
                        delete = '<c-d>', -- delete an entry
                    },
                    n = {
                        select = '<cr>',
                        paste = 'p',
                        paste_behind = 'P',
                        replay = 'r',
                        delete = 'd',
                    },
                },
            },
        },
        config = function(_, opts)
            require('neoclip').setup(opts)
            require("telescope").load_extension "neoclip"
            vim.keymap.set('n', '<leader><C-p>', '<Cmd>Telescope neoclip<cr>', { desc = '📋Clipboard History' })
        end
    },

    {
        'nvim-telescope/telescope-symbols.nvim',
        keys = {
            { '<leader>tm', '<cmd>Telescope symbols<cr>', desc = '🤠Search Symbols' }
        },
    },
    {
        "debugloop/telescope-undo.nvim",
        keys = {
            { '<leader>tu', '<cmd>Telescope undo<cr>', desc = ' Undo History' }
        },

        config = function()
            require("telescope").setup {
                extensions = {
                    undo = {
                        mappings = {
                            i = {
                                ['<CR>'] = require("telescope-undo.actions").restore,
                            },
                        }
                    }
                }
            }
            require("telescope").load_extension "undo"
        end,
    }
}
