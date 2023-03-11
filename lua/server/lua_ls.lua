local opts = {
    codelens = {
        enable = true,
    },
    completion = {
        postfix        = ":", -- for better completion
        displayContext = 2,
        callSnippet    = "Both",
        keywordSnippet = "Both",
    },
    -- hint = {
    --     enable = true,
    -- }
    format = {
        defaultConfig = {
            call_arg_parentheses     = "remove",
            trailing_table_separator = "always",
            quote_style              = "double",
            align_if_branch                              = true,
            space_before_open_square_bracket             = true,
            space_inside_function_call_parentheses       = true,
            space_inside_function_param_list_parentheses = true,
            space_inside_square_brackets                 = true,
            space_before_function_open_parenthesis       = true,
            space_before_function_call_open_parenthesis  = true,
            align_call_args                              = true,
        },
    },
}


return {
    settings = {
        Lua = opts,
    },
}
