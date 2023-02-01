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



-- Utility functions shared between progress reports for LSP and DAP

-- local client_notifs = {}

-- local function get_notif_data(client_id, token)
--     if not client_notifs[client_id] then
--         client_notifs[client_id] = {}
--     end

--     if not client_notifs[client_id][token] then
--         client_notifs[client_id][token] = {}
--     end

--     return client_notifs[client_id][token]
-- end

-- local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

-- local function update_spinner(client_id, token)
--     local notif_data = get_notif_data(client_id, token)

--     if notif_data.spinner then
--         local new_spinner = (notif_data.spinner + 1) % #spinner_frames
--         notif_data.spinner = new_spinner

--         notif_data.notification = vim.notify(nil, nil, {
--             hide_from_history = true,
--             icon = spinner_frames[new_spinner],
--             replace = notif_data.notification,
--         })

--         vim.defer_fn(function()
--             update_spinner(client_id, token)
--         end, 100)
--     end
-- end

-- local function format_title(title, client_name)
--     return client_name .. (#title > 0 and ": " .. title or "")
-- end

-- local function format_message(message, percentage)
--     return (percentage and percentage .. "%\t" or "") .. (message or "")
-- end

-- -- LSP integration
-- -- Make sure to also have the snippet with the common helper functions in your config!
-- vim.lsp.handlers["$/progress"] = function(_, result, ctx)
--     local client_id = ctx.client_id

--     local val = result.value

--     if not val.kind then
--         return
--     end

--     local notif_data = get_notif_data(client_id, result.token)

--     if val.kind == "begin" then
--         local message = format_message(val.message, val.percentage)

--         notif_data.notification = vim.notify(message, "info", {
--             title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
--             icon = spinner_frames[1],
--             timeout = false,
--             hide_from_history = false,
--         })

--         notif_data.spinner = 1
--         update_spinner(client_id, result.token)
--     elseif val.kind == "report" and notif_data then
--         notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
--             replace = notif_data.notification,
--             hide_from_history = false,
--         })
--     elseif val.kind == "end" and notif_data then
--         notif_data.notification =
--         vim.notify(val.message and format_message(val.message) or "Complete", "info", {
--             icon = "",
--             replace = notif_data.notification,
--             timeout = 3000,
--         })

--         notif_data.spinner = nil
--     end
-- end
