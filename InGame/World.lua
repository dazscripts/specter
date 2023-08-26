Tabs.World:AddSection("FE Scripts")

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
        plr.Character:SetPrimaryPartCFrame(workspace:FindFirstChild("emfpart2").CFrame)
    elseif a == 'Bone' then
        if not workspace.Map:FindFirstChild("Bone") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Bone!",
                SubContent = "Somebody may have taken the bone.", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            return end
        plr.Character:SetPrimaryPartCFrame(workspace.Map:FindFirstChild("Bone").CFrame)
    elseif a == 'Cursed Object' then
        if not workspace.Map:FindFirstChild("cursed_object") then
            Fluent:Notify({
                Title = "Error",
                Content = "Couldnt find Cursed Object!",
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            return end
        plr.Character:SetPrimaryPartCFrame(workspace.Map:FindFirstChild("cursed_object").PrimaryPart.CFrame)
    elseif a == 'Fusebox' then
        plr.Character:SetPrimaryPartCFrame(workspace.Map.Fusebox.Fusebox.CFrame)
    elseif a == 'Van' then
        plr.Character:SetPrimaryPartCFrame(workspace.Van.Spawn.CFrame)
    end
end)


