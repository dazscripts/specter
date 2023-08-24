local doors = workspace.Map.Doors
local closets = workspace.Map.Closets
local equipment = workspace.Equipment

Tabs.Visuals:AddSection("ESP")

local Ghost = Tabs.Visuals:AddToggle("Ghost", {Title = "Ghost ESP", Default = false })

local PlayersT = Tabs.Visuals:AddToggle("Players", {Title = "Players ESP", Default = false })

local Closets = Tabs.Visuals:AddToggle("Closets", {Title = "Closets ESP", Default = false })

local Items = Tabs.Visuals:AddToggle("Items", {Title = "Items ESP", Default = false })

local Interactables = Tabs.Visuals:AddToggle("Interactables", {Title = "Interactables ESP", Default = false })


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
                    h.FillColor = Color3.new(1,1,1)
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
    if Options.Items.Value == true then
        local h = Instance.new("Highlight")
        h.Name = 'Highlight'
        h.Adornee = workspace.Ghost
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = workspace.Ghost.HumanoidRootPart
        h.FillColor = Color3.new(1,0,0)
    else
        if workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight") then
            workspace.Ghost.HumanoidRootPart:FindFirstChild("Highlight"):Destroy()
        end
    end
end)