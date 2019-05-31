InitFuncs:add(function()
  speedcheat = false
  godcheat = false
  reveal = false
  fog = false
  debugcheat = false
end)

function HandleCheats(str)
  local resources = { "minerals", "energy"}

  if (str == "idkfa") then
    Players[GetThisPlayer()].Resources[1]=GetPlayerData(GetThisPlayer(), "Resources", "minerals") + 50000
	Players[GetThisPlayer()].Resources[3]=GetPlayerData(GetThisPlayer(), "Resources", "energy") + 50000
	Players[GetThisPlayer()].Resources[4]=GetPlayerData(GetThisPlayer(), "Resources", "hellpower") + 50000
    AddMessage(_("Very Happy RESOURCES Added"))
	
  elseif (str == "idfa") then
	for i=0,7 do 
		Players[i].Resources[1]=GetPlayerData(i, "Resources", "minerals") + 50000
		Players[i].Resources[3]=GetPlayerData(i, "Resources", "energy") + 50000
		Players[i].Resources[4]=GetPlayerData(i, "Resources", "hellpower") + 50000
	end
    AddMessage(_("Very Happy RESOURCES Added NOT ONLY for you!"))

  elseif (str == "iddt") then
	if (fog == false) then
		SetFogOfWar(true)
		RevealMap()
		fog = true
	else
		SetFogOfWar(false)
		fog = false
	end

  elseif (str == "idbeholds") then
    if (speedcheat) then
      speedcheat = false
      for i = 0,PlayerMax - 1 do
		  for j = 1,table.getn(resources) do
			SetPlayerData(i, "SpeedResourcesHarvest", resources[j], GetPlayerData(i, "SpeedResourcesHarvest", resources[j]) / 10)
			SetPlayerData(i, "SpeedResourcesReturn", resources[j], GetPlayerData(i, "SpeedResourcesReturn", resources[j]) / 10)
		  end
		  SetPlayerData(i, "SpeedBuild", GetPlayerData(i, "SpeedBuild") / 10)
		  SetPlayerData(i, "SpeedTrain", GetPlayerData(i, "SpeedTrain") / 10)
		  SetPlayerData(i, "SpeedUpgrade", GetPlayerData(i, "SpeedUpgrade") / 10)
		  SetPlayerData(i, "SpeedResearch", GetPlayerData(i, "SpeedResearch") / 10)
	  end
      AddMessage(_("Berserk disabled!"))
    else
      speedcheat = true
	  for i = 0,PlayerMax - 1 do
		  for j = 1,table.getn(resources) do
			SetPlayerData(i, "SpeedResourcesHarvest", resources[j], GetPlayerData(i, "SpeedResourcesHarvest", resources[j]) * 10)
			SetPlayerData(i, "SpeedResourcesReturn", resources[j], GetPlayerData(i, "SpeedResourcesReturn", resources[j]) * 10)
		  end
		  SetPlayerData(i, "SpeedBuild", GetPlayerData(i, "SpeedBuild") * 10)
		  SetPlayerData(i, "SpeedTrain", GetPlayerData(i, "SpeedTrain") * 10)
		  SetPlayerData(i, "SpeedUpgrade", GetPlayerData(i, "SpeedUpgrade") * 10)
		  SetPlayerData(i, "SpeedResearch", GetPlayerData(i, "SpeedResearch") * 10)
	  end
      AddMessage(_("Berserk enabled!"))
    end

  elseif (str == "idclev") then
    ActionVictory()

  elseif (str == "idkill") then
    ActionDefeat()

  elseif (str == "iddqd") then
    if (godcheat) then
      godcheat = false
      SetGodMode(false)
      AddMessage(_("Degreelessness Mode OFF"))
    else
      godcheat = true
      SetGodMode(true)
      AddMessage(_("Degreelessness Mode ON"))
    end
  elseif (str == "veteran") then
	local t = GetUnitUnderCursor()
	if (t ~= nil) then
     -- SetUnitVariable(UnitNumber(t), "Veterancy", 4, "Value")
	 SetUnitVariable(UnitNumber(t), "Xp", 4000, "Max")
	 SetUnitVariable(UnitNumber(t), "Xp", 4000, "Value")
	end
  elseif (str == "debug") then
    for i=0,7 do 
		Players[i].Resources[1]=GetPlayerData(i, "Resources", "minerals") + 50000
		Players[i].Resources[3]=GetPlayerData(i, "Resources", "energy") + 50000
		Players[i].Resources[4]=GetPlayerData(i, "Resources", "hellpower") + 50000
	end
	if (debugcheat) then
      debugcheat = false
      for i = 0,PlayerMax - 1 do
		  for j = 1,table.getn(resources) do
			SetPlayerData(i, "SpeedResourcesHarvest", resources[j], GetPlayerData(i, "SpeedResourcesHarvest", resources[j]) / 100)
			SetPlayerData(i, "SpeedResourcesReturn", resources[j], GetPlayerData(i, "SpeedResourcesReturn", resources[j]) / 100)
		  end
		  SetPlayerData(i, "SpeedBuild", GetPlayerData(i, "SpeedBuild") / 100)
		  SetPlayerData(i, "SpeedTrain", GetPlayerData(i, "SpeedTrain") / 100)
		  SetPlayerData(i, "SpeedUpgrade", GetPlayerData(i, "SpeedUpgrade") / 100)
		  SetPlayerData(i, "SpeedResearch", GetPlayerData(i, "SpeedResearch") / 100)
	  end
      AddMessage("debug disabled")
    else
      debugcheat = true
	  for i = 0,PlayerMax - 1 do
		  for j = 1,table.getn(resources) do
			SetPlayerData(i, "SpeedResourcesHarvest", resources[j], GetPlayerData(i, "SpeedResourcesHarvest", resources[j]) * 100)
			SetPlayerData(i, "SpeedResourcesReturn", resources[j], GetPlayerData(i, "SpeedResourcesReturn", resources[j]) * 100)
		  end
		  SetPlayerData(i, "SpeedBuild", GetPlayerData(i, "SpeedBuild") * 100)
		  SetPlayerData(i, "SpeedTrain", GetPlayerData(i, "SpeedTrain") * 100)
		  SetPlayerData(i, "SpeedUpgrade", GetPlayerData(i, "SpeedUpgrade") * 100)
		  SetPlayerData(i, "SpeedResearch", GetPlayerData(i, "SpeedResearch") * 100)
	  end
      AddMessage("debug enabled")
	 end
  else
    return false
  end
  return true
end