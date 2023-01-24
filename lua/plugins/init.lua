-- packer init
vim.cmd [[packadd packer.nvim]]


local neovide = vim.g.neovide
local source = neovide and 'neovide/compiled' or 'plugins/base/compiled'

require("packer").init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    compile_path = vim.fn.stdpath('config') .. '/lua/' .. source .. '.lua',
    auto_remove = not neovide,
}


require(source)
require("plugins.base")
require("plugins.ui")
require("plugins.tools")
require("plugins.lang")
require("plugins.telescope")
