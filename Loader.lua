
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

function tableToString(tbl, indent)
    if indent == nil then indent = 0 end
    local str = string.rep(" ", indent) .. "{\n"
    for k, v in pairs(tbl) do
        str = str .. string.rep(" ", indent + 2)
        if type(k) == "string" then
            str = str .. k .. " = "
        end
        if type(v) == "table" then
            str = str .. tableToString(v, indent + 2) .. ",\n"
        elseif type(v) == "string" then
            str = str .. '"' .. v .. '",\n'
        elseif type(v) == "number" or type(v) == "boolean" then
            str = str .. tostring(v) .. ",\n"
        end
    end
    return str .. string.rep(" ", indent) .. "}"
end

if game.PlaceId == LobbyId then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/dazscripts/specter/GUI/Lobby/Main.lua'))()
elseif game.PlaceId == GameId then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Main.lua'))()

end