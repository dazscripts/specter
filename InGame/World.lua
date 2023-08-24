Tabs.World:AddSection("FE Scripts")
local forcelights = Tabs.Player:AddToggle("forcelights", {Title = "Spam Lights", Default = false })
local event = events.Lightswitch

forcelights:OnChanged(function()
    if Options.forcelights.Value == false then return end
    repeat
        task.spawn(function()
            for i,v in pairs(workspace:WaitForChild("Map"):WaitForChild("Lightswitches"):GetChildren()) do
                event:FireServer(v)
            end
        end)
        task.wait(0.1)
    until Options.forcelights.Value == false
end)
local spamchat = Tabs.Player:AddToggle("spamchat", {Title = "Spam Chat", Default = false })
spamchat:OnChanged(function()
    if Options.spamchat.Value == false then return end
end)

local breakghost = Tabs.Player:AddToggle("breakghost", {Title = "Break Ghost Hunting (Godmode)", Default = false })
breakghost:OnChanged(function()

end)
