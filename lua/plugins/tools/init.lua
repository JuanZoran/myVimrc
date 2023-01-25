return {
    {
        "folke/todo-comments.nvim",
        event = 'VeryLazy',
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
        build = vim.fn["mkdp#util#install"],
    },

    {
        'CKolkey/ts-node-action',
        keys = {
            { "<leader>u", function() require("ts-node-action").node_action() end, desc = "🌀Trigger Node Action", },
        },
    },

    {
        'akinsho/toggleterm.nvim',
        keys = {
            '<C-d>',
            { '<C-g>', function()
                require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true }):toggle()
            end },
        },
        opts = {
            open_mapping = [[<C-d>]],
            -- autochdir = false,
            direction = 'float', --[[ 'vertical' | 'horizontal' | 'tab' | 'float', ]]
            float_opts = {
                border = 'curved'
            }
        },
    },


    {
        'Vonr/align.nvim',
        keys = {
            { mode = 'x', "<leader>=", function()
                require 'align'.align_to_string(true, true, true)
            end },
        }
    },

    { -- powerful comment with gc<char> | gb<char> | <leader>A
        "numtostr/comment.nvim",
        keys = {
            { 'gc', mode = { 'n', 'x' } }, '<leader>A'
        },
        opts = {
            ignore = '^$',
            extra = {
                -- -Add comment on the line above
                above = "gcO",
                ---Add comment on the line below
                below = "gco",
                ---Add comment at the end of line
                eol = "<Leader>A",
            },
        },
    },

    {
        "windwp/nvim-autopairs",
        opts = {
            -- check_ts = true,
            enable_abbr = true,
            fast_wrap = {
                map = "<C-r>",
                chars = { "{", "[", "(", '"', "'", "<" },
                pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                offset = 1, -- Offset from pattern match
                end_key = "l",
                -- keys = "qwertyuiopzxcvbnmasdfghjkl",
                keys = "uiopghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                -- highlight_grey = "LineNr",
                highlight_grey = "Comment",
            },
        },
    },


    {
        "olimorris/persisted.nvim",
        config = function() require 'plugins.tools.session' end,
    },

    {
        "lewis6991/gitsigns.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require 'plugins.tools.gitsigns' end,
    },

    {
        "folke/zen-mode.nvim",
        keys = {
            { '<leader><leader>h', '<Cmd>ZenMode<CR>' }
        },
        dependencies = {
            "folke/twilight.nvim",
            opts = { context = 20 },
        },
        opts = {
            window = {
                width = .85,
            },
        },
    },

    {
        "ggandor/leap.nvim",
        config = function() require 'plugins.tools.leap' end,
        keys = {
            { mode = '', '<leader>j', '<Plug>(leap-backward-to)', desc = '⬅️ quick jump backward' },
            { mode = '', '<leader><leader>l', '<Plug>(leap-cross-window)', desc = '💪quick jump cross window' },
            { mode = '', '<leader>l', '<Plug>(leap-forward-to)', desc = '➡️ quick jump forward' },
        },
        dependencies = {
            {
                'ggandor/flit.nvim',
                opts = {
                    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
                    -- A string like "nv", "nvo", "o", etc.
                    labeled_modes = "v",
                    multiline = true,
                    -- Like `leap`s similar argument (call-specific overrides).
                    -- E.g.: opts = { equivalence_classes = {} }
                    opts = {}
                }
            },
        }
    },
    {
        dir = "~/project/Neovim/Trans",
        keys = {
            { 'mm', mode = { 'n', 'x' }, '<Cmd>Translate<CR>', desc = ' Translate' },
            { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
        },
        dependencies = 'kkharji/sqlite.lua',
        config = true,
    }
}
