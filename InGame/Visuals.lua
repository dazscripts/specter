FullBright:OnChanged(function()
    if Options.FullBright.Value == false then return end
    game.Lighting:SetAttribute("OriginalExposure", game.Lighting.ExposureCompensation)
    if game.Lighting:FindFirstChild("Atmosphere") then game.Lighting.Atmosphere:SetAttribute("OriginalHaze", game.Lighting.Atmosphere.Haze) end
    repeat task.wait(0.1) game.Lighting.ExposureCompensation = 3 
    if game.Lighting:FindFirstChild("Atmosphere") then game.Lighting:FindFirstChild("Atmosphere").Haze = 0 end
    until Options.FullBright.Value == false
    game.Lighting.ExposureCompensation = game.Lighting:GetAttribute("OriginalExposure")
    if game.Lighting:FindFirstChild("Atmosphere") then game.Lighting.Atmosphere.Haze = game.Lighting.Atmosphere:GetAttribute("OriginalHaze") end
end)


local doors = workspace.Map.Doors
local closets = workspace.Map.Closets
local equipment = workspace.Equipment

local elec = game:GetService("Workspace").Map.EventObjects.Electronics
local sinks = game:GetService("Workspace").Map.EventObjects.Sinks
Interactables:OnChanged(function()
    if Options.Interactables.Value == true then
        repeat 
            for i,v in pairs(elec:GetChildren()) do
                if not v.Base:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = Color3.fromRGB(52, 177, 7)
                    h.Parent = v.Base
                    h.FillTransparency = 0.4
                    h.OutlineTransparency = 1
                end
            end
            for i,v in pairs(sinks:GetChildren()) do
                v.Transparency = 0
                if not v:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = Color3.fromRGB(52, 177, 7)
                    h.Parent = v
                    h.FillTransparency = 0.4
                    h.OutlineTransparency = 1
                end
            end
            if workspace.Map:FindFirstChild("cursed_object") and not workspace.Map:FindFirstChild("cursed_object"):FindFirstChild("Highlight") then
                local h = Instance.new("Highlight")
                h.Name = 'Highlight'
                h.Adornee = v
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.FillColor = Color3.fromRGB(52, 177, 7)
                h.Parent = v
                h.FillTransparency = 0.4
                h.OutlineTransparency = 1
            end
        task.wait(5)
        until Options.Interactables.Value == false
    else
        for i,v in pairs(elec:GetChildren()) do
            if v.Base:FindFirstChild("Highlight") then
                v.Base:FindFirstChild("Highlight"):Destroy()
            end
        end
        for i,v in pairs(sinks:GetChildren()) do
            if v:FindFirstChild("Highlight") then
                v:FindFirstChild("Highlight"):Destroy()
            end
        end
        if workspace.Map:FindFirstChild("cursed_object") and workspace.Map:FindFirstChild("cursed_object"):FindFirstChild("Highlight") then
            cursed:FindFirstChild("Highlight"):Destroy()
        end
    end
end)

Van:OnChanged(function()
    if Options.Van.Value == true then
        if not workspace.Van:FindFirstChild("Highlight") then
            local h = Instance.new("Highlight")
            h.Name = 'Highlight'
            h.Adornee = workspace.Van
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.Parent = workspace.Van
            h.FillTransparency = 1
            h.OutlineTransparency = 0.3  
        end
    else
        if workspace.Van:FindFirstChild("Highlight") then
            workspace.Van:FindFirstChild("Highlight"):Destroy()
        end
    end

end)

DeadBodies:OnChanged(function()
    if Options.Body.Value == true then
        repeat 
            for i,v in pairs(workspace.Bodies:GetChildren()) do
                if not v.HumanoidRootPart:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = Color3.fromRGB(255, 160, 39)
                    h.Parent = v.HumanoidRootPart
                    h.FillTransparency = 0.7
                    h.OutlineTransparency = 0.7
                end
            end
        task.wait(5)
        until Options.Body.Value == false
    else
        for i,v in pairs(workspace.Bodies:GetChildren()) do
            if v.HumanoidRootPart:FindFirstChild("Highlight") then
                v.HumanoidRootPart:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
end)

Items:OnChanged(function()
    if Options.Items.Value == true then
        repeat
            for i,v in pairs(workspace.Equipment:GetChildren()) do
                if not v.Main:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.Parent = v.Main
                    h.FillColor = Options.ItemColor.Value
                    h.FillTransparency = 0.4
                    h.OutlineTransparency = 0
                elseif v.Main:FindFirstChild("Highlight") then
                    v.Main:FindFirstChild("Highlight").FillColor = Options.ItemColor.Value
                end
            end
            task.wait(0.5)
        until Options.Items.Value == false
    else
        for i,v in pairs(workspace.Equipment:GetChildren()) do
            if v.Main:FindFirstChild("Highlight") then
                v.Main:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
end)

Ghost:OnChanged(function()
    if Options.Ghost.Value == true then
        local h = Instance.new("Highlight")
        h.Name = 'Highlight'
        h.Adornee = workspace.Ghost
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = workspace.Ghost.HumanoidRootPart
        h.FillColor = Options.GhostColor.Value
        h.FillTransparency = 0.7
        h.OutlineTransparency = 0.5
    else
        if workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight") then
            workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight"):Destroy()
        end
    end
end)

GhostColor:OnChanged(function()
    if workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight") then
        workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight").FillColor = Options.GhostColor.Value
    end
end)

local client = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.ClientMain)
PlayersT:OnChanged(function()
    if Options.Players.Value == true then
        repeat 
            for i,v in pairs(Players:GetChildren()) do
                if not v.Character.HumanoidRootPart:FindFirstChild("Highlight") and v ~= plr then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v.Character
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = Options.PlayersColor.Value
                    h.Parent = v.Character.HumanoidRootPart
                    h.FillTransparency = 0.7
                    h.OutlineTransparency = 0.5
                elseif v.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                    v.Character.HumanoidRootPart:FindFirstChild("Highlight").FillColor = Options.PlayersColor.Value
                end
            end
        task.wait(0.5)
        until Options.Players.Value == false
    else
        for i,v in pairs(Players:GetChildren()) do
            if v.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                v.Character.HumanoidRootPart:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
end)

Closets:OnChanged(function()
    if Options.Closets.Value == true then
        for i,v in pairs(workspace.Map.Closets:GetChildren()) do
            if not v.Area:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight")
                h.Name = 'Highlight'
                h.Adornee = v
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.FillColor = Options.ClosetColor.Value
                h.Parent = v.Area
                h.FillTransparency = 0.5
                h.OutlineTransparency = 1
            elseif v.Area:FindFirstChild("Highlight") then
                v.Area:FindFirstChild("Highlight").FillColor = Options.ClosetColor.Value
            end
        end
    else
        for i,v in pairs(workspace.Map.Closets:GetChildren()) do
            if v.Area:FindFirstChild("Highlight") then
                v.Area:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
end)
deadplayers:OnChanged(function()
    if not Options.deadplayers.Value then return end
    repeat Client.toggleDeadVisible(true) task.wait() until not Options.deadplayers.Value
end)