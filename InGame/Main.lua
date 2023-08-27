function rgbToColor3(r, g, b)
    return Color3.new(r/255, g/255, b/255)
end

Window = Fluent:CreateWindow({
    Title = 'Specter GUI 1.0.9.6',
    SubTitle = "| InGame",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})
--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "scroll" }),
    Main = Window:AddTab({ Title = "Main", Icon = "folder-cog" }),
    World = Window:AddTab({ Title = "World", Icon = "globe" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Evidence = Window:AddTab({ Title = "Evidence", Icon = "book" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "pencil" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Options = Fluent.Options

Tabs.Main:AddInput("message", {Title = "Chat Message",Default = "Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Show us a sign. Can you turn on the lights?",Placeholder = "Message", Numeric = false,Finished = false, Callback = function(Value)end})
spamchat = Tabs.Main:AddToggle("spamchat", {Title = "Spam Chat", Default = false })
breakghost = Tabs.Main:AddToggle("breakghost", {Title = "Break Ghost Hunting (Godmode)", Default = false })
Tabs.World:AddDropdown("LightMode", {Title = "Select Lights Mode",Values = {"Spam", "Force All On", "Force All Off"},Multi = false, Default = 1,})
forcelights = Tabs.World:AddToggle("forcelights", {Title = "Force Lights", Default = false })
Doors = Tabs.World:AddToggle("Doors", {Title = "Remove All Doors", Default = false})
Tabs.World:AddSection("Teleports")
ZoneDropdown = Tabs.World:AddDropdown("zone", {Title = "Zone Teleport",Values = {"Ghost Room", "Bone", "Cursed Object", "Fusebox", "Van"},Multi = false,Default = nil,})

local AllRooms = {}
for i,v in pairs(workspace.Map.Rooms:GetChildren()) do
    AllRooms[i] = v.Name
end

RoomTeleports = Tabs.World:AddDropdown("Room", {Title = "Room Teleport",Values = AllRooms,Multi = false,Default = nil,})
Tabs.World:AddSection("Paths [REQUIRES REMOVE ALL DOORS]")
Tabs.World:AddParagraph({Title = "Pathfinding Info",Content = "Shows a path to specified object when available"})
Tabs.World:AddDropdown("path", {Title = "Destination",Values = {"Ghost Room", "Bone", "Cursed Object", "Fusebox", "Van"},Multi = false,Default = nil,})
pathtoggle = Tabs.World:AddToggle("paths", {Title = "Show Paths", Default = false })

Tabs.Evidence:AddSection("Detect Evidence")
emf = Tabs.Evidence:AddToggle("EMF", {Title = "Auto Detect EMF 5", Default = false })
writing = Tabs.Evidence:AddToggle("Writing", {Title = "Auto Detect Ghost Writing", Default = false })
orbs = Tabs.Evidence:AddToggle("Orbs", {Title = "Auto Detect Ghost Orbs", Default = false })
fp = Tabs.Evidence:AddToggle("Fingerprints", {Title = "Auto Detect Fingerprints", Default = false })
sb = Tabs.Evidence:AddToggle("SpiritBox", {Title = "Force Spirit Box \n Normal Spirit Box restrictions apply", Default = false })
Tabs.Evidence:AddButton({Title = "Detect Freezing Temperatures",Description = "MUST START GAME TO PREVENT BREAKING",Callback = function()local Origin = Char.PrimaryPart.CFrameChar:SetPrimaryPartCFrame(workspace.emfpart2.CFrame)task.wait(0.2)if Char.Head.BreathAttachment.Breath.Enabled == true then Char:SetPrimaryPartCFrame(Origin) Window:Dialog({Title = "Temperature Results",Content = "Freezing Temperature was found! Would you like to enter it into the journal?",Buttons = {{Title = "Yes", Callback = function()PutEvidence("Freezing Temperature")end},{Title = "No",Callback = function()end},}})else Char:SetPrimaryPartCFrame(Origin)Window:Dialog({Title = "Temperature Results",Content = "Freezing Temperature was not found.",Buttons = {{Title = "Okay",Callback = function()end},}})end end})
Tabs.Evidence:AddSection("Objectives")
local ObjectivePath = workspace.Van.Objectives.SurfaceGui.Frame.Objectives
Tabs.Evidence:AddParagraph({Title = "Objectives",Content = ObjectivePath.Identify.Text .. '\n' .. ObjectivePath['1'].Text .. '\n' .. ObjectivePath['2'].Text .. '\n' .. ObjectivePath['3'].Text})

Tabs.Visuals:AddSection("World")
FullBright = Tabs.Visuals:AddToggle("FullBright", {Title = "FullBright", Default = false })
Tabs.Visuals:AddInput("xray", {Title = "Xray Opacity",Default = "0",Placeholder = "Opacity",Numeric = true,Finished = true,
Callback = function(Value)for i,v in pairs(workspace.Map:GetDescendants()) do pcall(function()
if v.Transparency == nil then print("no transparency detected") else
if not v:GetAttribute("OriginalTransparency") and v.Transparency ~= 1 then v:SetAttribute("OriginalTransparency", v.Transparency) end
if Value == 0 and v:GetAttribute("OriginalTransparency") then v.Transparency = v:GetAttribute("OriginalTransparency")elseif v.Transparency ~= 1 then v.Transparency = Value end end end)end end})

Tabs.Visuals:AddSection("ESP")

Ghost = Tabs.Visuals:AddToggle("Ghost", {Title = "Ghost ESP", Default = false })
PlayersT = Tabs.Visuals:AddToggle("Players", {Title = "Players ESP", Default = false })
DeadBodies = Tabs.Visuals:AddToggle("Body", {Title = "Dead Bodies ESP", Default = false })
Items = Tabs.Visuals:AddToggle("Items", {Title = "Items ESP", Default = false })

Closets = Tabs.Visuals:AddToggle("Closets", {Title = "Closets ESP", Default = false })
Van = Tabs.Visuals:AddToggle("Van", {Title = "Van ESP", Default = false })

Interactables = Tabs.Visuals:AddToggle("Interactables", {Title = "Interactables ESP", Default = false })

Tabs.Settings:AddSection("Script Customizations")

auto = Tabs.Settings:AddToggle("auto", {Title = "Auto Check Evidence in Journal when Detected", Default = false })
locator = Tabs.Settings:AddToggle("locator", {Title = "FE Ghost Locator", Default = false })
ghostnotifs = Tabs.Settings:AddToggle("ghostnotifs", {Title = "Ghost Hunting Notification", Default = false })
objecttp = Tabs.Settings:AddToggle("objecttp", {Title = "Use Teleports For Lights/Doors", Default = false })

-- // PAGES \\ --

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Home.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/MainPage.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/World.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Player.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Evidence.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/GUI/InGame/Visuals.lua"))()

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