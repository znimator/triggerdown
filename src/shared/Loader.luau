local rp = game:GetService("ReplicatedStorage")
local ss = game:GetService("ServerStorage")
local rs = game:GetService("RunService")

local Loader = {}

function Loader:Load()
    local gather = {}

    if rs:IsClient() then
        for i,v in rp.Modules:GetChildren() do
            table.insert(gather, require(v))
        end
    else
        for i,v in ss.Modules:GetChildren() do
            table.insert(gather, require(v))
        end
    end

    for i,v in gather do
        local success, err = pcall(v.Init, v)
        if not success then
            warn(string.format("[%s] Error loading module %q:\n%s", (rs:IsClient() and "Client" or "Server"), v.Name, err))
        end
    end

    for i,v in gather do
        local success, err = pcall(v.Start, v)
        if not success then
            warn(string.format("[%s] Error starting module %q:\n%s", (rs:IsClient() and "Client" or "Server"), v.Name, err))
        end
    end
end

return Loader