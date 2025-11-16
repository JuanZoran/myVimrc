local headers = {
	[[
███████╗ ██████╗ ██████╗  █████╗ ███╗   ██╗
╚══███╔╝██╔═══██╗██╔══██╗██╔══██╗████╗  ██║
  ███╔╝ ██║   ██║██████╔╝███████║██╔██╗ ██║
 ███╔╝  ██║   ██║██╔══██╗██╔══██║██║╚██╗██║
███████╗╚██████╔╝██║  ██║██║  ██║██║ ╚████║
╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝]],
}
return {
	sections = {
		{
			section = "terminal",
			cmd = "chafa ~/.config/omarchy/current/background --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
			height = 17,
			padding = 1,
		},
		{
			pane = 2,
			{ section = "keys", gap = 1, padding = 1 },
			{ section = "startup" },
		},
	},
}
