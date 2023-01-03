local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("Error telescope", 'error')
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-h>"] = actions.cycle_history_next,
                ["<C-l>"] = actions.cycle_history_prev,

                ["<C-i>"] = actions.move_selection_previous,
                ["<C-k>"] = actions.move_selection_next,

                ["<C-q>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                -- ["<C-e>"] = actions.preview_scrolling_up,
                -- ["<C-d>"] = actions.preview_scrolling_down,

                -- ["<PageUp>"] = actions.results_scrolling_up,
                -- ["<Pa geDown>"] = actions.results_scrolling_down,
                ["<C-o>"] = actions.send_to_qflist + actions.open_qflist,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-g>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                --["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
                ["<C-s>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
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

                -- ["<PageUp>"] = actions.results_scrolling_up,
                -- ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    },
    -- pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    -- },
    extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
        project = {
            theme = "dropdown",
            sync_with_nvim_tree = true,
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            -- case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
})

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
-- telescope.load_extension("notify")
-- telescope.load_extension("noice")
-- telescope.load_extension("project")



--- key-bindings ==============================
local set = require("util.map").set
local builtin = require("telescope.builtin")
set {
    mode = 'n',
    opt = {},
    map = {
        { "<C-f>", builtin.find_files },
        { "<leader>th", builtin.help_tags,                 ' Check out all tags'                     },
        { "<leader>tf", builtin.git_files,                 ' Search text in current buffer'          },
        { "<leader>tt", builtin.live_grep,                 ' Search text in cucurrent directory'     },
        { "<leader>gf", builtin.current_buffer_fuzzy_find, '[]Search Git File'                          },
        { "<leader>ts", builtin.spell_suggest,             '益spell suggestions about cursor word'     },
        { "<leader>tr", builtin.treesitter,                '滑Have a look at the tags provided by 滑' },
        { "<leader>te", builtin.diagnostics,               ' take a look'                            },
        { "<leader>tc", builtin.commands,                  'גּ Check out commands'                     },
        { "<leader>ti", builtin.jumplist,                  ' Get jumplist[C-i]'                      },
        { "<leader>tu", builtin.oldfiles,                  ' Check out edited files[C-u]'            },
        { "<leader>tk", builtin.keymaps,                   ' Check out keymaps[C-/]'                 },

        { "<C-u>", builtin.oldfiles },
        { "<C-o>", builtin.jumplist },
        { "<C-_>", builtin.keymaps } -- for C-/
    }

}

-- vim.keymap.set("n", "<Leader>T", ":Telescope ")
