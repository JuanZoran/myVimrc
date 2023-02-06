local meta = {
    add = function(self, plugin)
        self.size = self.size + 1
        self[self.size] = plugin
    end
}

meta.__index = meta

return function()
    return setmetatable({
        size = 0
    }, meta)
end
