local meta = {
    add = function(self, plugin)
        self.size = self.size + 1
        self[self.size] = plugin
    end,
}

meta.__index = meta

---@class util
---@field list fun(): table
return function()
    return setmetatable({
        size = 0,
    }, meta)
end
