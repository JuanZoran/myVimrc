M = {
    select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["hf"] = "@function.inner",
            ["hc"] = "@class.inner",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
        },
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        -- selection_modes = {
        -- 	["@parameter.outer"] = "v", -- charwise
        -- 	["@function.outer"] = "V", -- linewise
        -- 	["@class.outer"] = "<c-v>", -- blockwise
        -- },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = true,
    },
    swap = {
        enable = true,
        swap_next = {
            ["<leader>sl"] = "@parameter.inner",
        },
        swap_previous = {
            ["<leader>sj"] = "@parameter.inner",
        },
    },
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
            ["<leader>fl"] = "@function.outer",
            ["<leader>cl"] = { query = "@class.outer", desc = "Next class start" },
        },
        goto_next_end = {
            ["<leader>fL"] = "@function.outer",
            ["<leader>cL"] = "@class.outer",
        },
        goto_previous_start = {
            ["<leader>fj"] = "@function.outer",
            ["<leader>cj"] = "@class.outer",
        },
        goto_previous_end = {
            ["<leader>fJ"] = "@function.outer",
            ["<leader>cJ"] = "@class.outer",
        },
    },
    -- lsp_interop = {
    --     enable = true,
    --     border = 'none',
    --     peek_definition_code = {
    --         ["<leader>pf"] = "@function.outer",
    --         ["<leader>pc"] = "@class.outer"
    --     }
    -- }
}

return M
