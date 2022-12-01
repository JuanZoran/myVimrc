local navic = require("nvim-navic")
require("lualine").setup({
	-- options = { theme = "everforest" },
	options = { theme = "gruvbox-material" },
	-- options = { theme = "material" },
	-- options = { theme = "seoul256" },
	sections = {
		lualine_c = {
			-- { "filetype" },
			-- { navic.get_location, cond = navic.is_available },
			{ require("auto-session-library").current_session_name },
		},
	},
	winbar = {
		lualine_a = {
			{
				require("noice").api.status.mode.get, -- for macro
				cond = require("noice").api.status.mode.has,
				-- color = { fg = "#" },
			},
		},
		lualine_b = {
			{
				require("noice").api.status.command.get, -- show cmd in botton right
				cond = require("noice").api.status.command.has,
				color = { fg = "#a7c080" },
			},
			{
				require("noice").api.status.search.get, -- for search result
				cond = require("noice").api.status.search.has,
				color = { fg = "#a7c080" },
			},
		},
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
		-- lualine_x = {},
		-- lualine_y = {},
		-- lualine_z = {},
	},
    disabled_filetypes = {
      statusline = {"alpha"},
      winbar = {"alpha"},
    },
	-- extensions = { "quickfix", "nvim_tree" },
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
