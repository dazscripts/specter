local Dropdown = Tabs.World:AddDropdown("Lights", {
    Title = "Select Lights Mode",
    Values = {"Spam", "Force All On", "Force All Off"},
    Multi = false,
    Default = 1,
})


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


Doors:OnChanged(function()
    if Options.Doors.Value == true then
        Instance.new("Folder",rep).Name = 'Doors'

        for i,v in pairs(workspace.Map.Doors:GetChildren()) do
            if not v:GetAttribute("Closet") then
                v.Parent = rep.Doors
            end
        end
    else
        if rep:FindFirstChild("Doors") then
            for i,v in pairs(rep.Doors:GetChildren()) do
                v.Parent = workspace.Map.Doors
            end

            rep.Doors:Destroy()
        end

    end
end)




ZoneDropdown:OnChanged(function()
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
        Char:SetPrimaryPartCFrame(workspace.Map.Fusebox.Fusebox.CFrame * CFrame.new(0,0,-3))
    elseif a == 'Van' then
        Char:SetPrimaryPartCFrame(workspace.Van.Spawn.CFrame)
    end
end)

RoomTeleports:OnChanged(function()
    local a = workspace.Map.Rooms:FindFirstChild("Options.Room.Value")
    if not a then return end
    Char:SetPrimaryPartCFrame(a.Hitbox,CFrame)
end)

local PathfindingService = game:GetService("PathfindingService")

local PathOptions = {}

-- Your agent parameters
local agentRadius = 2
local agentHeight = 5
local agentCanJump = true
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
    if Options.paths.Value == false or not Options.path.Value then return end
    repeat task.wait(0.5)
        local startPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        repeat task.wait() until Dropdown2.Value ~= nil
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
				part.Shape = 'Ball'
                task.spawn(function()
                    task.wait(0.7)
                    part:Destroy()
                end)
                task.wait(0.03)
            end
        end
    until Options.paths.Value == false
end)

local function item(v)
    if not v then
        return nil
    else return v
    end
end

task.spawn(function()
    PathOptions['Fusebox'] = workspace.Map.Fusebox.Fusebox
    PathOptions['Van'] = workspace.Van.VanSpawn
    PathOptions['Ghost Room'] = workspace:WaitForChild("emfpart2")
    PathOptions['Cursed Object'] = item(workspace.Map:FindFirstChild("cursed_object").PrimaryPart)
    PathOptions['Bone'] = workspace.Map.Bone
end)
