local async = require("plenary.async")
async.run(function()
require'impatient'
require'filetype'.setup{}
require 'conf.notify'
end)

async.run(function()
require'conf.nvim_tree'
require("lualine").setup{
    options = { theme = 'everforest' }
}
end)

async.run(function()
require 'conf.alpha'
require 'conf.bufferline'
require 'conf.nscroll'
require 'conf.comment'
require 'conf.treesitter'
require 'conf.autopairs'
require 'conf.cmp'
require 'conf.telescope'
require 'conf.lsp-config'
require 'conf.lsp.lspsaga'
require 'conf.lsp.null-ls'
require 'conf.lsp'
end)