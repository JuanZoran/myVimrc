local opts = {
    runtime = {
        version = 'LuaJIT',
    },
    completion = {
        postfix        = ':', -- for better completion
        displayContext = 2,
        callSnippet    = 'Replace',
        keywordSnippet = 'Replace',
    },
    workspace = {
        userThirdParty = {
            os.getenv 'HOME' .. '/.config/LLS-Addons',
        },
        -- checkThirdParty = false,
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
