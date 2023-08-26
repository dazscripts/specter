Tabs.Evidence:AddSection("Detect Evidence")

local function PutEvidence(evidence)
    local gui = plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes[evidence].Box
    if not gui:FindFirstChild("Selected").Visible then
        for i,v in pairs(getconnections(gui.Activated)) do
            v:Fire()
        end
    end
end
local emf = Tabs.Evidence:AddToggle("EMF", {Title = "Auto Detect EMF 5", Default = false })

local writing = Tabs.Evidence:AddToggle("Writing", {Title = "Auto Detect Ghost Writing", Default = false })

local orbs = Tabs.Evidence:AddToggle("Orbs", {Title = "Auto Detect Ghost Orbs", Default = false })

local fp = Tabs.Evidence:AddToggle("Fingerprints", {Title = "Auto Detect Fingerprints", Default = false })

local sb = Tabs.Evidence:AddToggle("SpiritBox", {Title = "Force Spirit Box \n (Must be in the ghost room and Spirit Box must be inside the room turned on)", Default = false })

local auto = Tabs.Evidence:AddToggle("auto", {Title = "Auto Check Evidence in Journal when Detected", Default = false })

Tabs.Evidence:AddButton({
    Title = "Detect Freezing Temperatures",
    Description = "MUST START GAME TO PREVENT BREAKING",
    Callback = function()
        local Origin = plr.Character.PrimaryPart.CFrame
        plr.Character:SetPrimaryPartCFrame(workspace.emfpart2.CFrame)
        task.wait(0.2)
        if plr.Character.Head.BreathAttachment.Breath.Enabled == true then
            plr.Character:SetPrimaryPartCFrame(Origin)

            Window:Dialog({
                Title = "Temperature Results",
                Content = "Freezing Temperature was found! Would you like to enter it into the journal?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            PutEvidence("Freezing Temperature")
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()end
                    },
                }
            })
        else
            plr.Character:SetPrimaryPartCFrame(Origin)
            Window:Dialog({
                Title = "Temperature Results",
                Content = "Freezing Temperature was not found.",
                Buttons = {
                    {
                        Title = "Okay",
                        Callback = function()end
                    },
                }
            })
        end
    end
})

local msgs = {}
msgs[1] = "Are you there?"
msgs[2] = "Where are you?"
msgs[3] = "Are you a man?"
msgs[4] = "Are you a woman?"
msgs[5] = "How did you die?"
msgs[6] = "How old are you?"
msgs[7] = "When were you born?"
msgs[8] = "What is your name?"
msgs[9] = "Are you friendly?"
msgs[10] = "Can you talk?"
msgs[11] = "What do you want?"

local remote = game.ReplicatedStorage.Events.SimulateChatEvent

sb:OnChanged(function()
    if not Options.SpiritBox.Value then return end
    repeat
        task.spawn(function()
            for _,v in pairs(msgs) do
                remote:FireServer(v)
            end
        end)
        task.wait(0.1)
    until not Options.SpiritBox.Value
end)

emf:OnChanged(function()
    if not Options.EMF.Value then return end
    repeat if workspace:FindFirstChild("emfpart5") then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "EMF 5 has been detected!",
                SubContent = "Evidence is being entered in the Journal.", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            PutEvidence("Writing")
            Options.EMF:SetValue(false)

        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "EMF 5 has been detected!",
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            Options.EMF:SetValue(false)
        end
    end task.wait() until not Options.EMF.Value
end)

writing:OnChanged(function()
    if not Options.Writing.Value then return end
    repeat task.wait() until workspace.Equipment:FindFirstChild("Book") or Options.Writing.Value == false
    if not Options.Writing.Value then return end
    Fluent:Notify({
        Title = "Evidence",
        Content = "Found Book.. Waiting for writing.",
        Duration = 5 -- Set to nil to make the notification not disappear
    })
    repeat task.wait() until workspace.Equipment:FindFirstChild("Book"):GetAttribute("Written") or not workspace.Equipment:FindFirstChild("Book") or Options.Writing.Value == false
    if workspace.Equipment:FindFirstChild("Book"):GetAttribute("Written") then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "Ghost Writing has been detected!",
                SubContent = "Evidence is being entered in the Journal.", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            PutEvidence("Writing")
            Options.Writing:SetValue(false)
        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "Ghost Writing has been detected!",
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            Options.Writing:SetValue(false)
        end
    elseif not workspace.Equipment:FindFirstChild("Book") then
        Fluent:Notify({
            Title = "ERROR",
            Content = "Couldnt find Book",
            Duration = 5 -- Set to nil to make the notification not disappear
        })
        Options.Writing:SetValue(false)
    end
end)


orbs:OnChanged(function()
    if not Options.Orbs.Value then return end
    repeat if #workspace.Orbs:GetChildren() >= 1 then
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

        Options.Orbs:SetValue(false)
    end
    task.wait(0.5)
    until not Options.Orbs.Value
end)

fp:OnChanged(function()
    if not Options.Fingerprints.Value then return end
    repeat if #workspace.Fingerprints:GetChildren() >= 1 then
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
        Options.Fingerprints:SetValue(false)
    end
    task.wait(0.5)
    until not Options.Fingerprints.Value
end)

Tabs.Evidence:AddSection("Objectives")
local a = workspace.Van.Objectives.SurfaceGui.Frame.Objectives

Tabs.Evidence:AddParagraph({
    Title = "Objectives",
    Content = a.Identify.Text .. '\n' .. a['1'].Text .. '\n' .. a['2'].Text .. '\n' .. a['3'].Text
})