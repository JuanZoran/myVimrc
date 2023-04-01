-- switch header / source
local set = vim.keymap.set
set('n', '<leader><C-k>', '<Cmd>ClangdSwitchSourceHeader<CR>', { buffer = true })
set('i', '<C-k>', '<Cmd>ClangdSwitchSourceHeader<CR>', { buffer = true })
set('n', '<leader>k', '<Cmd>ClangdMemoryUsage<CR>', { buffer = true })


-- vim.api.nvim_create_autocmd('But')
