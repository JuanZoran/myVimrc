local mason_opts = {
	ui = {
		border = "rounded",
		keymaps = {
			toggle_package_expand = "o",
			install_package = "y",
			uninstall_package = "x",
		},
	},
}

return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		automatic_enable = {
			exclude = {
				"rust_analyzer",
			},
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = mason_opts },
		"neovim/nvim-lspconfig",
	},
}
