function rgbToColor3(r, g, b)
    return Color3.new(r/255, g/255, b/255)
end

Window = Fluent:CreateWindow({
    Title = 'Specter GUI 1.0.9.3',
    SubTitle = "| InGame",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})
--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
Tabs = {
    World = Window:AddTab({ Title = "World", Icon = "globe" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Evidence = Window:AddTab({ Title = "Evidence", Icon = "book" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "pencil" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Options = Fluent.Options
loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/World.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Player.lua"))()


loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Evidence.lua"))()

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

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("SpecterGUI")
SaveManager:SetFolder("SpecterGUI/InGame")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "NOTICE",
    Content = "Script has loaded",
    SubContent = "Thank you for using Specter GUI", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()