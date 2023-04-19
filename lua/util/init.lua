---@class util
local M = setmetatable({}, {
    __index = function(tbl, key)
        local res = require('util.' .. key)
        tbl[key] = res
        return res
    end,
})

---@alias mode
---|'n'
---|'v'
---|'x'
---|'s'
---|'o'
---|'i'
---|'l'
---|'c'
---|'t'
---|'!'

---@class keymap
---@field [1] string @lhs
---@field [2] string|function @rhs
---@field mode? mode|mode[]
---@field noremap? boolean
---@field silent? boolean
---@field expr? boolean
---@field nowait? boolean
---@field script? boolean
---@field unique? boolean
---@field buffer? boolean


local set = vim.keymap.set

---Load single keymap
---@param keymap keymap
local function load_keymap(keymap)
    local mode = keymap.mode or 'n'
    local lhs = keymap[1]
    local rhs = keymap[2]

    keymap[1] = nil
    keymap[2] = nil
    keymap.mode = nil
    set(mode, lhs, rhs, keymap)
end

---Lazy Kyemap-like load utility
---@param keymaps keymap|keymap[]
function M.map(keymaps)
    if type(keymaps[1]) == 'string' then
        load_keymap(keymaps)
    else
        ---@cast keymaps keymap[]
        for _, keymap in ipairs(keymaps) do load_keymap(keymap) end
    end
end

---Map with description
---@param args {map: {[1]:string, [2]:string|function, [3]:string?}[], opts: table?, mode?: mode|mode[]}
function M.map_opt_with_desc(args)
    local opts = args.opts or {}
    local mode = args.mode or 'n'
    for _, map in ipairs(args.map) do
        opts.desc = map[3]
        set(mode, map[1], map[2], opts)
    end
end

M.firenvim = vim.g.started_by_firenvim ~= nil
if M.firenvim then
    vim.g.firenvim_config = {
        globalSettings = { alt = 'all' },
        localSettings = {
            ['.*'] = {
                cmdline  = 'neovim',
                content  = 'text',
                priority = 0,
                selector = 'textarea',
                takeover = 'never'
            },
        },
    }

    vim.api.nvim_create_autocmd('UIEnter', {
        callback = function()
            local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
            if client and client.name == 'Firenvim' then
                vim.o.laststatus = 0
                vim.cmd [[set lines=40 columns=100]]
            end
        end,
    })
end


_G.util = M
