-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    vim.notify('saga error', 'error')
  return
end

saga.init_lsp_saga({
  -- keybinds for navigation in lspsaga window
  move_in_saga = { prev = "<C-i>", next = "<C-k>" },
  -- use enter to open file with finder
  finder_action_keys = {
    open = "<CR>",
  },
  -- use enter to open file with definition preview
  definition_action_keys = {
    edit = "<CR>",
  },
})
