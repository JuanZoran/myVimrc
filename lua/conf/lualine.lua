local icon = require("util").icon
local navic = require("nvim-navic")

require("lualine").setup({
    -- options = { theme = "everforest" },
    -- options = { theme = "iceberg_dark" },
    -- options = { theme = "gruvbox-material" },
    -- options = { theme = "material" },
    -- options = { theme = "seoul256" },
    options = {
        theme = "auto",
        disabled_filetypes = {
            statusline = { "alpha" },
            winbar = { "alpha" },
        },
    },
    sections = {
        lualine_b = {
            "branch",
            -- { 'diff', source = diff_source },
            { 'diff' },
        },
        lualine_c = {
            { require("auto-session-library").current_session_name },
            {
                "filename",
                -- TODO: Config this
                path = 1,
            },
        },
    },

    winbar = {
        lualine_a = {
            {
                "diagnostics",
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                sources = { "nvim_lsp" },
                -- Displays diagnostics for the defined severity types
                sections = { "error", "warn", "info", "hint" },
                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = "DiagnosticError", -- Changes diagnostics' error color.
                    warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
                    info = "DiagnosticInfo", -- Changes diagnostics' info color.
                    hint = "DiagnosticHint", -- Changes diagnostics' hint color.
                },
                symbols = { error = icon.Error, warn = icon.Warn, info = icon.Info, hint = icon.Hint },
                colored = false, -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = true, -- Show diagnostics even if there are none.
            },
        },
        lualine_b = {
            {
                require("noice").api.status.mode.get, -- for macro
                cond = require("noice").api.status.mode.has,
                -- color = { fg = "#a7c080" },
            },
            {
                require("noice").api.status.command.get,
                cond = require("noice").api.status.command.has,
            },
            {
                require("noice").api.status.search.get,
                cond = require("noice").api.status.search.has,
            },
        },

        lualine_c = {
            {
                navic.get_location,
                cond = navic.is_available,
            },
        },
        lualine_z = {
            "os.date[[%A %H:%M]]",
        },
        -- lualine_z = {},
    },
})
