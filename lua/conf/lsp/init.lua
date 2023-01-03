local servers = {
    -- "sumneko_lua",
    -- "pyright",
    -- "clangd",
    -- "gopls",
    -- "bashls",
}


-- NOTE :  debug.getinfo(1,"S").source:sub(2)  can get this absolute filename
-- local confDir = debug.getinfo(1,"S").source:sub(2):match('.*/') .. 'settings'
local confDir = '/home/zoran/.config/nvim/lua/conf/lsp/settings'

for file in vim.fs.dir(confDir) do
    local server = file:match('[^.]+')
    if #server > 0 then
        table.insert(servers, server)
    end
end

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
for _, server in ipairs(servers) do
    opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
    }

    local conf_opts = require ("conf.lsp.settings." .. server)
        -- 合并表: force | error | keep, 表示发生冲突时的处理方法
        opts = vim.tbl_deep_extend("force", conf_opts, opts)

    lspconfig[server].setup(opts)
end
