local async = require("plenary.async")
async.run(function()
	require("filetype").setup({})
	require("conf.notify")
end)

async.run(function()
	require("conf.nvim_tree")
    local navic = require("nvim-navic")
	require("lualine").setup({
		options = { theme = "everforest" },
        sections = {
        lualine_c = {
            { navic.get_location, cond = navic.is_available },
        }
    }
	})
	require("conf.which-key")
end)

async.run(function()
	require("conf.alpha")
	require("conf.bufferline")
	require("conf.nscroll")
	require("conf.comment")
	require("conf.lsp-config")
	require("conf.lsp.lspsaga")
	-- require("conf.lsp.null-ls")
	require("conf.lsp")
end)
async.run(function()
	require("conf.treesitter")
	require("conf.autopairs")
	require("conf.cmp")
	require("conf.telescope")
end)
