-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    vim.notify("saga error", "error")
    return
end
local icon = require('util').icon

saga.init_lsp_saga {
    -- keybinds for navigation in lspsaga window
    -- move_in_saga = { prev = "i", next = "k" },
    -- move_in_saga = { prev = "<C-i>", next = "<C-k>" },
    -- use enter to open file with finder
    finder_action_keys = {
        open = "<CR>",
    },
    symbol_in_winbar = {
        in_custom = true,
        enable = false,
        separator = '  ',
        -- click_support = true
    },
    definition_action_keys = {
        -- edit = '<C-c>o',
        vsplit = 'wo',
        split = 'wu',
        -- tabe = '<C-c>t',
        -- quit = 'q',
    },
    -- use enter to open file with definition preview
    border_style = "rounded",
    code_action_icon = icon.CodeAction,
}
