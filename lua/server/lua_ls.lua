-- vim.api.nvim_create_autocmd('BufReadPost', {
--     pattern = 'xmake.lua',
--     callback = function ()
--         require('neodev').register {
--             name = 'lspconfig',
--         }
--     end
-- })


local opts = {
    completion = {
        postfix = ':', -- for better completion
        displayContext = 2,
        callSnippet = 'Replace',
        keywordSnippet = 'Replace',
    },
    -- hint = {
    --     enable = true,
    -- }
    format = {
        enable = true,
        defaultConfig = {
            quote_style                      = 'single',
            call_arg_parentheses             = 'remove',
            trailing_table_separator         = 'smart',
            never_indent_before_if_condition = 'false',
            -- align_continuous_rect_table_field = "false",
        },
    },
}

return {
    settings = {
        Lua = opts,
    },
    -- server_capabilities = {
    --     documentFormattingProvider = false,
    -- },
}
