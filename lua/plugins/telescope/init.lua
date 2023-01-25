return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" }, -- lib
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy finder
            { 'nvim-telescope/telescope-ui-select.nvim', },
        },
        branch = '0.1.x',
        config = function() require 'plugins.telescope.base' end
    },
    -- {
    --     "jvgrootveld/telescope-zoxide", -- powerful cd
    --     keys = {
    --         '<leader>cd',
    --     },
    --     config = function()
    --         require("telescope").load_extension('zoxide')
    --         vim.keymap.set('n', '<leader>cd', "<cmd>Telescope zoxide list<cr>", { desc = ' Cd recently directory' })
    --     end,
    -- },
    -- {
    --     "nvim-telescope/telescope-project.nvim",
    --     keys = {
    --         '<C-p>',
    --     },
    --     config = function()
    --         local telescope = require('telescope')
    --         telescope.load_extension('project')
    --         vim.keymap.set('n', '<C-p>', telescope.extensions.project.project)
    --     end,
    -- }, --
    -- {
    --     "ThePrimeagen/refactoring.nvim",
    --     keys = {
    --         { 'x', '<Leader>rr' },
    --     },
    --     config = function() require 'plugins.telescope.refactor' end
    -- }, --
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

    -- {
    --     "AckslD/nvim-neoclip.lua",
    --     config = function() require 'plugins.telescope.neoclip' end
    -- },
    -- {
    --     'nvim-telescope/telescope-symbols.nvim',
    --     keys = {
    --         '<leader>tm'
    --     },
    --     config = function()
    --         vim.keymap.set('n', '<leader>tm', '<cmd>Telescope symbols<cr>', { desc = '🤠Search Symbols' })
    --     end,
    -- },
    -- {
    --     "debugloop/telescope-undo.nvim",
    --     keys = {
    --         '<leader>tu'
    --     },
    --     config = function()
    --         require("telescope").setup {
    --             extensions = {
    --                 undo = {
    --                     mappings = {
    --                         i = {
    --                             ['<CR>'] = require("telescope-undo.actions").restore,
    --                         },
    --                     }
    --                 }
    --             }
    --         }
    --         require("telescope").load_extension "undo"
    --         vim.keymap.set('n', '<leader>tu', '<cmd>Telescope undo<cr>', { desc = ' Undo History' })
    --     end,
    -- }
}
