-- switch header / source
vim.keymap.set({ "i", "n" }, "<C-k>", "<Cmd>ClangdSwitchSourceHeader<CR>", { buffer = true })
vim.keymap.set("n", "<leader>k", "<Cmd>ClangdMemoryUsage<CR>", { buffer = true })
