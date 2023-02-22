local plugins = require("util.plugin")()

plugins:add {
    "nvim-lua/plenary.nvim",
    lazy = true,
}

plugins:add {
    "nvim-telescope/telescope.nvim",
    event = 'VimEnter',
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy finder
        'nvim-telescope/telescope-ui-select.nvim',

    },
    version = false,
    config = function() require 'plugins.telescope.base' end
}

plugins:add {
    "jvgrootveld/telescope-zoxide", -- powerful cd
    keys = {
        { '<leader>cd', '<Cmd>Telescope zoxide list<CR>', desc = ' Cd recently directory', }
    },
}

plugins:add {
    'nvim-telescope/telescope-symbols.nvim',
    keys = {
        { '<leader>tm', '<Cmd>Telescope symbols<CR>', desc = '🤠Search Symbols' }
    },
}

plugins:add {
    "AckslD/nvim-neoclip.lua",
    event = { 'BufReadPre', 'BufNewFile' },
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
    dependencies = 'kkharji/sqlite.lua',
    config = function(_, opts)
        require('neoclip').setup(opts)
        require("telescope").load_extension "neoclip"
        vim.keymap.set('n', '<leader><C-p>', '<Cmd>Telescope neoclip<cr>', { desc = '📋Clipboard History' })
        vim.keymap.set('n', '<leader>P', '<Cmd>Telescope neoclip unnamed<cr>', { desc = '📋Clipboard History for system' })
    end
}


plugins:add {
    "debugloop/telescope-undo.nvim",
    keys = {
        { '<leader>tu', '<Cmd>Telescope undo<CR>', desc = ' Undo History' }
    },
    config = function()
        require("telescope").setup {
            extensions = {
                undo = {
                    mappings = {
                        i = { ['<CR>'] = require("telescope-undo.actions").restore, },
                    }
                }
            }
        }
        require("telescope").load_extension "undo"
    end,
}

return plugins
