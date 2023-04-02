return {
    settings = {
        gopls = {
            experimentalPostfixCompletions = true, -- NOTE : enable support for postfix completions
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true, -- better linting
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
    init_options = {
        usePlaceholders = true, -- add parameter placeholders when completing a function
    },
}
