-- switch header / source
vim.keymap.set({ "i", "n" }, "<C-k>", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = true })
