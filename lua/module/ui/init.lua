-- lualine
local status_ok, _ = pcall(require, "module.ui.conf.lualine")
if not status_ok then
    vim.notify("Error lualine", "error")
    return
end

-- alpha
local status_ok, _ = pcall(require, "module.ui.conf.alpha")
if not status_ok then
    vim.notify("Error alpha", "error")
    return
end

-- bufferline
local status_ok, _ = pcall(require, "module.ui.conf.bufferline")
if not status_ok then
    vim.notify("Error bufferline", "error")
    return
end

-- notify
local status_ok, _ = pcall(require, "module.ui.conf.notify")
if not status_ok then
    vim.notify("Error notify", "error")
    return
end

-- noice
local status_ok, _ = pcall(require, "module.ui.conf.noice")
if not status_ok then
    vim.notify("Error noice", "error")
    return
end

-- file explorer
local status_ok, _ = pcall(require, "module.ui.conf.nvim_tree")
if not status_ok then
    vim.notify("Error nvim_tree", "error")
    return
end
