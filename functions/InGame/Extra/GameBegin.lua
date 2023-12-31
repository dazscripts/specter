local info = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

local function NewTween(part)
    if Hunting then
        local tween = TweenService:Create(Char.PrimaryPart, info, {CFrame = part.CFrame})
        tween:Play()
        repeat task.wait() until Hunting == false
    end
    local tween = TweenService:Create(Char.PrimaryPart, info, {CFrame = part.CFrame})
    tween:Play()
end

task.wait(1)

local Camera = WS.CurrentCamera

local VAN_BUTTON = WS.Van.Close
local VAN_KEY = WS.Van.Key

VAN_BUTTON.CFrame = Char.HumanoidRootPart.CFrame * CFrame.new(0,0,-2)

task.wait(1)

Camera.CFrame = CFrame.new(Camera.CFrame.Position, VAN_BUTTON.Position)

task.wait(0.2)

fireproximityprompt(WS.Van.Close.VanPrompt)

task.wait(1)

Char:SetPrimaryPartCFrame(VAN_KEY.CFrame * CFrame.new(0,0,3))

task.wait(1)

Camera.CFrame = CFrame.new(Camera.CFrame.Position, VAN_KEY.Position)

task.wait(1)

fireproximityprompt(VAN_KEY.KeyPrompt)

task.wait(0.1)

local Camera = Workspace.CurrentCamera

repeat
    Char:SetPrimaryPartCFrame(WS.Map.Bone.CFrame)
    
    task.wait(0.2)
    
    for i = 1,5 do
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, WS.Map.Bone.CFrame.Position)
        task.wait(0.2)
    end
    
    fireproximityprompt(WS.Map.Bone.BonePrompt)
    task.wait(0.5)
until not WS.Map:FindFirstChild("Bone")

GetItem("Motion Sensor")
task.wait(0.1)
EquipItem("Motion Sensor")

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/Misc/Evidence.lua"))()

task.wait(2)

Char:SetPrimaryPartCFrame(WS.Ghost.PrimaryPart.CFrame * CFrame.new(0,0,-3))

task.wait(0.05)

PlaceItem("Motion Sensor", true)

task.wait(1)

coroutine.wrap(NewTween)(WS.Map.TouchParts.Inside.Inside)

task.wait(0.5)

NewTween(WS.emfpart2)

EquipItem("Flashlight")
task.wait(0.1)
DropItem("Flashlight")

GetItem("EMF Reader")
GetItem("Spirit Box")
GetItem("Book")

EquipItem("Spirit Box")
task.wait(0.1)
Toggle()
task.wait(0.1)
DropItem("Spirit Box")
task.wait(1)
task.spawn(function()
    GetItem("Thermometer")
    task.wait(0.1)
    EquipItem("Thermometer")
    task.wait(0.1)
    Toggle()
end)

task.wait(1)

--DropItem("Thermometer")


EquipItem("Book")
task.wait(0.1)
PlaceItem("Book",true)



task.wait(1)
GetItem("Crucifix")
task.wait(0.1)
EquipItem("Crucifix")
task.wait(0.1)
DropItem("Crucifix")
--GetItem("Motion Sensor")
--GetItem("Crucifix")
task.wait(0.1)
coroutine.wrap(NewTween)(WS.Map.TouchParts.Inside.Inside)

task.wait(1)

coroutine.wrap(NewTween)(WS.emfpart2)

EquipItem("EMF Reader")
task.wait(0.2)
Toggle()

-- try