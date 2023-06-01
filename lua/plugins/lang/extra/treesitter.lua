local indent = {
    'shellRaining/hlchunk.nvim',
    event = 'UIEnter',
    opts = {
        chunk = {
            style = '#61AEEF',
            textobject = 'ai',
        },
        line_num = {
            style = '#61AEEF',
        },
        blank = {
            enable = false,
        },
    },
}

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        indent,
        { 'nvim-treesitter/nvim-treesitter-context', config = true },
        'HiPhish/nvim-ts-rainbow2',
        'RRethy/nvim-treesitter-endwise',
        {
            'rrethy/vim-illuminate',
            config = function()
                require 'illuminate'.configure {
                    -- providers = { 'lsp', 'treesitter' },
                    large_file_curoff = 4000,
                    delay = 300,
                }
            end,
        },
    }, -- rainbow pairs
    opts = {
        ensure_installed = {
            'markdown',
            'markdown_inline',
            'bash',
            'vim',
            'regex',
            'lua',
            'python',
            'yaml',
            'cpp',
            'c',
        },
        auto_install = true,
        sync_installl = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        -- 启用增量选择
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<CR>',
                node_incremental = '<CR>',
                node_decremental = '<BS>',
                scope_incremental = '<TAB>',
            },
        },
        -- for ts-rainbow plugins
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        indent = {
            enable = true,
        },
        endwise = {
            enable = true,
        },
        matchup = {
            enable = true,
        },
    },
    config = function(_, opts)
        require 'nvim-treesitter.configs'.setup(opts)
    end,
}
