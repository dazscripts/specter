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


local doors = WS.Map.Doors
local closets = WS.Map.Closets
local equipment = WS.Equipment

local InteractableTable = {
    elec = WS.Map.EventObjects.Electronics:GetChildren(),
    sinks = WS.Map.EventObjects.Sinks:GetChildren(),
    cursed = WS.Map:FindFirstChild("cursed_object")
}

local function MakeHighlight(v)
    local h = Instance.new("Highlight")
    h.Name = 'Highlight'
    h.Adornee = v
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.FillColor = Options.InteractiblesColor.Value
    h.Parent = v
    h.FillTransparency = Options.InteractiblesColor.Transparency
    h.OutlineTransparency = 1
end

local function UpdateHighlight(v)
    if v:FindFirstChild("Highlight") then
        v:FindFirstChild("Highlight").FillTransparency = Options.InteractiblesColor.Transparency
        v:FindFirstChild("Highlight").FillColor = Options.InteractiblesColor.Value
    end
end

Interactables:OnChanged(function()
    if Options.Interactables.Value == true then

        repeat
            for i, v in pairs(InteractableTable) do
                if type(v) == 'table' then
                    for i2, v2 in pairs(v) do
                        if not v2:FindFirstChild("Highlight") then
                            MakeHighlight(v2)
                        else
                            UpdateHighlight(v2)
                        end
                    end
                else
                    if not v:FindFirstChild("Highlight") then
                        MakeHighlight(v)
                    else
                        UpdateHighlight(v)
                    end
                end
            end
            task.wait(1)
        until Options.Interactables.Value == false
    else
        for i, v in pairs(InteractableTable) do
            if type(v) == 'table' then
                for i2, v2 in pairs(v) do
                    if v2:FindFirstChild("Highlight") then
                        v2:FindFirstChild("Highlight"):Destroy()
                    end
                end
            else
                if v:FindFirstChild("Highlight") then
                    v:FindFirstChild("Highlight"):Destroy()
                end
            end
        end
    end
end)

Van:OnChanged(function()
    if Options.Van.Value == true then
        if not WS.Van:FindFirstChild("Highlight") then
            local h = Instance.new("Highlight")
            h.Name = 'Highlight'
            h.Adornee = WS.Van
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.Parent = WS.Van
            h.FillTransparency = Options.VanColor.Transparency
            h.OutlineTransparency = 0.3  
        end
    else
        if WS.Van:FindFirstChild("Highlight") then
            WS.Van:FindFirstChild("Highlight"):Destroy()
        end
    end
end)

VanColor:OnChanged(function()
    if WS.Van:FindFirstChild("Highlight") then
        WS.Van:FindFirstChild("Highlight").FillColor = Options.VanColor.Value
        WS.Van:FindFirstChild("Highlight").FillTransparency = Options.VanColor.Transparency
    end
end)


DeadBodies:OnChanged(function()
    if Options.Body.Value == true then
        repeat 
            for i,v in pairs(WS.Bodies:GetChildren()) do
                if not v.HumanoidRootPart:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = Color3.fromRGB(255, 160, 39)
                    h.Parent = v.HumanoidRootPart
                    h.FillTransparency = 0.7
                    h.OutlineTransparency = 0.7
                elseif v.HumanoidRootPart:FindFirstChild("Highlight") then
                    v.HumanoidRootPart:FindFirstChild("Highlight").FillColor = Options.DeadBodiesColor.Value
                    v.HumanoidRootPart:FindFirstChild("Highlight").FillTransparency = Options.DeadBodiesColor.Transparency
                end
            end
        task.wait(5)
        until Options.Body.Value == false
    else
        for i,v in pairs(WS.Bodies:GetChildren()) do
            if v.HumanoidRootPart:FindFirstChild("Highlight") then
                v.HumanoidRootPart:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
end)

Items:OnChanged(function()
    if Options.Items.Value == true then
        repeat
            for i,v in pairs(WS.Equipment:GetChildren()) do
                if not v.Main:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.Parent = v.Main
                    h.FillColor = Options.ItemColor.Value
                    h.FillTransparency = Options.ItemColor.Transparency
                    h.OutlineTransparency = 1
                elseif v.Main:FindFirstChild("Highlight") then
                    v.Main:FindFirstChild("Highlight").FillColor = Options.ItemColor.Value
                    v.Main:FindFirstChild("Highlight").FillTransparency = Options.ItemColor.Transparency
                end
            end
            task.wait(0.5)
        until Options.Items.Value == false
    else
        for i,v in pairs(WS.Equipment:GetChildren()) do
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
        h.Adornee = WS.Ghost
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = WS.Ghost.HumanoidRootPart
        h.FillColor = Options.GhostColor.Value
        h.FillTransparency = Options.GhostColor.Transparency
        h.OutlineTransparency = 0.5
    else
        if WS.Ghost.HumanoidRootPart:FindFirstChild("Highlight") then
            WS.Ghost.HumanoidRootPart:FindFirstChild("Highlight"):Destroy()
        end
    end
end)

GhostColor:OnChanged(function()
    if WS.Ghost.HumanoidRootPart:FindFirstChild("Highlight") then
        WS.Ghost.HumanoidRootPart:FindFirstChild("Highlight").FillColor = Options.GhostColor.Value
        WS.Ghost.HumanoidRootPart:FindFirstChild("Highlight").FillTransparency = Options.GhostColor.Transparency
    end
end)

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
                    h.FillTransparency = Options.PlayersColor.Transparency
                    h.OutlineTransparency = 0.5
                elseif v.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                    v.Character.HumanoidRootPart:FindFirstChild("Highlight").FillColor = Options.PlayersColor.Value
                    v.Character.HumanoidRootPart:FindFirstChild("Highlight").FillTransparency = Options.PlayersColor.Transparency
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
        for i,v in pairs(WS.Map.Closets:GetChildren()) do
            if not v.Area:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight")
                h.Name = 'Highlight'
                h.Adornee = v
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.FillColor = Options.ClosetColor.Value
                h.Parent = v.Area
                h.FillTransparency = Options.ClosetColor.Transparency
                h.OutlineTransparency = 1
            elseif v.Area:FindFirstChild("Highlight") then
                v.Area:FindFirstChild("Highlight").FillColor = Options.ClosetColor.Value
                v.Area:FindFirstChild("Highlight").FillTransparency = Options.ClosetColor.Transparency
            end
        end
    else
        for i,v in pairs(WS.Map.Closets:GetChildren()) do
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