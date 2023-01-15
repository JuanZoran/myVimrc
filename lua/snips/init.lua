local M = {}

local snippets_folder = vim.fn.stdpath "config" .. "/lua/snips"
local ls = require "luasnip"


local types = require "luasnip.util.types"

M.setup = function()
    ls.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        region_check_events = "CursorHold,InsertLeave",
        delete_check_events = "TextChanged,InsertEnter",
        -- enable_autosnippets = true,
        -- store_selection_keys = "<C-q>",
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { " Your Choice", "Title" } }, -- yellow
                },
            },
            [types.insertNode] = {
                active = {
                    virt_text = { { " Insert", "Function" } }, -- purple
                },
            },
        },
    }

    -- Lazy load snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }

    vim.keymap.set('n', '<leader><cr>', '<CMD>lua require"luasnip.loaders.from_lua".edit_snippet_files()<CR>')
    -- vim.cmd [[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]
end

return M
