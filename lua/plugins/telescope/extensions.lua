local plugins = require 'util.plugin'()
plugins:add {
    'jvgrootveld/telescope-zoxide', -- powerful cd
    keys = {
        { '<leader>cd', '<cmd>Telescope zoxide list<cr>', desc = ' Cd recently directory' },
    },
}

plugins:add {
    'AckslD/nvim-neoclip.lua',
    event = 'TextYankPost',
    keys = {
        { '<leader><C-p>', '<Cmd>Telescope neoclip<cr>',         desc = '📋Clipboard History' },
        { '<leader>P',     '<Cmd>Telescope neoclip unnamed<cr>', desc = '📋Clipboard History for system' },
    },

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
        require 'neoclip'.setup(opts)
        require 'telescope'.load_extension 'neoclip'
    end,

}

plugins:add {
    'nvim-telescope/telescope-symbols.nvim',
    keys = {
        { '<leader>mm', '<Cmd>Telescope symbols<CR>', desc = '🤠Search Symbols' },
    },
}

plugins:add {
    'nvim-telescope/telescope-project.nvim',
    keys = {
        { '<C-p>', function() require 'telescope'.extensions.project.project {} end },
    },
}

plugins:add {
    'nvim-telescope/telescope-ui-select.nvim',
    init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
            require 'lazy'.load { plugins = { 'telescope-ui-select.nvim' } }
            return vim.ui.select(...)
        end
    end,
    lazy = true,
    config = function() require 'telescope'.load_extension 'ui-select' end,
}



plugins:add {
    'debugloop/telescope-undo.nvim',
    keys = {
        { '<leader>tu', '<cmd>Telescope undo<cr>', desc = ' Undo History' },
    },
    config = function()
        require 'telescope'.setup {
            extensions = {
                undo = {
                    mappings = {
                        i = { ['<CR>'] = require 'telescope-undo.actions'.restore },
                    },
                },
            },
        }
        require 'telescope'.load_extension 'undo'
    end,
}

plugins:add {
    'renerocksai/telekasten.nvim',
    keys = {
        { 'mn', '<cmd>Telekasten panel<cr>', desc = '📚Telekasten' },
    },
}

return plugins
