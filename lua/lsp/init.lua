--- TODO :lualine show lspname
require("lsp.saga")
require("lsp.mason")

local ml = require("mason-lspconfig")
local servers = ml.get_installed_servers()
ml.setup {
    automatic_installation = false,
}

local lspconfig = require "lspconfig"
local handler = require("lsp.handlers")

--- 自动启动
local opts = {}
for _, server in ipairs(servers) do
    opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
        handlers = handler.handlers
    }

    local status, conf_opts = pcall(require, 'lsp.conf.' .. server)
    if status then
        opts = vim.tbl_extend("error", opts, conf_opts)
    end

    if server == 'clangd' then
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
    else
        lspconfig[server].setup(opts)
    end
end

--     -- TODO  load conf
local registry = require("mason-registry")
local package_to_lspconfig = require("mason-lspconfig.mappings.server").package_to_lspconfig
registry:on("package:uninstall:success", function(pkg)
    local native_name = package_to_lspconfig[pkg.name]
    if native_name then
        vim.ui.select(
            {
                'Remove your configuration for this Lsp',
                'Skip',
            },
            {
                prompt = 'Whether should remove the configuration ?',
            },
            function(select)
                if select ~= 'Skip' then
                    local res = os.remove(('%s/%s.lua'):format(vim.fn.stdpath('config') .. '/lua/lsp/conf', native_name))
                    vim.notify(('%s configuration removed %s'):format(pkg.name, (res and 'successfully' or 'failed')))
                else
                    vim.notify('Skip ...')
                end
            end
        )
    end
end)
