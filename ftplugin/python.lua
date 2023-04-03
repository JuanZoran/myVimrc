local set = vim.keymap.set
set('n', '<leader><C-k>', '<Cmd>PyrightOrganizeImports<CR>', { buffer = true })
set('i', '<C-k>', '<Cmd>PyrightOrganizeImports<CR>', { buffer = true })
