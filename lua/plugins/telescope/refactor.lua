require('refactoring').setup({
    prompt_func_return_type = {
        go = true,
        -- java = false,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
        -- lua = true,
    },
    prompt_func_param_type = {
        go = true,
        -- java = false,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
        -- lua = true
    },
    -- printf_statements = {},
    -- print_var_statements = {},
})

require('telescope').load_extension("refactoring")
vim.keymap.set(
    "v",
    "<Leader>rr",
    "<esc><cmd>lua require('telescope').extensions.refactoring.refactors()<cr>",
    { desc = '[]Refactoring Operations' }
)
