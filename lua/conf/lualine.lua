local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local icon = require("util").icon
local navic = require("nvim-navic")

require("lualine").setup({
    -- options = { theme = "everforest" },
    -- options = { theme = "iceberg_dark" },
    options = {
        theme = "auto",
        disabled_filetypes = {
            statusline = { "alpha" },
            winbar = { "alpha" },
        },
    },
    -- options = { theme = "gruvbox-material" },
    -- options = { theme = "material" },
    -- options = { theme = "seoul256" },
    sections = {
        lualine_b = {
            "branch",
            { 'diff', source = diff_source },
            {
                "diagnostics",
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                sources = { "nvim_diagnostic", "nvim_lsp" },
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
        lualine_c = {
            { require("auto-session-library").current_session_name },
        },
    },

    winbar = {
        lualine_a = {},
        lualine_b = {
            {
                require("noice").api.status.mode.get, -- for macro
                cond = require("noice").api.status.mode.has,
                -- color = { fg = "#a7c080" },
            },
            {
                require("noice").api.status.command.get, -- show cmd in botton right
                cond = require("noice").api.status.command.has,
            },
            {
                require("noice").api.status.search.get, -- for search result
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
        -- lualine_y = {},
        -- lualine_z = {},
    },
})

-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }
