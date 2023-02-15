local plugins = require("util.plugin")()
plugins:add {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy finder
        'nvim-telescope/telescope-ui-select.nvim'
    },
    branch = '0.1.x',
    config = function() require 'plugins.telescope.base' end
}

plugins:add {
    "jvgrootveld/telescope-zoxide", -- powerful cd
    keys = {
        { '<leader>cd', '<cmd>Telescope zoxide list<cr>', desc = ' Cd recently directory', }
    },
}

plugins:add {
    'nvim-telescope/telescope-symbols.nvim',
    keys = {
        { '<leader>tm', '<Cmd>Telescope symbols<CR>', desc = '🤠Search Symbols' }
    },
}


plugins:add {
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

return plugins
