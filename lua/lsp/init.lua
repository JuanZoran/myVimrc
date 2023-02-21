--- TODO :lualine show lspname
require("lsp.saga")

local servers = require("mason-lspconfig").get_installed_servers()
local lspconfig = require "lspconfig"
local handler = require("lsp.handlers")

local setup = function(server)
    local opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
        handlers = handler.handlers
    }
    local _, conf_opts = pcall(require, 'lsp.conf.' .. server)
    if _ then
        opts = vim.tbl_extend("error", opts, conf_opts)
    end

    lspconfig[server].setup(opts)
end
--- 自动启动
for _, server in ipairs(servers) do
    setup(server)
end

local exist = vim.fn.executable
if exist('lua-language-server') == 1 then
    setup('lua_ls')
end

if exist('marksman') == 1 then
    setup('marksman')
end

if exist('rust-analyzer') == 1 then
    setup('rust_analyzer')
end

if exist('clangd') == 1 then
    local opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
        handlers = handler.handlers
    }

    opts.capabilities.offsetEncoding = 'utf-8'
    local _, conf = pcall(require, 'lsp.conf.clangd')
    if _ then
        opts = vim.tbl_extend("error", opts, conf)
    end
    require("clangd_extensions").setup {
        server = opts,
        extensions = {
            memory_usage = {
                border = "rounded",
            },
            symbol_info = {
                border = "rounded",
            },
        }
    }
end

--     -- TODO  load conf
-- local registry = require("mason-registry")
-- local package_to_lspconfig = require("mason-lspconfig.mappings.server").package_to_lspconfig
-- registry:on("package:uninstall:success", function(pkg)
--     local native_name = package_to_lspconfig[pkg.name]
--     if native_name then
--         vim.ui.select(
--             { 'Remove your configuration for this Lsp', 'Skip', },
--             { prompt = 'Whether should remove the configuration ?', },
--             function(select)
--                 if select ~= 'Skip' then
--                     local res = os.remove(('%s/%s.lua'):format(vim.fn.stdpath('config') .. '/lua/lsp/conf', native_name))
--                     vim.notify(('%s configuration removed %s'):format(pkg.name, (res and 'successfully' or 'failed')))
--                 else
--                     vim.notify('Skip ...')
--                 end
--             end
--         )
--     end
-- end)
