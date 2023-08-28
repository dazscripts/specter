local event = events.Lightswitch

Options.forcelights:OnChanged(function()
    if Options.forcelights.Value == false then return end
    repeat
            local a = Options.LightMode.Value
            for i,v in pairs(WS:WaitForChild("Map"):WaitForChild("Lightswitches"):GetChildren()) do
                if a == "Spam" then
                    event:FireServer(v)
                elseif a == "Force All Off" then
                    if v:GetAttribute("On") == true then 
                        if Options.objecttp.Value == true and WS.Map.Fusebox.On.Transparency == 0 then
                            local k = Char.PrimaryPart.CFrame
                            task.wait(0.1)
                            Char:SetPrimaryPartCFrame(v.Up.CFrame * CFrame.new(0,0,-3))
                            task.wait(0.1)
                            event:FireServer(v) 
                            task.wait(0.1)
                            Char:SetPrimaryPartCFrame(k)
                        else
                            event:FireServer(v) 
                        end
                    end 
                elseif a == "Force All On" then
                    if v:GetAttribute("On") == false then
                        if Options.objecttp.Value == true and WS.Map.Fusebox.On.Transparency == 0 then
                            local k = Char.PrimaryPart.CFrame
                            task.wait(0.1)
                            Char:SetPrimaryPartCFrame(v.Up.CFrame * CFrame.new(0,0,-3))
                            task.wait(0.1)
                            event:FireServer(v) 
                            task.wait(0.1)
                            Char:SetPrimaryPartCFrame(k)
                        else
                            event:FireServer(v) 
                        end
                    end
                end
            end
        task.wait(0.1)
    until Options.forcelights.Value == false
end)


Options.Doors:OnChanged(function()
    if Options.Doors.Value == true then
        Instance.new("Folder",rep).Name = 'Doors'

        for i,v in pairs(WS.Map.Doors:GetChildren()) do
            if not v:GetAttribute("Closet") then
                v.Parent = rep.Doors
            end
        end
    else
        if rep:FindFirstChild("Doors") then
            for i,v in pairs(rep.Doors:GetChildren()) do
                v.Parent = WS.Map.Doors
            end

            rep.Doors:Destroy()
        end

    end
end)


local PathOptions = {}

Options.zone:OnChanged(function()
    local a = Options.zone.Value
    if a == 'Ghost Room' then
        if not WS:FindFirstChild("emfpart2") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Ghost room!",
                SubContent = "Try Opening the van door?",
                Duration = 5
            }) 
            Options.zone:SetValue(nil)
            return end
        Options.zone:SetValue(nil)
        Char:SetPrimaryPartCFrame(WS:FindFirstChild("emfpart2").CFrame)
    elseif a == 'Bone' then
        if not WS.Map:FindFirstChild("Bone") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Bone!",
                SubContent = "Somebody may have taken the bone.",
                Duration = 5
            })
            Options.zone:SetValue(nil)
            return end
        Options.zone:SetValue(nil)
        Char:SetPrimaryPartCFrame(WS.Map:FindFirstChild("Bone").CFrame)
    elseif a == 'Cursed Object' then
        if not WS.Map:FindFirstChild("cursed_object") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Cursed Object!",
                Duration = 5
            })
            Options.zone:SetValue(nil)
            return end
        Options.zone:SetValue(nil)
        Char:SetPrimaryPartCFrame(WS.Map:FindFirstChild("cursed_object").PrimaryPart.CFrame)
    elseif a == 'Fusebox' then
        Char:SetPrimaryPartCFrame(WS.Map.Fusebox.Fusebox.CFrame * CFrame.new(0,0,-3))
        Options.zone:SetValue(nil)

    elseif a == 'Van' then
        Char:SetPrimaryPartCFrame(WS.Van.Spawn.CFrame)
        Options.zone:SetValue(nil)
    end
end)

Options.Room:OnChanged(function()
    if Options.Room.Value == nil then return end
    local a = WS.Map.Rooms:FindFirstChild(Options.Room.Value)
    if not a then Options.Room:SetValue(nil) return end
    Char:SetPrimaryPartCFrame(a.Hitbox.CFrame)
    Options.Room:SetValue(nil)
end)

local PathfindingService = game:GetService("PathfindingService")

local agentParameters = {
    Radius = 2,
    Height = 5,
    CanJump = true,
    JumpHeight = 10,
    MaxSlope = 45,
}

Options.paths:OnChanged(function()
    if Options.paths.Value == false or not Options.path.Value then return end
    repeat task.wait(0.5)
        local startPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        repeat task.wait() until Options.path.Value ~= nil
        local endPosition = PathOptions[Options.path.Value].Position
        
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
                part.Parent = WS
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
    PathOptions['Fusebox'] = WS.Map.Fusebox.Fusebox
    PathOptions['Van'] = WS.Van.VanSpawn
    PathOptions['Ghost Room'] = WS:WaitForChild("emfpart2")
	if WS.Map:FindFirstChild("cursed_object") then PathOptions['Cursed Object'] = WS.Map:FindFirstChild("cursed_object").PrimaryPart end
    PathOptions['Bone'] = WS.Map.Bone
end)
