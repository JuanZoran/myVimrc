return {
	"nguyenvukhang/nvim-toggler",
	keys = {
		{ "<leader>u", function() require("nvim-toggler").toggle() end, },
	},
	opts = {
        -- inverses ={
        --     ['vim'] = 'emacs',
        -- }
    },
}
