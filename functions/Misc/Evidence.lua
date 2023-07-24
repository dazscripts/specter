Evidence = {}

local orbs = WS.Orbs
local fingerprint = WS.Fingerprints

orbs.ChildAdded:Connect(function(child)
    PutEvidence("Orbs")
end)

print("INIT: ORBS")

fingerprint.ChildAdded:Connect(function(child)
    PutEvidence("Fingerprints")
end)

print("INIT: FINGERPRINTS")

local SPIRIT_BOX_RESPONSES = {}

EquipmentPath.ChildAdded:Connect(function(new)
    if new.Name == "Book" then
        local book = EquipmentPath.Book

        local writingEvidence = book:GetAttributeChangedSignal("Written"):Connect(function()
            PutEvidence("Writing")
        end)
    elseif new.Name == "Spirit Box" then
        new.Main.ChildAdded:Connect(function(i)
            if i:FindFirstChild(child.Name) then
                PutEvidence("Spirit Box")
            end
        end)
    end
end)
game:GetService("Workspace").Equipment["Spirit Box"].Main

print("INIT: BOOK, SPIRIT BOX")

WS.ChildAdded:Connect(function(child)
    if child.Name == "emfpart5" then
        EquipItem("EMF Reader")
        local CurrentCFrame = Char.PrimaryPart.CFrame
        task.wait(0.1)
        Char:SetPrimaryPartCFrame(child.CFrame)
        task.wait(0.1)
        Char:SetPrimaryPartCFrame(CurrentCFrame)
        PutEvidence("EMF 5")
    end
end)

print("INIT: EMF")

local breath = Char.Head:WaitForChild("BreathAttachment").Breath

breath:GetPropertyChangedSignal("Enabled"):Connect(function()
    PutEvidence("Freezing Temperature")
end)

print("INIT: FREEZING")

local evidenceModule = require(game:GetService("ReplicatedStorage").Evidences).Ghosts

local function deepCompare(t1, t2)
    local lookup_table = {}
    for i, v in ipairs(t1) do
        lookup_table[v] = true
    end
    for i, v in ipairs(t2) do
        if not lookup_table[v] then return false end
    end
    return true
end

function findMatch(evidence, v2)
    for ghost, evidences in pairs(v2) do
        if deepCompare(evidence, evidences) then
            return ghost
        end
    end
    return nil
end
