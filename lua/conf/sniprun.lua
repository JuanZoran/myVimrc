local M = {}
function M.setup()
	require("sniprun").setup({
		display = {
			-- "Classic",
			-- "VirtualTextOk",
			-- "TempFloatingWindow",
			"VirtualText",             --# display results as virtual text
			-- "TempFloatingWindow",      --# display results in a floating window
			-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
			-- "Terminal",                --# display results in a vertical split
			-- "TerminalWithCode",        --# display results and code history in a vertical split
			"NvimNotify",              --# display with the nvim-notify plugin
			-- "Api"                      --# return output to a programming interface
		},
	})
end
return M
