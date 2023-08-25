Tabs.World:AddSection("FE Scripts")

local Dropdown = Tabs.World:AddDropdown("Lights", {
    Title = "Select Lights Mode",
    Values = {"Spam", "Force All On", "Force All Off"},
    Multi = false,
    Default = 1,
})

local forcelights = Tabs.World:AddToggle("forcelights", {Title = "Force Lights", Default = false })
local event = events.Lightswitch

forcelights:OnChanged(function()
    if Options.forcelights.Value == false then return end
    repeat
        task.spawn(function()
            for i,v in pairs(workspace:WaitForChild("Map"):WaitForChild("Lightswitches"):GetChildren()) do
                if Dropdown.Value == "Spam" then
                    event:FireServer(v)
                elseif Dropdown.Value == "Force All Off" then
                    if v:GetAttribute("On") == true then event:FireServer(v) end
                elseif Dropdown.Value == "Force All On" then
                    if v:GetAttribute("On") == false then event:FireServer(v) end
                end
                event:FireServer(v)
            end
        end)
        task.wait(0.1)
    until Options.forcelights.Value == false
end)
local spamchat = Tabs.World:AddToggle("spamchat", {Title = "Spam Chat", Default = false })
spamchat:OnChanged(function()
    if Options.spamchat.Value == false then return end
end)

local breakghost = Tabs.World:AddToggle("breakghost", {Title = "Break Ghost Hunting (Godmode)", Default = false })
breakghost:OnChanged(function()

end)