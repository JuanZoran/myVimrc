local plugins = require("util.plugin")()

plugins:add {
    'declancm/cinnamon.nvim',
    cond = function()
        local cond = true
        if not cond then
            local map = {
                mode = { 'n', 'x', 'o' }, -- be appended to other operator
                map = {
                    { "i", "k" },
                    { "k", "j" },
                    { "j", "h" },
                    { "h", "i" },
                    { 'L', '$' },
                    { 'J', '0' },
                    { 'I', '<C-u>zz' },
                    { 'K', '<C-d>zz' },
                }
            }
            local s = vim.keymap.set
            for _, v in ipairs(map.map) do
                s(map.mode, v[1], v[2])
            end
        end
        return cond
    end,
    config = function()
        require 'plugins.ui.smooth'
    end,
    -- lazy = true,
    event = 'VeryLazy',
    dependencies = {
        'gen740/SmoothCursor.nvim',
        'edluffy/specs.nvim',
    },
}

plugins:add {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {
        style = 'night',
        transparent = true,
        on_highlights = function(hl)
            hl['@variable'] = {
                fg = '#f4b085',
            }

            hl.Cursor = {
                bg = '#58a6ff',
            }
        end
    },
    config = function(_, opts)
        require('tokyonight').setup(opts)
        vim.cmd.colorscheme('tokyonight')
    end
}


plugins:add {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
}


plugins:add { -- 状态栏
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
        require "plugins.ui.lualine"
    end,
}

plugins:add { -- 文件树
    "nvim-tree/nvim-tree.lua",
    keys = {
        { 'ww', '<Cmd>NvimTreeToggle<CR>', desc = ' 触发文件树' }
    },
    config = function()
        require "plugins.ui.nvim_tree"
    end,
    tag = "nightly", -- optional, updated every week. (see issue #1193)
}

plugins:add { -- 标签栏
    "akinsho/bufferline.nvim",
    keys = {
        { "<leader>b<left>",  ":BufferLineMovePrev<CR>",     desc = '[]Move Buffer to Left' },
        { "<leader>b<right>", ":BufferLineMoveNext<CR>",     desc = '[]Move Buffer to Right' },
        { "<Leader>bb",       ":BufferLinePickClose<CR>",    desc = '﫧 Pick a Buffer to delete' },
        { "<C-j>",            "<Cmd>BufferLineCyclePrev<CR>" },
        { "<C-l>",            "<Cmd>BufferLineCycleNext<CR>" },
    },
    event = 'VeryLazy',
    opts = {
        -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
            show_buffer_close_icons = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            modified_icon = "💌",
            separator_style = "triky", -- slant, padded_slant | triky
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
            hover = {
                enabled = true,
                delay = 200,
                reveal = { 'close' }
            },
        },
    }
}


plugins:add {
    event = 'VimEnter',
    'goolord/alpha-nvim',
    cond = true,
    config = function() require("plugins.ui.alpha") end,
}

plugins:add {
    "folke/noice.nvim",
    dependencies = {
        "muniftanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                level = vim.log.INFO,
                stages = "slide",
                timeout = 2000,
                icons = {
                    ERROR = "🥵",
                    WARN = "🫢",
                    INFO = "🤔",
                }
            },
        },
    },
    config = function() require "plugins.ui.noice" end
}

-- plugins:add {
--     "rebelot/kanagawa.nvim",
--     lazy = false,
--     config = function()
--         require 'plugins.ui.theme.kanagawa'
--     end,
--     priority = 1000,
-- }
return plugins
