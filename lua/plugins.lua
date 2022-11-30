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
	--- required for other plugins
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	-- ================= my plugins here ====================
	-- fast speed
	use("lewis6991/impatient.nvim")
	use({ "dstein64/vim-startuptime" })
	use("nathom/filetype.nvim")
	-- ====================== ui =====================
	-- about theme
	use("sainnhe/everforest")
	-- 状态栏
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
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
		config = function()
			require("conf.lualine")
		end,
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	-- -- 通知栏
	use({
		"j-hui/fidget.nvim",
		config = function()
			-- require("fidget").setup({text = {spinner = "moon"}})
			require("fidget").setup({})
		end,
	})
	use("rcarriga/nvim-notify")

	-- smooth scroll animation
	use({
		"declancm/cinnamon.nvim",
		config = function()
			require("conf.smooth")
		end,
	})

	-- nice UI
	use({
		"folke/noice.nvim",
		config = function()
			require("conf/noice")
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"muniftanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	-- -- ====================== tools =====================
	use("voldikss/vim-floaterm")
	use("famiu/bufdelete.nvim")
	use({
		"rrethy/vim-illuminate", -- for cursor highlighting
		config = function()
			require("conf/illuminate")
		end,
	})

	--  smart 'm'
	use({
		"mfussenegger/nvim-treehopper",
		config = function()
			require("conf.treehop")
		end,
	})

	--  session manager
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/projects", "~/downloads", "/" },
				-- 				post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
				-- ---@diagnostic disable-next-line: different-requires
				-- 					require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
				-- 				end,
			})
		end,
	})

	use({
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({--[[your custom config--]]
				prompt_title = "历史片段",
				path_display = { "shorten" },
				theme_conf = require("telescope.themes").get_dropdown({}),
				previewer = true,
			})
		end,
	})

	-- quickly toggle status [keybind: <Leader>u]
	use({
		"nguyenvukhang/nvim-toggler",
		config = function()
			require("conf.toggle")
		end,
	})

	use("junegunn/vim-easy-align")

	-- easy comment
	use({
		"numtostr/comment.nvim",
		config = function()
			require("conf.comment")
		end,
	})

	-- git tools
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("conf.gitsigns")
		end,
	})

	use("voldikss/vim-translator")

	-- easymotion-like
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure hop the way you like here; see :h hop-config
			require("conf.hop")
		end,
	})
	-- -- ====================== syntax =====================
	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		requires = { "p00f/nvim-ts-rainbow" },
	})

	use("windwp/nvim-autopairs")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	--
	use("p00f/nvim-ts-rainbow")
	use({
		"michaelb/sniprun",
		run = "bash install.sh",
		ft = { "cpp" },
		config = function()
			require("conf.sniprun").setup()
		end,
	})
	-- -- ====================== completion =====================
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("glepnir/lspsaga.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		ft = { "markdown", "md" },
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- snippets
	use({
		{
			"l3mon4d3/luasnip",
			-- opt = true,
		},
		"rafamadriz/friendly-snippets",
	})
	-- completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "tzachar/cmp-tabnine", after = "nvim-cmp" },
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
		},
		event = "insertenter",
		wants = "luasnip",
		config = function()
			require("conf.cmp")
		end,
	})

	-- -- telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-project.nvim")
	use("jvgrootveld/telescope-zoxide")
	use("theprimeagen/harpoon")
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
		"smiteshp/nvim-navic",
		requires = { "neovim/nvim-lspconfig", --[[ "fgheng/winbar.nvim", ]]  "utilyre/barbecue.nvim"},
	})

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
