-- Remove annoying indent jumping
-- vim.bo.cinoptions = vim.bo.cinoptions .. "L0"

-- switch header / source
vim.keymap.set({ "i", "n" }, "<C-k>", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = true })
