local opts = {
    codeLens = { enable = true },
    runtime = { version = 'LuaJIT' },
    hint = {
        enable = true,
        -- arrayIndex = 'Enable',
        setType = true,
    },
    completion = {
        postfix        = ':', -- for better completion
        displayContext = 15,
        callSnippet    = 'Replace',
        keywordSnippet = 'Replace',
    },
    workspace = {
        userThirdParty = {
            os.getenv 'HOME' .. '/.config/LLS-Addons',
        },
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
    cmd = {
        --- TODO :remove this when lua-language-server updates
        '/home/zoran/Downloads/lua-language-server-f85e039-linux-x64/bin/lua-language-server',
        '--locale=zh-cn'
    },
    settings = {
        Lua = opts,
    },
    -- server_capabilities = {
    --     documentFormattingProvider = false,
    -- },
}
