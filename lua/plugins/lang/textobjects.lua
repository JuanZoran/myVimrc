local goto_next           = {}
local goto_next_start     = {}
local goto_next_end       = {}
local goto_previous       = {}
local goto_previous_start = {}
local goto_previous_end   = {}


local keymaps = {}
for key, capture in pairs {
    f = '@function',
    c = '@class',
    C = '@comment',
    d = '@conditional',
    l = '@loop',
    r = '@return',
    a = '@parameter',
} do
    local outer = capture .. '.outer'
    local inner = capture .. '.inner'


    keymaps['a' .. key]              = outer
    keymaps['h' .. key]              = inner
    goto_next[']' .. key]            = outer
    goto_next_start['][' .. key]     = outer
    goto_next_end[']]' .. key]       = outer
    goto_previous['[' .. key]        = outer
    goto_previous_start['[[' .. key] = outer
    goto_previous_end['[]' .. key]   = outer
end


return {
    select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = keymaps,
        -- INFO : some explain
        -- You can choose the select mode (default is charwise 'v')
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
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = true,
    },
    swap = {
        enable = true,
        swap_next = {
            ['<leader>sl'] = '@parameter.inner',
        },
        swap_previous = {
            ['<leader>sj'] = '@parameter.inner',
        },
    },
    move = {
        enable              = true,
        set_jumps           = true, -- whether to set jumps in the jumplist
        goto_next           = goto_next,
        goto_next_start     = goto_next_start,
        goto_next_end       = goto_next_end,
        goto_previous       = goto_previous,
        goto_previous_start = goto_previous_start,
        goto_previous_end   = goto_previous_end,
    },
}
