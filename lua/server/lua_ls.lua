-- NOTE :it has been setuped by `neodev.nvim`
return {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Both",
                keywordSnippet = "Both",
                displayContext = 2,
                postfix = ':', -- for better completion
            },
            -- hint = {
            --     enable = true,
            -- }
        },
    },
}
