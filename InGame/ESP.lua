local doors = workspace.Map.Doors
local closets = workspace.Map.Closets
local equipment = workspace.Equipment

Tabs.Visuals:AddSection("ESP")

local Ghost = Tabs.Visuals:AddToggle("Ghost", {Title = "Ghost ESP", Default = false })

local PlayersT = Tabs.Visuals:AddToggle("Players", {Title = "Players ESP", Default = false })
local DeadBodies = Tabs.Visuals:AddToggle("Body", {Title = "Dead Bodies ESP", Default = false })

local Closets = Tabs.Visuals:AddToggle("Closets", {Title = "Closets ESP", Default = false })

local Items = Tabs.Visuals:AddToggle("Items", {Title = "Items ESP", Default = false })

local Interactables = Tabs.Visuals:AddToggle("Interactables", {Title = "Interactables ESP", Default = false })
local elec = game:GetService("Workspace").Map.EventObjects.Electronics
local sinks = game:GetService("Workspace").Map.EventObjects.Sinks
local cursed = game:GetService("Workspace").Map.cursed_object
Interactables:OnChanged(function()
    if Options.Body.Value == true then
        repeat 
            for i,v in pairs(elec:GetChildren()) do
                if not v.HumanoidRootPart:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = rgbToColor3(52, 177, 7)
                    h.Parent = v.Base
                    h.FillTransparency = 0.4
                    h.OutlineTransparency = 1
                end
            end
            for i,v in pairs(sinks:GetChildren()) do
                if not v.HumanoidRootPart:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = rgbToColor3(52, 177, 7)
                    h.Parent = v
                    h.FillTransparency = 0.4
                    h.OutlineTransparency = 1
                end
            end
            if not cursed:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight")
                h.Name = 'Highlight'
                h.Adornee = v
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.FillColor = rgbToColor3(52, 177, 7)
                h.Parent = v
                h.FillTransparency = 0.4
                h.OutlineTransparency = 1
            end
        task.wait(5)
        until Options.Body.Value == false
    else
        for i,v in pairs(elec:GetChildren()) do
            if not v.Base:FindFirstChild("Highlight") then
                v.Base:FindFirstChild("Highlight"):Destroy()
            end
        end
        for i,v in pairs(sinks:GetChildren()) do
            if v:FindFirstChild("Highlight") then
                v:FindFirstChild("Highlight"):Destroy()
            end
        end
        if cursed:FindFirstChild("Highlight") then
            cursed:FindFirstChild("Highlight"):Destroy()
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
                    h.FillColor = rgbToColor3(255, 160, 39)
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
                    h.FillColor = rgbToColor3(0, 225, 255)
                    h.FillTransparency = 0.4
                    h.OutlineTransparency = 0
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
        h.FillColor = Color3.new(1,0,0)
        h.FillTransparency = 0.7
        h.OutlineTransparency = 0.5
    else
        if workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight") then
            workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight"):Destroy()
        end
    end
end)

PlayersT:OnChanged(function()
    if Options.Players.Value == true then
        repeat 
            for i,v in pairs(Players:GetChildren()) do
                if v:GetAttribute("Dead") == true then
                    for i2,v2 in pairs(v.Character:GetChildren()) do
                        if v2:IsA("BasePart") then
                            v2.Transparency = 0
                        end
                    end
                end
                if not v.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Name = 'Highlight'
                    h.Adornee = v.Character
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = rgbToColor3(140, 255, 244)
                    h.Parent = v.Character.HumanoidRootPart
                    h.FillTransparency = 0.7
                    h.OutlineTransparency = 0.5
                end
            end
        task.wait(5)
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
                h.FillColor = rgbToColor3(79, 255, 69)
                h.Parent = v.Area
                h.FillTransparency = 0.5
                h.OutlineTransparency = 1
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