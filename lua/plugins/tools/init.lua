local Trans = {
    "JuanZoran/Trans.nvim",
    keys = {
        { 'mm', mode = { 'n', 'x' }, '<Cmd>Translate<CR>', desc = ' Translate' },
        { 'mk', mode = { 'n', 'x' }, '<Cmd>TransPlay<CR>', desc = ' 自动发音' },
        { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
    },
    dependencies = { 'kkharji/sqlite.lua', lazy = true },
    opts = {
        hover = {
            spinner = 'moon'
        },
        engine = {
            baidu = {
                appid = '20220910001338724',
                appPasswd = 'EKnyuuJQeVn7DLxeIH7F'
            }
        }
    },
    dev = true,
}

local todo = {
    "folke/todo-comments.nvim",
    event = 'VeryLazy',
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require 'plugins.tools.todo-comments' end,
}

local which_key = {
    "folke/which-key.nvim",
    config = function() require "plugins.tools.which-key" end,
}


local markdown = {
    "iamcco/markdown-preview.nvim",
    keys = {
        { 'mp', '<Plug>MarkdownPreviewToggle', buffer = true }
    },
    ft = { "markdown", "md" },
    build = function() vim.fn["mkdp#util#install"]() end,
    dependencies = {
        {
            'dhruvasagar/vim-table-mode',
            lazy = true,
            -- TODO :
        },

    }
}

local ts_action = {
    'CKolkey/ts-node-action',
    keys = {
        { "<leader>u", function() require("ts-node-action").node_action() end, desc = "🌀Trigger Node Action", }
    },
}

local toggleterm = {
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
}

local align = {
    'Vonr/align.nvim',
    keys = {
        { mode = 'x', "<leader>=", function() require 'align'.align_to_string(true, true, true) end, }
    }
}

local comment = { -- powerful comment with gc<char> | gb<char> | <leader>A
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

local autopair = {
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


local surround = {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    config = function()
        require('mini.surround').setup {
            mappings = {
                suffix_last = 'p', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            }
        }
    end,
}

local session = {
    -- "olimorris/persisted.nvim",
    -- cmd = 'SessionLoad',
    -- config = function() require 'plugins.tools.session' end,
    'glepnir/dbsession.nvim',
    opts = {
        dir = vim.fn.stdpath('data') .. '/sessions/',
        auto_save_on_exit = true,
    },
}


local gitsigns = {
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

local zen_mode = {
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


local leap = {
    "ggandor/leap.nvim",
    config = function() require 'plugins.tools.leap' end,
    keys = {
        { mode = { 'x', 'o', 'n' }, '<leader>j', '<Plug>(leap-backward-to)', desc = '⬅️ quick jump backward' },
        { mode = { 'x', 'o', 'n' }, '<leader><leader>l', '<Plug>(leap-cross-window)',
            desc = '💪quick jump cross window' },
        { mode = { 'x', 'o', 'n' }, '<leader>l', '<Plug>(leap-forward-to)', desc = '➡️ quick jump forward' },
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

return {
    Trans,
    todo,
    which_key,
    markdown,
    ts_action,
    toggleterm,
    align,
    comment,
    autopair,
    session,
    gitsigns,
    zen_mode,
    leap,
    surround,
}
