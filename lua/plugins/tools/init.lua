local plugins = require("util.plugin")()

plugins:add {
    "JuanZoran/Trans.nvim",
    keys = {
        { 'mm', mode = { 'n', 'x' },       '<Cmd>Translate<CR>',             desc = ' Translate' },
        { 'mk', mode = { 'n', 'x' },       '<Cmd>TransPlay<CR>',             desc = ' 自动发音' },
        { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
    },
    dependencies = 'kkharji/sqlite.lua',
    opts = {
        frontend = {
            hover = {
                spinner = 'moon'
            }
        }
    },
    dev = true,
}

plugins:add {
    "folke/todo-comments.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require 'plugins.tools.todo-comments' end,
}

plugins:add {
    "folke/which-key.nvim",
    event = 'VeryLazy',
    opts = {
        plugins = {
            marks = false,        -- shows a list of your marks on ' and `
            registers = false,    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 30, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true,     -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true,       -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false,      -- default bindings on <c-w>
                nav = false,          -- misc bindings to work with windows
                z = true,             -- bindings for folds, spelling and others prefixed with z
                g = true,             -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments", },
        popup_mappings = {
            scroll_up = "<c-i>",   -- binding to scroll up inside the popup
            scroll_down = "<c-k>", -- binding to scroll down inside the popup
        },
        layout = {
            height = { min = 4, max = 25 },                                                      -- min and max height of the columns
            width = { min = 20, max = 50 },                                                      -- min and max width of the columns
            spacing = 3,                                                                         -- spacing between columns
            align = "left",                                                                      -- align columns left, center or right
        },
        ignore_missing = false,                                                                  -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "require" }, -- hide mapping boilerplate
        show_help = true,                                                                        -- show help message on the command line when the popup is visible
        show_keys = true,                                                                        -- show the currently pressed key and its label as a message in the command line
        triggers = "auto",                                                                       -- automatically setup triggers
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            i = { "i", "k" },
            v = { "i", "k" },
        },
        window = {
            border = "single",        -- none, single, double, shadow
            position = "bottom",      -- bottom, top
            margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
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

-- plugins:add {
--     'toppair/peek.nvim',
--     build = 'deno task --quiet build:fast',
-- }

plugins:add {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "md" },
    keys = {
        { 'mp', '<Plug>MarkdownPreviewToggle', desc = 'Toggle Markdown Preview' }
    },
    build = function() vim.fn["mkdp#util#install"]() end,
    dependencies = {
        {
            'dhruvasagar/vim-table-mode',
            keys = {
                { 'mt', '<Cmd>TableModeToggle<CR>', desc = 'Toggle Markdown Table Mode' },
            },
        },
    }
}

plugins:add {
    'CKolkey/ts-node-action',
    keys = {
        { "<leader>u", function() require("ts-node-action").node_action() end, desc = "🌀Trigger Node Action", }
    },
}

-- search/replace in multiple files
plugins:add {
    "windwp/nvim-spectre",
    keys = {
        { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
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
        { 'gc',        mode = { 'n', 'x' } },
        { '<leader>A', desc = 'Add Comment at end of line' },
    },
    opts = function()
        return {
            ignore = '^$',
            extra = {
                ---Add comment on the line above
                above = "gcO",
                ---Add comment on the line below
                below = "gco",
                ---Add comment at the end of line
                eol = "<Leader>A",
            },
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end,
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
}


plugins:add {
    'jackMort/ChatGPT.nvim',
    cmd = { 'ChatGPT', 'ChatGPTActAs', },
    keys = {
        { mode = 'x', '<leader>ai', '<Cmd>ChatGPTEditWithInstructions<CR>', desc = 'Black Magic AI' },
    },
    config = true,
}

plugins:add {
    'mfussenegger/nvim-treehopper',
    keys = {
        { mode = 'x', 'm', ":<C-U>lua require('tsht').nodes()<CR>", silent = true },
        { mode = 'o', 'm', function() require('tsht').nodes() end, },
    }
}

plugins:add {
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    opts = {
        check_ts = true,
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
    keys = {
        { mode = { 'n', 'x' }, 's' }
    },
    config = function()
        -- NOTE : special name
        require('mini.surround').setup {}
    end
}

plugins:add {
    "LudoPinelli/comment-box.nvim",
    keys = {
        { mode = { 'n', 'x' }, "<leader>rk", "<Cmd>lua require('comment-box').accbox()<CR>", desc = "Comment Center Box" },
        {
            mode = { 'n', 'x' },
            "<leader>rj",
            "<Cmd>lua require('comment-box').lbox()<CR>",
            desc =
            "Comment Left Aligned Text"
        },
        { mode = { 'n', 'x' }, "<leader>rl", "<Cmd>lua require('comment-box').cline()<CR>",  desc = "Comment Center Line" },
        { mode = { 'n', 'x' }, "<leader>ro", "<Cmd>lua require('comment-box').line()<CR>",   desc = "Comment Center Line" },
        -- { mode = { 'n', 'x' }, "<leader>ru", "<Cmd>lua require('comment-box').acbox()<CR>", desc = "Comment Left Box" },
    },
}

plugins:add {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
    keys = {
        { '<Leader>dw', '<Cmd>DiffviewToggleFiles<CR>',  desc = 'Toggle Diff Files' },
        { '<Leader>dF', '<Cmd>DiffviewFileHitory %<CR>', desc = 'Open Diff History For Current File' },
    },
    opts = function()
        local action = require('diffview.actions')
        return {
            keymaps = {
                file_panel = {
                    ['k'] = action.next_entry,
                    ['i'] = action.prev_entry,
                    ['<leader><leader>'] = action.listing_style,
                },
            }
        }
    end,
}

plugins:add {
    'glepnir/nerdicons.nvim',
    keys = {
        { '<leader>ni', '<Cmd>NerdIcons<CR>', desc = 'NerdIcons' },
    },
    opts = {
        border = 'rounded',
        down = '<C-k>',
        up = '<C-i>',
        copy = '<C-o>',
    },
}


plugins:add {
    "olimorris/persisted.nvim",
    cmd = { 'SessionLoad', 'SessionLoadLast' },
    keys = {
        { '<leader>ss', '<Cmd>Telescope persisted<CR>', desc = 'Check out the Session', }
    },
    opts = {
        use_git_branch = true, -- create session files based on the branch of the git enabled repository
        should_autosave = function()
            -- do not autosave if the alpha dashboard is the current filetype
            return vim.bo.filetype ~= 'alpha'
        end,
        on_autoload_no_session = function()
            vim.notify('Session Not Exist')
        end,
        autosave = false, -- automatically save session files when exiting Neovim
    },
    init = function()
        vim.api.nvim_create_autocmd('VimLeavePre', {
            callback = function()
                require('persisted').save()
            end,
        })
    end,
    config = function(_, opts)
        vim.opt.sessionoptions = "buffers,curdir,folds,winsize,winpos,help"
        require("telescope").load_extension("persisted") -- To load the telescope extension
        require("persisted").setup(opts)
    end,
}


plugins:add {
    "lewis6991/gitsigns.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
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
    keys = {
        { '<leader><leader>h', '<Cmd>ZenMode<CR>', desc = 'Toggle Zen Mode' }
    },
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
