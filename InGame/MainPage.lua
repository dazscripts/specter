

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral

Options.spamchat:OnChanged(function()
    if Options.spamchat.Value == false then return end
    repeat
        Channel:SendAsync(Options.message.Value)
        task.wait(3)
    until Options.spamchat.Value == false
end)

Options.breakghost:OnChanged(function()
    repeat task.wait() until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true or Options.breakghost.Value == false
    if Options.breakghost.Value == false then return end
    local origin = Char.PrimaryPart.CFrame
    task.wait(0.1)
    repeat task.wait() Char:SetPrimaryPartCFrame(WS.Ghost.PrimaryPart.CFrame * CFrame.new(0,-8,0)) until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == false or Options.breakghost.Value == false
    Char:SetPrimaryPartCFrame(origin)
    Options.breakghost:SetValue(false)
    task.wait(0.1)
    Options.breakghost:SetValue(true)
end)

local WaypointRemote = events.Waypoint
Options.locator:OnChanged(function()
    repeat task.wait() until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true or Options.locator.Value == false
    if Options.locator.Value == false then return end
    repeat task.wait() WaypointRemote:FireServer(WS.Ghost.HumanoidRootPart.Position) until plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == false or Options.locator.Value == false
    Options.locator:SetValue(false)
    task.wait(0.1)
    Options.locator:SetValue(true)
end)

local module = require(plr.PlayerScripts.ClientMain.Modules.PromptManager)
Options.Grab:OnChanged(function()
	local a = Options.Grab.Value
	if a ~= nil and WS.Equipment:FindFirstChild(a) then
	    module.HandlePrompt(WS.Equipment:FindFirstChild(a).Main.PickupPrompt, plr)
        Options.Grab:SetValue(nil)
    elseif a ~= nil and not WS.Equipment:FindFirstChild(a) then
        Fluent:Notify({Title = "Pickup Item",Content = "Couldnt find" .. a,SubContent = "Make sure the item is in the Workspace",Duration = 5})
        Options.Grab:SetValue(nil)
	end
end)