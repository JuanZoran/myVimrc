local plugins = require("util.plugin")()
plugins:add {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
}

plugins:add {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
        -- flavour = 'macchiato',
        transparent_background = true,
        custom_highlights = function()
            return require('plugins.ui.theme.override')
        end,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            telescope = true,
            notify = true,
            noice = true,
            ts_rainbow = true,
            lsp_trouble = true,
            markdown = true,
            native_lsp = {
                enabled = true,
            },
            navic = {
                enabled = true,
            },
            -- illuminate = true,
            -- which_key = true,
            -- mason = true,
            -- indent_blankline = {
            --     enable = true,
            --     colored_indent_levels = true,
            -- },
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme 'catppuccin'
    end,
    priority = 1000,
}

-- local cond = false
-- if not cond then
local map = {
    mode = { 'n', 'x', 'o' }, -- be appended to other operator
    map = {
        { "i", "k" },
        { "k", "j" },
        { "j", "h" },
        { "h", "i" },
        { 'L', '$' },
        { 'J', '^' },
        { 'I', '<C-u>zz' },
        { 'K', '<C-d>zz' },
    }
}
local s = vim.keymap.set
for _, v in ipairs(map.map) do
    s(map.mode, v[1], v[2])
end


local api = vim.api
local fn = vim.fn
plugins:add {
    'JuanZoran/specs.nvim',
    keys = {
        { mode = { 'n', 'x' }, 'H', function()
            vim.defer_fn(require('specs').show_specs, 10)
            api.nvim_feedkeys('I', 'n', false)
        end },

        { mode = { 'n', 'x' }, 'A', function()
            vim.defer_fn(require('specs').show_specs, 10)
            api.nvim_feedkeys('A', 'n', false)
        end },

        { mode = { 'n', 'x' }, 'J', function()
            local col = (vim.api.nvim_get_current_line()):find('%S')
            if col ~= vim.fn.col('.') then
                vim.defer_fn(require('specs').show_specs, 10)
                api.nvim_feedkeys('^', 'n', false)
            end
        end },

        { mode = { 'n', 'x' }, 'L', function()
            local _cur = fn.col('.')
            local _end = fn.col('$') - 1
            if _end ~= 0 and _cur ~= _end then
                vim.defer_fn(require("specs").show_specs, 10)
                fn.cursor { fn.line('.'), fn.col('$') }
            end
        end },
    },
    opts = function()
        return {
            show_jumps      = false,
            min_jump        = 30,
            popup           = {
                delay_ms = 0, -- delay before popup displays
                inc_ms = 10, -- time increments used for fade/resize effects
                blend = 85, -- starting blend, between 0-100 (fully transparent), see :h winblend
                width = 10,
                winhl = "Cursor",
                fader = require('specs').linear_fader,
                resizer = require('specs').shrink_resizer
            },
            ignore_buftypes = {
                nofile = true,
            },
        }
    end,
}

plugins:add {
    'gen740/SmoothCursor.nvim',
    name = 'smoothcursor',
    event = 'VeryLazy',
    opts = {
        autostart = true,
        speed = 30, -- max is 100 to stick to your current position
        intervals = 30, -- tick intervalI
        disable_float_win = true, -- disable on float window
        linehl = 'CursorLine',
        disabled_filetypes = {
            'alpha',
            'TelescopePrompt'
        },
        fancy = {
            head = { cursor = "▷", texthl = "SmoothCursor", linehl = 'CursorLine' },
            enable = true
        },
    },
}


plugins:add {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = {
        style = 'night',
        transparent = false,
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


plugins:add { -- 状态栏
    "nvim-lualine/lualine.nvim",
    event = 'VeryLazy',
    dependencies = {
        'SmiteshP/nvim-navic',
        opts = {
            separator = ' >> ',
            highlight = true,
            depth_limit = 5,
        },
        init = function()
            require('lsp.handlers').attach(function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    require('nvim-navic').attach(client, bufnr)
                end
            end)
        end,
    },
    config = function()
        require "plugins.ui.lualine"
    end,
}


plugins:add {
    "folke/noice.nvim",
    event = 'VeryLazy',
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
    opts = {
        -- you can enable a preset for easier configuration
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            progress = {
                enabled = true,
                -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                -- See the section on formatting for more details on how to customize.
                format = "lsp_progress",
                format_done = "lsp_progress_done",
                throttle = 1000 / 30, -- frequency to update lsp progress message
                view = "mini",
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
            command_palette = {
                views = {
                    cmdline_popup = {
                        position = {
                            row = "50%",
                            col = "50%",
                        },
                        size = {
                            min_width = 60,
                            width = "auto",
                            height = "auto",
                        },
                    },
                },
            },
        },
    }
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
