if vim.g.vscode then
    require("vscode")
else
    require("impatient") -- for load cache
    require("core")
end
