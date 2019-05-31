local iconlist = ListFilesInDirectory("graphics/ui/icons/")

for i = 1,table.getn(iconlist) do
    local name = string.sub(iconlist[i], 1, string.len(iconlist[i]) - 4)
    icon = CIcon:New(name)
    -- icon.G = CGraphic:New("graphics/ui/icons/" .. iconlist[i], 46, 38)
    icon.G = CPlayerColorGraphic:New("graphics/ui/icons/" .. iconlist[i], 46, 38)
    icon.Frame = 0
end
