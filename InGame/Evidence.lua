Tabs.Evidence:AddSection("Detect Evidence")

local orbs = Tabs.Evidence:AddToggle("Orbs", {Title = "Auto Detect Ghost Orbs", Default = false })

local fp = Tabs.Evidence:AddToggle("Fingerprints", {Title = "Auto Detect Fingerprints", Default = false })

local freezing = Tabs.Evidence:AddToggle("Freezing", {Title = "Auto Detect Freezing Temperatures", Default = false })

local writing = Tabs.Evidence:AddToggle("Writing", {Title = "Auto Detect Writing", Default = false })

Tabs.Evidence:AddSection("Objectives")
local a = workspace.Van.Objectives.SurfaceGui.Frame.Objectives

Tabs.Evidence:AddParagraph({
    Title = "Objectives",
    Content = a.Identify.Text .. '\n' .. a['1'].Text .. '\n' .. a['2'].Text .. '\n' .. a['3'].Text
})