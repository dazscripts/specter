Tabs.Player:AddSection("Player Customizations")

local third = Tabs.Player:AddToggle("third", {Title = "Enable Third Person", Default = true })
third:OnChanged(function()
    if Options.third.Value then
        plr.CameraMaxZoomDistance = 10000
        plr.CameraMode = 'Classic'
    else
        plr.CameraMode = 'LockFirstPerson'
    end
end)

Tabs.Player:AddSlider("FOV", {
    Title = "Field of View",
    Description = "Change how much you can see",
    Default = 70,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end
})

Tabs.Player:AddSlider("Gravity", {
    Title = "Gravity",
    Description = "Change workspace Gravity",
    Default = 196.1999969482422,
    Min = 0,
    Max = 300,
    Rounding = 1,
    Callback = function(Value)
        workspace.Gravity = Value
    end
})


Tabs.Player:AddSection("Character Mods")

Tabs.Player:AddSlider("WS", {
    Title = "Walkspeed",
    Description = "Change how fast your Avatar is",
    Default = 6,
    Min = 0,
    Max = 70,
    Rounding = 1,
    Callback = function(Value)
        plr.Character.Humanoid.WalkSpeed = Value
    end
})

Tabs.Player:AddSlider("JP", {
    Title = "JumpPower",
    Description = "Change how high You can jump.",
    Default = 0,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Callback = function(Value)
        plr.Character.Humanoid.JumpPower = Value
    end
})

Tabs.Player:AddSlider("Hip", {
    Title = "Hip Height",
    Description = "Change how tall your Avatar is",
    Default = 2.1924233436584473,
    Min = 0,
    Max = 7,
    Rounding = 1,
    Callback = function(Value)
        plr.Character.Humanoid.HipHeight = Value
    end
})