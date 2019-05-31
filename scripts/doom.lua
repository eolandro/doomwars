DefineRaceNames(
  "race", {
    "name", "uac",
    "display", "UAC",
    "visible"},
  "race", {
    "name", "hell",
    "display", "Hell",
    "visible"},
  "race", {
    "name", "neutral",
    "display", "Neutral"})

if (OldSetAiType == nil) then
  OldSetAiType = SetAiType
end

function SetAiType(player, ai)
	if (GameSettings.GameType == 104) then
		OldSetAiType(player, ai)
	elseif (ai == "tech-attack") then
		OldSetAiType(player, "complex-attack")
	else
		OldSetAiType(player, ai)
	end
end

if (OldCreateUnit == nil) then
  OldCreateUnit = CreateUnit
end

function CreateUnit(unittype, player, pos)
	if (GameCycle ~= 0 or player == 15) then
		return OldCreateUnit(unittype, player, pos)
	end

	if (Players[player].Type == PlayerNobody) then
		return nil
	end

	return OldCreateUnit(unittype, player, pos)
end

function MapUnitsInit()
	if (GameSettings.GameType>=100 and GameSettings.GameType~=104) then
		for player = 0, PlayerMax - 2 do
			if (GetPlayerData(player, "RaceName") == "uac") and (IsNetworkGame()==true or GameSettings.NetGameType == 2 or mapinfo.playertypes[player+1]~=nil) then
				CreateUnit("unit-command-center", player,{Players[player].StartPos.x, Players[player].StartPos.y})
			elseif (GetPlayerData(player, "RaceName") == "hell") and (IsNetworkGame()==true or GameSettings.NetGameType == 2 or mapinfo.playertypes[player+1]~=nil) then
				CreateUnit("unit-hellkeep", player,{Players[player].StartPos.x, Players[player].StartPos.y})
			end
		end
	end
end

function ForceUMSSettings(ptype, pside, pteams, rescount, difficulty, reveal_type)
    mapinfo.ums.enabled = 1
	mapinfo.ums.ptype = ptype
	mapinfo.ums.pside = pside
	mapinfo.ums.pteams = pteams
	mapinfo.ums.rescount = rescount
	mapinfo.ums.difficulty = difficulty
	mapinfo.ums.reveal_type = reveal_type
end

if (OldSetPlayerData == nil) then
  OldSetPlayerData = SetPlayerData
end

-- Override with game settings
function SetPlayerData(player, data, arg1, arg2)
  if (GameCycle ~= 0 or GameSettings.GameType == 104) then
    return OldSetPlayerData(player, data, arg1, arg2)
  end

  local res = {arg2, arg2, arg2}
  local rnd = {"uac","hell"}

  if (data == "RaceName") then
	  if (GameSettings.Presets[player].Race == 0) then
        arg1 = "uac"
      elseif (GameSettings.Presets[player].Race == 1) then
        arg1 = "hell"
      end
  elseif (data == "Resources") then
    if (GameSettings.Resources == 1) then
      res = {10000, 500}
    elseif (GameSettings.Resources == 2) then
      res = {6000, 250}
    elseif (GameSettings.Resources == 3) then
      res = {2000, 50}
	elseif (GameSettings.Resources == 4) then
      res = {25000, 3000}
    end
    if (arg1 == "minerals") then
      arg2 = res[1]
    elseif (arg1 == "energy") then
      arg2 = res[2]
    end
  end
  
  OldSetPlayerData(player, data, arg1, arg2)
end

if (OldDefinePlayerTypes == nil) then
  OldDefinePlayerTypes = DefinePlayerTypes
end

function DefinePlayerTypes(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p12, p13, p14, p15)
	if (IsNetworkGame()==true or GameSettings.NetGameType == 2 or Editor.Running==4 or currentCampaign ~= nil or GameSettings.GameType == 104) then
		local p = {p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15}
		local foundperson = false
		local nump = GameSettings.Opponents
		if (nump == 0) then nump = 15 end
			for i=1,15 do
				if (p[i] == "person" or p[i] == "computer") then
					if (p[i] == "person" and foundperson == false) then
						foundperson = true
					else
						if (nump == 0) then
							p[i] = "nobody"
						else
							nump = nump - 1
					end
				end
			end
		end
		OldDefinePlayerTypes(p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12], p[13], p[14], p[15])
	else
		local plrsnmb = {nil,nil,nil,nil,nil,nil,nil,nil}
		for i=0,7 do
			if GameSettings.Presets[i].Type == PlayerPerson then
				plrsnmb[i+1]="person"
			elseif GameSettings.Presets[i].Type == PlayerComputer then
				plrsnmb[i+1]="computer"
			elseif GameSettings.Presets[i].Type == PlayerNeutral then
				plrsnmb[i+1]="nobody"
			elseif GameSettings.Presets[i].Type == -1 then
				plrsnmb[i+1]=nil
			end
		end
		OldDefinePlayerTypes(plrsnmb[1], plrsnmb[2], plrsnmb[3], plrsnmb[4], plrsnmb[5], plrsnmb[6], plrsnmb[7], plrsnmb[8])
		mapinfo.playertypes[1] = plrsnmb[1]
		mapinfo.playertypes[2] = plrsnmb[2]
		mapinfo.playertypes[3] = plrsnmb[3]
		mapinfo.playertypes[4] = plrsnmb[4]
		mapinfo.playertypes[5] = plrsnmb[5]
		mapinfo.playertypes[6] = plrsnmb[6]
		mapinfo.playertypes[7] = plrsnmb[7]
		mapinfo.playertypes[8] = plrsnmb[8]
	end
end

drawLevels = {
	DL_NULL = 0,
	DL_OnLand = 5,
	DL_OnLand2 = 7,
	DL_LandUnit = 40,
	DL_OverLandUnit = 42,
	DL_PartGround = 42,
	DL_AirUnit = 45,
	DL_LowMissile = 50,
	DL_LowMissileExp = 51,
	DL_MissileAir = 60,
	DL_MissileAirExp = 61,
	
	DL_PartLow = 55,
	DL_PartHigh = 65,
	DL_MissileSpace = 120,
	DL_Interface = 150,
}
drawLevels = ProtectTable(drawLevels)

marineSpheres = {
	S_Shield = 1,
	S_Life = 2,
	S_Regeneration = 4,
	S_Skull = 8,
	S_AbsoluteDefence = 16,
	S_Acid = 32,
	S_Corruption = 64,
	S_Vampirism = 128,
}
marineSpheres = ProtectTable(marineSpheres)

unitFlagsIndex = {
	UFI_Init = 1,                   -- If unit was initialized
	UFI_UpgradePortal = 2,          -- Unit has researched upgrade portals
	UFI_Raising = 3,                -- Corpse is raising 
	UFI_StartDefibrillation = 4,    -- Defibrillation is started
	UFI_IsInfernoAnomaly = 5,       -- Inferno Anomaly is researched
	UFI_UpgradeZombification = 6,   -- Zombification is researched
	UFI_UpgradeTracer = 7,          -- Tracer is researched
	UFI_RadarEye = 8,               -- Radar eye is researched
	UFI_SuperweaponCharged = 9,     -- Superweapon is charged
	UFI_UpgradeSpeed = 10,          -- Cacodemon upgrade speed
	UFI_UpgradeCacoBall = 11,       -- Cacodemon upgrade cacoball
	UFI_UpgradeAcid = 12,           -- Acidball upgrade
	UFI_KillFromDemon = 13,         -- Flag saying that unit is trying to be eaten by demon
	UFI_ResearchActive = 14,        -- If radar is researching
	UFI_RadarResearch = 15,         -- Radar research upgraded
	UFI_SoulsResearch = 16,         -- Souls research upgraded
}
unitFlagsIndex = ProtectTable(unitFlagsIndex)

unitFlags = {
	UF_Init = 1,                              -- If unit was initialized
	UF_UpgradePortal = 2,                     -- Unit has researched upgrade portals
	UF_Raising = 4,                           -- Corpse is raising 
	UF_StartDefibrillation = 8,               -- Defibrillation is started
	UF_IsInfernoAnomaly = 16,                 -- Inferno Anomaly is researched
	UF_UpgradeZombification = 32,             -- Zombification is researched
	UF_UpgradeTracer = 64,                    -- Tracer is researched
	UF_RadarEye = 128,                        -- Radar eye is researched
	UF_SuperweaponCharged = 256,              -- Superweapon is charged
	UF_UpgradeSpeed = 512,                    -- Cacodemon upgrade speed
	UF_UpgradeCacoBall = 1024,                -- Cacodemon upgrade cacoball
	UF_UpgradeAcid = 2048,                    -- Acidball upgrade
	UF_KillFromDemon = 4096,                  -- Flag saying that unit is trying to be eaten by demon
	UF_ResearchActive = 8192,                 -- If radar is researching
	UF_RadarResearch = 16384,                 -- Radar research upgraded
	UF_SoulsResearch = 32768,                 -- Souls research upgraded
}
unitFlags = ProtectTable(unitFlags)