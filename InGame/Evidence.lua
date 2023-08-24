Tabs.Evidence:AddSection("Detect Evidence")

local function PutEvidence(evidence)
    local gui = plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes[evidence].Box
    if if not gui:FindFirstChild("Selected").Visible then
        for i,v in pairs(getconnections(gui.Activated)) do
            v:Fire()
        end
    end
end

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
            PutEvidence("Orbs")
        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "Orbs have been detected!",
                Duration = 5 -- Set to nil to make the notification not disappear
            })
        end

    end
end)

workspace.Fingerprints.ChildAdded:Connect(function()
    if Options.Fingerprints.Value then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "Fingerprints have been detected!",
                SubContent = "Evidence is being entered in the Journal.", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            PutEvidence("Fingerprints")
        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "Fingerprints have been detected!",
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