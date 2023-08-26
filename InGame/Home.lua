Tabs.Home:AddParagraph({
    Title = "Credits",
    Content = "Script made entirely by daz_. on discord!\nUI Library made by 5awid on discord!"
})
Tabs.Home:AddSection("Changelogs")
Tabs.Home:AddParagraph({
    Title = "",
    Content = "Script nearing a public beta release :)"
})
Tabs.Home:AddSection("Info")
Tabs.Home:AddParagraph({
    Title = "MAP: "..rep:GetAttribute("Map"),
    Content = "Difficulty: "..rep:GetAttribute("Difficulty").. " Van: " .. rep:GetAttribute("Van")
})