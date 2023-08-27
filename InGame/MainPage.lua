

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral

spamchat:OnChanged(function()
    if Options.spamchat.Value == false then return end
    repeat
        Channel:SendAsync(Input.Value)
        task.wait(3)
    until Options.spamchat.Value == false
end)

breakghost:OnChanged(function()
    repeat task.wait() until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true or Options.breakghost.Value == false
    if Options.breakghost.Value == false then return end
    local origin = Char.PrimaryPart.CFrame
    task.wait(0.1)
    repeat task.wait() Char:SetPrimaryPartCFrame(workspace.Ghost.PrimaryPart.CFrame * CFrame.new(math.random(3,4),2.2,5)) until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == false or Options.breakghost.Value == false
    Char:SetPrimaryPartCFrame(origin)
    Options.breakghost:SetValue(false)
    task.wait(0.1)
    Options.breakghost:SetValue(true)
end)

local WaypointRemote = events.Waypoint
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