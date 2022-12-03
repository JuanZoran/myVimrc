local servers = {
	"sumneko_lua", -- for python
	"pyright",
	"clangd",
	"gopls",
	"bashls",
	"marksman",
}
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	vim.notify("lspconfig error", "error")
	return
end

local handler = require("conf.lsp.handlers")
handler.setup()

--- 自动启动
local opts = {}
for _, server in pairs(servers) do
	opts = {
		on_attach = handler.on_attach,
		capabilities = handler.capabilities,
	}

	server = vim.split(server, "@")[1]
	local require_ok, conf_opts = pcall(require, "conf.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	else
		vim.notify(server .. " Not Found")
	end

	lspconfig[server].setup(opts)
end
