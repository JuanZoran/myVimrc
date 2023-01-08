-- require('nvim-toggler').setup {
--     -- your own inverses
--     inverses = {
--         ['True'] = 'False',
--         ['enable'] = 'disable',
--         ['if'] = 'elseif',
--         ['Right'] = 'Left',
--     },
--     remove_default_keybinds = true,
-- }

-- init.lua
-- vim.keymap.set('n', '<leader>u', require('nvim-toggler').toggle, { desc = '🌀 Quickly Switch' })

vim.keymap.set(
    "n",
    "<leader>u",
    require("ts-node-action").node_action,
    { desc = "🌀Trigger Node Action" }
)
