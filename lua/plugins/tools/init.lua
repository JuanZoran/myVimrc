local plugins = require("util.plugin")()

plugins:add {
    "folke/todo-comments.nvim",
    event = 'VeryLazy',
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require 'plugins.tools.todo-comments' end,
}


plugins:add {
    "folke/which-key.nvim",
    opts = {
        plugins = {
            marks = false, -- shows a list of your marks on ' and `
            registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 30, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments", },
        popup_mappings = {
            scroll_up = "<c-i>", -- binding to scroll up inside the popup
            scroll_down = "<c-k>", -- binding to scroll down inside the popup
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "require" }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        triggers = "auto", -- automatically setup triggers
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            i = { "i", "k" },
            v = { "i", "k" },
        },
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0
        },
        -- disable the WhichKey popup for certain buf types and file types.
        -- Disabled by deafult for Telescope
        disable = {
            filetypes = {},
            buftypes = { "TelescopePrompt", "NvimTree" },
        },

        -- triggers = {"<leader>"} -- or specify a list manually
        -- icons = {
        --     breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        --     separator = "", -- symbol used between a key and it's label
        --     group = "", -- symbol prepended to a group
        -- },
    }
}


plugins:add {
    {
        'dhruvasagar/vim-table-mode',
        keys = {
            { 'mt', '<Cmd>TableModeToggle<CR>', desc = 'Toggle Markdown Table Mode' },
        },
        ft = { 'md', 'markdown' },
        dependencies = {
            'ellisonleao/glow.nvim',
            opts = {
                border = 'rounded',
                style = 'dark',
                width = 100,
                width_ratio = 0.9,
                height_ratio = 0.85,
            },
            keys = {
                { 'mp', '<Cmd>Glow<CR>', desc = 'Open Markdown Preview' },
            },
        }
    },
}

plugins:add {
    'CKolkey/ts-node-action',
    keys = {
        { "<leader>u", function() require("ts-node-action").node_action() end, desc = "🌀Trigger Node Action", }
    },
}


local lazygit
plugins:add {
    'akinsho/toggleterm.nvim',
    keys = {
        '<C-d>',
        { '<C-g>', function()
            if not lazygit then lazygit = require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true }) end
            lazygit:toggle()
        end },
    },
    opts = {
        open_mapping = [[<C-d>]],
        autochdir = true,
        direction = 'float', --[[ 'vertical' | 'horizontal' | 'tab' | 'float', ]]
        float_opts = {
            border = 'curved'
        }
    },
}

plugins:add {
    'Vonr/align.nvim',
    keys = {
        { mode = 'x', "<leader>=", function() require 'align'.align_to_string(true, true, true) end, }
    }
}

plugins:add { -- powerful comment with gc<char> | gb<char> | <leader>A
    "numtostr/Comment.nvim",
    keys = {
        { 'gc', mode = { 'n', 'x' } },
        '<leader>A',
    },
    opts = {
        ignore = '^$',
        extra = {
            ---Add comment on the line above
            above = "gcO",
            ---Add comment on the line below
            below = "gco",
            ---Add comment at the end of line
            eol = "<Leader>A",
        },
    },
}

plugins:add {
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
}


plugins:add {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    config = function()
        -- NOTE : special name
        require('mini.surround').setup {
            mappings = {
                suffix_last = 'p', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            }
        }
    end
}


-- plugins:add {
--     "olimorris/persisted.nvim",
--     -- cmd = 'SessionLoad',
--     event = 'VimEnter',
--     keys = {
--         { '<leader>ss', '<CMD>Telescope persisted<CR>', desc = 'Check out the Session', }
--     },
--     config = function()
--         require("telescope").load_extension("persisted") -- To load the telescope extension
--         require("persisted").setup {
--             use_git_branch = true, -- create session files based on the branch of the git enabled repository
--             should_autosave = function()
--                 -- do not autosave if the alpha dashboard is the current filetype
--                 return vim.bo.filetype ~= 'alpha'
--             end,
--             on_autoload_no_session = function()
--                 print('Session Not Exist')
--             end,
--             autosave = true, -- automatically save session files when exiting Neovim
--             -- save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
--             -- command = "VimLeavePre", -- the autocommand for which the session is saved
--             -- silent = false, -- silent nvim message when sourcing session file
--             -- should_autosave = nil, -- function to determine if a session should be autosaved
--             -- autoload = false, -- automatically load the session for the cwd on Neovim startup
--             -- follow_cwd = true, -- change session file name to match current working directory if it changes
--             -- allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
--             -- ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
--             -- before_save = nil, -- function to run before the session is saved to disk
--             -- after_save = nil, -- function to run after the session is saved to disk
--             -- after_source = nil, -- function to run after the session is sourced
--             -- telescope = { -- options for the telescope extension
--             --     before_source = nil, -- function to run before the session is sourced via telescope
--             --     after_source = nil, -- function to run after the session is sourced via telescope
--             --     reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
--             -- },
--         }
--     end
-- }


plugins:add {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = 'VeryLazy',
    keys = {
        { '<leader>gi', '<Cmd>Gitsigns preview_hunk_inline<CR>' },
        { '<leader>gd', '<Cmd>Gitsigns diffthis<CR>' },
        { '<leader>gs', '<Cmd>Gitsigns show<CR>' },
        { '<leader>gr', '<Cmd>Gitsigns reset_buffer<CR>' },
    },
    opts = {
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    },
}

plugins:add {
    "folke/zen-mode.nvim",
    keys = { '<leader><leader>h', '<Cmd>ZenMode<CR>' },
    dependencies = {
        "folke/twilight.nvim",
        opts = { context = 20 },
    },
    opts = {
        window = { width = 0.85, },
    },
}


plugins:add {
    "ggandor/leap.nvim",
    config = function() require 'plugins.tools.leap' end,
    keys = {
        { mode = { 'x', 'o', 'n' }, '<leader>j',         '<Plug>(leap-backward-to)',  desc = '⬅️ quick jump backward' },
        { mode = { 'x', 'o', 'n' }, '<leader><leader>l', '<Plug>(leap-cross-window)', desc = '💪quick jump cross window' },
        { mode = { 'x', 'o', 'n' }, '<leader>l',         '<Plug>(leap-forward-to)',   desc = '➡️ quick jump forward' },
    },
    dependencies = {
        'ggandor/flit.nvim',
        keys = { 'f', 'F', 't', 'T' },
        opts = {
            -- A string like "nv", "nvo", "o", etc.
            labeled_modes = "v",
            multiline = true,
        }
    },
}

return plugins
