require("noice").setup({
    -- you can enable a preset for easier configuration
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        progress = {
            enabled = true,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini",
        },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
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
            },
        },
    },
})

vim.keymap.set({ "i", 'v' }, "<c-d>", function()
    if not require("noice.lsp").scroll(4) then
        return "<c-d>"
    end
end, { silent = true, expr = true })


vim.keymap.set({ "i", 'v' }, "<c-u>", function()
    if not require("noice.lsp").scroll(-4) then
        return "<c-u>"
    end
end, { silent = true, expr = true })
