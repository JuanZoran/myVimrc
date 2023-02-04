local telescope = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy finder
        'nvim-telescope/telescope-ui-select.nvim'
    },
    branch = '0.1.x',
    config = function() require 'plugins.telescope.base' end
}


local zoxide = {
    "jvgrootveld/telescope-zoxide", -- powerful cd
    keys = {
        { '<leader>cd', '<cmd>Telescope zoxide list<cr>', desc = ' Cd recently directory', }
    },
}

local neoclip = {
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
        vim.keymap.set('n', '<leader>P', '<Cmd>Telescope neoclip unnamed<cr>', { desc = '📋Clipboard History for system' })
    end

}

local symbols = {
    'nvim-telescope/telescope-symbols.nvim',
    keys = {
        { '<leader>tm', '<Cmd>Telescope symbols<CR>', desc = '🤠Search Symbols' }
    },
}


local undo = {
    "debugloop/telescope-undo.nvim",
    keys = {
        { '<leader>tu', '<cmd>Telescope undo<cr>', desc = ' Undo History' }
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

return {
    telescope,
    zoxide,
    neoclip,
    symbols,
    undo,
}
