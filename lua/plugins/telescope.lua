local use = require("packer").use
use {
    "nvim-telescope/telescope.nvim",
    cmd = 'Telescope',
    requires = {
        { "nvim-lua/plenary.nvim", opt = true }, -- lib
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fuzzy finder
        { 'nvim-telescope/telescope-ui-select.nvim' },
    },
}

use {
    "jvgrootveld/telescope-zoxide", -- powerful cd
    module = 'telescope._extensions.zoxide',
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
    config = [[require 'conf.refactor']]
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
    config = function()
        require('conf.harpoon')
    end,
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
    keys = {
        { 'n', '<leader>tg' },
    },
    config = function()
        require("neoclip").setup()
        require("telescope").load_extension "neoclip"
        vim.keymap.set('n', '<leader>tg', '<cmd>Telescope neoclip<cr>', { desc = '[]Clipboard History' })
    end,
}
