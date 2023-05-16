if util.firenvim then return {} end
local plugins = util.list()

local config = function()
    local handler = require 'plugins.lsp.handlers'
    local opts = {
        on_attach = handler.on_attach,
        capabilities = handler.get_capabilities(),
        handlers = handler.handlers,
    }
    require 'mason-lspconfig'.setup_handlers { function(server)
        local _, conf_opts = pcall(require, 'server.' .. server)
        local conf = _ and vim.tbl_extend('error', opts, conf_opts) or opts
        require 'lspconfig'[server].setup(conf)
    end, }
end

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
    'glepnir/lspsaga.nvim',
    opts = function() return require 'plugins.lsp.saga' end,
}

plugins:add {
    'lvimuser/lsp-inlayhints.nvim',
    -- commit = '84ca3abe8aaecbb5b30ad89e4701d4a9c821b72c',
    init = function()
        require 'plugins.lsp.handlers'.attach(function(client, bufnr)
            require 'lsp-inlayhints'.on_attach(client, bufnr)
        end)
    end,
    keys = { {
        '<leader>hi', function() require 'lsp-inlayhints'.toggle() end, desc = 'Toggle Inlay Hints',
    }, },
    opts = {
        inlay_hints = {
            parameter_hints = { prefix = 'param:' },
            type_hints = { prefix = 'type' },
            only_current_line = false,
        },
    },
    config = function(_, opts)
        require 'lsp-inlayhints'.setup(opts)
        vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#9692af' })
    end,
}
-- dependencies = {
--     {
--         'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
--         -- FIXME :
--         cond = false,
--         config = true,
--     },
-- }, -- pretty ui for [code-action | hover-text | ....]

plugins:add {
    'SmiteshP/nvim-navbuddy',
    init = function()
        require 'plugins.lsp.handlers'.attach(function(client, bufnr)
            require 'nvim-navbuddy'.attach(client, bufnr)
        end)
    end,
    keys = {
        { '<leader>k', '<Cmd>Navbuddy<CR>' },
    },
    opts = function()
        local actions = require 'nvim-navbuddy.actions'
        return {
            window = {
                border = 'rounded',
                size = '65%',
            },
            mappings = {
                k = actions.next_sibling,     -- down
                i = actions.previous_sibling, -- up
                j = actions.parent,           -- Move to left panel
                l = actions.children,         -- Move to right panel
                h = actions.insert_name,      -- Insert at start of name
                H = actions.insert_scope,     -- Insert at start of scope
            },
        }
    end,
}

return {
    'neovim/nvim-lspconfig', -- official lspconfig
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = plugins,
    config = config,
}
