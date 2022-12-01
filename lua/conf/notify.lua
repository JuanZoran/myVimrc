local notify = require("notify")
local icons = require('util').icon

notify.setup({
	---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
	stages = "slide",
	---@usage Function called when a new window is opened, use for changing win settings/config
	on_open = nil,
	---@usage Function called when a window is closed
	on_close = nil,
	---@usage timeout for notifications in ms, default 5000
	timeout = 2000,
	-- Render function for notifications. See notify-render()
	render = "default",
	---@usage highlight behind the window for stages that change opacity
	background_colour = "Normal",
	---@usage minimum width for notification windows
	minimum_width = 50,
	---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
	level = "TRACE",
	---@usage Icons for the different levels
	icons = {
	    ERROR = icons.Error,
	    WARN = icons.Warn,
	    INFO = icons.Info,
	    DEBUG = icons.Debug,
	    TRACE = icons.Trace,
	},
})

-- LSP process notify
if false then
	-- base functions
	-- Utility functions shared between progress reports for LSP and DAP

	local client_notifs = {}

	local function get_notif_data(client_id, token)
		if not client_notifs[client_id] then
			client_notifs[client_id] = {}
		end

		if not client_notifs[client_id][token] then
			client_notifs[client_id][token] = {}
		end

		return client_notifs[client_id][token]
	end

	local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

	local function update_spinner(client_id, token)
		local notif_data = get_notif_data(client_id, token)

		if notif_data.spinner then
			local new_spinner = (notif_data.spinner + 1) % #spinner_frames
			notif_data.spinner = new_spinner

			notif_data.notification = vim.notify(nil, nil, {
				hide_from_history = true,
				icon = spinner_frames[new_spinner],
				replace = notif_data.notification,
			})

			vim.defer_fn(function()
				update_spinner(client_id, token)
			end, 100)
		end
	end

	local function format_title(title, client_name)
		return client_name .. (#title > 0 and ": " .. title or "")
	end

	local function format_message(message, percentage)
		return (percentage and percentage .. "%\t" or "") .. (message or "")
	end

	-- lsp status
	-- LSP integration
	-- Make sure to also have the snippet with the common helper functions in your config!

	vim.lsp.handlers["$/progress"] = function(_, result, ctx)
		local client_id = ctx.client_id

		local val = result.value

		if not val.kind then
			return
		end

		local notif_data = get_notif_data(client_id, result.token)

		if val.kind == "begin" then
			local message = format_message(val.message, val.percentage)

			notif_data.notification = vim.notify(message, "info", {
				title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
				icon = spinner_frames[1],
				timeout = false,
				hide_from_history = false,
			})

			notif_data.spinner = 1
			update_spinner(client_id, result.token)
		elseif val.kind == "report" and notif_data then
			notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
				replace = notif_data.notification,
				hide_from_history = false,
			})
		elseif val.kind == "end" and notif_data then
			notif_data.notification = vim.notify(val.message and format_message(val.message) or "Complete", "info", {
				icon = "",
				replace = notif_data.notification,
				timeout = 3000,
			})

			notif_data.spinner = nil
		end
	end
end
vim.notify = notify
