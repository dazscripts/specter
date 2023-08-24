function rgbToColor3(r, g, b)
    return Color3.new(r/255, g/255, b/255)
end


local Window = Fluent:CreateWindow({
    Title = 'Specter GUI 1.0.3',
    SubTitle = "| InGame",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})
--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Evidence = Window:AddTab({ Title = "Main", Icon = "book" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "pencil" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Options = Fluent.Options

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Evidence.lua"))()


Fluent:Notify({
    Title = "NOTICE",
    Content = "Script has loaded",
    SubContent = "Thank you for using Specter GUI", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
})

Tabs.Visuals:AddSection("World")

local FullBright = Tabs.Visuals:AddToggle("FullBright", {Title = "FullBright", Default = false })

FullBright:OnChanged(function()
    if Options.FullBright.Value == false then return end
    repeat task.wait(0.1) game.Lighting.ExposureCompensation = 3 until Options.FullBright.Value == false
    game.Lighting.ExposureCompensation = -1
end)

local Doors = Tabs.Visuals:AddToggle("Doors", {Title = "Remove All Doors", Default = false})

Doors:OnChanged(function()
    if Options.Doors.Value == true then
        Instance.new("Folder",game.ReplicatedStorage).Name = 'Doors'

        for i,v in pairs(workspace.Map.Doors:GetChildren()) do
            if not v:GetAttribute("Closet") then
                v.Parent = game.ReplicatedStorage.Doors
            end
        end
    else
        if game.ReplicatedStorage:FindFirstChild("Doors") then
            for i,v in pairs(game.ReplicatedStorage.Doors:GetChildren()) do
                v.Parent = workspace.Map.Doors
            end

            game.ReplicatedStorage.Doors:Destroy()
        end

    end
end)



loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/ESP.lua"))()



-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()