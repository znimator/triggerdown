local NetDriver = {}
NetDriver.__index = NetDriver

function NetDriver.new()
    local self = setmetatable({}, NetDriver)

    self.Connections = {}

    return self
end

return NetDriver