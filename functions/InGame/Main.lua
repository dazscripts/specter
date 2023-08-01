Char = plr.Character
Hunting = false

ImportantGUIS = {}

AI_EVIDENCE = {
    ['Freezing Temperature'] = false,
    ['EMF 5'] = "Unknown",
    ['Writing'] = "Unknown",
    ['Fingerprints'] = "Unknown",
    ['Spirit Box'] = false,
    ['Orbs'] = "Unknown",
    ['Motion'] = false,
}


local WaypointRemote = events:WaitForChild("Waypoint")

for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes:GetChildren() do
    if v:IsA("Frame") then
        table.insert(ImportantGUIS, v)
    end
end

for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.GhostCheckboxes:GetChildren() do
    if v:IsA("Frame") then
        table.insert(ImportantGUIS, v)
    end
end

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/GameFunctions.lua"))()

local LightSwitches = WS.Map.Lightswitches:GetChildren()
local LightRemote = events:WaitForChild("Lightswitch")

local function fireLight(v)
    LightRemote:FireServer(v)
end

for _, v in pairs(LightSwitches) do
    v:GetAttributeChangedSignal("On"):Connect(function()
        if v:GetAttribute("On") == true then
            coroutine.wrap(fireLight)(v)
        end
    end)
    rs.RenderStepped:Wait()
    coroutine.wrap(fireLight)(v)
end

local function waypoint()
    WaypointRemote:FireServer(WS.Ghost.HumanoidRootPart.Position)
end

events.Hunt.OnClientEvent:Connect(function()
    Hunting = not Hunting
    
    if Hunting then
        
        repeat 
            rs.RenderStepped:Wait()
            
            coroutine.wrap(waypoint)()
        until (Char.PrimaryPart.Position - WS.Ghost.PrimaryPart.Position).Magnitude < 10 or not Hunting
        
        if not Hunting then return end
        
        repeat 
            Char:SetPrimaryPartCFrame(WS.Ghost.PrimaryPart.CFrame * CFrame.new(0,8,-6)) 
            task.wait() 
        until not Hunting
    else
        task.wait(0.3)
        Char:SetPrimaryPartCFrame(WS.emfpart2.CFrame)
    end
end)

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral

task.spawn(function()
    while true do
        Channel:SendAsync("Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Show us a sign. Can you turn on the lights?")
        task.wait(5)
    end
end)

local waterP = WS.Map.EventObjects.Sinks
local Camera = WS.CurrentCamera

for _, v in pairs(waterP:GetChildren()) do
    v.Running:GetPropertyChangedSignal("Playing"):Connect(function()
        task.wait(20)
        if v.Running == false then return end

        repeat task.wait()
        until Hunting == false
        

        Char:SetPrimaryPartCFrame(v.CFrame * CFrame.new(0,5,0))

        for i = 1,4 do
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, v.Position)
            task.wait(0.1)
        end

        fireproximityprompt(v.ProximityPrompt)

        task.wait(0.3)

        Char:SetPrimaryPartCFrame(WS.emfpart2.CFrame)

    end)
end

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua"))()

task.wait(60 * 3)

if AI_EVIDENCE.Orbs == "Unknown" then AI_EVIDENCE.Orbs = false end

task.wait(60 * 3)

if AI_EVIDENCE.Fingerprints == "Unknown" then AI_EVIDENCE.Fingerprints = false end

task.wait(60 * 3)

if AI_EVIDENCE.Writing == "Unknown" then AI_EVIDENCE.Writing = false end

task.wait(60 * 3)

local ghost = MakeGuess()

if ghost ~= nil then
    for _, v2 in ipairs(ImportantGUIS) do
        if v2.Name == ghost then
            for _, signal in pairs(getconnections(v2.Box.Activated)) do
                signal:Fire()
            end
        end
    end
else
    if AI_EVIDENCE.Freezing == true then
        for _, v2 in ipairs(ImportantGUIS) do
            if v2.Name == "Thaye" then
                for _, signal in pairs(getconnections(v2.Box.Activated)) do
                    signal:Fire()
                end
            end
        end
    end

end



    
local VAN_BUTTON = WS.Van.Close

delay(5, function()
    while true do
        VAN_BUTTON.CFrame = Char.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
        rs.RenderStepped:Wait()
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, VAN_BUTTON.Position)
    end
end)

task.wait(7)

fireproximityprompt(WS.Van.Close.VanPrompt)

