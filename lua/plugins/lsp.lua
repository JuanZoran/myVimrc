local mason = {
	"mason-org/mason.nvim",
	opts = {
		ui = {
			border = "rounded",
			keymaps = {
				toggle_package_expand = "o",
				install_package = "y",
				uninstall_package = "x",
			},
		},
	},
}


-- For system installed instead of mason
vim.lsp.enable("clangd")


return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		automatic_enable = {
			exclude = {
				"rust_analyzer",
			},
		},
	},
	dependencies = { mason, "neovim/nvim-lspconfig", },
}
