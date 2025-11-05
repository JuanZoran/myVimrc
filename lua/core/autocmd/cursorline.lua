local set_cursorline = function(event, value, pattern)
    util.autocmd(event, {
        pattern = pattern,
        callback = function()
            local filetype = vim.bo.filetype
            if filetype ~= 'TelescopePrompt' and filetype ~= 'alpha'
            then
                vim.opt_local.cursorline = value
            end
        end,
    })
end

set_cursorline('InsertEnter', false)
set_cursorline('InsertLeave', true)
-- set_cursorline("WinLeave", false)
-- set_cursorline("WinEnter", true)
