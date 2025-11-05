local function get_plug(plug_name)
    return require ('plugins.lsp.' .. plug_name)
end


return {
    get_plug 'cmp',
    -- get_plug('linter'),
    get_plug('rustace'),
    get_plug('saga'),
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = {
                    "rust_analyzer",
                }
            }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
}
