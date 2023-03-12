return {
    settings = {
        gopls = {
            experimentalPostfixCompletions = true, -- NOTE : enable support for postfix completions
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true, -- better linting
        },
    },
    init_options = {
        usePlaceholders = true, -- add parameter placeholders when completing a function
    }
}
