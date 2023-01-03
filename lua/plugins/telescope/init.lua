local use = require("packer").use

use {
    "nvim-telescope/telescope.nvim",
    requires = {
        { "nvim-lua/plenary.nvim", opt = true }, -- lib
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fuzzy finder
        { 'nvim-telescope/telescope-ui-select.nvim', },
    },
    config = [[require 'plugins.telescope.base']]
}

use {
    "jvgrootveld/telescope-zoxide", -- powerful cd
    keys = {
        { 'n', '<leader>cd' },
    },
    config = function()
        require("telescope").load_extension('zoxide')
        vim.keymap.set('n', '<leader>cd', "<cmd>Telescope zoxide list<cr>", { desc = ' Cd recently directory' })
    end,
}

use {
    "nvim-telescope/telescope-project.nvim",
    keys = {
        { 'n', '<C-p>' },
    },
    config = function()
        local telescope = require('telescope')
        telescope.load_extension('project')
        vim.keymap.set('n', '<C-p>', telescope.extensions.project.project)
    end,
} -- project

use {
    "ThePrimeagen/refactoring.nvim",
    keys = {
        { 'v', '<Leader>rr' },
    },
    config = [[require 'plugins.telescope.refactor']]
} -- list


use {
    "brandoncc/telescope-harpoon.nvim", -- list
    keys = {
        { 'n', '<Leader>hh' },
        { 'n', '<Leader>hi' },
        { 'n', '<Leader>hj' },
        { 'n', '<Leader>hl' },
        { 'n', '<Leader>hc' },
        { 'n', '<Leader>hm' },
    },
    config = [[require 'plugins.telescope.harpoon']],
    requires = { {
        "theprimeagen/harpoon",
        opt = true
    } }
} -- list


use {
    "nvim-telescope/telescope-frecency.nvim",
    keys = {
        { 'n', '<C-y>' },
    },
    requires = { "kkharji/sqlite.lua", opt = true },
    config = function()
        require("telescope").load_extension("frecency")
        vim.keymap.set('n', '<C-y>', '<cmd>Telescope frecency<cr>') -- []Recently File Sorted by Frequency
    end
} -- list

use {
    "AckslD/nvim-neoclip.lua",
    config = [[require 'plugins.telescope.neoclip']]
}

use {
    "xiyaowong/telescope-emoji.nvim",
    keys = {
        'n', '<leader>tm'
    },
    config = function()
        require("telescope").load_extension "emoji"
        vim.keymap.set('n', '<leader>tm', '<cmd>Telescope emoji<cr>', { desc = '🤠Search Emoji' })
    end,
}

use {
    "debugloop/telescope-undo.nvim",
    keys = {
        'n', '<leader>tu'
    },
          -- ["<cr>"] = require("telescope-undo.actions").yank_additions,
          -- ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
          -- ["<C-cr>"] = require("telescope-undo.actions").restore,
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
        vim.keymap.set('n', '<leader>tu', '<cmd>Telescope undo<cr>', { desc = '[]Undo History' })
    end,
}
