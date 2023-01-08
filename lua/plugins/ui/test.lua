local function lsp_is_active()
    return vim.lsp.get_active_clients() ~= nil
end

local function get_lsp_staus()
    local clients = vim.lsp.get_active_clients()
    local status = clients[1].name
    for i = 2, #clients do
        status = status .. '   ' .. clients[i].name
    end
    -- vim.pretty_print(status)
    return status
end

local status = get_lsp_staus()

vim.pretty_print(status)
