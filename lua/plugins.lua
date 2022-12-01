-- packer init
vim.cmd([[packadd packer.nvim]])
local packer = require("packer")
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- for autosource the plugin configuration
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- ================= my plugins here ====================
	-- fast speed
	use("lewis6991/impatient.nvim")
	use({ "dstein64/vim-startuptime" })
	use("nathom/filetype.nvim")

	-- ====================== ui =====================
	-- about theme
	use("sainnhe/everforest")

	-- 状态栏
	use({
    	"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- -- 文件树
	use({
		"nvim-tree/nvim-tree.lua",
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

	-- tab line
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- -- 通知样式 TODO: config with lsp-status
	use("rcarriga/nvim-notify")

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

    -- lsp funcion parse in statusline winbar
	use({
		"smiteshp/nvim-navic",
		requires = {
			"neovim/nvim-lspconfig",
		},
	})

    -- uesful which-key
	use("folke/which-key.nvim")

	-- -- ====================== tools =====================
    -- TODO list
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

    -- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		ft = { "markdown", "md" },
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- TODO: compare this with toggleterm
	use("voldikss/vim-floaterm") -- float terminal
	use("rrethy/vim-illuminate") -- cursor-word highlighting
	use("mfussenegger/nvim-treehopper") -- smart range switching with 'm'
	use("rmagatti/auto-session") -- workspace manage
	use("nguyenvukhang/nvim-toggler") -- easy change true/false with '<leader>u'
	use("junegunn/vim-easy-align") -- TODO: read official readme for better use this powerful align helper: this can help markdown auto-align with table
	use("numtostr/comment.nvim") -- powerful comment with gc<char> | gb<char> | <leader>a
	use("voldikss/vim-translator") -- translator with <leader><leader>
	use("windwp/nvim-autopairs") -- smart pair
	use("nvim-treesitter/nvim-treesitter-textobjects") -- easymotion with text

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

    -- optional but strongly recommended
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})

	-- -- ====================== syntax =====================
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
		requires = "kevinhwang91/promise-async",
	})

	-- powerful code-runner
	use({
		"michaelb/sniprun",
		run = "bash install.sh",
		ft = { "cpp", "python", "go" },
	})

	-- -- ====================== completion =====================
	-- mason | lspconfig | mason-lspconfig
	use({
		"williamboman/mason.nvim", -- lsp manager
		"williamboman/mason-lspconfig.nvim", -- make bridge between lspconfig and mason
		"neovim/nvim-lspconfig", -- official lspconfig
	})
	use("glepnir/lspsaga.nvim") -- pretty ui for [code-action | hover-text | ....]

	-- NOTE: a super powerful completion engine for neovim
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "tzachar/cmp-tabnine", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
			{ "l3mon4d3/luasnip", after = "nvim-cmp" },
			{ "rafamadriz/friendly-snippets", after = "nvim-cmp" },
		},
		event = { "cmdlineenter", "insertenter" }, -- lazy-load
		config = function()
			require("conf.cmp")
		end,
	})

	-- -- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" }, -- lib
			{ "nvim-telescope/telescope-project.nvim" },
			{ "jvgrootveld/telescope-zoxide" }, -- powerful cd
			{ "brandoncc/telescope-harpoon.nvim" }, -- list
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fuzzy finder
		},
	})

	-- harpoon | firenvim
	use({ "theprimeagen/harpoon" })
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- FIXME: desable null-ls
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	}) -- configure formatters & linters
	use({
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({})
		end,
	}) -- bridges gap b/w mason & null-ls


	--- =========== alternative ======================
	-- use 'lukas-reineke/indent-blankline.nvim'
	-- use({
	-- 	"nvim-neorg/neorg",
	-- 	-- tag = "*",
	-- 	ft = "norg",
	-- 	run = ":neorg sync-parsers",
	-- 	after = "nvim-treesitter", -- you may want to specify telescope here as well
	-- 	config = function()
	-- 		require("conf/neorg").setup()
	-- 	end,
	-- })
	--
	-- use({
	-- 	"tzachar/cmp-tabnine", -- use ":cmptabninehub" command to login
	-- 	after = "nvim-cmp",
	-- 	run = "bash ./install.sh",
	-- })
	--
	-- use({
	-- 	"toppair/peek.nvim",
	-- 	run = "deno task --quiet build:fast",
	-- })
	--
	-- use({ "hrsh7th/nvim-cmp", requires = {
	-- 	"l3mon4d3/luasnip",
	-- } })
	-- use("onsails/lspkind.nvim")
	-- use("hrsh7th/cmp-nvim-lsp")
	-- use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/cmp-path")
	-- use("hrsh7th/cmp-cmdline")
	-- use("hrsh7th/cmp-nvim-lua")
	-- --- snip
	-- use("saadparwaiz1/cmp_luasnip")
	-- use("l3mon4d3/luasnip")
	-- use("rafamadriz/friendly-snippets")

	-- use({
	-- 	"andymass/vim-matchup",
	-- 	setup = function()
	-- 		-- may set any options here
	--             -- vim.g.matchup_surround_enabled = 1
	-- 		vim.g.matchup_matchparen_offscreen = { method = "popup" }
	-- 	end,
	-- })

	-- automatically set up your configuration after cloning packer.nvim
	-- put this at the end after all plugins
end)
