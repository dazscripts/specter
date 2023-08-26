local library = require(rep:WaitForChild("Library"))

local Window = Fluent:CreateWindow({
    Title = 'Specter GUI 1.0.2',
    SubTitle = "| Lobby",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "folder-cog" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "NOTICE",
        Content = "Script has loaded",
        SubContent = "Thank you for using Specter GUI", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })

    Tabs.Main:AddParagraph({
        Title = "ALERT",
        Content = "Since you are in the lobby none of the ingame features will appear."
    })

    local Invite = Tabs.Main:AddToggle("Invite", {Title = "Spam Invite Players", Default = false })

    Invite:OnChanged(function()
        if Options.Invite.Value == false then return end
        repeat
            pcall(function()
                for _,v in pairs(Players:GetChildren()) do
                    task.spawn(function()
                        events:FindFirstChild("InvitePlayer"):InvokeServer(Players:FindFirstChild(v.Name))
                    end)
                end    
            end)
            task.wait(1)
        until Options.Invite.Value == false
    end)

    --Options.Invite:SetValue(false)
	Tabs.Main:AddSection("Other")

    local Dropdown = Tabs.Main:AddDropdown("Case", {
        Title = "Select Case To Auto Buy",
        Values = {"Case1", "Case2", "Case3", "Case4", "MetalsCollection"},
        Multi = false,
        Default = 1,
    })

    local CaseToggle = Tabs.Main:AddToggle("BuyCases", {Title = "Auto Buy Case", Default = false})
    
    CaseToggle:OnChanged(function()
		if Options.BuyCases.Value == false then return end
        repeat
            local results = game:GetService("ReplicatedStorage").Events.PurchaseCase:InvokeServer(Dropdown.Value)
            if results.Success == true then
                Fluent:Notify({
                    Title = "Winnings",
                    Content = "you won:" .. results.Data.WinningItem.Skin .. results.Data.WinningItem.Equipment,
                    SubContent = "Rarity: ".. results.Data.WinningItem.Rarity, -- Optional
                    Duration = 3 -- Set to nil to make the notification not disappear
                })
            else
                Fluent:Notify({
                    Title = "Failed To Buy Case",
                    Content = results.Reason,
                    SubContent = '', -- Optional
                    Duration = 3 -- Set to nil to make the notification not disappear
                })
            end
            task.wait(1)
        until Options.BuyCases.Value == false
    end)
    Tabs.Main:AddSection("Files")
    Tabs.Main:AddButton({
        Title = "Save LocalPlayer Stats",
        Description = "Writes your stats to a file in workspace",
        Callback = function()
            local args = {
                [1] = "Get Stats",
                [2] = game.Players.LocalPlayer
            }
            
            writefile('SpecterGUI/Lobby/StatSaves/' .. args[2].Name ,tableToString(game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Events"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))))
        end
    })
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("SpecterGUI")
SaveManager:SetFolder("SpecterGUI/Lobby")

if not isfolder('SpecterGUI/Lobby/StatSaves') then
    makefolder('SpecterGUI/Lobby/StatSaves')
end


InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()