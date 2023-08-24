
--!strict
repeat task.wait() until game:IsLoaded()

Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

Players = game:GetService("Players")
plr = Players.LocalPlayer

for _, v in next, getconnections(plr.Idled) do
    v:Disable()
end

WS = game:GetService("Workspace")
rep = game:GetService("ReplicatedStorage")
TweenService = game:GetService("TweenService")
rs = game:GetService("RunService")

events = rep:WaitForChild("Events")

local LobbyId = 8267733039
local GameId = 8417221956

if game.PlaceId == LobbyId then
    loadstring(game:HttpGet('https://github.com/dazscripts/specter/GUI/Lobby/Main.lua'))()
elseif game.PlaceId == GameId then

end