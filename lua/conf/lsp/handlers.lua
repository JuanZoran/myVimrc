local M = {}

-- TODO: backfill this to template
M.setup = function()
	-- local signs = {
	-- 	{ name = "DiagnosticSignError", text = "" },
	-- 	{ name = "DiagnosticSignWarn", text = "" },
	-- 	{ name = "DiagnosticSignHint", text = "" },
	-- 	{ name = "DiagnosticSignInfo", text = "" },
	-- }
	-- for _, sign in ipairs(signs) do
	-- 	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	-- end

	local signs = { Error = "🤕", Warn = "😦", Info = "🤔", Hint = "😐" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local config = {
		-- disable virtual text
		-- virtual_text = true, --- enable for diagnostic information
		virtual_text = { source = "always", prefix = "🔬" },

		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			-- prefix = "🔔",
			prefix = "🔮",
		},
	}

	vim.diagnostic.config(config)
	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 	border = "rounded",
	-- })
end

local navic = require("nvim-navic")
navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
	-- highlight = true,
	separator = "  ",
	-- separator = "  ",
})

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	local map = require("util").map
	map(
		"n",
		{ silent = true, buffer = bufnr },
		{ "<Leader>rn", "<cmd>Lspsaga rename<CR>" },
		{ "<Leader>ca", "<cmd>Lspsaga code_action<CR>" },
		{ "<Leader>dd", "<cmd>Lspsaga show_line_diagnostics<CR>" },
		{ "<Leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
		{
			"<Leader>dm",
			vim.diagnostic.setqflist,
		},
		{ "<Leader>o", "<cmd>LSoutlineToggle<CR>" },
		{ "gh", "<cmd>Lspsaga hover_doc<cr>" },
		{ "gf", "<cmd>Lspsaga lsp_finder<cr>" },
		{ "gd", "<cmd>Lspsaga peek_definition<cr>" },
		{
			"gD",
			vim.lsp.buf.declaration,
		},
		{
			"gi",
			vim.lsp.buf.implementation,
		},
		{
			"gr",
			vim.lsp.buf.references,
		},
		{
			"<Leader>de",
			vim.diagnostic.open_float,
		},
		-- for text diagnostic
		{ "<Leader>dj", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
		{ "<Leader>dl", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
		{
			"<Leader>de",
			vim.diagnostic.open_float,
		},
		{
			"==",
			function()
				vim.lsp.buf.format({
					filter = function(client)
						-- apply whatever logic you want (in this example, we'll only use null-ls)
						return client.name == "null-ls"
					end,
					async = true,
				})
			end,
		}
	)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- NOTE: Make UFO use Lsp for fold
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
return M

-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
-- 	border = "rounded",
-- })

-- local function lsp_highlight_document(client)
-- 	-- Set autocommands conditional on server_capabilities
-- 	if client.server_capabilities.documentHighlight then
-- 		vim.cmd([[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]])
-- 	end
-- end
--
-- require("lsp_signature").on_attach({
-- 	bind = true, -- This is mandatory, otherwise border config won't get registered.
-- 	handler_opts = {
-- 		border = "rounded",
-- 	},
-- }, bufnr) -- Note: add in lsp client on-attach

-- lsp_highlight_document(client)
