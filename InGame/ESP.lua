local doors = workspace.Map.Doors
local closets = workspace.Map.Closets
local equipment = workspace.Equipment

Tabs.Visuals:AddSection("ESP")

local Ghost = Tabs.Visuals:AddToggle("Ghost", {Title = "Ghost ESP", Default = false })

local PlayersT = Tabs.Visuals:AddToggle("Players", {Title = "Players ESP", Default = false })


local Closets = Tabs.Visuals:AddToggle("Closets", {Title = "Closets ESP", Default = false })

local Items = Tabs.Visuals:AddToggle("Items", {Title = "Items ESP", Default = false })

local Interactables = Tabs.Visuals:AddToggle("Interactables", {Title = "Interactables ESP", Default = false })
