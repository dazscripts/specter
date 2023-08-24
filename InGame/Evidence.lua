Tabs.Evidence:AddSection("Detect Evidence")

local orbs = Tabs.Evidence:AddToggle("Orbs", {Title = "Auto Detect Ghost Orbs", Default = false })

local fp = Tabs.Evidence:AddToggle("Fingerprints", {Title = "Auto Detect Fingerprints", Default = false })

local freezing = Tabs.Evidence:AddToggle("Freezing", {Title = "Auto Detect Freezing Temperatures", Default = false })

local writing = Tabs.Evidence:AddToggle("Writing", {Title = "Auto Detect Writing", Default = false })

local auto = Tabs.Evidence:AddToggle("auto", {Title = "Auto Check Evidence in Journal when Detected", Default = false })

workspace.Orbs.ChildAdded:Connect(function()
    if Options.Orbs.Value then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "Orbs have been detected!",
                SubContent = "Evidence is being entered in the Journal.", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            if game:GetService("Players").LocalPlayer.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes.Orbs.Box:FindFirstChild("Selected").Visible == false then
                for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes.Orbs.Box.Activated)) do
                    v:Fire()
                end
            end
        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "Orbs have been detected!",
                Duration = 5 -- Set to nil to make the notification not disappear
            })
        end

    end
end)



Tabs.Evidence:AddSection("Objectives")
local a = workspace.Van.Objectives.SurfaceGui.Frame.Objectives

Tabs.Evidence:AddParagraph({
    Title = "Objectives",
    Content = a.Identify.Text .. '\n' .. a['1'].Text .. '\n' .. a['2'].Text .. '\n' .. a['3'].Text
})