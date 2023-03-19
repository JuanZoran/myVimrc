local keys = {
    {
        "<leader>th",
        '<Cmd>Telescope help_tags <CR>',
        desc = ' Check out all tags'
    },
    {
        "<leader>tH",
        '<Cmd>Telescope highlights <CR>',
        desc = '[] Check out all highlights'
    },
    {
        "<leader>tf",
        '<Cmd>Telescope git_files <CR>',
        desc = ' Search text in current buffer'
    },
    {
        "<leader>tt",
        '<Cmd>Telescope live_grep <CR>',
        desc = ' Search text in cucurrent directory'
    },
    {
        "<leader>gf",
        '<Cmd>Telescope current_buffer_fuzzy_find <CR>',
        desc = '[]Search Git File'
    },
    {
        "<leader>ts",
        '<Cmd>Telescope spell_suggest <CR>',
        desc = '益spell suggestions about cursor word'
    },
    {
        "<leader>tr",
        '<Cmd>Telescope treesitter <CR>',
        desc = '滑Have a look at the tags provided by 滑'
    },
    {
        "<leader>te",
        '<Cmd>Telescope diagnostics <CR>',
        desc = ' take a look'
    },
    {
        "<leader>tc",
        '<Cmd>Telescope commands <CR>',
        desc = 'גּ Check out commands'
    },
    {
        "<leader>tC",
        [[<Cmd>lua require"telescope.builtin".colorscheme{enable_preview = true}<CR>]],
        desc = 'Colorscheme Preview'
    },
    {
        "<leader>ti",
        '<Cmd>Telescope jumplist <CR>',
        desc = ' Get jumplist[C-i]'
    },
    {
        "<leader>tk",
        '<Cmd>Telescope keymaps <CR>',
        desc = ' Check out keymaps[S-C-/]'
    },
    {
        '<leader>fd',
        ([[<Cmd>Telescope find_files cwd=%s<CR>]]):format(vim.fn.stdpath('config')),
        desc = ' Dotfiles search'
    },
    {
        "<C-b>",
        '<Cmd>Telescope marks<CR>',
        desc = '[]Check out Marks'
    },
    -- TODO :Symbols
    {
        "<C-s>",
        '<Cmd>Telescope lsp_document_symbols<CR>',
        desc = '[]Check out Marks'
    },

    -- vim.keymap.set("n", "<Leader>T", ":Telescope ")
    { "<C-u>",   '<Cmd>Telescope oldfiles<Cr>' },
    { "<C-o>",   '<Cmd>Telescope jumplist<Cr>' },
    { "<C-f>",   '<Cmd>Telescope find_files<CR>', },
    { "<C-/>",   '<leader>tc' },                                  -- for C-/
    { "<S-C-/>", '<leader>tk',                    remap = true }, -- for C-/
}


local config = function()
    local actions = require("telescope.actions")
    require('telescope').setup {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },
            mappings = {
                i = {
                    ["<C-h>"]   = actions.cycle_history_next,
                    ["<C-l>"]   = actions.cycle_history_prev,
                    ["<C-i>"]   = actions.move_selection_previous,
                    ["<C-k>"]   = actions.move_selection_next,
                    ["<C-q>"]   = actions.close,
                    ["<Down>"]  = actions.move_selection_next,
                    ["<Up>"]    = actions.move_selection_previous,
                    ["<CR>"]    = actions.select_default,
                    ["<C-x>"]   = actions.select_horizontal,
                    ["<C-v>"]   = actions.select_vertical,
                    ["<C-t>"]   = actions.select_tab,
                    ["<C-u>"]   = false,
                    -- ["<C-e>"] = actions.preview_scrolling_up,
                    -- ["<C-d>"] = actions.preview_scrolling_down,
                    ["<C-o>"]   = actions.send_to_qflist + actions.open_qflist,
                    ["<C-g>"]   = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"]   = actions.send_selected_to_qflist + actions.open_qflist,
                    --["<C-l>"] = actions.complete_tag,
                    ["<C-_>"]   = actions.which_key, -- keys from pressing <C-/>
                },
                n = {
                    ["<C-s>"] = actions.close,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,
                    ["<C-q>"] = actions.close,
                    ["<C-o>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["k"] = actions.move_selection_next,
                    ["i"] = actions.move_selection_previous,
                    ["I"] = actions.move_to_top,
                    -- ["M"] = actions.move_to_middle,
                    ["K"] = actions.move_to_bottom,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,
                    ["<C-i>"] = actions.preview_scrolling_up,
                    ["<C-k>"] = actions.preview_scrolling_down,
                    ["?"] = actions.which_key,
                },
            },
        },
        extensions = {
            ['ui-select'] = { require('telescope.themes').get_dropdown() },
            project = {
                theme = "dropdown",
                hidden_files = true,
            },
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                -- case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
    }

    local telescope = require("telescope")
    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")
end

return {
    "nvim-telescope/telescope.nvim",
    cmd = 'Telescope',
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy finder
        'nvim-telescope/telescope-ui-select.nvim',
        "nvim-lua/plenary.nvim",
    },
    keys = keys,
    version = false,
    config = config,
}
