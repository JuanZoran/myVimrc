require 'util'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

local M = require 'lazy.view.config'
M.keys.hover = 'gh'
local install = M.commands.install
install.key = 'Y'
install.key_plugin = 'y'

require 'lazy'.setup({
    { import = 'plugins' },
    -- {import = 'plugins.lsp'},
    -- {import = 'plugins.lang'},
}, {
    install = {
        colorscheme = { 'catppuccin', 'tokyonight', 'kanagawa', 'habamax' },
    },
    git = {
        url_format = 'git@github.com:%s.git',
    },
    ui = {
        size = { width = 0.85, height = 0.85 },
        border = 'rounded',
    },
    performance = {
        cache = {
            enabled = true,
            -- disable_events = {},
        },
        rtp = {
            disabled_plugins = {
                'spellfile_plugin',
                'syntax_completion',
                '2html_plugin',
                'getscript',
                'getscriptPlugin',
                -- 'gzip',
                -- 'zip',
                -- 'zipPlugin',
                'logipat',
                'netrw',
                'netrwPlugin',
                'netrwSettings',
                'netrwFileHandlers',
                'matchit',
                'matchparen',
                'tar',
                'tarPlugin',
                'rrhelper',
                'shada',
                'vimball',
                'vimballPlugin',
                'tohtml',
                'tutor',
            },
        },
    },
    dev = {
        -- directory where you store your local plugin projects
        path = vim.fn.stdpath 'config' .. '/custom',
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = { 'JuanZoran' }, -- For example {"folke"}
        fallback = true,            -- Fallback to git when local plugin doesn't exist
    },
    debug = false,
})

require 'core'
-- util.map {
--     { mode = {'n', 'i'}, '<Tab>', function ()
--         print('tab is pressed')
--     end },
--     { mode = {'n', 'i'}, '<C-I>', function ()
--         print('<C-i> is pressed')
--     end },
-- }
