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
            workspace = {
                library = {
                    '/usr/share/awesome/lib',
                },
                checkThirdParty = false,
            },
            diagnostics = {
                globals = {
                    "awesome",
                    "client",
                    "root",
                    "screen",
                    "mouse",
                    "tag",
                    "key",
                    "keygrabber",
                    "mousegrabber",
                    "dbus",
                    "drawin",
                },
            }

            -- hint = {
            --     enable = true,
            -- }
        },
    },
}
