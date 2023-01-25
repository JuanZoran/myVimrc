return {
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    },


    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require 'plugins.tools.todo-comments' end,
    },


    {
        "folke/which-key.nvim",
        config = function() require "plugins.tools.which-key" end,
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown", "md" },
        run = vim.fn["mkdp#util#install"]
    },
    {
        'CKolkey/ts-node-action',
        keys = {
            { "n", "<leader>u" },
        },
        config = [[require'plugins.tools.toggle']]
    },

    {
        'akinsho/toggleterm.nvim',
        keys = {
            '<C-d>',
            '<C-g>',
        },
        config = [[require"plugins.tools.toggleterm"]],
    },

    {
        'Vonr/align.nvim',
        module = 'align',
    },

    { -- powerful comment with gc<char> | gb<char> | <leader>A
        "numtostr/comment.nvim",
        config = [[require'plugins.tools.comment']],
    },


    {
        "windwp/nvim-autopairs",
        config = function() require "plugins.tools.autopairs" end,
    },


    {
        "olimorris/persisted.nvim",
        config = function() require 'plugins.tools.session' end,
    },


    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim", module = 'plenary' },



        config = function() require 'plugins.tools.gitsigns' end,
    },


    {
        "folke/zen-mode.nvim",
        keys = { { 'n', '<leader><leader>h' } },



        config = function() require 'plugins.tools.zen' end,
    },


    {
        "folke/twilight.nvim",
        module = 'twilight',
    },


    {
        "ggandor/leap.nvim",
        config = function() require 'plugins.tools.leap' end,
        dependencies = {
            'ggandor/flit.nvim',
        }
    },
    {
        dir = "~/project/Neovim/Trans",
        keys = {
            { 'mm', mode = { 'n', 'x' } },
            'mi',
        },
        dependencies = 'kkharji/sqlite.lua',
        config = function()
            require "Trans".setup {
                -- theme = 'tokyonight',
            }
            vim.keymap.set({ "x", 'n' }, "mm", '<Cmd>Translate<CR>', { desc = ' Translate' })
            vim.keymap.set("n", "mi", "<Cmd>TranslateInput<CR>", { desc = ' Translate From Input' })
        end,
    }
}
