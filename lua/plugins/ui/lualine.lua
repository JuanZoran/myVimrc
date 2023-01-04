local icon = require("util").icon

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

-- local function handler(clicks, button, modifiers)
--     -- To see all available details: vim.pretty_print(node)
--     local st = node.range.start
--     local en = node.range['end']
--     if button == "l" then
--         if clicks == 2 then
--             -- double left click to do nothing
--         else -- jump to node's starting line+char
--             vim.fn.cursor(st.line + 1, st.character + 1)
--         end
--     elseif button == "r" then
--         if modifiers == "s" then
--             print "lspsaga" -- shift right click to print "lspsaga"
--         end -- jump to node's ending line+char
--         vim.fn.cursor(en.line + 1, en.character + 1)
--     elseif button == "m" then
--         -- middle click to visual select node
--         vim.fn.cursor(st.line + 1, st.character + 1)
--         vim.cmd "normal v"
--         vim.fn.cursor(en.line + 1, en.character + 1)
--     end
-- end

require("lualine").setup({
    -- options = { theme = "everforest" },
    -- options = { theme = "iceberg_dark" },
    -- options = { theme = "gruvbox-material" },
    -- options = { theme = "material" },
    -- options = { theme = "seoul256" },
    options = {
        theme = "auto",
        disabled_filetypes = {
            statusline = {
                "alpha",
                -- "NvimTree",
                "startuptime",
                "toggleterm",
                "lspsagaoutline",
            },
            winbar = {
                "alpha",
                "help",
                "packer",
                "NvimTree",
                "lspsagaoutline",
                "toggleterm",
                -- "dap-repl",
                -- "dapui_console",
                -- "dapui_watches",
                -- "dapui_stacks",
                -- "dapui_breakpoints",
                -- "dapui_scopes",
            },
        },
    },
    sections = {
        lualine_b = {
            -- "branch",
            { 'b:gitsigns_head', icon = '' },
            { 'diff', source = diff_source },
        },
        lualine_c = {
            {
                "filename",
                path = 1,
            },
            -- 'lsp_progress',
        },
    },
    winbar = {
        lualine_a = {
            {
                "diagnostics",
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                sources = { "nvim_diagnostic" },
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
            {
                require("noice").api.status.mode.get, -- for macro
                cond = require("noice").api.status.mode.has,
                -- color = { fg = "#a7c080" },
            },
        },
        lualine_b = {
            {
                require("noice").api.status.command.get,
                cond = require("noice").api.status.command.has,
            },
            -- {
            --     require("noice").api.status.search.get,
            --     cond = require("noice").api.status.search.has,
            -- },
        },

        lualine_c = {
            {
                require('lspsaga.symbolwinbar').get_symbol_node,
                -- on_click = handler,
            },
            -- {
            --     navic.get_location,
            --     cond = navic.is_available,
            --     -- color = { fg = "#f3ca28" },
            -- },
        },
        lualine_z = {
            "os.date[[%A %H:%M]]",
        },
    },
    extensions = { "nvim-tree", "quickfix" },
})
