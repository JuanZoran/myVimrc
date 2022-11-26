local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    vim.notify("mason_null_ls error", "error")
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "sumneko_lua",
        "gopls"
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
        -- "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "clang-format",
        "goimports",
        -- "eslint_d", -- ts/js linter
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true,
})
