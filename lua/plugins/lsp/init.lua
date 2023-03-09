local config = function()
    local handler = require("plugins.lsp.handlers")
    local opts = {
        on_attach = handler.on_attach,
        capabilities = handler.get_capabilities(),
        handlers = handler.handlers
    }

    require('mason-lspconfig').setup_handlers {
        function(server)
            local _, conf_opts = pcall(require, 'server.' .. server)
            local conf = _ and vim.tbl_extend("error", vim.deepcopy(opts), conf_opts) or opts
            require('lspconfig')[server].setup(conf)
        end,
        ['clangd'] = function()
            local _, conf_opts = pcall(require, 'server.clangd')
            local conf = _ and vim.tbl_extend("error", vim.deepcopy(opts), conf_opts) or opts
            require("clangd_extensions").setup {
                server = conf,
                extensions = {
                    memory_usage = {
                        border = "rounded",
                    },
                    symbol_info = {
                        border = "rounded",
                    },
                }
            }
        end,
    }

    --     -- TODO  load conf
    local registry = require("mason-registry")
    local package_to_lspconfig = require("mason-lspconfig.mappings.server").package_to_lspconfig
    registry:on("package:uninstall:success", function(pkg)
        local native_name = package_to_lspconfig[pkg.name]
        local process = function(select)
            if select ~= 'Skip' then
                local res = os.remove(('%s/%s.lua'):format(vim.fn.stdpath('config') .. '/lua/lsp/conf',
                    native_name))
                vim.notify(('%s configuration removed %s'):format(pkg.name,
                    (res and 'successfully' or 'failed')))
            else
                vim.notify('Skip ...')
            end
        end

        if native_name then
            vim.ui.select(
                { 'Remove your configuration for this Lsp', 'Skip', },
                { prompt = 'Whether should remove the configuration ?', },
                process
            )
        end
    end)
end

return {
    "neovim/nvim-lspconfig", -- official lspconfig
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'p00f/clangd_extensions.nvim',
        {
            "glepnir/lspsaga.nvim", opts = function()
            return require('plugins.lang.saga')
        end,
        }, -- pretty ui for [code-action | hover-text | ....]
        {
            "williamboman/mason.nvim",
            cmd = 'Mason',
            opts = {
                ui = {
                    border = "rounded",
                    keymaps = {
                        -- Keymap to expand a package
                        toggle_package_expand = "o",
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
            },
        },
        { "williamboman/mason-lspconfig.nvim", cmd = 'LspInstall', config = true },
        {
            "folke/neodev.nvim",
            opts = { library = { plugins = { 'nvim-dap-ui', }, } },
        },
        {
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                local null_ls = require("null-ls")
                local formatting = null_ls.builtins.formatting
                null_ls.setup {
                    sources = {
                        formatting.prettier.with { extra_args = { '--tab-width', 4 } }, -- I prefer 4
                        formatting.black.with { extra_args = { '--fast' } },
                        formatting.beautysh,
                        -- null_ls.builtins.completion.luasnip,
                    },
                    on_attach = function(server, bufnr)
                        if server.server_capabilities.documentFormattingProvider then
                            vim.keymap.set('n', '==', function() vim.lsp.buf.format({ async = true, buffer = bufnr }) end,
                                { desc = ' formatting buffer' })
                        end
                    end
                }
            end,
        }
    },
    config = config,
}
