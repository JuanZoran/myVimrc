vim.opt.termguicolors = true

-- 复制高亮

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

-- TODO
-- for non background
vim.cmd([[colorscheme everforest]])
-- vim.nvim_set_hl(0, 'Normal', {})
vim.cmd([[highlight Normal guibg=NONE ctermbg=None]])
-- vim.cmd([[highlight Visual guibg=#e9dcb6 ctermbg=16]])
vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=None]])
vim.cmd([[hi Todo gui=bold guifg=#2f383e guibg=#83c092]])
-- vim.cmd([[highlight FidgetTitle ctermfg=None guifg=None]])

-- vim.api.nvim_set_hl(0, "Normal", { guibg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { guibg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
