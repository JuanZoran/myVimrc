vim.cmd([[packadd packer.nvim]])
local packer = require("packer")
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	-- use 'h-hg/fcitx.nvim'
	-- ================= My plugins here ====================
	-- fast speed
	use("lewis6991/impatient.nvim")
	use("dstein64/vim-startuptime")
	use("nathom/filetype.nvim")
	-- use 'lukas-reineke/indent-blankline.nvim'
	-- ====================== UI =====================
	-- about theme
	use("sainnhe/everforest")
	-- 状态栏
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		sections = { lualine_c = { require("auto-session-library").current_session_name } },
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
		-- config = function ()
		--     require'alpha'.setup(require'alpha.themes.startify'.config)
		-- end
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	-- -- 通知栏
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	use("rcarriga/nvim-notify")
	-- -- smooth scroll
	use("karb94/neoscroll.nvim")
	-- -- ====================== Tools =====================
	use("voldikss/vim-floaterm")
	use({
		"RRethy/vim-illuminate",
		config = function()
			require("conf/illuminate")
		end,
	})
	use({
		"mfussenegger/nvim-treehopper",
		config = function()
			require("conf/treehop")
		end,
	})
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	})
	use({
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({--[[your custom config--]]
                prompt_title = '历史片段',
                -- theme_conf = require('telescope.themes').get_dropdown()
			})
		end,
	})

	use("junegunn/vim-easy-align")
	use("terrortylor/nvim-comment")
	-- for git tools
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("conf.gitsigns")
		end,
	})
	use("voldikss/vim-translator")
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({})
		end,
	})
	-- -- ====================== Syntax =====================
	-- -- TODO: 配置
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		requires = "p00f/nvim-ts-rainbow",
	})
	use({
		"windwp/nvim-autopairs",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	--
	use("p00f/nvim-ts-rainbow")
	use({
		"michaelb/sniprun",
		run = "bash install.sh",
		config = function()
			require("conf.sniprun").setup()
		end,
	})
	-- -- ====================== Completion =====================
	--
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind.nvim")

	use({
		"tzachar/cmp-tabnine", -- use ":CmpTabnineHub" command to login
		after = "nvim-cmp",
		run = "bash ./install.sh",
	})
	use({ "hrsh7th/nvim-cmp", requires = {
		"L3MON4D3/LuaSnip",
	} })
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	-- --- snip
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- -- Telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-neorg/neorg",
		-- tag = "*",
		ft = "norg",
		run = ":Neorg sync-parsers",
		after = "nvim-treesitter", -- You may want to specify Telescope here as well
		config = function()
			require("conf/neorg").setup()
		end,
	})
	use("nvim-telescope/telescope-project.nvim")
	use("nvim-telescope/telescope-packer.nvim")
	use("jvgrootveld/telescope-zoxide")
	use("ThePrimeagen/harpoon")
	use("brandoncc/telescope-harpoon.nvim")
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- formatting & linting
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
	use("folke/which-key.nvim")
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})

	--- =========== alternative ======================
	-- use({
	-- 	"andymass/vim-matchup",
	-- 	setup = function()
	-- 		-- may set any options here
	--             -- vim.g.matchup_surround_enabled = 1
	-- 		vim.g.matchup_matchparen_offscreen = { method = "popup" }
	-- 	end,
	-- })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
end)
