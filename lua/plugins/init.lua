-- packer init
vim.cmd [[packadd packer.nvim]]

require("packer").init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/base/' .. 'compiled.lua',
    -- profile = {
    --     enable = true,
    --     threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    -- },
}

require("plugins.base")
require("plugins.ui")
require("plugins.tools")
require("plugins.lang")
require("plugins.telescope")
