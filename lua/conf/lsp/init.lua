-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	vim.notify("lspconfig error", "error")
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	vim.notify("cmp_lsp error", "error")
	return
end

-- local on_attach = function(client, buf)
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	-- on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig["clangd"].setup({
	-- capabilities = capabilities,
	-- -- on_attach = on_attach,
	-- settings = { -- custom settings for lua
	-- 	Lua = {
	-- 		-- make the language server recognize "vim" global
	-- 		diagnostics = {
	-- 			globals = { "vim" },
	-- 		},
	-- 		workspace = {
	-- 			-- make language server aware of runtime files
	-- 			library = {
	-- 				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	-- 				[vim.fn.stdpath("config") .. "/lua"] = true,
	-- 			},
	-- 		},
	-- 	},
	-- },
})
