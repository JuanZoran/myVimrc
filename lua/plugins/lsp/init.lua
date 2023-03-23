local config = function()
    local handler = require 'plugins.lsp.handlers'
    local opts = {
        on_attach = handler.on_attach,
        capabilities = handler.get_capabilities(),
        handlers = handler.handlers,
    }

    local setup = function(server)
        local _, conf_opts = pcall(require, 'server.' .. server)
        local conf = (_ and conf_opts) and vim.tbl_extend('error', vim.deepcopy(opts), conf_opts) or opts
        require 'lspconfig'[server].setup(conf)
    end

    local exist = vim.fn.executable
    if exist 'marksman' == 1 then setup 'marksman' end
    if exist 'rust-analyzer' == 1 then setup 'rust_analyzer' end
    if exist 'lua-language-server' == 1 then setup 'lua_ls' end

    if exist 'clangd' == 1 then
        local _, conf_opts = pcall(require, 'server.clangd')
        local conf = _ and vim.tbl_extend('error', vim.deepcopy(opts), conf_opts) or opts
        require 'clangd_extensions'.setup {
            server = conf,
            extensions = {
                memory_usage = {
                    border = 'rounded',
                },
                symbol_info = {
                    border = 'rounded',
                },
            },
        }
    end
    require 'mason-lspconfig'.setup_handlers { setup }
end

return {
    'neovim/nvim-lspconfig', -- official lspconfig
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'p00f/clangd_extensions.nvim',
        {
            'glepnir/lspsaga.nvim',
            opts = function()
                return require 'plugins.lang.saga'
            end,
        }, -- pretty ui for [code-action | hover-text | ....]
        {
            'williamboman/mason.nvim',
            cmd = 'Mason',
            opts = {
                ui = {
                    border = 'rounded',
                    keymaps = {
                        -- Keymap to expand a package
                        toggle_package_expand   = 'o',
                        -- Keymap to install the package under the current cursor position
                        install_package         = '<Leader>i',
                        -- Keymap to reinstall/update the package under the current cursor position
                        update_package          = 'u',
                        -- Keymap to check for new version for the package under the current cursor position
                        check_package_version   = 'c',
                        -- Keymap to update all installed packages
                        update_all_packages     = 'U',
                        -- Keymap to check which installed packages are outdated
                        check_outdated_packages = 'C',
                        -- Keymap to uninstall a package
                        uninstall_package       = 'd',
                        -- Keymap to cancel a package installation
                        cancel_installation     = '<C-c>',
                        -- Keymap to apply language filter
                        apply_language_filter   = '<C-f>',
                    },
                },
            },
        },
        { 'williamboman/mason-lspconfig.nvim', cmd = 'LspInstall', config = true },
        {
            'folke/neodev.nvim',
            opts = { library = { plugins = { 'nvim-dap-ui', 'plenary' } } },
        },
        {
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                local null_ls = require 'null-ls'
                local formatting = null_ls.builtins.formatting
                null_ls.setup {
                    sources = {
                        formatting.prettier.with { extra_args = { '--tab-width', 4 } }, -- I prefer 4
                        formatting.black.with { extra_args = { '--fast' } },
                        formatting.beautysh,

                    },
                    on_attach = function(server, bufnr)
                        if server.server_capabilities.documentFormattingProvider then
                            vim.keymap.set('n', '==', function() vim.lsp.buf.format { async = true, buffer = bufnr } end,
                                { desc = ' formatting buffer' })
                        end
                    end,
                }
            end,
        },
    },
    config = config,
}
