-- init.lua
require('nvim-toggler').setup({
  -- your own inverses
  inverses = {
    ['True'] = 'False'
  },
  -- removes the default <leader>i keymap
  remove_default_keybinds = true,
})

-- init.lua
vim.keymap.set('n', '<leader>u', require('nvim-toggler').toggle)
