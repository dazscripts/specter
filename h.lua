-- Decompiled using Krnl
local v1 = 6
local v4 = game:GetService("ContextActionService")
local v7 = game:GetService("GuiService")
local v10 = game:GetService("CollectionService")
local v11 = game
v11.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local v15 = game
v11 = v15.Players
local v16 = v11.LocalPlayer
v11 = {}
local v369 = {}
local v17 = "Are you there?"
v369[1] = v17
v369[2] = "Where are you?"
v369[3] = "Are you a man?"
v369[4] = "Are you a woman?"
v369[5] = "How did you die?"
v369[6] = "How old are you?"
v369[7] = "When were you born?"
v369[8] = "What is your name?"
v369[9] = "Are you friendly?"
v369[10] = "Can you talk?"
v369[11] = "What do you want?"
v1 = #v369
v17 = nil
local function determineSize_1()
    v17 = UDim2.new(0, (workspace.CurrentCamera.ViewportSize.X) * 0.36458333333333, 0, (workspace.CurrentCamera.ViewportSize.Y) * 0.64814814814815)
end
(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function()
    v17 = UDim2.new(0, (workspace.CurrentCamera.ViewportSize.X) * 0.36458333333333, 0, (workspace.CurrentCamera.ViewportSize.Y) * 0.64814814814815)
end)
v17 = UDim2.new(0, (workspace.CurrentCamera.ViewportSize.X) * 0.36458333333333, 0, (workspace.CurrentCamera.ViewportSize.Y) * 0.64814814814815)
local v68 = UDim2.new(0.5, 0, 0.45, 0)
local v74 = UDim2.new(0.5, 0, 0.45, 0)
local v80 = UDim2.new(0, 10, 0, 10)
local v82 = script.Template
local v85 = Instance.new("ScreenGui", v16:WaitForChild("PlayerGui"))
v85.Name = "MenuScreen"
local v88 = Instance.new("Frame", v85)
v88.AnchorPoint = Vector2.new(0.5, 0.5)
v88.Size = v80
v88.Position = v74
v10:AddTag(v88, "ResizeX")
v10:AddTag(v88, "ResizeY")
local v98 = false
v88.Visible = v98
v98 = 1
v88.BackgroundTransparency = v98
v98 = 0
v88.BorderSizePixel = v98
v98 = "MenuFrame"
v88.Name = v98
v98 = v7.AutoSelectGuiEnabled
local v99 = v7.GuiNavigationEnabled
local v230 = 1
for v230 = v230, v1, 1 do
    local v238 = 360
    if 16 <= v230 then
        v238 = false
    end
    (function(p1, p2, p3, p4)
        local v102 = {}
        local v104 = v82:Clone()
        v104.Text = p1
        v104.Name = p1
        v10:AddTag(v104, "ResizeX")
        v10:AddTag(v104, "ResizeY")
        local v114 = math.rad(90 + p2)
        v104.Position = UDim2.new(0, ((v17.X.Offset) / 2) * math.cos(v114) - (v104.Size.X.Offset) / 2, 0, ((v17.X.Offset) / 2) * math.sin(v114) - (v104.Size.Y.Offset) / 2)
        v104.Parent = v88
        v104.Parent.Changed:Connect(function()
            v104.Size = UDim2.new(0, ((workspace.CurrentCamera.ViewportSize.X) * 0.0625) * (v88.Size.X.Offset) / v17.X.Offset, 0, ((workspace.CurrentCamera.ViewportSize.Y) * 0.064814814814815) * (v88.Size.Y.Offset) / v17.Y.Offset)
            v104.Position = UDim2.new(0.5, ((v88.Size.X.Offset) / 2) * math.cos(v114) - (v104.Size.X.Offset) / 2, 0.5, ((v88.Size.Y.Offset) / 2) * math.sin(v114) - (v104.Size.Y.Offset) / 2)
        end)
        v102.Label = v104
        v102.Vector = Vector2.new(math.cos(v114), math.sin(v114))
        v102.Range = p3
        table.insert(v11, v102)
    end)(v15[v230], ((360) / v1) * v230 - 1, (v238) / v1, true)
end
local function closeMenu_1()
    v7.GuiNavigationEnabled = v99
    v7.AutoSelectGuiEnabled = v98
    v4:UnbindAction("RadialMenu")
    local v302 = v7.SelectedObject
    if v302 then
    end
    v302 = v7
    v302.SelectedObject = nil
    v88:TweenSizeAndPosition(v80, v74, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.4, true, function()
        local v310 = menuOpen
        if not v310 then
            v310 = v88
            v310.Visible = false
        end
    end)
    menuOpen = false
end
local function onMenuSelect_1(p9)
    if p9 then
        game.ReplicatedStorage.Events.SimulateChatEvent:FireServer(p9.Name)
        game.SoundService.RadialSelect:Play()
        closeMenu_1()
    end
end
function pickoption(p10, p11)
    local v331 = v7
    local v332 = v331.SelectedObject
    if v332 then
        v331 = v7
        v332 = v331.SelectedObject
        if v332 then
            v331 = game.ReplicatedStorage.Events.SimulateChatEvent
            v331:FireServer(v332.Name)
            game.SoundService.RadialSelect:Play()
            closeMenu_1()
        end
    end
end
(v16:GetAttributeChangedSignal("Radial")):Connect(function()
    local v346 = v16:GetAttribute("Radial")
    if not v346 then
        v346 = closeMenu_1
        v346()
    end
end)
game:GetService("UserInputService").InputBegan:Connect(function(p14)
    if p14.KeyCode == Enum.KeyCode.ButtonA then
        if menuOpen then
            pickoption()
        end
    end
end)
v240 = false
v4:BindAction("ToggleMenu", function(p12, p13)
    if p13 == Enum.UserInputState.Begin then
        if not menuOpen then
            local v351 = v16:GetAttribute("Radial")
            if v351 then
                v351 = function()
                    v99 = v7.GuiNavigationEnabled
                    v98 = v7.AutoSelectGuiEnabled
                    v7.GuiNavigationEnabled = false
                    v7.AutoSelectGuiEnabled = false
                    v4:BindAction("RadialMenu", function(p6, p7, p8)
                        if p8.Position.magnitude > 0.4 then
                            v7.SelectedObject = (function(p5)
                                local v242 = 1
                                local v243 = v11
                                local v244 = #v243
                                for v242 = v242, v244, 1 do
                                    v243 = v11[v242]
                                    if (math.rad(v243.Range)) / 2 > math.acos(((p5.X) * v243.Vector.X + (p5.Y) * v243.Vector.Y) / p5.magnitude) then
                                        return v243.Label
                                    end
                                end
                                v244 = nil
                                return v244
                            end)(p8.Position)
                            return 
                        end
                        v268 = v7
                        v269 = nil
                        v268.SelectedObject = v269
                    end, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
                    v88.Visible = true
                    v88:TweenSizeAndPosition(v17, v68, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                    menuOpen = true
                end
                v351()
                return 
                closeMenu_1()
            end
            return 
        end
    end
end, v240, Enum.KeyCode.ButtonL1, Enum.KeyCode.K)
