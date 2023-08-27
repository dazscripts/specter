
local Input = Tabs.Main:AddInput("message", {
    Title = "Chat Message",
    Default = "Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Show us a sign. Can you turn on the lights?",
    Placeholder = "Message",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)end
})

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral

local spamchat = Tabs.Main:AddToggle("spamchat", {Title = "Spam Chat", Default = false })
spamchat:OnChanged(function()
    if Options.spamchat.Value == false then return end
    repeat
        Channel:SendAsync(Input.Value)
        task.wait(3)
    until Options.spamchat.Value == false
end)

local breakghost = Tabs.Main:AddToggle("breakghost", {Title = "Break Ghost Hunting (Godmode)", Default = false })
breakghost:OnChanged(function()
    repeat task.wait() until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true or Options.breakghost.Value == false
    if Options.breakghost.Value == false then return end
    local origin = Char.PrimaryPart.CFrame
    task.wait(0.1)
    repeat task.wait() Char:SetPrimaryPartCFrame(workspace.Ghost.PrimaryPart.CFrame * CFrame.new(math.random(2,3),2.1,4)) until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == false or Options.breakghost.Value == false
    Char:SetPrimaryPartCFrame(origin)
    Options.breakghost:SetValue(false)
    task.wait(0.1)
    Options.breakghost:SetValue(true)
end)
local WaypointRemote = events.Waypoint
local locator = Tabs.Main:AddToggle("locator", {Title = "FE Ghost Locator", Default = false })
locator:OnChanged(function()
    repeat task.wait() until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true or Options.locator.Value == false
    if Options.locator.Value == false then return end
    repeat task.wait() WaypointRemote:FireServer(workspace.Ghost.HumanoidRootPart.Position) until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == false or Options.locator.Value == false
    Options.locator:SetValue(false)
    task.wait(0.1)
    Options.locator:SetValue(true)
end)


local Pickup = Tabs.Main:AddDropdown("Grab", {
    Title = "Pickup Item",
    Values = {"EMF Reader","Spirit Box", "Ghost Goggles", "Book", "Motion Sensor", "Crucifix", "Camera", "Flashlight", "Thermometer"},
    Multi = false,
    Default = nil,
})
local module = require(plr.PlayerScripts.ClientMain.Modules.PromptManager)
Pickup:OnChanged(function()
	local a = Options.Grab.Value
	if a ~= nil and workspace.Equipment:FindFirstChild(a) then
	    module.HandlePrompt(workspace.Equipment:FindFirstChild(a).Main.PickupPrompt, plr)
	end
end)