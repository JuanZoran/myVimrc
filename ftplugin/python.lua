local set = vim.keymap.set
set('i', '<C-k>', '<cmd>PyrightOrganizeImports<CR>', { buffer = true })
set('n', '<leader><C-k>', '<cmd>PyrightOrganizeImports<CR>', { buffer = true })
