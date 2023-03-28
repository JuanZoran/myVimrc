local opts = {
    completion = {
        postfix        = ':', -- for better completion
        displayContext = 2,
        callSnippet    = 'Replace',
        keywordSnippet = 'Replace',
    },
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
