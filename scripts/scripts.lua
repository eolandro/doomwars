if (GetPlayerData(GetThisPlayer(), "RaceName") == "uac") then
	Load("scripts/uac/ui.lua")
elseif (GetPlayerData(GetThisPlayer(), "RaceName") == "hell") then
	Load("scripts/hell/ui.lua")
end

if (tileset == "uac-base" or tileset == "hell-fortress") then
	GameSettings.Inside = true
end
