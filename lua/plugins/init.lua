-- packer init
vim.cmd([[packadd packer.nvim]])
local packer = require("packer")
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/' .. 'packer_compiled.lua',

    -- profile = {
    --     enable = true,
    --     threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    -- },
})

require("plugins.packer_compiled")
require("plugins.base")
require("plugins.ui")
require("plugins.tools")
require("plugins.lang")
require("plugins.telescope")



























-- automatically set up your configuration after cloning packer.nvim
-- put this at the end after all plugins
-- HACK: alternatively
-- smart range switching with 'm'
-- optional but strongly recommended
-- use({
--     "phaazon/hop.nvim",
--     branch = "v2",
-- })

-- use {
--     "mfussenegger/nvim-treehopper",
--     keys = {
--         { 'x', 'm' },
--         { 'o', 'm' },
--     },
--     config = function()
--         vim.keymap.set("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
--         vim.keymap.set("x", "m", ":lua require('tsht').nodes()<CR>", { silent = true })
--     end
-- }
-- use {
--     'edluffy/hologram.nvim',
--     fd = { 'md', 'markdown' },
--     config = function()
--         require('hologram').setup {
--             auto_display = true -- WIP automatic markdown image display, may be prone to breaking
--         }
--     end
-- }
-- easy change true/false with '<leader>u'

-- for autosource the plugin configuration
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])
