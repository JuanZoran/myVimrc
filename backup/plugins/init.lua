-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
-- augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
--
-- Have packer use a popup window
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}


return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'h-hg/fcitx.nvim'
    -- ================= My plugins here ====================
    -- fast speed
    use 'lewis6991/impatient.nvim'
    use 'dstein64/vim-startuptime'
    use 'nathom/filetype.nvim'

    -- use 'lukas-reineke/indent-blankline.nvim'
    -- ====================== UI =====================
    -- about theme
    use 'folke/tokyonight.nvim'
    -- 状态栏
    use 'kyazdani42/nvim-web-devicons'
    -- home
    use 'goolord/alpha-nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- using packer.nvim
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    -- 通知栏
    use 'rcarriga/nvim-notify'
    -- 滚动栏
    use 'petertriho/nvim-scrollbar'
    use 'gelguy/wilder.nvim'
    -- smooth scroll
    use 'karb94/neoscroll.nvim'
    -- above func
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }
    -- ====================== Tools =====================
    use 'voldikss/vim-floaterm'
    use 'junegunn/vim-easy-align'
    use 'terrortylor/nvim-comment'
    -- 文件树
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- ====================== Syntax =====================
    -- TODO: 配置
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        requires = "p00f/nvim-ts-rainbow"
    }

    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'p00f/nvim-ts-rainbow'
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }


    -- ====================== Completion =====================
    -- use 'tjdevries/nlua.nvim' -- for neovim api completion

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use "hrsh7th/cmp-nvim-lua"

    --- snip
    use "saadparwaiz1/cmp_luasnip"
    use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    -- lspkind
    use 'onsails/lspkind-nvim'
    -- use

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'BurntSushi/ripgrep'
    use 'nvim-telescope/telescope-project.nvim'

    --------------------- TODO --------------------------
    use "windwp/nvim-autopairs"
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
    --   "folke/which-key.nvim",
    --   config = function()
    --     require("which-key").setup {
    --       -- your configuration comes here
    --       -- or leave it empty to use the default settings
    --       -- refer to the configuration section below
    --     }
    --   end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
