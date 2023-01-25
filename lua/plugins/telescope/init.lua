return {
    {
        "nvim-telescope/telescope.nvim",
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

    -- {
    --     "nvim-telescope/telescope-project.nvim",
    --     keys = {
    --         { '<C-p>', '<cmd>Telescope project<cr>', desc = '[] select project' },
    --     },
    -- }, --

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

    -- {
    --     "brandoncc/telescope-harpoon.nvim", -- list
    --     keys = {
    --         '<Leader>hh',
    --         '<Leader>hi',
    --         '<Leader>hj',
    --         '<Leader>hl',
    --         '<Leader>hc',
    --         '<Leader>hm',
    --     },
    --     config = function() require 'plugins.telescope.harpoon' end,
    --     dependencies = { {
    --         "theprimeagen/harpoon",
    --     } }
    -- }, -- list

    {
        "AckslD/nvim-neoclip.lua",
        config = function() require 'plugins.telescope.neoclip' end
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
