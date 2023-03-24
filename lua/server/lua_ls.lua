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

    workspace = {
        library = {
            '/usr/share/awesome/lib',
        },
        checkThirdParty = false,
    },
    diagnostics = {
        globals = {
            'awesome',
            'client',
            'root',
            'screen',
            'mouse',
            'tag',
            'key',
            'keygrabber',
            'mousegrabber',
            'dbus',
            'drawin',
        },
        -- neededFileStatus = {
        --         ["codestyle-check"] = "Opened",
        -- },
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
