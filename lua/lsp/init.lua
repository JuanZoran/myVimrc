local servers = {}
local enable_auto_install = false

require("lsp.saga")

-- NOTE :  debug.getinfo(1,"S").source:sub(2)  can get this absolute filename
-- local confDir = debug.getinfo(1,"S").source:sub(2):match('.*/') .. 'settings'
local confDir = vim.fn.stdpath('config') .. '/lua/lsp/conf'

for file in vim.fs.dir(confDir) do
    local server = file:match('[^.]+')
    if #server > 0 then
        table.insert(servers, server)
    end
end

require('mason').setup {
    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        -- check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        -- border = "none",
        icons = {
            -- The list icon to use for installed packages.
            package_installed = "✓",
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "➜",
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "✗",
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "<Leader>i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "d",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },
}

require("mason-lspconfig").setup {
    ensure_installed = enable_auto_install and servers or nil,
    automatic_installation = enable_auto_install,
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
-- local blacklist = {
--     'grammarly'
-- }

for _, server in ipairs(servers) do
    -- if not vim.tbl_contains(blacklist, server) then
    opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
    }
    -- end

    local conf_opts = require('lsp.conf.' .. server)
    for k, v in pairs(conf_opts) do
        if type(v) == 'table' then
            opts[k] = opts[k] and vim.tbl_deep_extend("force", opts[k], v) or v
        else
            opts[k] = v
        end
    end
    -- 合并表: force | error | keep, 表示发生冲突时的处理方法
    lspconfig[server].setup(opts)
end
