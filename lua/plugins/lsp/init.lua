if util.firenvim then return {} end
local plugins = util.list()

local config = function()
    local handler = require 'plugins.lsp.opts.handlers'
    local opts = {
        on_attach = handler.on_attach,
        capabilities = handler.get_capabilities(),
        handlers = handler.handlers,
    }

    local merged_conf = function(server)
        local _, conf_opts = pcall(require, 'server.' .. server)

        return _ and vim.tbl_extend('force', opts, conf_opts) or opts
    end

    require 'mason-lspconfig'.setup_handlers {
        function(server) require 'lspconfig'[server].setup(merged_conf(server)) end,
        rust_analyzer = function()
            require 'rust-tools'.setup {
                server = merged_conf 'rust_analyzer',
                tools = {
                    inlay_hints = {
                        auto = false,
                    },
                },
            }
        end,
    }
end

plugins:add {
    'simrat39/rust-tools.nvim',
    lazy = true,
}


plugins:add {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
        ui = {
            border = 'rounded',
            keymaps = {
                -- Keymap to expand a package
                toggle_package_expand = 'o',
                -- Keymap to install the package under the current cursor position
                install_package = 'y',
                -- Keymap to reinstall/update the package under the current cursor position
                update_package = 'u',
                -- Keymap to check for new version for the package under the current cursor position
                check_package_version = 'c',
                -- Keymap to update all installed packages
                update_all_packages = 'U',
                -- Keymap to check which installed packages are outdated
                check_outdated_packages = 'C',
                -- Keymap to uninstall a package
                uninstall_package = 'd',
                -- Keymap to cancel a package installation
                cancel_installation = '<C-c>',
                -- Keymap to apply language filter
                apply_language_filter = '<C-f>',
            },
        },
    },
}

plugins:add {
    'williamboman/mason-lspconfig.nvim',
    cmd = 'LspInstall',
    config = true,
}


plugins:add {
    'folke/neoconf.nvim',
    opts = {
        import = {
            vscode = false, -- local .vscode/settings.json
            coc = false,    -- global/local coc-settings.json
            nlsp = false,   -- global/local nlsp-settings.nvim json settings
        },
    },
}


plugins:add {
    'folke/neodev.nvim',
    opts = {
        library = {
            enabled = true,
            plugins = { 'plenary.nvim', 'luasnip' },
        },
    },
}

plugins:add {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting
        null_ls.setup {
            sources = {
                formatting.prettier.with { extra_args = function(opt)
                    return { '--tab-width', opt.options.tabSize }
                end, },
                -- formatting.prettier.with { extra_args = { '--tab-width', vim.bo.shiftwidth } },
                formatting.black.with { extra_args = { '--fast' } },
                formatting.beautysh,
                -- null_ls.builtins.code_actions.ts_node_action,
                -- formatting.stylua,
                -- null_ls.builtins.diagnostics.zsh,
            },
            on_attach = function(server, bufnr)
                if server.server_capabilities.documentFormattingProvider then
                    vim.keymap.set('n', '==',
                        function() vim.lsp.buf.format { async = true, buffer = bufnr } end,
                        { desc = ' formatting buffer' })
                end
            end,
        }
    end,

}
plugins:add {
    import = 'plugins.lsp.extra',
}

vim.keymap.set('n', '<leader>hi', function()
    vim.lsp.buf.inlay_hint(0)
end)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(env)
        if vim.lsp.get_client_by_id(env.data.client_id).server_capabilities.inlayHintProvider then
            vim.lsp.buf.inlay_hint(env.buf, true)
            vim.api.nvim_set_hl(0, 'LspInlayHint', {
                fg = '#858a94',
                bg = '#2d2e32',
                italic = true,
            })
        end
    end,
})

-- plugins:add {
--     'SmiteshP/nvim-navbuddy',
--     cond = false,
--     init = function()
--         require 'plugins.lsp.opts.handlers'.attach(function(client, bufnr)
--             require 'nvim-navbuddy'.attach(client, bufnr)
--         end)
--     end,
--     keys = {
--         { '<leader>k', '<Cmd>Navbuddy<CR>' },
--     },
--     opts = function()
--         local actions = require 'nvim-navbuddy.actions'
--         return {
--             window = {
--                 border = 'rounded',
--                 size = '65%',
--             },
--             mappings = {
--                 k = actions.next_sibling,     -- down
--                 i = actions.previous_sibling, -- up
--                 j = actions.parent,           -- Move to left panel
--                 l = actions.children,         -- Move to right panel
--                 h = actions.insert_name,      -- Insert at start of name
--                 H = actions.insert_scope,     -- Insert at start of scope
--             },
--         }
--     end,
-- }


-- plugins:add {
--     'SmiteshP/nvim-navic',
--     lazy = true,
--     opts = {
--         highlight = true,
--         separator = ' >> ',
--         depth_limit = 5,
--     },
--     init = function()
--         -- vim.g.navic_silence = true
--         require 'plugins.lsp.opts.handlers'.attach(function(client, bufnr)
--             if client.server_capabilities.documentSymbolProvider then
--                 require 'nvim-navic'.attach(client, bufnr)
--             end
--         end)
--     end,
-- }

return {
    'neovim/nvim-lspconfig', -- official lspconfig
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = plugins,
    config = config,
}
