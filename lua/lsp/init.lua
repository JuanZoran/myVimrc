local servers = {}
local auto_install = false
local auto_configure = true

require("lsp.saga")
require("lsp.mason")

-- NOTE :  debug.getinfo(1,"S").source:sub(2)  can get this absolute filename
-- local confDir = debug.getinfo(1,"S").source:sub(2):match('.*/') .. 'settings'

local conf_dir = vim.fn.stdpath('config') .. '/lua/lsp/conf'
for file in vim.fs.dir(conf_dir) do
    local server = file:match('[^.]+')
    if #server > 0 then
        table.insert(servers, server)
    end
end


require("mason-lspconfig").setup {
    ensure_installed = auto_install and servers or nil,
    automatic_installation = auto_install,
}

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    vim.notify("lspconfig error", "error")
    return
end

local handler = require("lsp.handlers")

--- 自动启动
local opts = {}
for _, server in ipairs(servers) do
    opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
    }

    local conf_opts = require('lsp.conf.' .. server)
    for k, v in pairs(conf_opts) do
        if type(v) == 'table' then
            opts[k] = opts[k] and vim.tbl_deep_extend("force", opts[k], v) or v
        else
            opts[k] = v
        end
    end

    lspconfig[server].setup(opts)
end

if auto_configure then
    -- TODO  load conf
    local registry = require("mason-registry")

    local package_to_lspconfig = require("mason-lspconfig.mappings.server").package_to_lspconfig
    local default_conf = [[
return {
    -- TODO <++>
}
]]

    -- NOTE if package is included in neovim native lsp then create default conf
    registry:on("package:install:success", function(pkg)
        local native_name = package_to_lspconfig[pkg.name]
        if native_name then
            local new_file = ('%s/%s.lua'):format(conf_dir, native_name)
            local exsit = io.open(new_file, 'r')
            if exsit then
                vim.notify(pkg.name .. 'configuration has exsited!')
                exsit:close()
                return
            end
            local new_conf = io.open(new_file, 'a')
            assert(new_conf ~= nil)
            new_conf:write(default_conf)
            new_conf:close()
            vim.notify(pkg.name .. ' configuration has been created successfully!')
        end
    end)

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
                        local res = os.remove(('%s/%s.lua'):format(conf_dir, native_name))
                        vim.notify(('%s configuration removed %s'):format(pkg.name, (res and 'successfully' or 'failed')))
                    else
                        vim.notify('Skip ...')
                    end
                end
            )
        end
    end)
end
