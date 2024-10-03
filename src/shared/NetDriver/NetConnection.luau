local NetConnection = {}
NetConnection.__index = NetConnection

function NetConnection.new()
    local self = setmetatable({}, NetConnection)

    return self
end

return NetConnection