
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

Options.SpiritBox:OnChanged(function()
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

Options.EMF:OnChanged(function()
    if not Options.EMF.Value then return end
    repeat if WS:FindFirstChild("emfpart5") then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "EMF 5 has been detected!",
                SubContent = "Evidence is being entered in the Journal.",
                Duration = 5
            })
            PutEvidence("Writing")
            Options.EMF:SetValue(false)

        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "EMF 5 has been detected!",
                Duration = 5
            })
            Options.EMF:SetValue(false)
        end
    end task.wait() until not Options.EMF.Value
end)

Options.Writing:OnChanged(function()
    if not Options.Writing.Value then return end
    repeat task.wait() until WS.Equipment:FindFirstChild("Book") or Options.Writing.Value == false
    if not Options.Writing.Value then return end
    Fluent:Notify({
        Title = "Evidence",
        Content = "Found Book.. Waiting for writing.",
        Duration = 5
    })
    repeat task.wait() until WS.Equipment:FindFirstChild("Book"):GetAttribute("Written") or not WS.Equipment:FindFirstChild("Book") or Options.Writing.Value == false
    if WS.Equipment:FindFirstChild("Book"):GetAttribute("Written") then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "Ghost Writing has been detected!",
                SubContent = "Evidence is being entered in the Journal.",
                Duration = 5
            })
            PutEvidence("Writing")
            Options.Writing:SetValue(false)
        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "Ghost Writing has been detected!",
                Duration = 5
            })
            Options.Writing:SetValue(false)
        end
    elseif not WS.Equipment:FindFirstChild("Book") then
        Fluent:Notify({
            Title = "ERROR",
            Content = "Couldnt find Book",
            Duration = 5
        })
        Options.Writing:SetValue(false)
    end
end)


Options.Orbs:OnChanged(function()
    if not Options.Orbs.Value then return end
    repeat if #WS.Orbs:GetChildren() >= 1 then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "Orbs have been detected!",
                SubContent = "Evidence is being entered in the Journal.",
                Duration = 5
            })
            PutEvidence("Orbs")
        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "Orbs have been detected!",
                Duration = 5
            })
        end

        Options.Orbs:SetValue(false)
    end
    task.wait(0.5)
    until not Options.Orbs.Value
end)

Options.Fingerprints:OnChanged(function()
    if not Options.Fingerprints.Value then return end
    repeat if #WS.Fingerprints:GetChildren() >= 1 then
        if Options.auto.Value then
            Fluent:Notify({
                Title = "Evidence",
                Content = "Fingerprints have been detected!",
                SubContent = "Evidence is being entered in the Journal.",
                Duration = 5
            })
            PutEvidence("Fingerprints")
        else
            Fluent:Notify({
                Title = "Evidence",
                Content = "Fingerprints have been detected!",
                Duration = 5
            })
        end
        Options.Fingerprints:SetValue(false)
    end
    task.wait(0.5)
    until not Options.Fingerprints.Value
end)

