-- packer init
vim.cmd([[packadd packer.nvim]])
local packer = require("packer")
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    profile = {
        enable = true,
        threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
})

-- for autosource the plugin configuration
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- ================= my plugins here ====================
    use({
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    })
    -- fast speed
    use("lewis6991/impatient.nvim")
    use "nathom/filetype.nvim"



    -- NOTE:====================== ui =====================
    -- about theme
    use { "sainnhe/everforest", opt = true }
    use("projekt0n/github-nvim-theme")
    use {

        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require('colorizer').setup {}
        end
    }


    -- 状态栏
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            'arkav/lualine-lsp-progress'
        },
    })

    -- -- 文件树
    use({
        "nvim-tree/nvim-tree.lua",
        keys = { 'n', 'ww' },
        -- cond = 'not vim.g.vscode',
        config = 'require"conf.nvim_tree"',
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })

    -- home
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- tabline
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

    -- smooth scroll animation
    use("declancm/cinnamon.nvim")

    -- nice ui
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "muniftanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    })

    -- lsp function parse in statusline winbar
    use({
        "smiteshp/nvim-navic",
        requires = {
            "neovim/nvim-lspconfig",
        },
    })
    use("rrethy/vim-illuminate") -- cursor-word highlighting
    use("lukas-reineke/indent-blankline.nvim")


    -- NOTE: ====================== Tools =====================
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    -- uesful which-key
    use("folke/which-key.nvim")

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        ft = { "markdown", "md" },
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    use {
        "nguyenvukhang/nvim-toggler",
        keys = {
            { "n", "<Leader>u" },
        },
        config = function()
            require("conf.toggle")
        end,
    }

    -- TODO: compare this with toggleterm
    -- FIXME: use Lspsaga with this
    -- use("voldikss/vim-floaterm") -- float terminal
    use("numtostr/comment.nvim") -- powerful comment with gc<char> | gb<char> | <leader>a
    use("nvim-treesitter/nvim-treesitter-textobjects") -- easymotion with text

    -- TODO: read official readme for better use this powerful align helper: this can help markdown auto-align with table
    use {
        "junegunn/vim-easy-align",
        keys = {
            { '', '<Leader>=' },
        },
        config = function()
            vim.keymap.set('', '<leader>=', '<Plug>(EasyAlign)', { desc = 'ﱓ EasyAlign' })
        end,
    }

    -- lazy-load translate plugin
    use({
        "sicong-li/T.vim",
        keys = {
            { 'v', 'mm' },
            { 'n', 'mm' },
        },
        config = function()
            vim.keymap.set("v", "mm", ':<c-u>call T#VisualSearch(visualmode())<cr>', { desc = ' Translate' })
            vim.keymap.set("n", "mm", "<cmd>call T#Main(expand('<cword>'))<cr>", { desc = ' Translate' })
        end
    })


    -- Auto pairs
    -- TODO:config autopair
    use {
        "windwp/nvim-autopairs",
        event = 'InsertEnter',
        config = 'require("conf.autopairs")'
    }

    -- combine auto-session with telescope
    use({
        "rmagatti/session-lens",
        requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    })

    -- integrate with git
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })


    use {
        'AckslD/nvim-trevJ.lua',
        keys = { {
            "n",
            "<leader>ff",
        } },
        config = function()
            local m = require('trevj')
            m.setup {}
            vim.keymap.set('n', '<leader>ff', m.format_at_cursor, { desc = '[]Open Format At Cursor' })
        end, -- optional call for configurating non-default filetypes etc
    }

    use { -- foucs mode
        'junegunn/limelight.vim',
        keys = { 'n', '<leader><leader>h' },
        config = 'require("conf.zen")'
    }



    -- NOTE: ====================== syntax =====================
    -- high-performance language parser
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        requires = { "p00f/nvim-ts-rainbow" }, -- rainbow pairs
    })


    -- make neovim has modernize folder
    use({
        "kevinhwang91/nvim-ufo",
        keys = {
            { 'n', 'zR' },
            { 'n', 'zM' },
            { 'v', 'za' },
        },
        requires = { "kevinhwang91/promise-async", opt = true },
        config = 'require "conf.ufo"',
    })
    -- -- ====================== completion =====================
    -- mason | lspconfig | mason-lspconfig
    use({
        "williamboman/mason.nvim", -- lsp manager
        "williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
        "neovim/nvim-lspconfig", -- official lspconfig
        "glepnir/lspsaga.nvim", -- pretty ui for [code-action | hover-text | ....]
    })

    use {
        "L3mon4d3/luasnip",
        requires = {
            "rafamadriz/friendly-snippets"
        },
        event = 'InsertEnter',
        after = 'nvim-cmp',
        config = function()
            require('snips').setup()
        end
    }

    -- NOTE: a super powerful completion engine for neovim
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "tzachar/cmp-tabnine", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "luasnip" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        },
        event = 'InsertEnter', -- lazy-load
        -- event = { "cmdlineenter", "insertenter" }, -- lazy-load
        config = function()
            require("conf.cmp")
        end,
    })

    use({
        "ggandor/leap.nvim",
        config = function ()
            require("leap").add_default_mappings()
        end
    })

    -- -- telescope

    use({
        "nvim-telescope/telescope.nvim",
        cmd = 'Telescope',
        requires = {
            { "nvim-lua/plenary.nvim", opt = true }, -- lib
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fuzzy finder
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
    })

    use {
        "jvgrootveld/telescope-zoxide", -- powerful cd
        module = 'telescope._extensions.zoxide',
        keys = {
            { 'n', '<leader>cd' },
        },
        config = function()
            require("telescope").load_extension('zoxide')
            vim.keymap.set('n', '<leader>cd', "<cmd>Telescope zoxide list<cr>", { desc = ' Cd recently directory' })
        end,
    }

    use {
        "nvim-telescope/telescope-project.nvim",
        keys = {
            { 'n', '<C-p>' },
        },
        config = function()
            local telescope = require('telescope')
            telescope.load_extension('project')
            vim.keymap.set('n', '<C-p>', telescope.extensions.project.project)
        end,
    } -- project

    use {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            { 'v', '<Leader>rr' },
        },
        config = function()
            require('conf.refactor')
        end
    } -- list

    use {
        "brandoncc/telescope-harpoon.nvim", -- list
        keys = {
            { 'n', '<Leader>hh' },
            { 'n', '<Leader>hi' },
            { 'n', '<Leader>hj' },
            { 'n', '<Leader>hl' },
            { 'n', '<Leader>hc' },
            { 'n', '<Leader>hm' },
        },
        config = function()
            require('conf.harpoon')
        end,
        requires = { {
            "theprimeagen/harpoon",
            opt = true
        } }
    } -- list


    use {
        "nvim-telescope/telescope-frecency.nvim",
        keys = {
            { 'n', '<C-y>' },
        },
        requires = { "kkharji/sqlite.lua", opt = true },
        config = function()
            require("telescope").load_extension("frecency")
            vim.keymap.set('n', '<C-y>', '<cmd>Telescope frecency<cr>') -- []Recently File Sorted by Frequency
        end
    } -- list

    use {
        "AckslD/nvim-neoclip.lua",
        keys = {
            { 'n', '<leader>tg' },
        },
        config = function()
            require("neoclip").setup()
            require("telescope").load_extension "neoclip"
            vim.keymap.set('n', '<leader>tg', '<cmd>Telescope neoclip<cr>', { desc = '[]Clipboard History' })
        end,
    }


    -- | firenvim
    use({
        "glacambre/firenvim",
        run = function()
            vim.fn["firenvim#install"](0)
        end,
    })

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
end)
