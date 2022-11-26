vim.opt.termguicolors = true

-- 复制高亮

vim.api.nvim_create_autocmd('TextYankPost',{
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300
    }
  end,
})

vim.cmd[[colorscheme everforest]]

-- for non background
vim.cmd[[highlight Normal guibg=NONE ctermbg=None]]
vim.cmd[[highlight EndOfBuffer guibg=NONE ctermbg=None]]

