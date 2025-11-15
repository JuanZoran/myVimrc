return {
	"LudoPinelli/comment-box.nvim",
	cmd  = "CBcatalog",
	keys = {
		{ mode = { "n", "x" }, "gCj", function() require("comment-box").albox(3) end, desc = "Comment Left Box",   },
		{ mode = { "n", "x" }, "gCk", function() require("comment-box").acbox(3) end, desc = "Comment Center Box", },
		{ mode = { "n", "x" }, "gCl", function() require("comment-box").arbox(3) end, desc = "Comment Right Box",  },
	},
}
