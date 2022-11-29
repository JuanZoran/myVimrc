-- if you want to set which can be the jump-key
-- require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
vim.keymap.set("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", {silent = true})
vim.keymap.set("x", "m", ":lua require('tsht').nodes()<CR>", {silent = true})
