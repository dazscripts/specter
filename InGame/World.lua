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

Tabs.World:AddSection("Teleports")

local Dropdown = Tabs.World:AddDropdown("zone", {
    Title = "Zone Teleport",
    Values = {"Ghost Room", "Bone", "Cursed Object", "Fusebox", "Van"},
    Multi = false,
    Default = nil,
})

Dropdown:OnChanged(function()
    local a = Options.zone.Value
    if a == 'Ghost Room' then
        if not workspace:FindFirstChild("emfpart2") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Ghost room!",
                SubContent = "Try Opening the van door?", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            }) return end
        Char:SetPrimaryPartCFrame(workspace:FindFirstChild("emfpart2").CFrame)
    elseif a == 'Bone' then
        if not workspace.Map:FindFirstChild("Bone") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Bone!",
                SubContent = "Somebody may have taken the bone.", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            return end
        Char:SetPrimaryPartCFrame(workspace.Map:FindFirstChild("Bone").CFrame)
    elseif a == 'Cursed Object' then
        if not workspace.Map:FindFirstChild("cursed_object") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Cursed Object!",
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            return end
        Char:SetPrimaryPartCFrame(workspace.Map:FindFirstChild("cursed_object").PrimaryPart.CFrame)
    elseif a == 'Fusebox' then
        Char:SetPrimaryPartCFrame(workspace.Map.Fusebox.Fusebox.CFrame)
    elseif a == 'Van' then
        Char:SetPrimaryPartCFrame(workspace.Van.Spawn.CFrame)
    end
end)


Tabs.World:AddSection("Paths [REQUIRES REMOVE ALL DOORS]")
Tabs.World:AddParagraph({
    Title = "PAthfinding Info",
    Content = "Shows a path to specified object when available"
})

local PathfindingService = game:GetService("PathfindingService")

local Dropdown2 = Tabs.World:AddDropdown("path", {
    Title = "Destination (Requires Remove All Doors)",
    Values = {"Ghost Room", "Bone", "Cursed Object", "Fusebox", "Van"},
    Multi = false,
    Default = nil,
})

local PathOptions = {
    'Bone' = workspace.Map.Bone
    'Fusebox' = workspace.Map.Fusebox.Fusebox
    'Van' = workspace.Van.Spawn
}

local pathtoggle = Tabs.World:AddToggle("paths", {Title = "Show Paths", Default = false })
-- Your agent parameters
local agentRadius = 2
local agentHeight = 5
local agentCanJump = false
local agentJumpHeight = 10
local agentMaxSlope = 45

local agentParameters = {
    Radius = agentRadius,
    Height = agentHeight,
    CanJump = agentCanJump,
    JumpHeight = agentJumpHeight,
    MaxSlope = agentMaxSlope,
}

pathtoggle:OnChanged(function()
    if Options.paths.Value == false then return end
    repeat task.wait(0.5)
        local startPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local endPosition = PathOptions[Dropdown2.Value].Position
        
        local path = PathfindingService:CreatePath(agentParameters)
        
        path:ComputeAsync(startPosition, endPosition)
        
        if path.Status == Enum.PathStatus.Success then
            local waypoints = path:GetWaypoints()
            
            for _, waypoint in pairs(waypoints) do
                local part = Instance.new("Part")
                part.Size = Vector3.new(0.4,0.4,0.4)
                part.Material = Enum.Material.Neon
                part.Position = waypoint.Position
                part.Anchored = true
                part.CanCollide = false
                part.Parent = Workspace
                task.spawn(function()
                    task.wait(0.5)
                    part:Destroy()
                end)
            end
        end
    until Options.paths.Value == false
end)
task.spawn(function()
    PathOptions['Ghost Room'] = workspace:WaitForChild("emfpart2")
    PathOptions['Cursed Object'] = workspace.Map:WaitForChild("cursed_object")
end)
