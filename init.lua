vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local M = require('lazy.view.config')
M.keys.hover = 'gh'
local install = M.commands.install
install.key = 'Y'
install.key_plugin = 'y'

require("lazy").setup('plugins', {
    default = {
        version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    ui = {
        border = "rounded",
    },
    -- dev = {
    --     -- directory where you store your local plugin projects
    --     path = "~/project/Neovim",
    --     ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    --     patterns = {}, -- For example {"folke"}
    --     fallback = false, -- Fallback to git when local plugin doesn't exist
    -- },
})

require('core')
