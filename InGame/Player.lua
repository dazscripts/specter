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
    Rounding = 0,
    Callback = function(Value)
        WS.CurrentCamera.FieldOfView = Value
    end
})

Tabs.Player:AddSlider("Gravity", {
    Title = "Gravity",
    Description = "Change WS Gravity",
    Default = 196.1999969482422,
    Min = 0,
    Max = 300,
    Rounding = 1,
    Callback = function(Value)
        WS.Gravity = Value
    end
})


Tabs.Player:AddSection("Character Mods")

Tabs.Player:AddSlider("WS", {
    Title = "Walkspeed",
    Description = "Change how fast your Avatar is",
    Default = Char.Humanoid.WalkSpeed,
    Min = 0,
    Max = 70,
    Rounding = 0,
    Callback = function(Value)
        plr.Character.Humanoid.WalkSpeed = Value
    end
})

Tabs.Player:AddSlider("JP", {
    Title = "JumpPower",
    Description = "Change how high You can jump.",
    Default = Char.Humanoid.JumpPower,
    Min = 0,
    Max = 120,
    Rounding = 0,
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