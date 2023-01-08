local icon = require("util").icon


-- TODO : lsp server Name
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

local function lsp_is_active()
    return vim.lsp.buf_get_clients() ~= nil
end

local function get_lsp_staus()
    local clients = vim.lsp.buf_get_clients()
    local status = ''
    local tmp = {}
    for _, v in pairs(clients) do
        table.insert(tmp, v.name)
    end
    status = table.concat(tmp, '  ')
    return status
end

local lsp_status = {
    get_lsp_staus,
    cond = lsp_is_active,
    color = {
        fg = '#000000', bg = '#10B981'
    },
    separator = {
        left = '',
        right = '',
    }, -- Determines what separator to use for the component.
}


require("lualine").setup({
    options = {
        -- component_separators = { left = '', right = '' },
        section_separators = {
            right = '',
            left = '',
        },
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
        lualine_z = {
            lsp_status,
        },
        lualine_b = {
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

        lualine_c = {
            {
                require('lspsaga.symbolwinbar').get_symbol_node,
                -- on_click = handler,
            },
        },
        lualine_a = {
            {
                "os.date[[%A %H:%M]]",
                color = {
                    fg = '#000000', bg = '#10B981'
                },
            },
        },
    },
    extensions = { "nvim-tree", "quickfix" },
})
