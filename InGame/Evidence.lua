
local function PutEvidence(evidence)
    local gui = plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes[evidence].Box
    if not gui:FindFirstChild("Selected").Visible then
        for i,v in pairs(getconnections(gui.Activated)) do
            v:Fire()
        end
    end
end

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

local remote = events.SimulateChatEvent

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

