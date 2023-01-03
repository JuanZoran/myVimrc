local servers = {
    -- "sumneko_lua",
    -- "pyright",
    -- "clangd",
    -- "gopls",
    -- "bashls",
}

-- NOTE :  debug.getinfo(1,"S").source:sub(2)  can get this absolute filename
-- local confDir = debug.getinfo(1,"S").source:sub(2):match('.*/') .. 'settings'
local confDir = vim.fn.stdpath('config') .. '/lua/lsp/conf'

for file in vim.fs.dir(confDir) do
    local server = file:match('[^.]+')
    if #server > 0 then
        table.insert(servers, server)
    end
end

require("lsp.saga")

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

local handler = require("lsp.handlers")

--- 自动启动
local opts = {}
for _, server in ipairs(servers) do
    opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
    }

    local conf_opts = require('lsp.conf.' .. server)
    -- 合并表: force | error | keep, 表示发生冲突时的处理方法
    opts = vim.tbl_deep_extend("force", conf_opts, opts)

    lspconfig[server].setup(opts)
end
