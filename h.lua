-- Decompiled using Krnl
local v1 = {}
local v3 = script
local v5, v6, v3 = pairs(v3.Modules:GetChildren())
for v21, u1 in v5, v6, v3 do
    local v15, v16 = pcall(function()
        v1[u1.Name] = require(u1)
    end)
    if not v15 then
        warn("CRITICAL ERROR: " .. v16)
    end
end
v5 = v1.PromptManager
v5:Customize()
local v22 = v1.Services
v6 = require
v3 = v22.ReplicatedStorage
u1 = "Evidences"
local v23 = v6(v3:WaitForChild(u1))
v21 = print
v16 = v22.GuiService
local v34 = v16:IsTenFootInterface()
if not v34 then
    local v35 = v22.UserInputService
    v34 = v35.GamepadEnabled
    if v34 then
        v15 = "Console"
        v35 = v22.UserInputService
        v34 = v35.TouchEnabled
        if v34 then
            v35 = v22.UserInputService
            v34 = v35.KeyboardEnabled
            if not v34 then
                v15 = "Mobile"
                v15 = "Desktop"
            else
            end
            v21("User is playing on", v15)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("GetDevice").OnClientInvoke = function()
                local v26 = v22
                local v28 = v26.GuiService:IsTenFootInterface()
                if not v28 then
                    v26 = v22.UserInputService
                    v28 = v26.GamepadEnabled
                    if v28 then
                        v28 = "Console"
                        return v28
                    end
                    local v32 = v22
                    v26 = v32.UserInputService
                    local v30 = v26.TouchEnabled
                    if v30 then
                        v32 = v22
                        v26 = v32.UserInputService
                        v30 = v26.KeyboardEnabled
                        if not v30 then
                            v30 = "Mobile"
                            return v30
                        end
                    end
                    return "Desktop"
                end
            end
            local v3261 = {}
            local v41 = {}
            local v42 = {}
            v34 = 0
            v35 = {}
            local v43 = false
            v19 = game.Players
            v18 = v19.LocalPlayer
            v19 = workspace.CurrentCamera
            local v49 = (v18:WaitForChild("PlayerGui")):WaitForChild("Gui")
            local v52 = v18.PlayerGui:WaitForChild("PlayerName")
            local v55 = v49:WaitForChild("Journal")
            workspace:WaitForChild("Map")
            local v69 = UDim2.new(1, -80, 1, -205)
            local v75 = UDim2.new(1, -80, 1, -265)
            v55.Content.Overview.Overview.Text1.Text = string.format('Your goal is to identify the type of ghost haunting <font color="#d0b05e">%s</font> using the tools in your van. <font color="#d0b05e">%s</font>', game.ReplicatedStorage:GetAttribute("Map"), "Learn more about each equipment with the buttons below.")
            game.ReplicatedStorage.AttributeChanged:Connect(function(p1)
                local v109 = game
                if p1 == "Map" then
                    v109 = v55.Content.Overview.Overview.Text1
                    v109.Text = string.format('Your goal is to identify the type of ghost haunting <font color="#d0b05e">%s</font> using the tools in your van. <font color="#d0b05e">%s</font>', v109.ReplicatedStorage:GetAttribute(p1), "Learn more about each equipment with the buttons below.")
                end
            end)
            game["Script Context"].Error:Connect(function(p2, p3, p4)
                local v124 = ""
                local v128, v129 = pcall(function()
                    return p4:GetFullName()
                end)
                if not v128 then
                    v124 = "Protected Script"
                else
                    v124 = v129
                end
                game.ReplicatedStorage.Events.Error:FireServer(p2, p3, v124)
            end)
            game.ReplicatedStorage.Events.Notification.OnClientEvent:Connect(function(p5, p6, p7)
                if not p7 then
                    p7 = 5
                end
                v1.NotificationManager:Create(p5, p6, p7)
            end)
            local v146
            task.spawn(function()
                assert((function(p8, ...)
                    local v148 = {}
                    local v150 = 100
                    local v151 = 1
                    for v149 = 1, v150, v151 do
                        local v152 = {}
                        local v162 = game
                        v152[4] = v162
                        v152[2] = pcall(game.StarterGui[p8], v162.StarterGui, ...)
                        v148 = v152
                        local v164 = v148[1]
                        if not v164 then
                            break
                        end
                        v164 = task.wait
                        v157 = 1
                        v164(v157)
                    end
                    v151 = v148
                    v150 = unpack
                    return v150(v151)
                end)("SetCore", "ResetButtonCallback", false))
            end)
            local v3275 = workspace
            local v174 = v3275.Map:FindFirstChild("Blockers")
            if v174 then
                v3275 = workspace.Map
                v174 = v3275.Blockers
                v18:GetMouse().TargetFilter = v174
            end
            v174 = nil
            local v177 = v22.ReplicatedStorage:FindFirstChild("Animations")
            function updateAnim()
                local v179 = v174
                if v179 then
                    v179 = v174
                    v179:Stop()
                    v174 = nil
                end
                local v181 = v41
                v180 = v181[v34]
                if v180 then
                    if v180 ~= "" then
                        if v180 ~= nil then
                            v181 = workspace
                            local v188 = ((v181:FindFirstChild(v18.Name)):WaitForChild("Humanoid")):WaitForChild("Animator")
                            if v180 == "Flashlight" then
                                v174 = v188:LoadAnimation(v177:WaitForChild("Hold_Flashlight"))
                            else
                                if v180 ~= "Ghost Goggles" then
                                    v174 = v188:LoadAnimation(v177:WaitForChild("Hold_Generic"))
                                end
                            end
                            v195 = v174
                            if v195 then
                                v195 = v174
                                v195:Play()
                            end
                        end
                    end
                end
            end
            local function updateProximityPrompt_1(p9)
                local v198 = v1
                local v200 = v198.Keybinds.Binds
                local v206 = p9.ActionText
                local v201 = v200[v206]
                if v201 then
                    v200 = v201.Type
                    if v200 == "KeyCode" then
                        v198 = Enum
                        v206 = v198[v201.Type]
                        v198 = v201.Code
                        v200 = v206[v198]
                        p9.KeyboardKeyCode = v200
                    end
                end
                if v18:GetAttribute("Dead") then
                    v202 = p9.MaxActivationDistance
                    p9:SetAttribute("Distance", v202)
                    p9.MaxActivationDistance = 0
                end
            end
            updateProximityPrompt = updateProximityPrompt_1
            local v212 = game.ReplicatedStorage.Events.Message
            updateProximityPrompt_1 = v212.OnClientEvent
            updateProximityPrompt_1:Connect(function(p10)
                game.StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[SYSTEM] " .. p10, Color = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, TextSize = 18
                })
            end)
            workspace.DescendantAdded:Connect(function(p11)
                local v231 = p11:IsA("ProximityPrompt")
                if v231 then
                    v231 = updateProximityPrompt
                    v231(p11)
                end
            end)
            (v18:WaitForChild("Data")):WaitForChild("Room").Changed:Connect(function(p12)
                if p12 then
                    v49.RoomName.Text = string.upper(p12.Name)
                    return 
                end
                v241 = v49
                v239 = v241.RoomName
                v241 = ""
                v239.Text = v241
            end)
            workspace.Orbs.ChildAdded:Connect(function(p13)
                local v247 = v41[v34]
                local v248 = v18
                if v247 then
                    v248 = "Tool"
                    if v247 == "Ghost Goggles" then
                        local v254 = ((workspace:FindFirstChild(v248.Name)):FindFirstChild(v248)):GetAttribute("On")
                        if v254 then
                            v254 = 0
                            p13.Transparency = v254
                            return 
                        end
                        p13.Transparency = 1
                    end
                end
            end)
            workspace.Fingerprints.ChildAdded:Connect(function(p14)
                local v261 = v41[v34]
                local v262 = v18
                if v261 then
                    v262 = "Tool"
                    if v261 == "Ghost Goggles" then
                        local v268 = ((workspace:FindFirstChild(v262.Name)):FindFirstChild(v262)):GetAttribute("On")
                        if v268 then
                            v268 = v18
                            if v268:GetAttribute("FP") then
                                p14:WaitForChild("SurfaceGui").Brightness = 10
                            end
                        end
                    end
                end
            end)
            function disableEquipment()
                local v278 = v18
                local v280 = workspace:FindFirstChild(v278.Name)
                if v280 then
                    v278 = "Head"
                    local v282 = v280:FindFirstChild(v278)
                    if v282 then
                        v282 = v280.Head
                        v282.LocalTransparencyModifier = 1
                    end
                end
                v283 = v22.Lighting
                v282 = v283.GogglesTint
                v283 = false
                v282.Enabled = v283
                v282 = pairs
                local v292 = workspace
                v283 = v292.Orbs
                local v285, v286, v284 = v282(v283:GetChildren())
                for v289, v288 in v285, v286, v292 do
                    v288.Transparency = 1
                end
                v286 = workspace
                v285 = v286.Fingerprints
                local v290, v286, v284 = v285:GetChildren()
                for v289, v288 in v290, v286, v292 do
                    v287 = v288.SurfaceGui
                    v287.Brightness = 0.5
                end
                v290 = toggleDeadVisible
                v286 = false
                v290(v286)
            end
            function toggleDeadVisible(p15)
                local v294 = game
                local v296, v294, v297 = v294.Players:GetPlayers()
                for v316, v299 in v296, v294, v297 do
                    local v298 = v18
                    local v301 = v299:GetAttribute("Dead")
                    v301 = workspace
                    local v305, v306, v307 = (v301:FindFirstChild(v299.Name)):GetDescendants()
                    for v315, v310 in v305, v306, v307 do
                        local v311 = v310:IsA("BasePart")
                        if v311 then
                            break
                        end
                        v311 = v310.Name
                        if v311 ~= "HumanoidRootPart" then
                            break
                        end
                        v311 = Enum.Material.ForceField
                        v310.Material = v311
                        v310.Color = v22.Lighting.GogglesTint.TintColor
                        if v310.Name == "Head" then
                            v310.Transparency = 0.9
                        else
                            v310.Transparency = 0.7
                            break
                            v310.Transparency = 1
                        end
                    end
                end
                if v299 ~= v298 then
                    return 
                    if p15 then
                    end
                    if v301 then
                        if v303 then
                        end
                    end
                end
            end
            function updateEquipmentStuff()
                local v325 = v41[v34]
                local v326 = v18
                if v325 then
                    v326 = "Tool"
                    local v329 = (workspace:FindFirstChild(v326.Name)):FindFirstChild(v326)
                    if v18:GetAttribute("InCamera") then
                        v329:SetAttribute("On", false)
                    end
                    if v325 == "Ghost Goggles" then
                        local v337 = v329:GetAttribute("Color")
                        if not v337 then
                            v337 = v22.ReplicatedStorage.Equipment
                            local v342 = (v337:FindFirstChild("Ghost Goggles")):GetAttribute("Color")
                        end
                        v339 = game.Lighting.GogglesTint
                        v339.TintColor = v342
                        v339 = game.Lighting.GogglesTint
                        local v378 = v329:GetAttribute("On") or false
                        v339.Enabled = v378
                        local v347 = v329:GetAttribute("On")
                        if v347 then
                            v347 = pairs
                            local v348 = workspace
                            v378 = v348.Orbs
                            local v349, v350, v348 = v347(v378:GetChildren())
                            for v353, v352 in v349, v350, v348 do
                                v352.Transparency = 0
                            end
                            v350 = workspace
                            v349 = v350.Fingerprints
                            local v354, v350, v348 = v349:GetChildren()
                            for v353, v352 in v354, v350, v348 do
                                v351 = v18
                                local v356 = v351:GetAttribute("FP")
                                if v356 then
                                    v356 = v352.SurfaceGui
                                    v356.Brightness = 5
                                end
                            end
                            v354 = toggleDeadVisible
                            v350 = true
                            v354(v350)
                        else
                            disableEquipment()
                        end
                        local v359 = workspace
                        local v361, v359, v348 = v359.Equipment:GetChildren()
                        for v353, v352 in v361, v359, v348 do
                            v356 = v352.Name
                            if v356 == "Candle" then
                                local v363 = v352:GetAttribute("Lit")
                                if not v363 then
                                    v357 = v352.PrimaryPart
                                    v363 = v357.LightPrompt
                                    v357 = false
                                    v363.Enabled = v357
                                end
                            end
                        end
                        return 
                    end
                    if v325 == "Lighter" then
                        v359 = "On"
                        local v364 = v329:GetAttribute(v359)
                        if v364 then
                            v361 = workspace
                            v364 = v361.Equipment
                            local v365, v361, v366 = v364:GetChildren()
                            for v348, v353 in v365, v361, v366 do
                                v352 = v353.Name
                                if v352 == "Candle" then
                                    v357 = "Lit"
                                    local v367 = v353:GetAttribute(v357)
                                    if not v367 then
                                        v363 = v353.PrimaryPart
                                        v367 = v363.LightPrompt
                                        v363 = true
                                        v367.Enabled = v363
                                        v363 = v353.PrimaryPart
                                        v367 = v363.PickupPrompt
                                        v363 = false
                                        v367.Enabled = v363
                                    end
                                end
                            end
                        else
                            v361 = workspace
                            v365 = v361.Equipment
                            local v368, v361, v366 = v365:GetChildren()
                            for v348, v353 in v368, v361, v366 do
                                v367 = v353.Name
                                if v367 == "Candle" then
                                    local v370 = v353:GetAttribute("Lit")
                                    if not v370 then
                                        v363 = v353.PrimaryPart
                                        v370 = v363.LightPrompt
                                        v363 = false
                                        v370.Enabled = v363
                                        v363 = v353.PrimaryPart
                                        v370 = v363.PickupPrompt
                                        v363 = true
                                        v370.Enabled = v363
                                    end
                                end
                            end
                        end
                    end
                    v368 = disableEquipment
                    v368()
                    return 
                end
                local v371 = workspace
                v329 = v371.Equipment
                local v372, v371, v361 = v329:GetChildren()
                for v366, v348 in v372, v371, v361 do
                    v353 = v348.Name
                    if v353 == "Candle" then
                        v363 = "Lit"
                        local v373 = v348:GetAttribute(v363)
                        if not v373 then
                            v373 = v348.PrimaryPart
                            if v373 then
                                v370 = v348.PrimaryPart
                                v373 = v370.LightPrompt
                                v370 = false
                                v373.Enabled = v370
                                v370 = v348.PrimaryPart
                                v373 = v370.PickupPrompt
                                v370 = true
                                v373.Enabled = v370
                            end
                        end
                    end
                end
                v372 = disableEquipment
                v372()
            end
            (v18:GetAttributeChangedSignal("InCamera")):Connect(function()
                local v385 = v18:GetAttribute("InCamera")
                if v385 then
                    v385 = disableEquipment
                    v385()
                end
            end)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("DataLoaded").OnClientEvent:Connect(function(p16, p17, p18)
                local v394 = workspace:WaitForChild("Map")
                local v396 = v18:GetAttributes()
                local v397 = v396.LowQuality
                if v397 then
                    v397 = pairs
                    local v399, v400, v401 = v397(v394:GetDescendants())
                    for v407, v404 in v399, v400, v401 do
                        local v405 = v404:IsA("BasePart")
                        if v405 then
                            v405 = v404.Material
                            if v405 == Enum.Material.Glass then
                                v405 = Enum.Material.Plastic
                                v404.Material = v405
                            end
                        end
                    end
                end
                v42 = p18
                v401 = v22
                v400 = v401.SoundService
                v399 = v400.Inside
                v407 = "Inside"
                v399.SoundId = v394:GetAttribute(v407)
                v401 = v22
                v399 = v401.SoundService.Outside
                v399.SoundId = v394:GetAttribute("Outside")
                v401 = v1
                local v591 = v401.Keybinds
                v399 = v591.Images
                if p16 then
                    v401 = v1
                    v591 = v401.Keybinds
                    v591.Binds = p16
                    v591 = pairs
                    v401 = workspace
                    local v411, v412, v413 = v591(v401:GetDescendants())
                    for v404, v405 in v411, v412, v413 do
                        local v415 = v405:IsA("ProximityPrompt")
                        if v415 then
                            v415 = updateProximityPrompt
                            v415(v405)
                        end
                    end
                    v411 = v396.KeybindHUD
                    if v411 then
                        v411 = v18
                        v413 = "Device"
                        if v411:GetAttribute(v413) == "Desktop" then
                            v412 = v49
                            v412 = true
                            v412.Keybinds.Visible = v412
                            v412 = p16
                            print(v412)
                            local v420, v421, v422 = pairs(p16)
                            for v404, v405 in v420, v421, v422 do
                                local v423 = v49
                                local v426 = v423.Keybinds:FindFirstChild(v404)
                                if v426 then
                                    v426 = print
                                    v423 = v405.Code
                                    v426(v423, v405.Type, v404)
                                    local v435 = v399[v405.Type]
                                    local v593 = v435[v405.Code]
                                    local v594 = v593[1]
                                    v49.Keybinds:FindFirstChild(v404).ImageLabel.ImageRectOffset = v594
                                    if v405.Type == "KeyCode" then
                                        v593 = v49
                                        v594 = v593.Keybinds
                                        v435 = v404
                                        v594:FindFirstChild(v435).ImageLabel.Image = "rbxassetid://9995273305"
                                    else
                                        v593 = v49
                                        v436 = v593.Keybinds
                                        v436:FindFirstChild(v404).ImageLabel.Image = "rbxassetid://9995272657"
                                    end
                                end
                            end
                            v422 = v49
                            v421 = v422.Keybinds
                            v420 = v421.Questions
                            v421 = false
                            v420.Visible = v421
                        else
                            v420 = pairs
                            v421 = p16
                            local v439, v440, v422 = v420(v421)
                            for v404, v405 in v439, v440, v422 do
                                v438 = v49
                                v433 = v438.Keybinds
                                v429 = v404
                                local v441 = v433:FindFirstChild(v429)
                                if v441 then
                                    v438 = v49.Keybinds
                                    v441 = v438:FindFirstChild(v404).ImageLabel
                                    v434 = v49.Keybinds
                                    v441.ImageRectOffset = v399.KeyCode[(v434:FindFirstChild(v404)):GetAttribute("KeyCode")][1]
                                end
                            end
                            v440 = v49
                            v439 = v440.Keybinds
                            v440 = false
                            v439.Visible = v440
                        end
                        v422 = v49
                        v440 = v422.Keybinds
                        v404 = "Questions"
                        v439 = v440:FindFirstChild(v404).ImageLabel
                        v439.Image = "rbxassetid://9995275815"
                        v422 = v49
                        v439 = v422.Keybinds:FindFirstChild("Questions").ImageLabel
                        v422 = 146.286
                        v439.ImageRectSize = Vector2.new(v422, 146.246)
                        v439 = v49.Keybinds:FindFirstChild("Questions").ImageLabel
                        v439.ImageRectOffset = v399.KeyCode.ButtonL1[1]
                        v439 = v49.Keybinds:FindFirstChild("Card").ImageLabel
                        v439.Image = "rbxassetid://9995275815"
                        v439 = v49.Keybinds:FindFirstChild("Card").ImageLabel
                        v439.ImageRectSize = Vector2.new(146.286, 146.246)
                        v439 = v49.Keybinds:FindFirstChild("Card").ImageLabel
                        local v468 = v399.KeyCode
                        local v615 = v468.ButtonR1
                        v439.ImageRectOffset = v615[1]
                        v439 = pairs
                        local v469, v470, v465 = v439(p16)
                        for v468, v405 in v469, v470, v615 do
                            v444 = v49
                            v441 = v444.Keybinds
                            v442 = v468
                            local v471 = v441:FindFirstChild(v442)
                            v444 = Vector2.new
                            v445 = 85.33
                            local v473 = v444(85.33, v445)
                            v450 = "Device"
                            local v475 = v18:GetAttribute(v450)
                            v475 = v405.Type
                            v475 = Vector2.new
                            v473 = v475(85.33, 85.33)
                            local v480 = v18:GetAttribute("Device")
                            v480 = v405.Type
                            if v480 == "UserInputType" then
                                v480 = Vector2.new
                                v473 = v480(204.8, 204.8)
                            else
                                v483 = v18
                                if v483:GetAttribute("Device") == "Console" then
                                    v473 = Vector2.new(146.286, 146.246)
                                end
                            end
                            if v471 then
                                v488 = v471.ImageLabel
                                v488.ImageRectSize = v473
                                v488 = v18
                                if v488:GetAttribute("Device") == "Console" then
                                    v471.ImageLabel.Image = "rbxassetid://9995275815"
                                end
                            end
                        end
                        v469 = v18
                        v615 = "Device"
                        if v469:GetAttribute(v615) == "Mobile" then
                            v470 = v49
                            v470 = false
                            v470.Keybinds.Visible = v470
                        end
                        if v396.InventoryHUD then
                            v470 = v49
                            v470 = true
                            v470.Toolbar.Visible = v470
                        else
                            v470 = v49
                            v470 = false
                            v470.Toolbar.Visible = v470
                        end
                        if v18:GetAttribute("Device") == "Desktop" then
                            v470 = string.format
                            v490 = v1
                            v473 = v490.Keybinds
                            v471 = v473.Binds
                            v405 = v471.Revive
                            v468 = v405.Code
                            v49:WaitForChild("Revive").Text = v470("REVIVE (%s)", v468)
                        else
                            v496 = v49
                            v498 = "REVIVE (X)"
                            v496:WaitForChild("Revive").Text = v498
                        end
                        if v475 == "Desktop" then
                            v500 = v396.Gamma
                            if v475 == "KeyCode" then
                                if v500 < 0 then
                                    v498 = false
                                end
                                v498 = true
                                local v650 = -1
                                if v498 then
                                    v471 = v500
                                    v405 = math.abs
                                    local v651 = v650 - (v405(v471)) * 2
                                else
                                    v502 = math.abs
                                    v503 = (v502(v500)) * 2
                                    local v652 = v650 + v503
                                end
                                v505 = game
                                v503 = v505.Lighting
                                v503.ExposureCompensation = v650
                                if v480 == "Desktop" then
                                    v35 = p17
                                    v505 = v35
                                    v503 = v505["Ghost Goggles"]
                                    if v503 then
                                        v505 = v35
                                        v503 = v505["Ghost Goggles"]
                                        if v503 == 1 then
                                            v505 = game.Lighting
                                            v503 = v505.GogglesTint
                                            v505 = 0.03
                                            v503.Brightness = v505
                                        else
                                            v505 = v35
                                            v503 = v505["Ghost Goggles"]
                                            if v503 == 2 then
                                                v506 = game
                                                v505 = v506.Lighting
                                                v503 = v505.GogglesTint
                                                v505 = 0.06
                                                v503.Brightness = v505
                                            else
                                                v505 = v35
                                                v503 = v505["Ghost Goggles"]
                                                if v503 == 3 then
                                                    v506 = game
                                                    v505 = v506.Lighting
                                                    v503 = v505.GogglesTint
                                                    v505 = 0.06
                                                    v503.Brightness = v505
                                                    v503 = v18
                                                    v506 = "FP"
                                                    v473 = true
                                                    v503:SetAttribute(v506, v473)
                                                end
                                            end
                                        end
                                    end
                                    local v509 = v18:GetAttribute("Watch")
                                    if v509 then
                                        v509 = v49
                                        v505 = true
                                        v509:WaitForChild("Sanity").Visible = v505
                                    end
                                    v511 = v18
                                    if v511:GetAttribute("Device") == "Mobile" then
                                        v505 = UDim2.new
                                        v490 = 0.15
                                        v491 = 0
                                        v49:WaitForChild("Toolbar").Size = v505(0.65, 0, v490, v491)
                                        v49:WaitForChild("Toolbar").Position = UDim2.new(0.5, 0, 0.9, 0)
                                        v49:WaitForChild("Sanity").Size = UDim2.new(0.5, 0, 0.08, 0)
                                        v49:WaitForChild("Sanity").Position = UDim2.new(0.25, 0, 0.74, 0)
                                        v49:WaitForChild("Stamina").Size = UDim2.new(1, 0, 0.035, 0)
                                        v49:WaitForChild("Stamina").Position = UDim2.new(0.5, 0, 0.995, 0)
                                        v49:WaitForChild("RoomName").Size = UDim2.new(0.3, 0, 0.08, 0)
                                        v49:WaitForChild("RoomName").Position = UDim2.new(0.35, 0, 0.025, 0)
                                        v49:WaitForChild("Version").Size = UDim2.new(0.375, 0, 0.033, 0)
                                        local v581 = UDim2.new(1, 0, 975, 0)
                                        v49:WaitForChild("Version").Position = v581
                                        local v585 = (v18:WaitForChild("PlayerGui")):FindFirstChild("TouchGui")
                                        if v585 then
                                            v581 = v18:WaitForChild("PlayerGui").TouchGui.TouchControlFrame
                                            v585 = v581.JumpButton
                                            v585:Destroy()
                                        end
                                    end
                                    return 
                                end
                            end
                        end
                    end
                end
            end)
            function updateInventory(p19)
                v41 = p19
                v34 = v18:GetAttribute("Index")
                local v660 = v49:FindFirstChild("Toolbar")
                local v663, v664, v665 = pairs(p19)
                for v667, v672 in v663, v664, v665 do
                    local v671 = v660:FindFirstChild(tostring(v667))
                    local v674 = v42[v672]
                    local v711 = v35[v672] or 0
                    local v712
                    local v713
                    local v678 = game.ReplicatedStorage
                    local v682 = (v678.Equipment:FindFirstChild(v672)):FindFirstChild(v674)
                    if v682 then
                        v678 = game.ReplicatedStorage
                        v682 = v678.Equipment
                        v713 = (v682:FindFirstChild(v672)):FindFirstChild(v674)
                    end
                    if not v713 then
                        v678 = game.ReplicatedStorage
                        v686 = v678.Equipment
                        v713 = (v686:FindFirstChild(v672)):FindFirstChild(v674 .. "_" .. v711)
                    end
                    if v713 then
                        v712 = v713
                    else
                        v693 = warn
                        v678 = "Failed to find"
                        v690 = v674
                        v691 = "_"
                        v689 = v690 .. v691 .. v711
                        v693(v678, v672, v689)
                        v713 = game.ReplicatedStorage.Equipment
                        v712 = v713:FindFirstChild(v672)
                    end
                    local v700 = v712:GetAttribute("Image")
                    if v700 then
                        v671.Image = v700
                    else
                        v697 = warn
                        v697(v712, "does not have image")
                        v671.Image = "rbxassetid://26688657"
                        v700 = "rbxassetid://26688657"
                        v671.Image = v700
                        v674 = ""
                        v671.Image = v674
                    end
                    if v667 == v34 then
                        v711 = true
                        v671.UIStroke.Enabled = v711
                    else
                        v711 = false
                        v671.UIStroke.Enabled = v711
                    end
                end
                v663 = v18
                v665 = "Fourth"
                if v672 ~= "" then
                    if v663:GetAttribute(v665) then
                        v664 = true
                        v660:FindFirstChild("4").Visible = v664
                    else
                        v664 = false
                        v660:FindFirstChild("4").Visible = v664
                    end
                    v708 = updateEquipmentStuff
                    v708()
                    updateAnim()
                    return 
                    if v674 then
                        if v676 then
                        end
                    end
                end
            end
            function castRay(p20)
                local v722 = {}
                local v727 = workspace
                local v769 = v727.Map.Nodes
                local v728 = workspace
                local v771 = v728.Map.TouchParts
                local v729 = workspace
                local v773 = v729.Map.PossessionSpawns
                local v730 = workspace
                local v731 = workspace
                v722[1] = workspace.Equipment
                v722[2] = workspace.Map.Blockers
                v722[3] = v769
                v722[4] = v771
                v722[5] = v773
                v722[6] = v730.Map.BoneSpawns
                v722[7] = v19
                v722[8] = v731.Ghost
                local v778 = v18
                if v778.Character then
                    v771 = v18
                    v769 = v771.Character
                    v778 = v722
                    table.insert(v778, v769)
                end
                local v733 = game
                local v735, v736, v733 = pairs(v733.Players:GetPlayers())
                for v725, v727 in v735, v736, v733 do
                    v728 = workspace
                    v730 = v727.Name
                    local v737 = v728:FindFirstChild(v730)
                    if v737 then
                        v731 = v737
                        v729 = table.insert
                        v729(v722, v731)
                    end
                end
                v733 = workspace
                v736 = v733.Map
                v735 = v736.Rooms
                local v739, v736, v733 = v735:GetChildren()
                for v725, v727 in v739, v736, v733 do
                    local v741 = v727:FindFirstChild("Hitbox")
                    if v741 then
                        v741 = table.insert
                        v741(v722, v727.Hitbox)
                    end
                end
                v739 = workspace
                local v744, v736, v733 = v739:GetChildren()
                for v725, v727 in v744, v736, v733 do
                    local v747 = v727.Name:match("emfpart")
                    if v747 then
                        v747 = table.insert
                        v747(v722, v727)
                    end
                end
                v736 = v22
                v744 = v736.UserInputService
                local v750 = v744:GetMouseLocation()
                v736 = nil
                if p20 then
                    v733 = v19
                    v773 = (v19.ViewportSize.X) / 2
                    v736 = v733:ViewportPointToRay(v773, (v19.ViewportSize.Y) / 2)
                else
                    v755 = v19
                    v736 = v755:ViewportPointToRay(v750.X, v750.Y)
                end
                v758 = RaycastParams.new
                local v759 = v758()
                v759.FilterType = Enum.RaycastFilterType.Exclude
                v759.FilterDescendantsInstances = v722
                v751 = v736.Direction
                v752 = (v751) * 5000
                v751 = v759
                local v761 = workspace:Raycast(v736.Origin, v752, v751)
                if v761 == nil then
                    return nil, nil
                end
                return v761.Instance, v761.Position, v761.Normal
            end
            function attemptPlace()
                local v787 = v41
                local v788 = v34
                local v789 = v787[v788]
                if v789 then
                    if v789 ~= "" then
                        v788 = game.ReplicatedStorage
                        v787 = v788.Equipment
                        local v791 = v787:FindFirstChild(v789)
                        if v791 then
                            local v793 = v791:GetAttribute("Placed")
                            if v793 then
                                v793 = v19
                                local v795 = v793:FindFirstChild("ViewModel")
                                if v795 then
                                    v795 = castRay
                                    local v796, v797 = v795()
                                    local v800 = game.ReplicatedStorage.Events
                                    local v805 = v800.PlaceItem:InvokeServer(v34, v19.ViewModel.PrimaryPart.CFrame, v796, v797)
                                    if v805 then
                                        v800 = v22.ContextActionService
                                        v800:UnbindAction("ToggleTool")
                                        v22.ContextActionService:UnbindAction("Place")
                                        updateInventory(v805.NewInventory)
                                        v34 = 0
                                        local v813 = v19:FindFirstChild("ViewModel")
                                        if v813 then
                                            v813 = v19
                                            (v813:FindFirstChild("ViewModel")):Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            function placeTool(p21, p22, p23)
                if p22 == Enum.UserInputState.Begin then
                    local v826 = v18
                    local v828 = workspace:FindFirstChild(v826.Name)
                    local v829 = v41
                    if v829 then
                        local v830 = v41
                        v826 = v34
                        v829 = v830[v826]
                        if v829 then
                            v826 = v22
                            v830 = v826.ReplicatedStorage
                            v829 = v830.Equipment
                            local v831 = v41
                            v826 = v831[v34]
                            local v833 = v829:FindFirstChild(v826)
                            if v833 then
                                v831 = "Placed"
                                local v834 = v833:GetAttribute(v831)
                                if v834 then
                                    v834 = attemptPlace
                                    v834()
                                end
                            end
                        end
                    end
                end
            end
            function toggleTool(p24, p25, p26)
                local v839 = v18:GetAttribute("InCamera")
                if v839 then
                    return 
                end
                v839 = Enum.UserInputState.Begin
                if p25 == v839 then
                    v839 = workspace
                    local v840 = v18
                    local v842 = v839:FindFirstChild(v840.Name)
                    local v843 = v41
                    if v843 then
                        local v844 = v41
                        v840 = v34
                        v843 = v844[v840]
                        if v843 then
                            v844 = v22
                            v843 = v844.ReplicatedStorage
                            v840 = "Events"
                            ((v843:WaitForChild(v840)):WaitForChild("ToggleEquipment")):InvokeServer()
                            v844 = v41
                            updateInventory(v844)
                        end
                    end
                end
            end
            local function equipTool_1(p27, p28, p29)
                local v850 = 0
                if p28 == Enum.UserInputState.Begin then
                    if p29.KeyCode == Enum.KeyCode.One then
                        v850 = 1
                    else
                        if p29.KeyCode == Enum.KeyCode.Two then
                            v850 = 2
                        else
                            if p29.KeyCode == Enum.KeyCode.Three then
                                v850 = 3
                            else
                                if p29.KeyCode == Enum.KeyCode.Four then
                                    v850 = 4
                                end
                            end
                        end
                    end
                    local v853 = v34
                    local v855 = v18:GetAttribute("Drinking")
                    if not v855 then
                        v855 = 0
                        if v850 >= v855 then
                            v853 = v22
                            v855 = v853.ReplicatedStorage
                            local v861 = ((v855:WaitForChild("Events")):WaitForChild("Equip")):InvokeServer(v850)
                            v853 = v861.Success
                            if v853 then
                                v853 = updateInventory
                                v853(v861.NewInventory)
                                local v863 = v41
                                local v864 = v34
                                if v41[v853] ~= v863[v864] then
                                    v863 = v1
                                    v864 = "Ruffle" .. (Random.new()):NextInteger(1, 3)
                                    v863.EzFX:PlaySound(v864)
                                end
                                v866 = v1
                                local v873 = v866.Keybinds.Binds.Toggle
                                local v908 = v41
                                local v909 = v34
                                local v927 = v908[v909]
                                if v927 then
                                    v909 = v22
                                    v908 = v909.ContextActionService
                                    v866 = "ToggleTool"
                                    v871 = toggleTool
                                    v908:BindAction(v866, v871, true, Enum[v873.Type][v873.Code], Enum.KeyCode.ButtonR2)
                                    v909 = v22
                                    v909.ContextActionService:SetPosition("ToggleTool", v69)
                                    v909 = v22.ReplicatedStorage
                                    local v884 = v909.Equipment:FindFirstChild(v927)
                                    if v884 then
                                        local v886 = v884:GetAttribute("Placed")
                                        if v886 then
                                            v886 = v22.ContextActionService
                                            v886:BindAction("Place", placeTool, true)
                                            v22.ContextActionService:SetPosition("Place", v75)
                                        end
                                    end
                                    v887 = v22
                                    v887.ContextActionService:SetImage("ToggleTool", "rbxassetid://14055955684")
                                    v887 = v22
                                    v887.ContextActionService:SetImage("Place", "rbxassetid://14055956137")
                                    return 
                                end
                                v884 = v22.ContextActionService
                                v887 = "ToggleTool"
                                v884:UnbindAction(v887)
                                v22.ContextActionService:UnbindAction("Place")
                                return 
                                v861 = v22.ContextActionService
                                v861:UnbindAction("ToggleTool")
                                v22.ContextActionService:UnbindAction("Place")
                            end
                            return 
                        end
                    end
                end
            end
            equipTool = equipTool_1
            equipTool_1 = {}
            equipTool_1[1] = "One"
            equipTool_1[2] = "Two"
            equipTool_1[3] = "Three"
            equipTool_1[4] = "Four"
            local v928, v929, v930 = v49.Toolbar:GetChildren()
            for v209, v933 in v928, v929, v930 do
                local v934 = v933:IsA("ImageButton")
                if v934 then
                    v934 = v933.Activated
                    v934:Connect(function()
                        equipTool("", Enum.UserInputState.Begin, {
                            KeyCode = Enum.KeyCode[equipTool_1[tonumber(v933.Name)]]
                        })
                    end)
                end
            end
            local function dPad_1(p30, p31)
                local v949 = Enum.UserInputState.Begin
                if p30 == v949 then
                    local v950 = 3
                    local v953 = v18:GetAttribute("Fourth")
                    if v953 then
                        v950 = 4
                    end
                    if p31 then
                        local v954 = 1
                        v953 = v950
                        local v955 = 1
                        for v954 = v954, v953, v955 do
                            local v958 = v41[v949 + v954]
                            v958 = v949 + v954
                            v958 = v41[v949 + v954]
                            local v966 = v949 + v954
                            break
                            v958 = v41[v954 - v950 + v966]
                            v958 = v954 - v950
                            local v967 = v958 + v966
                        end
                        break
                        local v964 = 1
                        if v958 then
                            v953 = v950
                            if v950 > v958 then
                                v955 = 1
                                for v954 = v964, v953, v955 do
                                    v956 = v41
                                    v957 = v949 - v954
                                    v958 = v956[v957]
                                    v958 = v949 - v954
                                    v956 = 0
                                    v956 = v41
                                    v957 = v949 - v954
                                    v958 = v956[v957]
                                    local v968 = v949 - v954
                                    break
                                    v956 = v41
                                    v959 = v954 + v950
                                    v957 = v959 - v968
                                    v958 = v956[v957]
                                    v958 = v954 + v950
                                    local v969 = v958 - v968
                                end
                                if v958 ~= "" then
                                end
                                if v958 ~= "" then
                                    v953 = {}
                                    if v958 then
                                        v955 = Enum.KeyCode.One
                                        v953[1] = v955
                                        if v958 >= v956 then
                                            v955 = Enum.KeyCode.Two
                                            v953[2] = v955
                                            v955 = Enum.KeyCode.Three
                                            if v958 ~= "" then
                                                v953[3] = v955
                                                v955 = Enum.KeyCode.Four
                                                v953[4] = v955
                                                v955 = equipTool
                                                v964 = ""
                                                v958 = Enum.UserInputState.Begin
                                                v956 = {}
                                                v957 = v953[v34]
                                                v956.KeyCode = v957
                                                v955(v964, v958, v956)
                                                return 
                                            end
                                        end
                                    end
                                    if v958 ~= "" then
                                    end
                                end
                            end
                        end
                    end
                end
            end
            function dpad(p32, p33, p34)
                if p34.KeyCode == Enum.KeyCode.DPadRight then
                    dPad_1(p33, true)
                    return 
                end
                if p34.KeyCode == Enum.KeyCode.DPadLeft then
                    dPad_1(p33, false)
                end
            end
            function dropTool(p35, p36, p37)
                if p36 == Enum.UserInputState.Begin then
                    local v983 = v41
                    local v984 = v34
                    if v983[v984] ~= "" then
                        v984 = v22
                        v983 = v984.GuiService
                        local v985 = v983:IsTenFootInterface()
                        if not v985 then
                            local v986 = v22
                            v984 = v986.UserInputService
                            v985 = v984.GamepadEnabled
                            if v985 then
                                v986 = v22
                                v984 = v986.UserInputService
                                v985 = v984.TouchEnabled
                                if v985 then
                                    v986 = v22
                                    v984 = v986.UserInputService
                                    v985 = v984.KeyboardEnabled
                                    if not v985 then
                                        local v1020 = "Mobile"
                                        local v1021 = "Desktop"
                                    else
                                    end
                                    if "Console" == "Console" then
                                        v985 = v41
                                        v984 = v34
                                        v986 = v22
                                        v984 = v986.ReplicatedStorage
                                        v985 = v984.Equipment
                                        v986 = v985[v984]
                                        local v987 = v985:FindFirstChild(v986)
                                        if v987 then
                                            local v989 = v987:GetAttribute("Placed")
                                            if v989 then
                                                v989 = attemptPlace
                                                v989()
                                                return 
                                            end
                                        end
                                        local v997 = ((v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("Drop")):InvokeServer(v34)
                                        if v997.Success then
                                            updateInventory(v997.NewInventory)
                                            v22.ContextActionService:UnbindAction("ToggleTool")
                                            v22.ContextActionService:UnbindAction("Place")
                                            return 
                                            v987 = v22
                                            v997 = "Events"
                                            local v1008 = ((v987.ReplicatedStorage:WaitForChild(v997)):WaitForChild("Drop")):InvokeServer(v34)
                                            v987 = v1008.Success
                                            if v987 then
                                                v987 = updateInventory
                                                v987(v1008.NewInventory)
                                                v22.ContextActionService:UnbindAction("ToggleTool")
                                                v22.ContextActionService:UnbindAction("Place")
                                            end
                                        end
                                        return 
                                    end
                                end
                            end
                        end
                    end
                end
            end
            local function handleSprint_1(p38, p39, p40)
                if p39 then
                    v22.ReplicatedStorage.Events.Sprint:FireServer(p39)
                end
            end
            handleSprint = handleSprint_1
            v930 = v22.ReplicatedStorage
            v933 = "Events"
            handleSprint_1 = (v930:WaitForChild(v933)):WaitForChild("UpdateInventory").OnClientEvent
            handleSprint_1:Connect(function(p41)
                updateInventory(p41)
            end)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("Hunt").OnClientEvent:Connect(function(p42)
                if p42 == true then
                    local v1042 = workspace
                    local v1045 = v1042.Ghost:FindFirstChild("Highlight")
                    if v1045 then
                        v1042 = workspace
                        v1045 = v1042.Ghost
                        (v1045:FindFirstChild("Highlight")):Destroy()
                    end
                end
                v43 = p42
                v1042 = script.Parent
                v1042.VideoFeed:SetAttribute("Hunting", p42)
                if p42 then
                    v1042 = v22
                    (v1042.TweenService:Create(v22.SoundService.Outside, TweenInfo.new(1), {
                        Volume = 0
                    })):Play()
                    v1042 = v22
                    (v1042.TweenService:Create(v22.SoundService.Inside, TweenInfo.new(1), {
                        Volume = 0
                    })):Play()
                    v1042 = v22.SoundService
                    v1042 = 0
                    v1042.Hunt.TimePosition = v1042
                    v1042 = v22
                    (v1042.TweenService:Create(v22.SoundService.Hunt, TweenInfo.new(1), {
                        Volume = ((0.5) * v18:GetAttribute("MasterVolume")) * v18:GetAttribute("HuntVolume")
                    })):Play()
                    return 
                end
                v1042 = v22
                v1057 = 0
                (v1042.TweenService:Create(v22.SoundService.Hunt, TweenInfo.new(1), {
                    Volume = v1057
                })):Play()
                local v1089 = v18:GetAttribute("Inside")
                if v1089 then
                    v1042 = v22
                    v1089 = v1042.TweenService
                    v1075 = workspace
                    v1078 = v1075.Map
                    v1075 = v18
                    v1076 = (v1078:GetAttribute("InsideVolume")) * v1075:GetAttribute("BackgroundVolume")
                    v1057 = (v1076) * v18:GetAttribute("MasterVolume")
                    (v1089:Create(v22.SoundService.Inside, TweenInfo.new(1), {
                        Volume = v1057
                    })):Play()
                    return 
                end
                v1042 = v22
                v1098 = workspace
                v1100 = v1098.Map
                v1098 = v18
                v1076 = (v1100:GetAttribute("OutsideVolume")) * v1098:GetAttribute("BackgroundVolume")
                v1057 = (v1076) * v18:GetAttribute("MasterVolume")
                (v1042.TweenService:Create(v22.SoundService.Outside, TweenInfo.new(1), {
                    Volume = v1057
                })):Play()
            end)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("PlaySound").OnClientEvent:Connect(function(p43, p44, p45)
                if p44 then
                    v1.EzFX:Create3DSound(p43, p45)
                    return 
                end
            end)
            function GetPosition(p46, p47, p48)
                return ((CFrame.new(p46.Position)) * CFrame.Angles(math.rad(p48.X), math.rad(p48.Y), math.rad(p48.Z))) * CFrame.new(p47 - p46.Position)
            end
            local v1317
            local v1318
            local v1319 = false
            local v1320
            local v1322 = v18:GetMouse()
            v1322.Move:Connect(function()
                local v1326 = v34
                local v1327 = v41[v1326]
                local v1339 = v1319
                if not v1339 then
                    v1339 = v1317
                    if v1339 then
                        v1339 = v1318
                        if v1339 then
                            if v1327 ~= "" then
                                if v1327 == nil then
                                    v1326 = v22.ReplicatedStorage
                                    v1339 = v1326.Events
                                    (v1339:WaitForChild("ArmRot")):FireServer(v1320, v1318)
                                else
                                    v1326 = v22.ReplicatedStorage
                                    (v1326.Events:WaitForChild("ArmRot")):FireServer(v1317, v1318)
                                end
                                task.wait()
                                v1319 = false
                                return 
                            end
                        end
                    end
                end
            end)
            local function cleanupPlacing_1()
                local v1346 = v19:FindFirstChild("ViewModel")
                if v1346 then
                    v1346 = v19
                    (v1346:FindFirstChild("ViewModel")):Destroy()
                end
            end
            cleanupPlacing = cleanupPlacing_1
            local v1352 = game.ReplicatedStorage.Events:WaitForChild("LuckyEye")
            cleanupPlacing_1 = v1352.OnClientEvent
            cleanupPlacing_1:Connect(function()
                local v1353 = workspace
                local v1355, v1353, v1356 = v1353.Map:GetChildren()
                for v1366, v1358 in v1355, v1353, v1356 do
                    local v1357 = v1358.Name
                    v1357 = v1358.Name
                    if v1357 == "cursed_object" then
                        v1357 = Instance.new
                        local v1361 = v1357("Highlight", v1358)
                        v1361.FillTransparency = 1
                        v1361.OutlineTransparency = 0
                        task.delay(60, function()
                            v1361:Destroy()
                        end)
                    end
                end
                if v1357 ~= "Bone" then
                    return 
                end
            end)
            local function angleBetween_1(p49, p50)
                return math.acos(math.clamp(p49:Dot(p50), -1, 1))
            end
            v1352 = 0
            local v1384 = (game.ReplicatedStorage.Assets:WaitForChild("WhisperPart")):Clone()
            v1384.Parent = workspace
            (script:GetAttributeChangedSignal("Draining")):Connect(function()
                ((game.ReplicatedStorage:WaitForChild("Events")):WaitForChild("PhantomDrain")):FireServer(script:GetAttribute("Draining"))
            end)
            local v1763 = v18:GetMouse()
            v1763.Button1Down:Connect(function()
                local v1766 = v22
                local v1768 = v1766.GuiService:IsTenFootInterface()
                if not v1768 then
                    local v1769 = v22
                    v1766 = v1769.UserInputService
                    v1768 = v1766.GamepadEnabled
                    if v1768 then
                        local v1770 = "Console"
                        v1769 = v22
                        v1766 = v1769.UserInputService
                        v1768 = v1766.TouchEnabled
                        if v1768 then
                            v1769 = v22
                            v1766 = v1769.UserInputService
                            v1768 = v1766.KeyboardEnabled
                            if not v1768 then
                                v1770 = "Mobile"
                                v1770 = "Desktop"
                            else
                            end
                            if v1770 == "Mobile" then
                                return 
                            end
                            v1770 = attemptPlace
                            v1770()
                            return 
                        end
                    end
                end
            end)
            local v1771 = {}
            local v1777 = math.random(1, 10)
            v1763 = tick() + (v1777) / 10
            local v1780, v1781, v1777 = pairs(v22.CollectionService:GetTagged("Flicker"))
            for v1783, v1782 in v1780, v1781, v1777 do
                v1771[v1782] = v1782
            end
            v1780 = v22.CollectionService
            v1777 = "Flicker"
            (v1780:GetInstanceAddedSignal(v1777)):Connect(function(p52)
                v1771[p52] = p52
            end)
            (v22.CollectionService:GetInstanceRemovedSignal("Flicker")):Connect(function(p53)
                local v1792, v1793, v1794 = p53:GetChildren()
                for v1800, v1796 in v1792, v1793, v1794 do
                    v1796.SpotLight.Brightness = v1796:GetAttribute("Brightness")
                    v1796.Transparency = 0
                end
                v1792 = v1771
                v1793 = nil
                v1792[p53] = v1793
            end)
            v1782 = "Events"
            v1781 = (v22.ReplicatedStorage:WaitForChild(v1782)):WaitForChild("VanDoor").OnClientEvent
            v1783 = function(p54, p55)
                if p54 == "Open" then
                    (function()
                        local v1170 = workspace:FindFirstChild("Van")
                        local v1174 = v22.ReplicatedStorage:GetAttribute("VanType")
                        if v1170 then
                            break
                        end
                        if v1174 ~= "Van" then
                            if v1174 ~= "Box Van" then
                                if v1174 == "Compact Van" then
                                    local v1179 = 0
                                    for v1179 = v1179, -97, -1 do
                                        v1170.VanDoor:SetPrimaryPartCFrame(GetPosition((v1170:FindFirstChild("VanDoor")):FindFirstChild("Rotate"), v1170.VanDoor.PrimaryPart.Position, Vector3.new(0, 90, v1179)))
                                        task.wait()
                                    end
                                    return 
                                end
                                if v1174 == "RV" then
                                    v1181 = "VanDoor"
                                    v1179 = 0
                                    v1180 = -97
                                    for v1179 = v1179, v1180, -1 do
                                        v1170.VanDoor:SetPrimaryPartCFrame(GetPosition((v1170:FindFirstChild(v1181)):FindFirstChild("Rotate"), v1170.VanDoor.PrimaryPart.Position, Vector3.new(0, v1179, 0)))
                                        task.wait()
                                    end
                                    return 
                                end
                                if v1174 == "Armored Van" then
                                    break
                                end
                                v1195 = "VanDoor1"
                                v1179 = "VanDoor2"
                                local v1212 = 0
                                for v1212 = v1212, -97, -1 do
                                    v1170.VanDoor1:SetPrimaryPartCFrame(GetPosition((v1170:FindFirstChild(v1195)):FindFirstChild("Rotate"), v1170.VanDoor1.PrimaryPart.Position, Vector3.new(0, v1212, 0)))
                                    v1170.VanDoor2:SetPrimaryPartCFrame(GetPosition((v1170:FindFirstChild(v1179)):FindFirstChild("Rotate"), v1170.VanDoor2.PrimaryPart.Position, Vector3.new(0, -v1212, 0)))
                                    task.wait()
                                end
                                return 
                            end
                        end
                    end)()
                    local v1839 = {}
                    local v1843, v1844, v1845 = (p55:WaitForChild("AnimSaves")):GetDescendants()
                    for v1852, v1848 in v1843, v1844, v1845 do
                        local v1849 = v1848:IsA("Animation")
                        if v1849 then
                            v1849 = table.insert
                            v1849(v1839, v1848)
                        end
                    end
                    v1845 = v1
                    v1844 = v1845.Services
                    v1843 = v1844.ContentProvider
                    v1845 = v1839
                    v1843:PreloadAsync(v1845)
                    return 
                end
                v1839 = function()
                    local v1245 = workspace:FindFirstChild("Van")
                    local v1249 = v22.ReplicatedStorage:GetAttribute("VanType")
                    if v1245 then
                        break
                    end
                    if v1249 ~= "Van" then
                        if v1249 ~= "Box Van" then
                            if v1249 == "Compact Van" then
                                local v1254 = -97
                                for v1254 = v1254, 0, 1 do
                                    v1245.VanDoor:SetPrimaryPartCFrame(GetPosition((v1245:FindFirstChild("VanDoor")):FindFirstChild("Rotate"), v1245.VanDoor.PrimaryPart.Position, Vector3.new(0, 90, v1254)))
                                    task.wait()
                                end
                                return 
                            end
                            if v1249 == "RV" then
                                v1256 = "VanDoor"
                                v1254 = -97
                                v1255 = 0
                                for v1254 = v1254, v1255, 1 do
                                    v1245.VanDoor:SetPrimaryPartCFrame(GetPosition((v1245:FindFirstChild(v1256)):FindFirstChild("Rotate"), v1245.VanDoor.PrimaryPart.Position, Vector3.new(0, v1254, 0)))
                                    task.wait()
                                end
                                return 
                            end
                            if v1249 == "Armored Van" then
                                break
                            end
                            v1270 = "VanDoor1"
                            v1254 = "VanDoor2"
                            local v1287 = -97
                            for v1287 = v1287, 0, 1 do
                                v1245.VanDoor1:SetPrimaryPartCFrame(GetPosition((v1245:FindFirstChild(v1270)):FindFirstChild("Rotate"), v1245.VanDoor1.PrimaryPart.Position, Vector3.new(0, v1287, 0)))
                                v1245.VanDoor2:SetPrimaryPartCFrame(GetPosition((v1245:FindFirstChild(v1254)):FindFirstChild("Rotate"), v1245.VanDoor2.PrimaryPart.Position, Vector3.new(0, -v1287, 0)))
                                task.wait()
                            end
                            return 
                        end
                    end
                end
                v1839()
            end
            v1781:Connect(v1783)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("Door").OnClientEvent:Connect(function(p56, p57, p58, p59)
                local v1861 = v18:GetAttribute("Dead")
                if not v1861 then
                    v1861 = Instance.new
                    local v1863 = v1861("CFrameValue")
                    v1863.Value = p57
                    local v1873 = v22.TweenService:Create(v1863, TweenInfo.new(p59, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Value = p58
                    })
                    v1863.Changed:Connect(function(p60)
                        p56:PivotTo(p60)
                    end)
                    v1873:Play()
                    local v1878
                    v1878 = v1873.Completed:Connect(function()
                        v1863:Destroy()
                        v1878:Disconnect()
                        v1878 = nil
                    end)
                end
            end)
            (v18:GetAttributeChangedSignal("Sprinting")):Connect(function()
                local v1892 = v18:GetAttribute("Sprinting")
                if v1892 then
                    v1892 = v22.TweenService
                    (v1892:Create(v19, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 64
                    })):Play()
                    return 
                end
                v1893 = v22
                v1901 = Enum.EasingStyle.Quad
                (v1893.TweenService:Create(v19, TweenInfo.new(0.25, v1901, Enum.EasingDirection.Out), {
                    FieldOfView = 70
                })):Play()
            end)
            (v18:GetAttributeChangedSignal("Stamina")):Connect(function()
                local v1918 = v18:GetAttribute("Stamina")
                local v1925 = v49
                v1925.Stamina:TweenSize(UDim2.new((v1918) / 100, 0, 0.01, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.05, true)
                local v1934 = v18:GetAttribute("clear_vision")
                if v1934 then
                    v1925 = v22.Lighting
                    v1934 = v1925.Blur
                    v1925 = 0
                    v1934.Size = v1925
                    v1925 = v22.Lighting
                    v1934 = v1925.ColorCorrection
                    v1925 = 0
                    v1934.Contrast = v1925
                    return 
                end
                if 10 >= v1918 then
                    v1935 = v22
                    v1925 = v1935.Lighting
                    v1935 = 10
                    v1925 = v1935 - v1918
                    v1925.Blur.Size = v1925
                    v1935 = v22
                    v1925 = v1935.Lighting
                    v1935 = 10 - v1918
                    v1925 = (v1935) / 240
                    v1925.ColorCorrection.Contrast = v1925
                    return 
                end
                v1935 = v22
                v1935.Lighting.Blur.Size = 0
                v1935 = v22
                v1935.Lighting.ColorCorrection.Contrast = 0
            end)
            (v18:GetAttributeChangedSignal("Sanity")):Connect(function()
                v49:WaitForChild("Sanity").Text = "SANITY: " .. math.round(v18:GetAttribute("Sanity")) .. "%"
                local v1972 = 7 - (7) * (v18:GetAttribute("Sanity")) / 50
                local v1965 = v18:GetAttribute("clear_vision")
                if v1965 then
                    v1972 = 0
                end
                v1965 = game.Lighting.SanityBlur
                v1965.Size = v1972
            end)
            pcall(function()
                (v22.TweenService:Create(v22.SoundService.Outside, TweenInfo.new(1), {
                    Volume = ((workspace.Map:GetAttribute("OutsideVolume")) * v18:GetAttribute("BackgroundVolume")) * v18:GetAttribute("MasterVolume")
                })):Play()
            end)
            (v18:GetAttributeChangedSignal("Inside")):Connect(function()
                local v2008 = v18:GetAttribute("Dead")
                if not v2008 then
                    v2008 = v43
                    if not v2008 then
                        if not v18:GetAttribute("Inside") then
                            v2008 = v22.TweenService
                            (v2008:Create(v22.SoundService.Outside, TweenInfo.new(1), {
                                Volume = ((workspace.Map:GetAttribute("OutsideVolume")) * v18:GetAttribute("BackgroundVolume")) * v18:GetAttribute("MasterVolume")
                            })):Play()
                            (v22.TweenService:Create(v22.SoundService.Inside, TweenInfo.new(1), {
                                Volume = 0
                            })):Play()
                            return 
                        end
                        v2009 = v22
                        v2024 = 0
                        (v2009.TweenService:Create(v22.SoundService.Outside, TweenInfo.new(1), {
                            Volume = v2024
                        })):Play()
                        v2009 = v22
                        v2020 = workspace
                        v2023 = v2020.Map
                        v2020 = v18
                        v2021 = (v2023:GetAttribute("InsideVolume")) * v2020:GetAttribute("BackgroundVolume")
                        v2024 = (v2021) * v18:GetAttribute("MasterVolume")
                        (v2009.TweenService:Create(v22.SoundService.Inside, TweenInfo.new(1), {
                            Volume = v2024
                        })):Play()
                    end
                end
            end)
            v49:WaitForChild("Revive").Activated:Connect(function()
                if Enum.UserInputState.Begin == Enum.UserInputState.Begin then
                    local v2087 = v18:GetAttribute("Dead")
                    if v2087 then
                        v2087 = v1.EzFX
                        v2087:LerpBlur(12, 0.3)
                        v22.MarketplaceService:PromptProductPurchase(v18, 1246920063)
                    end
                end
            end)
            v22.MarketplaceService.PromptProductPurchaseFinished:Connect(function()
                v1.EzFX:LerpBlur(0, 0.3)
            end)
            local v2111 = workspace.ScareGhost.AnimSaves
            local v2115 = workspace.ScareGhost.Humanoid:LoadAnimation(workspace.ScareGhost.AnimSaves.Scares:GetChildren()[math.random(1, #v2111.Scares:GetChildren())])
            v2115:AdjustSpeed(1)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("Died").OnClientEvent:Connect(function()
                v49:WaitForChild("Toolbar").Visible = false
                v49:WaitForChild("Stamina").Visible = false
                print("client died")
                local v2130, v2131, v2132 = pairs(workspace:GetDescendants())
                for v2140, v2135 in v2130, v2131, v2132 do
                    if v2135:IsA("ProximityPrompt") then
                        v2135:SetAttribute("Distance", v2135.MaxActivationDistance)
                        v2135.MaxActivationDistance = 0
                    end
                end
                v2130 = task.spawn
                v2131 = function()
                    updateInventory(v41)
                end
                v2130(v2131)
                v55.Visible = false
                v2132 = v22
                v2132.SoundService.Outside.Volume = 0
                v2132 = v22
                v2132.SoundService.Inside.Volume = 0
                local v2175 = v1
                v2132 = "Death"
                v2175.EzFX:PlaySound(v2132)
                local v2147 = v18:GetAttribute("DeathJumpscares")
                if v2147 then
                    v2147 = v2115
                    v2147:Play()
                    v2175 = Enum.CameraType.Scriptable
                    v19.CameraType = v2175
                    v2135 = workspace
                    v2140 = v2135.Scare
                    v2175 = v2140.Camera.CFrame
                    v19.CFrame = v2175
                    v2175 = v22
                    v2140 = TweenInfo.new
                    v2135 = 0.08
                    v2139 = Enum.EasingStyle.Quad
                    (v2175.TweenService:Create(v19, v2140(v2135, v2139, Enum.EasingDirection.Out, 3, true), {
                        FieldOfView = 65
                    })):Play()
                    v2175 = v2115
                    v2175.Stopped:Wait()
                else
                    v2175 = true
                    v49:WaitForChild("Death").Visible = v2175
                end
                v2160 = task.wait
                v2160(0.15)
                v49:WaitForChild("Death").Visible = true
            end)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("AfterDeath").OnClientEvent:Connect(function()
                v49:WaitForChild("Toolbar").Visible = false
                v49:WaitForChild("Stamina").Visible = false
                v49:WaitForChild("RoomName").Text = "PURGATORY"
                v49:WaitForChild("Revive").Visible = true
                v19.CameraSubject = (workspace:WaitForChild(v18.Name)):WaitForChild("Humanoid")
                v19.CameraType = Enum.CameraType.Custom
                v22.Lighting:WaitForChild("DeathTint").Enabled = true
                game.Lighting.FogColor = Color3.fromRGB(0, 255, 255)
                game.Lighting.FogEnd = 100
                game.Lighting.FogStart = 0
                game.Lighting.Atmosphere.Density = 0.65
                game.Lighting.Atmosphere.Color = Color3.fromRGB(0, 255, 255)
                game.Lighting.Atmosphere.Decay = Color3.fromRGB(0, 255, 255)
                local v2215 = game
                v2215.Lighting.Atmosphere.Glare = 0
                game.Lighting.Atmosphere.Haze = 10
                local v2304 = 1
                local v2305 = 0.02
                for v2215 = 0, v2304, v2305 do
                    task.wait()
                    v49:WaitForChild("Death").BackgroundTransparency = v2215
                end
                v2304 = v49
                v2305 = 1
                v2304:WaitForChild("Death").BackgroundTransparency = v2305
                v49:WaitForChild("Death").Visible = false
                v49:WaitForChild("Death").BackgroundTransparency = 0
                local v2311 = workspace
                local v2226 = v2311.Map:FindFirstChild("Doors")
                if v2226 then
                    local v2227 = workspace
                    v2311 = v2227.Map
                    v2226 = v2311.Doors
                    local v2228, v2214, v2227 = v2226:GetChildren()
                    for v2219, v2230 in v2228, v2311, v2227 do
                        local v2231, v2232, v2233 = v2230:GetDescendants()
                        for v2246, v2236 in v2231, v2232, v2233 do
                            local v2237 = v2236:IsA("BasePart")
                            if v2237 then
                                v2237 = v2236.CanCollide
                                v2236:SetAttribute("CanCollide", v2237)
                                v2236:SetAttribute("Transparency", v2236.Transparency)
                                v2236.CanCollide = false
                                v2236.Transparency = 1
                            end
                        end
                    end
                end
                v2311 = v22
                v2228 = v2311.TweenService
                v2230 = v22
                v2219 = v2230.SoundService
                v2227 = v2219.Outside
                v2219 = TweenInfo.new
                v2230 = 1
                v2231 = 0
                (v2228:Create(v2227, v2219(v2230), {
                    Volume = v2231
                })):Play()
                v2246 = workspace
                v2233 = v2246.Map
                v2236 = "InsideVolume"
                v2246 = v18
                v2237 = "BackgroundVolume"
                v2232 = (v2233:GetAttribute(v2236)) * v2246:GetAttribute(v2237)
                v2231 = (v2232) * v18:GetAttribute("MasterVolume")
                (v22.TweenService:Create(v22.SoundService.Inside, TweenInfo.new(1), {
                    Volume = v2231
                })):Play()
            end)
            (v22.ReplicatedStorage:WaitForChild("Events")):WaitForChild("AfterRevive").OnClientEvent:Connect(function()
                local v2325, v2326, v2327 = workspace:GetDescendants()
                for v2336, v2330 in v2325, v2326, v2327 do
                    if v2330:IsA("ProximityPrompt") then
                        if v2330:GetAttribute("Distance") then
                            v2330.MaxActivationDistance = v2330:GetAttribute("Distance")
                        end
                    end
                end
                v2326 = workspace
                v2325 = v2326.Map
                v2327 = "Doors"
                local v2337 = v2325:FindFirstChild(v2327)
                if v2337 then
                    local v2338 = workspace
                    v2326 = v2338.Map
                    v2337 = v2326.Doors
                    local v2339, v2326, v2338 = v2337:GetChildren()
                    for v2336, v2330 in v2339, v2326, v2338 do
                        local v2340 = workspace
                        local v2341 = v2340.Map
                        v2335 = v2341.Doors
                        local v2342, v2341, v2340 = v2335:GetChildren()
                        for v2360, v2346 in v2342, v2341, v2340 do
                            print("Makking doors visible")
                            local v2347, v2348, v2349 = v2346:GetDescendants()
                            for v2359, v2352 in v2347, v2348, v2349 do
                                if v2352:IsA("BasePart") then
                                    v2352.CanCollide = v2352:GetAttribute("CanCollide")
                                    v2352.Transparency = v2352:GetAttribute("Transparency")
                                end
                            end
                        end
                    end
                end
            end)
            (v18:GetAttributeChangedSignal("Dead")):Connect(function()
                local v2367 = v18:GetAttribute("Dead")
                if not v2367 then
                    v2367 = v49
                    v2367:WaitForChild("Revive").Visible = false
                    v49:WaitForChild("Toolbar").Visible = true
                    v49:WaitForChild("RoomName").Text = ""
                    v49:WaitForChild("Stamina").Visible = true
                    v22.Lighting:WaitForChild("DeathTint").Enabled = false
                    local v2379, v2380, v2381 = pairs(workspace:GetDescendants())
                    for v2390, v2384 in v2379, v2380, v2381 do
                        if v2384:IsA("ProximityPrompt") then
                            if v2384:GetAttribute("Distance") then
                                v2384.MaxActivationDistance = v2384:GetAttribute("Distance")
                            end
                        end
                    end
                    v2380 = game
                    v2379 = v2380.Lighting
                    v2380 = Color3.fromRGB
                    v2381 = 0
                    v2390 = 255
                    v2384 = 255
                    v2379.FogColor = v2380(v2381, v2390, v2384)
                    v2379 = game.Lighting
                    v2379.FogEnd = 100000
                    v2379 = game.Lighting
                    v2379.FogStart = 0
                    v2379 = game.Lighting.Atmosphere
                    v2379.Density = 0.319
                    v2379 = game.Lighting.Atmosphere
                    v2379.Color = Color3.fromRGB(0, 0, 0)
                    v2379 = game.Lighting.Atmosphere
                    v2379.Decay = Color3.fromRGB(0, 0, 0)
                    v2379 = game.Lighting.Atmosphere
                    v2379.Glare = 0.63
                    v2379 = game.Lighting.Atmosphere
                    v2379.Haze = 0
                end
            end)
            game.ReplicatedStorage.Events.UpdatePlayer.OnClientEvent:Connect(function(p64)
                if p64 then
                    local v2436 = workspace:FindFirstChild(p64.Name)
                    if v2436 then
                        local v2439 = p64:GetAttribute("Dead")
                        if v2439 then
                            v2439 = v18
                            local v2441 = v2439:GetAttribute("Dead")
                            if v2441 then
                                v2441 = pairs
                                local v2443, v2444, v2445 = v2441(v2436:GetChildren())
                                for v2453, v2448 in v2443, v2444, v2445 do
                                    local v2449 = v2448:IsA("BasePart")
                                    if v2449 then
                                        v2449 = v2448.Name
                                        if v2449 ~= "HumanoidRootPart" then
                                            v2449 = 0
                                            v2448.Transparency = v2449
                                            v2449 = v2436.Head
                                            local v2451 = v2449:FindFirstChild("Face")
                                            if v2451 then
                                                v2451 = v2436.Head.face
                                                v2451.Transparency = 0
                                            end
                                        end
                                    end
                                end
                                return 
                            end
                            v2443 = pairs
                            local v2454, v2455, v2445 = v2443(v2436:GetChildren())
                            for v2453, v2448 in v2454, v2455, v2445 do
                                local v2457 = v2448:IsA("BasePart")
                                if v2457 then
                                    v2457 = v2448.Name
                                    if v2457 ~= "HumanoidRootPart" then
                                        v2457 = 1
                                        v2448.Transparency = v2457
                                        v2457 = v2436.Head
                                        local v2459 = v2457:FindFirstChild("Face")
                                        if v2459 then
                                            v2452 = v2436.Head
                                            v2459 = v2452.face
                                            v2452 = 1
                                            v2459.Transparency = v2452
                                        end
                                    end
                                end
                            end
                            v2454 = updateEquipmentStuff
                            v2454()
                            return 
                        end
                        local v2461, v2462, v2445 = pairs(v2436:GetChildren())
                        for v2453, v2448 in v2461, v2462, v2445 do
                            local v2464 = v2448:IsA("BasePart")
                            if v2464 then
                                v2464 = v2448.Name
                                if v2464 ~= "HumanoidRootPart" then
                                    v2464 = 0
                                    v2448.Transparency = v2464
                                end
                            end
                        end
                        v2461 = v2436.Head
                        v2445 = "Face"
                        local v2465 = v2461:FindFirstChild(v2445)
                        if v2465 then
                            v2462 = v2436.Head
                            v2465 = v2462.face
                            v2462 = 0
                            v2465.Transparency = v2462
                        end
                    end
                end
            end)
            local v2469 = v49:WaitForChild("Journal")
            local v2472 = (v2469:WaitForChild("Content")):WaitForChild("Photos")
            local v2476 = (v2469:WaitForChild("Content")):WaitForChild("Overview")
            local function toggleJournal_1(p65, p66, p67)
                if p66 == Enum.UserInputState.Begin then
                    local v2481 = v2469.Visible
                    v2469.Visible = not v2481
                    local v2503 = v2469
                    if not v2503.Visible then
                        local v2483, v2482, v2481 = v2472:GetChildren()
                        for v2480, v2486 in v2483, v2503, v2481 do
                            if v2486:IsA("Frame") then
                                local v2489 = v2486:FindFirstChildOfClass("ViewportFrame")
                                if v2489 then
                                    v2486.staticframe.Visible = true
                                    v2489.Size = UDim2.new(0, 0, 0, 0)
                                    v2489.Parent = v49.Photos
                                end
                            end
                        end
                        return 
                    end
                    v2503 = v2476
                    v2483 = v2503.Name
                    if v2483 == "Photos" then
                        v2503 = v49
                        v2483 = v2503.Photos
                        local v2497, v2482, v2481 = v2483:GetChildren()
                        for v2480, v2486 in v2497, v2503, v2481 do
                            v2489 = UDim2.new
                            v2495 = 1
                            v2496 = 0
                            v2486.Size = v2489(v2495, v2496, 1, 0)
                            v2486.Parent = v2472:FindFirstChild(v2486.Name)
                        end
                    end
                end
            end
            toggleJournal = toggleJournal_1
            toggleJournal_1 = v1.EzUI
            toggleJournal_1:Init()
            local v2514, v2515, v2516 = pairs((v2469:WaitForChild("Navigation")):GetChildren())
            for v2579, v2111 in v2514, v2515, v2516 do
                local v2518 = v2111:IsA("TextButton")
                if v2518 then
                    v2518 = v2111.Activated
                    v2518:Connect(function()
                        local v2523 = v2111
                        local v2525 = (v2469:WaitForChild("Content")):FindFirstChild(v2523.Name)
                        if v2525 then
                            v2525 = v2476
                            if v2525 then
                                v2525 = v2476
                                v2525.Visible = false
                                v2525 = v2469
                                v2523 = v2476
                                v2523 = 170
                                (v2525:WaitForChild("Navigation")):FindFirstChild(v2523.Name).TextColor3 = Color3.fromRGB(170, v2523, 170)
                            end
                            v2530 = v2469
                            v2476 = (v2530:WaitForChild("Content")):FindFirstChild(v2111.Name)
                            v2533 = Color3.fromRGB
                            (v2469:WaitForChild("Navigation")):FindFirstChild(v2111.Name).TextColor3 = v2533(255, 255, 255)
                            local v2574 = v2476
                            if v2574.Name == "Photos" then
                                v2574 = v49
                                local v2546, v2545, v2547 = v2574.Photos:GetChildren()
                                for v2557, v2554 in v2546, v2574, v2547 do
                                    v2554.Size = UDim2.new(1, 0, 1, 0)
                                    v2554.Parent = v2472:FindFirstChild(v2554.Name)
                                end
                            else
                                v2546 = v2472
                                local v2558, v2545, v2547 = v2546:GetChildren()
                                for v2557, v2554 in v2558, v2574, v2547 do
                                    if v2554:IsA("Frame") then
                                        local v2562 = v2554:FindFirstChildOfClass("ViewportFrame")
                                        if v2562 then
                                            v2562.Size = UDim2.new(0, 0, 0, 0)
                                            v2562.Parent = v49.Photos
                                        end
                                    end
                                end
                            end
                            v2558 = v2476
                            v2574 = true
                            v2558.Visible = v2574
                        end
                    end)
                end
            end
            v2514 = 0
            v2515 = nil
            v2516 = nil
            v2579 = {}
            v2111 = {}
            local v2584 = (v2469:WaitForChild("Content")):WaitForChild("Evidence")
            local v2589 = v2584:WaitForChild("GhostCheckboxes")
            local function updateEvidence_1()
                local v2594, v2595, v2596 = pairs(v2589:GetChildren())
                for v2647, v2599 in v2594, v2595, v2596 do
                    local v2600 = v2599:IsA("Frame")
                    v2600 = false
                    local v2601 = v2579
                    local v2602
                    local v2603
                    for v2610, v2608 in v2601, v2602, v2603 do
                        if not table.find(v23.Ghosts[v2599.Name], v2608) then
                            v2600 = true
                        end
                    end
                    v2601 = v2111
                    v2602 = nil
                    v2603 = nil
                    for v2610, v2608 in v2601, v2602, v2603 do
                        v2609 = table.find
                        v2605 = v23
                        v2605 = v2599.Name
                        if v2609(v2605.Ghosts[v2605], v2608) then
                            v2600 = true
                        end
                    end
                    v2603 = "TextLabel"
                    v2602 = string.format
                    v2610 = string.upper
                    v2608 = v2599.Name
                    v2599:WaitForChild(v2603).Text = v2602("<i>%s</i>", v2610(v2608))
                    if v2599:WaitForChild("TextLabel").TextColor3 ~= Color3.fromRGB(208, 176, 94) then
                        v2599:WaitForChild("TextLabel").TextColor3 = Color3.fromRGB(143, 47, 47)
                        v2599:WaitForChild("TextLabel").Text = string.format("<b>%s</b>", string.upper(v2599.Name))
                        if v2599:WaitForChild("TextLabel").TextColor3 ~= Color3.fromRGB(208, 176, 94) then
                            v2599:WaitForChild("TextLabel").TextColor3 = Color3.fromRGB(255, 255, 255)
                        end
                    end
                end
                return 
                if v2600 then
                    if v2600 then
                    end
                end
            end
            local v2660, v2661, v2662 = pairs((v2584:WaitForChild("EvidenceCheckboxes")):GetChildren())
            for v2786, v2665 in v2660, v2661, v2662 do
                local v2666 = v2665:IsA("Frame")
                if v2666 then
                    local v2667 = v2665.TextButton
                    v2666 = v2667.Text
                    v2667 = false
                    v2665:WaitForChild("Box").Activated:Connect(function()
                        (v2665:WaitForChild("Box")):WaitForChild("Selected").Visible = not (v2665:WaitForChild("Box")):WaitForChild("Selected").Visible
                        local v2722 = v2665
                        local v2685 = v2722.Box:FindFirstChild("Selected")
                        if v2685.Visible then
                            if v2667 then
                                v2667 = false
                                v2685 = v2665
                                v2685 = v2666
                                v2685.TextButton.Text = v2685
                                v2685 = v2665
                                v2685 = Color3.fromRGB
                                v2722 = 255
                                v2685.TextButton.TextColor3 = v2685(v2722, 255, 255)
                                table.remove(v2111, table.find(v2111, v2665.Name))
                            end
                        end
                        if v2514 == 3 then
                            local v2698 = (v2665:WaitForChild("Box")):WaitForChild("Selected")
                            if v2698.Visible then
                                v2698 = false
                                (v2515:WaitForChild("Box")):WaitForChild("Selected").Visible = v2698
                                v2698 = v2579
                                table.insert(v2698, v2665.Name)
                                v2691 = v2515
                                table.remove(v2579, table.find(v2579, v2691.Name))
                            else
                                local v2713 = (v2665:WaitForChild("Box")):WaitForChild("Selected")
                                local v2714 = v2713.Visible
                                if v2714 then
                                    v2714 = v2514
                                    v2714 = v2714 + 1
                                    v2514 = v2714
                                    v2713 = v2579
                                    v2714 = table.insert
                                    v2714(v2713, v2665.Name)
                                else
                                    local v2717 = v2514
                                    v2717 = v2717 - 1
                                    v2514 = v2717
                                    v2715 = v2579
                                    v2691 = v2665
                                    table.remove(v2579, table.find(v2715, v2691.Name))
                                end
                            end
                            v2515 = v2665
                            updateEvidence_1()
                            return 
                        end
                    end)
                    v2665.TextButton.Activated:Connect(function()
                        local v2740 = v2667
                        if not v2740 then
                            v2740 = true
                            v2667 = v2740
                            v2740 = v2665.TextButton
                            v2740.Text = "<s>" .. v2666 .. "</s>"
                            v2740 = v2665.TextButton
                            v2740.TextColor3 = Color3.fromRGB(143, 47, 47)
                            v2740 = table.insert
                            v2740(v2111, v2665.Name)
                            local v2748 = v2665
                            local v2750 = v2748.Box:FindFirstChild("Selected")
                            local v2751 = v2750.Visible
                            if v2751 then
                                v2750 = v2665
                                v2751 = v2750.Box
                                v2748 = "Selected"
                                v2750 = false
                                v2751:FindFirstChild(v2748).Visible = v2750
                                v2514 = v2514 - 1
                                v2750 = v2579
                                table.remove(v2750, table.find(v2579, v2665.Name))
                                v2667 = false
                                v2665.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                v2665.TextButton.Text = v2666
                                table.remove(v2111, table.find(v2111, v2665.Name))
                            end
                            updateEvidence_1()
                            return 
                        end
                    end)
                end
            end
            v2660 = pairs
            local v2787, v2788, v2662 = v2660(v2589:GetChildren())
            for v2786, v2665 in v2787, v2788, v2662 do
                local v2790 = v2665:IsA("Frame")
                if v2790 then
                    v2670 = "Box"
                    v2790 = v2665:WaitForChild(v2670).Activated
                    v2790:Connect(function()
                        local v2802 = (v2665:WaitForChild("Box")):WaitForChild("Selected")
                        local v2803 = v2802.Visible
                        local v2804 = not v2803
                        (v2665:WaitForChild("Box")):WaitForChild("Selected").Visible = v2804
                        if v2516 then
                            v2803 = "Box"
                            v2804 = false
                            (v2516:WaitForChild(v2803)):WaitForChild("Selected").Visible = v2804
                            v2804 = v2516
                            v2802 = "TextLabel"
                            local v2808 = v2804:WaitForChild(v2802)
                            local v2810 = v2808.Text:match("<i>")
                            if not v2810 then
                                v2810 = v2516
                                v2808 = Color3.fromRGB
                                v2810:WaitForChild("TextLabel").TextColor3 = v2808(255, 255, 255)
                            else
                                v2812 = v2516
                                v2816 = Color3.fromRGB
                                v2812:WaitForChild("TextLabel").TextColor3 = v2816(143, 47, 47)
                            end
                        end
                        v2822 = v2665
                        local v2826 = (v2822:WaitForChild("Box")):WaitForChild("Selected")
                        v2818 = v2826.Visible
                        if v2818 then
                            v2818 = v2665
                            v2516 = v2818
                            v2818 = v2516
                            v2826 = Color3.fromRGB
                            v2818:WaitForChild("TextLabel").TextColor3 = v2826(208, 176, 94)
                            v22.ReplicatedStorage.Events.Guess:FireServer(v2516.Name)
                            return 
                        end
                        v2516 = nil
                    end)
                end
            end
            v2662 = "Content"
            local v2845 = (v2469:WaitForChild(v2662)):WaitForChild("Overview")
            v2786 = "Tools"
            local v2846 = v2845:WaitForChild(v2786)
            v2665 = "Overview"
            local v2850 = (v2845:WaitForChild(v2665)):WaitForChild("Tools")
            local v2851
            local v2854, v2855, v2791 = pairs(v2850:GetChildren())
            for v2875, v2858 in v2854, v2855, v2791 do
                local v2859 = v2858:IsA("TextButton")
                if v2859 then
                    v2859 = v2858.Activated
                    v2859:Connect(function()
                        local v2868 = false
                        v2850.Parent.Visible = v2868
                        if v2851 then
                            v2868 = false
                            v2851.Visible = v2868
                        end
                        v2851 = v2846:FindFirstChild(v2858.Name)
                        if v2851 then
                            v2868 = true
                            v2851.Visible = v2868
                        else
                            v2868 = "Invalid tool, cannot find page"
                            warn(v2868)
                        end
                        v2846.Visible = true
                    end)
                end
            end
            v2875 = "Back"
            v2854 = v2846:WaitForChild(v2875).Activated
            v2791 = function()
                v2846.Visible = false
                v2850.Parent.Visible = true
            end
            v2854:Connect(v2791)
            v2858 = v1.Services
            v2858.ReplicatedStorage.Events.ReceivePhoto.OnClientEvent:Connect(function(p68, p69, p70)
                if p69 then
                    local v2889 = p69.Humanoid.Animator:LoadAnimation(p69.AnimSaves.HuntMove)
                    v2889:Play()
                    v2889:AdjustSpeed(0)
                    v2889.TimePosition = p70
                end
            end)
            local v2896 = (v2469:WaitForChild("Content")):WaitForChild("Ghosts")
            local v2897 = v2896:WaitForChild("Buttons")
            v2858 = "Ghosts"
            local v2899 = v2896:WaitForChild(v2858)
            local v2900
            local v2903, v2904, v2905 = pairs(v2897:GetChildren())
            for v2924, v2908 in v2903, v2904, v2905 do
                local v2909 = v2908:IsA("TextButton")
                if v2909 then
                    v2909 = v2908.Activated
                    v2909:Connect(function()
                        local v2912 = false
                        v2897.Visible = v2912
                        if v2900 then
                            v2912 = false
                            v2900.Visible = v2912
                        end
                        v2900 = v2899:FindFirstChild(v2908.Name)
                        if v2900 then
                            v2912 = true
                            v2900.Visible = v2912
                        else
                            v2912 = "Invalid ghost, cannot find page"
                            warn(v2912)
                        end
                        v2899.Visible = true
                    end)
                end
            end
            v2924 = "Back"
            v2903 = v2899:WaitForChild(v2924).Activated
            v2905 = function()
                v2899.Visible = false
                v2897.Visible = true
            end
            v2903:Connect(v2905)
            v2908 = game
            v2908.ReplicatedStorage.Events.See.OnClientEvent:Connect(function()
                local v2935 = v18:GetAttribute("see_hunt")
                if v2935 then
                    v2935 = Instance.new
                    local v2939 = v2935("Highlight", workspace.Ghost)
                    v2939.FillTransparency = 0.5
                    v2939.OutlineTransparency = 0
                    v2939.Name = "Highlight"
                end
            end)
            v1.Services.ReplicatedStorage.Events:WaitForChild("SpiritBox").OnClientEvent:Connect(function(p71, p72)
                if p71 then
                    if p72 then
                        v22.TextChatService:WaitForChild("TextChannels").RBXSystem:DisplaySystemMessage(string.format("<font color='#aa0000'>%s</font>", p72))
                        local v2955 = p71.PrimaryPart:FindFirstChild("Template")
                        if v2955 then
                            local v2957 = v2955:Clone()
                            v2957.Parent = p71.PrimaryPart
                            v2957.Enabled = true
                            v2957.Name = p72
                            v2957.Message.Text = p72
                            (game.TweenService:Create(v2957, TweenInfo.new(5), {
                                Size = UDim2.new(3, 0, 0.5, 0), StudsOffset = Vector3.new(0, 1.5, 0)
                            })):Play()
                            task.delay(6, function()
                                v2957:Destroy()
                            end)
                        end
                    end
                end
            end)
            game.ReplicatedStorage.Events:WaitForChild("Fortune").OnClientEvent:Connect(function(p73)
                v22.TextChatService:WaitForChild("TextChannels").RBXSystem:DisplaySystemMessage('<font color="rgb(85, 255, 127)">' .. p73 .. "</font>")
            end)
            if v18:GetAttribute("Device") == "Console" then
                task.spawn(function()
                    while true do
                        task.wait()
                        local v3017 = v18:GetAttribute("Dead")
                        if not v3017 then
                            v3017 = workspace
                            local v3018 = v18
                            local v3020 = v3017:FindFirstChild(v3018.Name)
                            local v3021
                            if v3020 then
                                v3021 = v3020:FindFirstChild("HumanoidRootPart")
                            end
                            v3024 = workspace.Map
                            local v3026 = v3024:FindFirstChild("Ouija Board")
                            local v3097 = false
                            if v3026 then
                                if v3026.PrimaryPart then
                                    local v3029 = v3026:GetAttribute("Active")
                                    if v3029 then
                                        if v3021 then
                                            v3029 = v3021.Position - v3026.PrimaryPart.Position.Magnitude
                                            if 15 >= v3029 then
                                                v3097 = true
                                            end
                                        end
                                    end
                                end
                            end
                            v3033 = workspace
                            v3029 = v3033.Equipment
                            local v3034, v3033, v3030 = v3029:GetChildren()
                            for v3032, v3031 in v3034, v3033, v3030 do
                                if v3031.Name == "Spirit Box" then
                                    local v3117 = v3031.PrimaryPart
                                    local v3038 = v3031:GetAttribute("On")
                                    if v3038 then
                                        if v3117 then
                                            if v3021 then
                                                v3038 = v3021.Position - v3117.Position.Magnitude
                                                if 15 >= v3038 then
                                                    v3018 = true
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            v3033 = game
                            v3034 = v3033.Players
                            local v3042, v3033, v3030 = v3034:GetPlayers()
                            for v3032, v3031 in v3042, v3033, v3030 do
                                v3041 = "Dead"
                                local v3043 = v3031:GetAttribute(v3041)
                                if not v3043 then
                                    v3043 = workspace
                                    local v3045 = v3043:FindFirstChild(v3031.Name)
                                    if v3045 then
                                        v3039 = "Tool"
                                        local v3046 = v3045:FindFirstChild(v3039)
                                        if v3046 then
                                            v3040 = "Item"
                                            if v3031:GetAttribute(v3040) == "Spirit Box" then
                                                local v3050 = v3046:GetAttribute("On")
                                                if v3050 then
                                                    if v3021 then
                                                        v3050 = v3045.HumanoidRootPart.Position - v3021.Position.Magnitude
                                                        if 15 >= v3050 then
                                                            v3018 = true
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            v3033 = v41
                            v3030 = v34
                            v3042 = v3033[v3030]
                            if v3042 == "Spirit Box" then
                                if v3020 then
                                    v3030 = "Tool"
                                    local v3054 = v3020:FindFirstChild(v3030)
                                    if v3054 then
                                        v3054 = v3020.Tool
                                        if v3054:GetAttribute("On") then
                                            v3097 = true
                                        end
                                    end
                                end
                            end
                            v3056 = v18
                            v3032 = v3097
                            v3056:SetAttribute("Radial", v3032)
                        end
                        v3020 = workspace
                        v3026 = "Ghost"
                        local v3058 = v3020:FindFirstChild(v3026)
                        if v3058 then
                            v3018 = "Ghost"
                            if v3058:GetAttribute(v3018) == 1 then
                                v3058 = v3058:WaitForChild("Base")
                                v3033 = "Bone"
                                v3058:WaitForChild("1").CFrame = (v3058:WaitForChild(v3033)):WaitForChild("Bone.001").TransformedWorldCFrame
                                v3058:WaitForChild("25").CFrame = ((v3058.Bone["Bone.001"]:WaitForChild("Bone.023")):WaitForChild("Bone.024")):WaitForChild("Bone.025").TransformedWorldCFrame
                                v3058:WaitForChild("26").CFrame = v3058.Bone["Bone.001"]["Bone.023"]["Bone.024"]["Bone.025"]:WaitForChild("Bone.026").TransformedWorldCFrame
                                v3058:WaitForChild("8").CFrame = ((v3058.Bone["Bone.001"]:WaitForChild("Bone.006")):WaitForChild("Bone.007")):WaitForChild("Bone.008").TransformedWorldCFrame
                                v3058:WaitForChild("9").CFrame = v3058.Bone["Bone.001"]["Bone.006"]["Bone.007"]["Bone.008"]:WaitForChild("Bone.009").TransformedWorldCFrame
                            end
                        end
                    end
                end)
            end
            task.spawn(function()
                while true do
                    task.wait()
                    if not v18.Character then
                        break
                    end
                end
                v3121 = v22.RunService
                v3122 = v3121.RenderStepped
                v3122:Connect(function(p51)
                    v1322.Icon = "rbxassetid://6110948325"
                    v52.Adornee = nil
                    v52.User.Text = ""
                    local v1698 = v1322
                    if v1698.Target then
                        v1698 = v22
                        local v1389 = v1322.Target
                        local v1391 = v1698.Players:GetPlayerFromCharacter(v1389.Parent)
                        if v1391 then
                            v1389 = "Dead"
                            local v1392 = v1391:GetAttribute(v1389)
                            if not v1392 then
                                local v1394 = v1322.Target
                                v1392 = v1394.Parent
                                local v1395 = v1392:FindFirstChild("HumanoidRootPart")
                                if v1395 then
                                    v1394 = v52
                                    v1394.Adornee = v1395
                                    v1394 = v52.User
                                    v1394.Text = v1391.Name
                                end
                            end
                        end
                    end
                    v1391 = workspace
                    v1396 = v18
                    v1394 = v1396.Name
                    local v1397 = v1391:FindFirstChild(v1394)
                    if v1397 then
                        v1396 = "Humanoid"
                        local v1398 = v1397:FindFirstChild(v1396)
                        local v1399 = v1320
                        if not v1399 then
                            v1399 = (v1397:WaitForChild("RightUpperArm")):WaitForChild("RightShoulder").C0
                            v1320 = v1399
                        end
                        local v1405 = tick()
                        v1388 = math.cos
                        v1404 = (v1388((v1405) * 1)) * 0.2
                        local v1410 = math.sin((v1405) * 1)
                        local v1703 = (v1410) * 0.2
                        if v1398 then
                            v1410 = v18
                            local v1412 = v1410:GetAttribute("Sprinting")
                            if v1412 then
                                v1412 = game.TweenService
                                (v1412:Create(v1398, TweenInfo.new(0.5), {
                                    CameraOffset = Vector3.new(0, 0.25, -1)
                                })):Play()
                            else
                                v1413 = game
                                v1423 = Vector3.new
                                (v1413.TweenService:Create(v1398, TweenInfo.new(0.5), {
                                    CameraOffset = v1423(0, -0.25, -1)
                                })):Play()
                            end
                        end
                        v1413 = v41
                        local v1437 = v1413[v34]
                        v1413 = pairs
                        local v1438, v1439, v1440 = v1413(v1397:GetChildren())
                        for v1454, v1434 in v1438, v1439, v1440 do
                            local v1443 = v1434:IsA("Model")
                            if v1437 ~= "Ghost Goggles" then
                                v1443 = pairs
                                local v1445, v1446, v1447 = v1443(v1434:GetChildren())
                                for v1452, v1450 in v1445, v1446, v1447 do
                                    local v1451 = v1450:IsA("BasePart")
                                    if v1451 then
                                        v1451 = v1450.Transparency
                                        if v1451 ~= 1 then
                                            v1451 = 0
                                            v1450.Transparency = v1451
                                            v1451 = 0
                                            v1450.LocalTransparencyModifier = v1451
                                        end
                                    end
                                end
                                v1447 = "BasePart"
                                local v1453 = v1434:IsA(v1447)
                                if v1453 then
                                    v1453 = v1434.Name
                                    if v1453 ~= "Head" then
                                        v1453 = 0
                                        v1434.LocalTransparencyModifier = v1453
                                    end
                                end
                            end
                        end
                        v1438 = v1352
                        if v1443 then
                            v1438 = v1438 + 1
                            v1352 = v1438
                            v1439 = 5
                            v1434 = v1352
                            v1454 = math.rad
                            v1440 = math.cos
                            v1438 = (v1439) * v1440(v1454(v1434))
                            v1453 = v1352
                            v1439 = (5) * math.sin(math.rad(v1453))
                            if v1397 then
                                break
                            end
                            if v1384 then
                                break
                            end
                            local v1462 = v1397:FindFirstChild("Head")
                            if v1462 then
                                break
                            end
                            v1462 = v1384
                            v1446 = v1438
                            v1452 = v1439
                            local v1466 = Vector3.new(v1446, 0, v1452)
                            v1462.CFrame = v1397.Head.CFrame + v1466
                            if 20 > v18:GetAttribute("Sanity") then
                                v1466 = 0.025
                                v1466 = v18
                                v1384.Whispers.Volume = ((v1466) * v18:GetAttribute("MasterVolume")) * v1466:GetAttribute("GhostVolume")
                            end
                            v1471 = "Ghost"
                            local v1474 = workspace:FindFirstChild(v1471)
                            if v1474 then
                                v1470 = "Base"
                                local v1476 = v1474:WaitForChild(v1470)
                                if v1476.Transparency == 0 then
                                    v1473 = "Head"
                                    local v1477 = v1397:FindFirstChild(v1473)
                                    if v1477 then
                                        v1476 = v1397.Head.CFrame.LookVector
                                        v1451 = "Base"
                                        v1450 = v1397.Head
                                        local v1714 = v1474:WaitForChild(v1451).Position - v1450.Position.Unit
                                        v1450 = -1
                                        local v1487 = math.acos(math.clamp(v1476:Dot(v1714), v1450, 1))
                                        v1477 = v1487
                                        v1476 = 0.78539816339745
                                        if v1476 > v1477 then
                                            v1477 = RaycastParams.new
                                            local v1488 = v1477()
                                            v1476 = Enum.RaycastFilterType.Exclude
                                            v1488.FilterType = v1476
                                            v1476 = {}
                                            v1487 = workspace.Map
                                            v1714 = v1487.Blockers
                                            v1487 = workspace.Equipment
                                            local v1490 = workspace
                                            local v1491 = v1490.Map
                                            v1476[1] = v1714
                                            v1476[2] = v1487
                                            v1476[3] = v1397
                                            v1476[4] = v1491.Nodes
                                            local v1719 = workspace
                                            v1487 = v1719.Map
                                            v1714 = v1487.Rooms
                                            local v1493, v1487, v1489 = v1714:GetChildren()
                                            for v1492, v1491 in v1493, v1487, v1719 do
                                                v1490 = table.insert
                                                v1490(v1476, v1491.Hitbox)
                                            end
                                            v1493 = workspace
                                            local v1496, v1487, v1489 = v1493:GetChildren()
                                            for v1492, v1491 in v1496, v1487, v1719 do
                                                local v1499 = v1491.Name:match("emfpart")
                                                if v1499 then
                                                    v1499 = table.insert
                                                    v1499(v1476, v1491)
                                                end
                                            end
                                            v1488.FilterDescendantsInstances = v1476
                                            v1496 = true
                                            v1488.IgnoreWater = v1496
                                            v1496 = workspace
                                            v1719 = v1397.Head.Position
                                            local v1503 = v1474.HumanoidRootPart.Position
                                            local v1504 = v1397.Head
                                            local v1721 = v1504.Position
                                            local v1505 = v1503 - v1721
                                            local v1506 = v1496:Raycast(v1719, (v1505.Unit) * 60, v1488)
                                            if v1506 then
                                                v1487 = v1506.Instance
                                                if v1487 then
                                                    local v1507 = v1506.Instance
                                                    local v1508 = v1507.Parent
                                                    v1487 = v1508.Name
                                                    if v1487 ~= "Ghost" then
                                                        v1487 = script
                                                        v1507 = "Draining"
                                                        v1487:SetAttribute(v1507, false)
                                                    else
                                                        local v1512 = v18:GetAttribute("Dead")
                                                        if not v1512 then
                                                            v1512 = script
                                                            v1512:SetAttribute("Draining", true)
                                                            script:SetAttribute("Draining", false)
                                                            v1488 = script
                                                            v1506 = "Draining"
                                                            v1488:SetAttribute(v1506, false)
                                                            script:SetAttribute("Draining", false)
                                                        end
                                                    end
                                                    if v1397 then
                                                        local v1524 = v1397:FindFirstChild("Head")
                                                        local v1526 = v1397:FindFirstChild("RightUpperArm")
                                                        if v1526 then
                                                            if v1524 then
                                                                v1508 = "RightShoulder"
                                                                local v1529 = v1526:FindFirstChild(v1508, true)
                                                                local v1533 = v1524:FindFirstChild("Neck", true)
                                                                if v1529 then
                                                                    if v1533 then
                                                                        v1503 = "HumanoidRootPart"
                                                                        local v1535 = v1397:WaitForChild(v1503)
                                                                        v1721 = workspace
                                                                        local v1537 = v1721.CurrentCamera
                                                                        v1505 = v1537.CFrame
                                                                        local v1538 = v1535.CFrame:ToObjectSpace(v1505)
                                                                        local v1539 = v1538.LookVector
                                                                        if v1529 then
                                                                            if v1533 then
                                                                                if v1437 ~= "Flashlight" then
                                                                                    if v1437 == "Camera" then
                                                                                        v1721 = v1529.C0
                                                                                        v1537 = v1721.X
                                                                                        v1504 = v1529.C0
                                                                                        v1721 = v1504.Y
                                                                                        v1504 = 0
                                                                                        v1535 = (CFrame.new(v1537, v1721, v1504)) * CFrame.Angles(0, -math.asin(v1539.X), 0)
                                                                                        v1538 = (v1535) * CFrame.Angles(math.asin(v1539.Y), 0, 0)
                                                                                        v1535 = v1317
                                                                                        if v1535 then
                                                                                            v1535 = v1317
                                                                                            v1317 = v1535:Lerp(v1538, 0.25)
                                                                                        else
                                                                                            v1317 = v1538
                                                                                        end
                                                                                        v1556 = v1317
                                                                                        v1529.C0 = v1556
                                                                                        v1556 = ((CFrame.new(0, v1533.C0.Y, 0)) * CFrame.Angles(0, -math.asin(v1539.X), 0)) * CFrame.Angles(math.asin(v1539.Y), 0, 0)
                                                                                        v1318 = v1556
                                                                                    else
                                                                                        v1538 = v1320
                                                                                        v1529.C0 = v1538
                                                                                        v1553 = CFrame.new
                                                                                        v1573 = 0
                                                                                        v1556 = (v1553(v1573, v1533.C0.Y, 0)) * CFrame.Angles(0, -math.asin(v1539.X), 0)
                                                                                        v1538 = (v1556) * CFrame.Angles(math.asin(v1539.Y), 0, 0)
                                                                                        v1318 = v1538
                                                                                    end
                                                                                    if v1437 then
                                                                                        if v1437 ~= "" then
                                                                                            v1529 = game
                                                                                            v1526 = v1529.ReplicatedStorage
                                                                                            v1524 = v1526.Equipment
                                                                                            v1529 = v1437
                                                                                            local v1589 = v1524:FindFirstChild(v1529)
                                                                                            if v1589 then
                                                                                                v1533 = "Tool"
                                                                                                local v1590 = v1397:FindFirstChild(v1533)
                                                                                                v1539 = "Placed"
                                                                                                local v1592 = v1589:GetAttribute(v1539)
                                                                                                if v1592 then
                                                                                                    if v1397 then
                                                                                                        if v1590 then
                                                                                                            v1592 = castRay
                                                                                                            local v1593, v1594, v1595 = v1592()
                                                                                                            if v1594 then
                                                                                                                v1538 = nil
                                                                                                                v1556 = v19
                                                                                                                local v1597 = v1556:FindFirstChild("ViewModel")
                                                                                                                if v1597 then
                                                                                                                    v1597 = v19
                                                                                                                    if (v1597:FindFirstChild("ViewModel")):GetAttribute("ModelName") == v1437 then
                                                                                                                        v1538 = v19:FindFirstChild("ViewModel")
                                                                                                                        local v1605 = v19:FindFirstChild("ViewModel")
                                                                                                                        if v1605 then
                                                                                                                            v1605 = v19
                                                                                                                            if (v1605:FindFirstChild("ViewModel")):GetAttribute("ModelName") ~= v1437 then
                                                                                                                                local v1610, v1588, v1611 = v19:GetChildren()
                                                                                                                                for v1616, v1613 in v1610, v1588, v1611 do
                                                                                                                                    if v1613.Name == "ViewModel" then
                                                                                                                                        v1613:Destroy()
                                                                                                                                        print("Destroy")
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                        v1538 = v1590:Clone()
                                                                                                                        v1616 = v1397.HumanoidRootPart
                                                                                                                        v1611 = v1616.CFrame
                                                                                                                        v1538:PivotTo(v1611)
                                                                                                                        v1588 = v22
                                                                                                                        v1616 = "ActiveCamera"
                                                                                                                        v1588.CollectionService:RemoveTag(v1538.Main, v1616)
                                                                                                                        local v1621, v1622, v1623 = pairs(v1538:GetChildren())
                                                                                                                        for v1643, v1613 in v1621, v1622, v1623 do
                                                                                                                            local v1626 = v1613:IsA("BasePart")
                                                                                                                            v1626 = v1613.Transparency
                                                                                                                            if v1626 ~= 1 then
                                                                                                                                v1626 = 0.15
                                                                                                                                v1613.Transparency = v1626
                                                                                                                                v1626 = Color3.fromRGB
                                                                                                                                v1613.Color = v1626(0, 170, 0)
                                                                                                                                v1613.Anchored = true
                                                                                                                            else
                                                                                                                                local v1632 = v1613:IsA("BasePart")
                                                                                                                                if v1632 then
                                                                                                                                    v1632 = false
                                                                                                                                    v1613.CanCollide = v1632
                                                                                                                                    v1632 = true
                                                                                                                                    v1613.Anchored = v1632
                                                                                                                                end
                                                                                                                            end
                                                                                                                            local v1633, v1634, v1635 = v1613:GetChildren()
                                                                                                                            for v1642, v1638 in v1633, v1634, v1635 do
                                                                                                                                local v1639 = v1638:IsA("Motor6D")
                                                                                                                                if v1638:IsA("WeldConstraint") then
                                                                                                                                    v1638:Destroy()
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                        v1621 = v19
                                                                                                                        if v1626 then
                                                                                                                            v1538.Parent = v1621
                                                                                                                            v1621 = "ViewModel"
                                                                                                                            v1538.Name = v1621
                                                                                                                            v1623 = "ModelName"
                                                                                                                            v1643 = v1437
                                                                                                                            if not v1639 then
                                                                                                                                v1538:SetAttribute(v1623, v1643)
                                                                                                                                v1622 = v1538.PrimaryPart
                                                                                                                                local v1645, v1646, v1647 = pairs(v1622:GetChildren())
                                                                                                                                for v1649, v1613 in v1645, v1646, v1647 do
                                                                                                                                    v1635 = "ProximityPrompt"
                                                                                                                                    local v1648 = v1613:IsA(v1635)
                                                                                                                                    if v1648 then
                                                                                                                                        v1648 = false
                                                                                                                                        v1613.Enabled = v1648
                                                                                                                                    end
                                                                                                                                end
                                                                                                                                if v1538 then
                                                                                                                                    local v1650, v1646 = v1538:GetBoundingBox()
                                                                                                                                    v1647 = Color3.fromRGB
                                                                                                                                    v1649 = 0
                                                                                                                                    v1613 = 170
                                                                                                                                    v1648 = 0
                                                                                                                                    local v1651 = v1647(v1649, v1613, v1648)
                                                                                                                                    local v1653 = CFrame.new()
                                                                                                                                    local v1654 = workspace
                                                                                                                                    v1634 = v1654.Van
                                                                                                                                    local v1656 = v1593:IsDescendantOf(v1634)
                                                                                                                                    if not v1656 then
                                                                                                                                        v1654 = v1397.HumanoidRootPart
                                                                                                                                        local v1657 = v1654.Position
                                                                                                                                        v1642 = v1538.PrimaryPart
                                                                                                                                        v1654 = v1642.Position
                                                                                                                                        v1656 = v1657 - v1654.Magnitude
                                                                                                                                        if v1656 >= 8 then
                                                                                                                                            v1656 = Color3.fromRGB
                                                                                                                                            v1657 = 0
                                                                                                                                            v1654 = 0
                                                                                                                                            v1651 = v1656(170, v1657, v1654)
                                                                                                                                        end
                                                                                                                                        v1659 = pairs
                                                                                                                                        local v1661, v1662, v1663 = v1659(v1538:GetChildren())
                                                                                                                                        for v1666, v1642 in v1661, v1662, v1663 do
                                                                                                                                            if v1642:IsA("BasePart") then
                                                                                                                                                v1642.Color = v1651
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                        v1663 = "HumanoidRootPart"
                                                                                                                                        local v1667 = v1397:FindFirstChild(v1663)
                                                                                                                                        if v1667 then
                                                                                                                                            v1667 = CFrame.new
                                                                                                                                            v1642 = "PlaceOffset"
                                                                                                                                            v1662 = v1594 + v1589:GetAttribute(v1642)
                                                                                                                                            if not v1662 then
                                                                                                                                                v1662 = Vector3.new
                                                                                                                                                local v1670 = v1662()
                                                                                                                                            end
                                                                                                                                            v1665 = v1397:FindFirstChild("HumanoidRootPart").Orientation
                                                                                                                                            v1666 = math.rad
                                                                                                                                            v1653 = (v1667(v1670)) * CFrame.Angles(0, v1666(v1665.Y), 0)
                                                                                                                                        end
                                                                                                                                        if v1437 == "Motion Sensor" then
                                                                                                                                            v1671 = CFrame.new
                                                                                                                                            v1679 = v1594 + v1589:GetAttribute("PlaceOffset")
                                                                                                                                            if not v1679 then
                                                                                                                                                v1679 = Vector3.new
                                                                                                                                                local v1683 = v1679()
                                                                                                                                            end
                                                                                                                                            v1653 = (v1671(v1683, v1594 + v1595)) * CFrame.Angles(-1.5707963267949, 3.1415926535898, 0)
                                                                                                                                        end
                                                                                                                                        if v1653 then
                                                                                                                                            v1538:PivotTo(v1653)
                                                                                                                                            return 
                                                                                                                                            v1593 = cleanupPlacing
                                                                                                                                            v1593()
                                                                                                                                            return 
                                                                                                                                            cleanupPlacing()
                                                                                                                                            return 
                                                                                                                                            cleanupPlacing()
                                                                                                                                            return 
                                                                                                                                            v1590 = cleanupPlacing
                                                                                                                                            v1590()
                                                                                                                                            return 
                                                                                                                                            v1589 = cleanupPlacing
                                                                                                                                            v1589()
                                                                                                                                        end
                                                                                                                                        return 
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
                v3121 = v22.RunService
                v3121.Heartbeat:Connect(function()
                    if tick() >= v1763 then
                        local v1812 = (math.random(1, 10)) / 30
                        v1763 = tick() + v1812
                        local v1813, v1814, v1812 = pairs(v1771)
                        for v1811, v1821 in v1813, v1814, v1812 do
                            local v1819 = (math.random(1, 10)) / 10
                            local v1822, v1823, v1824 = pairs(v1821:GetChildren())
                            for v1828, v1826 in v1822, v1823, v1824 do
                                local v1827 = v1826.SpotLight.Enabled
                                if not v1827 then
                                    return 
                                end
                                v1827 = v1826.SpotLight
                                v1827.Brightness = v1819
                                v1826.Transparency = v1819
                            end
                        end
                    end
                end)
            end)
            local v3128 = v22.ReplicatedStorage
            local v3131 = v3128.Events.RetrieveNotes:InvokeServer()
            v2908 = "Map"
            local v3135, v3128, v3136 = ((workspace:WaitForChild(v2908)):WaitForChild("Notes")):GetChildren()
            for v3145, v3141 in v3135, v3128, v3136 do
                if table.find(v2897:GetChildren(), v3141:WaitForChild("NotePrompt").ObjectText) then
                    v3141:Destroy()
                end
            end
            v3145 = v22.ReplicatedStorage
            v3136 = v3145.Events
            v3128 = v3136.MapJumpscare
            v3135 = v3128.OnClientEvent
            v3136 = function(p77)
                v1.TriggerEvents[p77]()
            end
            v3135:Connect(v3136)
            local v3149 = false
            v3145 = v22.ProximityPromptService
            v3141 = v1.PromptManager.HandlePrompt
            v3145.PromptTriggered:Connect(v3141)
            v3145 = v1.Keybinds
            local v3168 = v3145.Binds
            v3145 = v22.ContextActionService
            v3142 = Enum.KeyCode.One
            v3145:BindAction("Equip", equipTool, false, v3142, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four)
            v22.ContextActionService:BindAction("Sprint", handleSprint, true, Enum[v3168.Sprint.Type][v3168.Sprint.Code], Enum.KeyCode.ButtonL3)
            v22.ContextActionService:BindAction("Drop", dropTool, true, Enum[v3168.Drop.Type][v3168.Drop.Code], Enum.KeyCode.DPadDown)
            v22.ContextActionService:BindAction("Journal", toggleJournal, true, Enum[v3168.Journal.Type][v3168.Journal.Code], Enum.KeyCode.ButtonY)
            v22.ContextActionService:BindAction("Revive", function(p61, p62, p63)
                if p62 == Enum.UserInputState.Begin then
                    local v2070 = v18:GetAttribute("Dead")
                    if v2070 then
                        v2070 = v1.EzFX
                        v2070:LerpBlur(12, 0.3)
                        v22.MarketplaceService:PromptProductPurchase(v18, 1246920063)
                    end
                end
            end, false, Enum[v3168.Revive.Type][v3168.Revive.Code], Enum.KeyCode.ButtonX)
            v22.ContextActionService:BindAction("Headlight", function(p74, p75, p76)
                if p75 == Enum.UserInputState.Begin then
                    for v3008, v3003 in v41, nil, nil do
                        if v3003 == "Flashlight" then
                            (v22.ReplicatedStorage.Events:WaitForChild("ToggleHeadlight")):FireServer()
                            return 
                        end
                    end
                end
            end, true, Enum[v3168.Headlight.Type][v3168.Headlight.Code], Enum.KeyCode.ButtonB)
            v22.ContextActionService:BindAction("Switch", dpad, false, Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight)
            v22.ContextActionService:BindAction("Waypoint", function(p78, p79, p80)
                if p79 == Enum.UserInputState.Begin then
                    if v3149 then
                        return 
                    end
                    v3149 = true
                    local v3164
                    local v3152
                    local v3153 = v22
                    local v3155 = v3153.GuiService:IsTenFootInterface()
                    if not v3155 then
                        local v3156 = v22
                        v3153 = v3156.UserInputService
                        v3155 = v3153.GamepadEnabled
                        if v3155 then
                            local v3157 = "Console"
                            v3156 = v22
                            v3153 = v3156.UserInputService
                            v3155 = v3153.TouchEnabled
                            if v3155 then
                                v3156 = v22
                                v3153 = v3156.UserInputService
                                v3155 = v3153.KeyboardEnabled
                                if not v3155 then
                                    v3157 = "Mobile"
                                    v3157 = "Desktop"
                                else
                                end
                                if v3157 == "Mobile" then
                                    v3157 = castRay
                                    v3155 = true
                                    local v3158, v3159 = v3157(v3155)
                                    local v3165 = v3158
                                    v3152 = v3159
                                else
                                    v3159 = v1322
                                    v3158 = v3159.Hit
                                    v3152 = v3158.Position
                                end
                                v3156 = v22
                                v3153 = v3156.ReplicatedStorage
                                v3159 = v3153.Events
                                v3158 = v3159.Waypoint
                                v3153 = v3152
                                v3158:FireServer(v3153)
                                v3159 = 0.25
                                task.wait(v3159)
                                v3149 = false
                                return 
                            end
                        end
                    end
                end
            end, true, Enum[v3168.Waypoint.Type][v3168.Waypoint.Code], Enum.KeyCode.DPadUp)
            v22.ContextActionService:SetPosition("Sprint", UDim2.new(1, -140, 1, -85))
            v22.ContextActionService:SetPosition("Drop", UDim2.new(1, -80, 1, -85))
            v22.ContextActionService:SetPosition("Headlight", UDim2.new(1, -80, 1, -145))
            v22.ContextActionService:SetPosition("Journal", UDim2.new(1, -140, 1, -145))
            v22.ContextActionService:SetPosition("ToggleTool", v69)
            v22.ContextActionService:SetPosition("Waypoint", UDim2.new(1, -140, 1, -205))
            v22.ContextActionService:SetPosition("Place", v75)
            v22.ContextActionService:SetImage("Sprint", "rbxassetid://14055955942")
            v22.ContextActionService:SetImage("Journal", "rbxassetid://14055956335")
            v22.ContextActionService:SetImage("Drop", "rbxassetid://14055956661")
            v22.ContextActionService:SetImage("Headlight", "rbxassetid://14055956487")
            v22.ContextActionService:SetImage("Waypoint", "rbxassetid://14055957379")
            v22.ContextActionService:SetImage("ToggleTool", "rbxassetid://14055955684")
            v22.ContextActionService:SetImage("Place", "rbxassetid://14055956137")
            return 
        end
    end
end
