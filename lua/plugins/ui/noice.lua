-- vim.notify("setting .........")
require("noice").setup({
    lsp = {
        -- TODO: config this with lsp progress
        progress = {
            enabled = false,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            -- format = "lsp_progress",
            -- format_done = "Completle!",
            -- throttle = 1000 / 50, -- frequency to update lsp progress message
            -- view = "notify",
        },
        hover = {
            enabled = false, -- avoid get conflicts with lspsaga
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
        command_palette = {
            views = {
                cmdline_popup = {
                    position = {
                        row = "50%",
                        col = "50%",
                    },
                    size = {
                        min_width = 60,
                        width = "auto",
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 23,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                        max_height = 15,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
                    },
                },
            },
        },
    },
})
