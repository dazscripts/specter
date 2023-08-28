local notifEvent

ghostnotifs:OnChanged(function()
    if Options.ghostnotifs.Value == true then
        notifEvent = events.Hunt.OnClientEvent:Connect(function()
            if plr.PlayerScripts.VideoFeed:GetAttribute("Hunting") == true then
                Fluent:Notify({
                    Title = "Ghost Notifications",
                    Content = "The Ghost has started Hunting!",
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Ghost Notifications",
                    Content = "The Ghost has Stopped Hunting!",
                    Duration = 5
                })
            end
        end)
    else
        if notifEvent ~= nil then notifEvent:Disconnect() end
    end
end)