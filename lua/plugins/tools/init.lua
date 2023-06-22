local plugins = util.list()

plugins:add {
    import = 'plugins.tools.extra',
}

plugins:add {
    'JuanZoran/Trans.nvim',
    keys = {
        { 'mm', mode = { 'n', 'x' },       '<Cmd>Translate<CR>',             desc = 'Translate' },
        { 'mk', mode = { 'n', 'x' },       '<Cmd>TransPlay<CR>',             desc = 'Auto Play' },
        -- { 'mi', function() end, desc = 'Trans test' },
        { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
    },
    -- lazy = false,
    dependencies = 'kkharji/sqlite.lua',
    opts = {
        frontend = {
            hover = {
                spinner = 'moon',
                keymaps = {
                    -- pageup       = '<C-u>',
                    -- pagedown     = '<C-d>',
                    pageup       = '[[',
                    pagedown     = ']]',
                    pin          = '<leader>[',
                    close        = '<leader>]',
                    toggle_entry = '<leader>;',
                },
                -- animation = {
                --     open = false,
                --     close = false,
                -- }
            },
        },
        dir = os.getenv 'HOME' .. '/.vim/dict',
    },
    dev = true,
}

plugins:add {
    'JuanZoran/template',
    lazy = false,
    keys = {
        { '<leader><leader>t',    function() require 'template'.create() end, desc = '🔨Create New Template' },
        { '<leader><leader><CR>', function() require 'template'.select() end, desc = '🌳Edit Template' },
        { '<leader><leader>d',    function() require 'template'.delete() end, desc = '❌Remove Template' },
    },
    opts = {
        template_dir = vim.fn.stdpath 'config' .. '/lua/template',
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
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    ft = 'norg',
    cmd = 'Neorg',
    opts = {
        load = {
            ['core.defaults'] = {},  -- Loads default behaviour
            ['core.concealer'] = {}, -- Adds pretty icons to your documents
            ['core.dirman'] = {      -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = '~/notes',
                    },
                },
            },
        },
    },
}


plugins:add {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'md' },
    keys = { { 'mp', '<Plug>MarkdownPreviewToggle', desc = 'Toggle Markdown Preview' } },
    build = function() vim.fn['mkdp#util#install']() end,
    dependencies = {
        {
            'dhruvasagar/vim-table-mode',
            keys = {
                { 'mt', '<Cmd>TableModeToggle<CR>', desc = 'Toggle Markdown Table Mode' },
            },
        },
    },
}

plugins:add {
    'AckslD/nvim-FeMaco.lua',
    cmd = 'FeMaco',
    opts = {
    },
}


plugins:add {
    'lukas-reineke/headlines.nvim',
    ft = { 'markdown', 'md', 'norg' },
    config = function()
        require 'headlines'.setup()
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, 'CodeBlock', { bg = 'NONE' })
        -- for i, color in ipairs {
        --     { fg = '#a6d189', bg = 'NONE' },
        --     { fg = '#8caaee', bg = 'NONE' },
        --     { fg = '#e78284', bg = 'NONE' },
        --     { fg = '#ca9ee6', bg = 'NONE' },
        --     { fg = '#e5c890', bg = 'NONE' },
        --     { fg = '#babbf1', bg = 'NONE' },
        -- } do set_hl(0, 'Headline' .. i, color) end
        -- set_hl(0, 'Headline', { link = 'Headline1' })
    end,
}


plugins:add {
    'CKolkey/ts-node-action',
    keys = {
        { '<leader>u', function() require 'ts-node-action'.node_action() end, desc = 'Trigger Node Action' },
    },
}

-- search/replace in multiple files
plugins:add {
    'windwp/nvim-spectre', -- dependencies: rg, sed
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
    opts = {
        -- ignore = '^$',
        extra = {
            ---Add comment on the line above
            above = 'gcO',
            ---Add comment on the line below
            below = 'gco',
            ---Add comment at the end of line
            eol = '<Leader>A',
        },
    },
    config = function(_, opts)
        require 'Comment'.setup(opts)
        local ft = require 'Comment.ft'
        ft.set('rasi', { '//%s', '/*%s*/' })
    end,
}


plugins:add {
    'echasnovski/mini.surround',
    keys = {
        { 'sF', desc = 'Find' },
        { 'sd', desc = 'Delete', mode = { 'x', 'n' } },
        { 'sa', desc = 'Add',    mode = { 'x', 'n' } },
        { 'sf', desc = 'find' },
        { 'sr', desc = 'replace' },
        { 's?', desc = 'custom', mode = 'x' },
    },
    config = function()
        -- NOTE : special name
        require 'mini.surround'.setup {}
        local set = vim.keymap.set
        local opt = { remap = true }
        for _, char in ipairs { 'sa', 'sd', 'sf', 'sF', 'sr' } do
            set('x', char .. 'q', char .. "'", opt)
        end
    end,
}

plugins:add {
    'LudoPinelli/comment-box.nvim',
    keys = {
        {
            mode = { 'n', 'x' },
            '<leader>rj',
            "<Cmd>lua require('comment-box').llbox()<CR>",
            desc = 'Comment Left Box',
        },
        {
            mode = { 'n', 'x' },
            '<leader>rk',
            "<Cmd>lua require('comment-box').lcbox()<CR>",
            desc = 'Comment Center Box',
        },
        {
            mode = { 'n', 'x' },
            '<leader>rl',
            "<Cmd>lua require('comment-box').lrbox()<CR>",
            desc = 'Comment Right Box',
        },
        {
            '<leader>ru',
            "<Cmd>lua require('comment-box').line()<CR>",
            desc = 'Comment Left Line',
        },
        {
            '<leader>ri',
            "<Cmd>lua require('comment-box').cline()<CR>",
            desc = 'Comment Center Line',
        },
        {
            '<leader>ro',
            "<Cmd>lua require('comment-box').rline()<CR>",
            desc = 'Comment Right Line',
        },
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
    keys = {
        { '<leader>hw', '<Cmd>HiMyWordsToggle<CR>', desc = 'Toggle Current Word Highlight' },
        { '<leader>hn', '<Cmd>HiMyWordsClear<CR>',  desc = 'Clear Word Highlight' },
    },
    'dvoytik/hi-my-words.nvim',
    config = true,
}

plugins:add {
    'glacambre/firenvim',
    cond = util.firenvim,
    build = function()
        require 'lazy'.load { plugins = 'firenvim', wait = true }
        vim.fn['firenvim#install'](0)
    end,
}


plugins:add {
    'andymass/vim-matchup',
    event = 'VeryLazy',
    init = function()
        -- vim.g.matchup_motion_enabled = 0
        vim.g.matchup_text_obj_enabled = 0
    end,
}


plugins:add {
    'CRAG666/code_runner.nvim',
    keys = {
        { '<leader>rr', '<Cmd>RunCode<CR>', desc = 'Code Runner' },
    },
    opts = {
        mode = 'toggleterm',
        filetype = {
            cpp = 'xmake -r && xmake run $end',
        },
    },
}

return plugins
