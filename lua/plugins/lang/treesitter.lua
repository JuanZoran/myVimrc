local ts = require("nvim-treesitter.configs")
ts.setup {
    auto_install = true,
    -- ensure_installed = "cpp, python, go, lua, vim, markdown, bash",
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
        }
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
    autopairs = {
        enable = true,
    },
    textobjects = require("plugins.lang.textobjects"),
}
