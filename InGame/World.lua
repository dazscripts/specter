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
            end
        end)
        task.wait(0.1)
    until Options.forcelights.Value == false
end)

local Input = Tabs.World:AddInput("message", {
    Title = "Chat Message",
    Default = "Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Show us a sign. Can you turn on the lights?",
    Placeholder = "Message",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)end
})

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral

local spamchat = Tabs.World:AddToggle("spamchat", {Title = "Spam Chat", Default = false })
spamchat:OnChanged(function()
    if Options.spamchat.Value == false then return end
    repeat
        Channel:SendAsync(Input.Value)
        task.wait(3)
    until Options.spamchat.Value == false
end)

local breakghost = Tabs.World:AddToggle("breakghost", {Title = "Break Ghost Hunting (Godmode)", Default = false })
breakghost:OnChanged(function()
    repeat task.wait() until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true or Options.breakghost.Value == false
    if Options.breakghost.Value == false then return end
    --repeat until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true or Options.breakghost.Value == false
end)