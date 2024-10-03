local Players = game:GetService("Players")

local CharacterReplication_Server = {}

function CharacterReplication_Server:Init()
    game.Players.PlayerAdded:Connect(function(player)
        print("Waiting for connection from " .. player)
    end)
end

function CharacterReplication_Server:Start()
    
end

return CharacterReplication_Server