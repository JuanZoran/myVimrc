local plugins = require 'util.plugin' ()

plugins:add {
    'JuanZoran/Trans.nvim',
    keys = {
        { 'mm', mode = { 'n', 'x' },       '<Cmd>Translate<CR>',             desc = ' Translate' },
        -- { 'mi', function() end, desc = 'Trans test' },
        { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
    },
    -- branch = '',
    dependencies = 'kkharji/sqlite.lua',
    opts = {
        frontend = {
            hover = {
                spinner = 'moon'
            },
        },
        dir = os.getenv 'HOME' .. '/.vim/dict',
    },
    dev = true,
}

plugins:add {
    'tweekmonster/helpful.vim',
    cmd = 'HelpfulVersion',
}

plugins:add {
    'chentoast/marks.nvim',
    keys = { 'm', { 'gm', '`', remap = true } },
    config = true,
}


plugins:add {
    'folke/todo-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require 'plugins.tools.todo-comments' end,
}

plugins:add {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        popup_mappings = {
            scroll_up = '<c-i>',   -- binding to scroll up inside the popup
            scroll_down = '<c-k>', -- binding to scroll down inside the popup
        },
        layout = {
            height = { min = 4, max = 25 },                                                      -- min and max height of the columns
            width = { min = 20, max = 50 },                                                      -- min and max width of the columns
            spacing = 3,                                                                         -- spacing between columns
            align = 'left',                                                                      -- align columns left, center or right
        },
        hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ', 'require' }, -- hide mapping boilerplate
        triggers_blacklist = {
            i = { 'i', 'k' },
            v = { 'i', 'k' },
        },
        window = {
            border = 'single', -- none, single, double, shadow
        },
        -- operators = {
        --     gc = "Comments",
        -- },
        plugins = {
            marks = true,         -- shows a list of your marks on ' and `
            registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true,     -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true,       -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = true,       -- default bindings on <c-w>
                nav = true,           -- misc bindings to work with windows
                z = true,             -- bindings for folds, spelling and others prefixed with z
                g = true,             -- bindings for prefixed with g
            },
        },
        disable = {
            filetypes = {},
            buftypes = { 'TelescopePrompt' },
        },
    },
}

plugins:add {
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown', 'md' },
    keys = {
        { 'mt', '<Cmd>TableModeToggle<CR>', desc = 'Toggle Markdown Table Mode' },
    },
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
    },
}

plugins:add {
    'CKolkey/ts-node-action',
    keys = {
        { '<leader>u', function() require 'ts-node-action'.node_action() end, desc = '🌀Trigger Node Action' },
    },
}

-- search/replace in multiple files
plugins:add {
    'windwp/nvim-spectre',
    keys = {
        { '<leader>sr', function() require 'spectre'.open() end, desc = 'Replace in files (Spectre)' },
        {
            '<leader>sw',
            function() require 'spectre'.open_visual { select_word = true } end,
            desc = 'Search current word',
        },
    },
}

plugins:add {
    'Vonr/align.nvim',
    keys = {
        { mode = 'x', '<leader>=', function() require 'align'.align_to_string(true, true, true) end },
    },
}

plugins:add { -- powerful comment with gc<char> | gb<char> | <leader>A
    'numtostr/Comment.nvim',
    keys = {
        { 'gc',        mode = { 'n', 'x' } },
        { '<leader>A', desc = 'Add Comment at end of line' },
    },
    opts = function()
        return {
            ignore = '^$',
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = '<Leader>A',
            },
            pre_hook = require 'ts_context_commentstring.integrations.comment_nvim'.create_pre_hook(),
        }
    end,
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
}


plugins:add {
    'jackMort/ChatGPT.nvim',
    cmd = { 'ChatGPT', 'ChatGPTActAs' },
    keys = {
        { mode = 'x', '<leader>ai', '<Cmd>ChatGPTEditWithInstructions<CR>', desc = 'Black Magic AI' },
    },
    config = true,
}

plugins:add {
    'mfussenegger/nvim-treehopper',
    keys = {
        { mode = 'x', 'm', ":<C-U>lua require('tsht').nodes()<CR>", silent = true },
        { mode = 'o', 'm', function() require 'tsht'.nodes() end },
    },
}

plugins:add {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
        check_ts = true,
        enable_abbr = true,
        fast_wrap = {
            map = '<C-;>',
            chars = { '{', '[', '(', '"', "'", '<' },
            pattern = [=[[%'%"%)%>%]%)%}%,]]=],
            offset = 1, -- Offset from pattern match
            end_key = 'l',
            -- keys = "qwertyuiopzxcvbnmasdfghjkl",
            keys = 'uiopghjkl',
            check_comma = true,
            highlight = 'PmenuSel',
            -- highlight_grey = "LineNr",
            highlight_grey = 'Comment',
        },
    },
}

plugins:add {
    'echasnovski/mini.surround',
    keys = {
        { mode = { 'n', 'x' }, 's' },
    },
    config = function()
        -- NOTE : special name
        require 'mini.surround'.setup {}
    end,
}

plugins:add {
    'LudoPinelli/comment-box.nvim',
    keys = {
        { mode = { 'n', 'x' }, '<leader>rk', "<Cmd>lua require('comment-box').accbox()<CR>", desc = 'Comment Center Box' },
        {
            mode = { 'n', 'x' },
            '<leader>rj',
            "<Cmd>lua require('comment-box').lbox()<CR>",
            desc = 'Comment Left Aligned Text'
        },
        { mode = { 'n', 'x' }, '<leader>rl', "<Cmd>lua require('comment-box').cline()<CR>",  desc = 'Comment Center Line' },
        { mode = { 'n', 'x' }, '<leader>ro', "<Cmd>lua require('comment-box').line()<CR>",   desc = 'Comment Center Line' },
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
        local action = require 'diffview.actions'
        return {
            keymaps = {
                file_panel = {
                    ['k'] = action.next_entry,
                    ['i'] = action.prev_entry,
                    ['<leader><leader>'] = action.listing_style,
                },
            },
        }
    end,
}


plugins:add {
    'olimorris/persisted.nvim',
    cmd = { 'SessionLoad', 'SessionLoadLast' },
    keys = {
        { '<leader>ss', '<Cmd>Telescope persisted<CR>', desc = 'Check out the Session' },
    },
    opts = {
        use_git_branch = true, -- create session files based on the branch of the git enabled repository
        should_autosave = function()
            -- do not autosave if the alpha dashboard is the current filetype
            return vim.bo.filetype ~= 'alpha'
        end,
        on_autoload_no_session = function()
            vim.notify 'Session Not Exist'
        end,
        autosave = false, -- automatically save session files when exiting Neovim
    },
    init = function()
        vim.api.nvim_create_autocmd('VimLeavePre', {
            callback = function()
                require 'persisted'.save()
            end,
        })
    end,
    config = function(_, opts)
        vim.opt.sessionoptions = 'buffers,curdir,folds,winsize,winpos,help'
        require 'telescope'.load_extension 'persisted' -- To load the telescope extension
        require 'persisted'.setup(opts)
    end,
}


plugins:add {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        { '<leader>gi', '<Cmd>Gitsigns preview_hunk_inline<CR>' },
        { '<leader>gd', '<Cmd>Gitsigns diffthis<CR>' },
        { '<leader>gs', '<Cmd>Gitsigns show<CR>' },
        { '<leader>gr', '<Cmd>Gitsigns reset_buffer<CR>' },
    },
    opts = {
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        signs = {
            add = { text = '▎' },
            change = { text = '▎' },
            delete = { text = '' },
            topdelete = { text = '' },
            changedelete = { text = '▎' },
            untracked = { text = '▎' },
        },
    },
}


plugins:add {
    'folke/zen-mode.nvim',
    keys = {
        { '<leader><leader>h', '<Cmd>ZenMode<CR>', desc = 'Toggle Zen Mode' },
    },
    dependencies = {
        'folke/twilight.nvim',
        opts = { context = 20 },
    },
    opts = {
        window = { width = 0.85 },
    },
}


plugins:add {
    'ggandor/leap.nvim',
    config = function() require 'plugins.tools.leap' end,
    keys = {
        { mode = { 'x', 'o', 'n' }, '<leader>j',         '<Plug>(leap-backward-to)',  desc = 'Jump backward' },
        { mode = { 'x', 'o', 'n' }, '<leader><leader>l', '<Plug>(leap-cross-window)', desc = 'Jump cross window' },
        { mode = { 'x', 'o', 'n' }, '<leader>l',         '<Plug>(leap-forward-to)',   desc = 'Jump forward' },
    },
    dependencies = {
        'ggandor/flit.nvim',
        keys = { 'f', 'F', 't', 'T' },
        opts = {
            -- A string like "nv", "nvo", "o", etc.
            labeled_modes = 'v',
            multiline = true,
        },
    },
}


return plugins
