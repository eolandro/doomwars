Load("scripts/bit.lua")

InitFuncs = {}
LanguageTable = {}
GraphicsDelayArray = {}
DebugOption = false
function InitFuncs:add(f)
  table.insert(self, f)
end

function InitGameVariables()
  for i=1,table.getn(InitFuncs) do
    InitFuncs[i]()
  end
end

function NewSyncRand(mi, ma)
	return mi + SyncRand(ma - mi + 1)
end

function LuaAddMessage(args)
	print(tostring(args))
end

function DebugOut(args)
	if (DebugOption == true) then
		print(args)
	end
end

function ProtectTable(tbl)
	return setmetatable ({}, 
    {
		__index = tbl,  -- read access gets original table item
		__newindex = function (t, n, v)
		DebugPrint("attempting to change constant " .. 
			tostring (n) .. " to " .. tostring (v), 2)
		end
	})
end

math.randomseed(os.time())

SetTitleScreens(
  {Image = "graphics/ui/logoback.png", Music = "music/start.ogg", Timeout = 20},
  {Image = "graphics/ui/logoback.png", Music = "music/start.ogg", Timeout = 20, Editor = 1}
)

--- Skirmish Setup --------------
sk_ptype = {-1,-1,-1,-1,-1,-1,-1,-1}
sk_pside = {-1,-1,-1,-1,-1,-1,-1,-1}
sk_teams = {-1,-1,-1,-1,-1,-1,-1,-1}
sk_rescount = -1
sk_game_type = -1
sk_difficulty = -1
sk_reveal_type = -1

doom = {}

doom.Name = "Doom Wars: UAC vs. Hell"
doom.Version = "1.3 beta 1"

SetGameName("doom")
SetFullGameName(doom.Name)

SetMenuRace("hell")

SetSelectionStyle("corners")
Preference.ShowSightRange = false
Preference.ShowAttackRange = false
Preference.ShowReactionRange = false
Preference.BigScreen = false
Preference.PauseOnLeave = false
Preference.AiExplores = false

Preference.ShowNameDelay = 30
Preference.ShowNameTime = 60

DefineBoolFlags("lostsoul", "Superweapon", "UAC", "Hell", "BigUnit", "Center",
				"Mechanical", "Dead", "Zombie", "ShowArmor", "organic", "HeavyFlesh", "Minerals",
				"IsResurrectable", "Hero", "Transporter", "Soul",
				"Sawer", "Medic", "PlantValue", "SphereMarine")

-- Armor types
DefineVariables("IsLightArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("IsCombatArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("IsHeavyArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})

DefineVariables("IsFleshArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("IsHeavyFleshArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("IsAirFleshArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})

DefineVariables("IsMechanicalArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("IsAirMechanicalArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})

DefineVariables("IsBuildingArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("IsHeavyBuildingArmor",{Value = 0, Increase = 0, Max = 1, Enable = true})

DefineVariables("IsCursedArmor",{Value = 0, Increase = 0, Max = 1, Enable = false})

-- Currently used weapons damage
DefineVariables("LightArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("CombatArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("FleshArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyFleshArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirFleshArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("MechanicalArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirMechanicalArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("BuildingArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyBuildingArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("CursedArmorDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})

-- Primary weapons
DefineVariables("LightArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("CombatArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("FleshArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyFleshArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirFleshArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("MechanicalArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirMechanicalArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("BuildingArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyBuildingArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("CursedArmorDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})

-- Secondary weapons
DefineVariables("LightArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("CombatArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("FleshArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyFleshArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirFleshArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("MechanicalArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirMechanicalArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("BuildingArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyBuildingArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("CursedArmorDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})

-- Third weapons
DefineVariables("LightArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("CombatArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("FleshArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyFleshArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirFleshArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("MechanicalArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("AirMechanicalArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("BuildingArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyBuildingArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("CursedArmorDamage4",{Value = 0, Increase = 0, Max = 1000, Enable = true})

-- Internal use
DefineVariables("Poison",{Value = 0, Increase = -1, Max = 600, Enable = true})
DefineVariables("ArmorShield",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("Ressurect",{Value = 0, Increase = 0, Max = 16, Enable = false})
DefineVariables("SmokeTime",{Value = 0, Increase = -1, Max = 100, Enable = true})
DefineVariables("SmokeBreak",{Value = 0, Increase = 0, Max = 100, Enable = true})
DefineVariables("SmokeBreak2",{Value = 0, Increase = 0, Max = 100, Enable = true})
DefineVariables("Weapon",{Value = 0, Increase = 0, Max = 8, Enable = false})
DefineVariables("RessurectPlayer",{Value = 0, Increase = 0, Max = 16, Enable = true})
DefineVariables("ProductValue",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("ProductMax",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("SoulHarvesting",{Value = 0, Increase = -1, Max = 12, Enable = true})
DefineVariables("Mines",{Value = 0, Increase = 0, Max = 3, Enable = false})
DefineVariables("Bombs",{Value = 0, Increase = 0, Max = 1, Enable = false})
DefineVariables("DoneDefibrillation",{Value = 0, Increase = 0, Max = 2, Enable = true})
DefineVariables("ToZombifie",{Value = 0, Increase = -1, Max = 4, Enable = false})
DefineVariables("OldMinProduct",{Value = 0, Increase = 0, Max = 1000000, Enable = true})
DefineVariables("OldEngProduct",{Value = 0, Increase = 0, Max = 1000000, Enable = true})
DefineVariables("MinProduct",{Value = 0, Increase = 0, Max = 1000000, Enable = true})
DefineVariables("EngProduct",{Value = 0, Increase = 0, Max = 1000000, Enable = true})
DefineVariables("ArtifactGive",{Value = 0, Increase = 0, Max = 1000, Enable = false})
DefineVariables("ZombificationTime",{Value = 0, Increase = -1, Max = 10, Enable = true})
DefineVariables("VeteranOfPain",{Value = 1, Increase = 0, Max = 4, Enable = true})
DefineVariables("RessurectPlayerPain",{Value = 0, Increase = 0, Max = 16, Enable = true})
DefineVariables("Charge",{Value = 0, Increase = 0, Max = 1000, Enable = false})
DefineVariables("NeedToResurrect",{Value = 1, Increase = 0, Max = 100, Enable = true})
DefineVariables("Confusion",{Value = 0, Increase = -30, Max = 150, Enable = true})
DefineVariables("ConfusionReduce",{Value = 0, Increase = 0, Max = 100, Enable = true})
DefineVariables("UsedSpheres",{Value = 0, Increase = 0, Max = 200000, Enable = true})
DefineVariables("ResearchedPlayers",{Value = 0, Increase = 0, Max = 200000, Enable = true})      -- Use to determine which player researched this building
DefineVariables("RadarCharge",{Value = 0, Increase = 0, Max = 1000, Enable = false})
DefineVariables("RadarResearch",{Value = 0, Increase = 0, Max = 1000, Enable = false})
DefineVariables("RadarResearchTarget",{Value = 0, Increase = 0, Max = 65536, Enable = true})
-- Unit arguments
DefineVariables("Arg1",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("Arg2",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("Arg3",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("Arg12",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("Arg13",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("Arg14",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("Arg15",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("Op1",{Value = 0, Increase = 0, Max = 1000000, Enable = true})
DefineVariables("Op2",{Value = 0, Increase = 0, Max = 1000000, Enable = true})
DefineVariables("Op3",{Value = 0, Increase = 0, Max = 1000000, Enable = true})
DefineVariables("Op4",{Value = 0, Increase = 0, Max = 1000000, Enable = true})

DefineVariables("BaseDamage",{Value = 0, Increase = 0, Max = 1000, Enable = true})                 -- Base damage
DefineVariables("BaseDamage2",{Value = 0, Increase = 0, Max = 1000, Enable = true})                -- Base damage 2
DefineVariables("BaseDamage3",{Value = 0, Increase = 0, Max = 1000, Enable = true})                -- Base damage 3
DefineVariables("TotalPowerHandicap",{Value = 0, Increase = 0, Max = 100, Enable = true})          
DefineVariables("Precision",{Value = 100, Increase = 0, Max = 100, Enable = false})
DefineVariables("Veterancy",{Value = 1, Increase = 0, Max = 4, Enable = true})
DefineVariables("VeterancyUAC",{Value = 1, Increase = 0, Max = 4, Enable = true})
DefineVariables("VeterancyHell",{Value = 1, Increase = 0, Max = 4, Enable = true})
DefineVariables("Repair",{Value = 0, Increase = 0, Max = 1, Enable = true})                        -- To control if unit is ready for repairing(don't move)
DefineVariables("DoomerFist",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("DoomerInvisGive",{Value = 0, Increase = 0, Max = 10000, Enable = false})
DefineVariables("DoomerDoomGive",{Value = 0, Increase = 0, Max = 10000, Enable = false})
DefineVariables("DoomerInvulnGive",{Value = 0, Increase = 0, Max = 10000, Enable = false})
DefineVariables("HellSuperweaponTTL",{Value = 0, Increase = -30, Max = 1800, Enable = false})
DefineVariables("UnitFlags",{Value = 0, Increase = 0, Max = 200000, Enable = true})
DefineVariables("AcidSphereMaxDamage",{Value = 0, Increase = 0, Max = 100000, Enable = true})
DefineVariables("CorruptionSphereMaxDamage",{Value = 0, Increase = 0, Max = 100000, Enable = true})
DefineVariables("VampirismSphereMaxDamage",{Value = 0, Increase = 0, Max = 100000, Enable = true})
-- Trading
DefineVariables("TradeMode",{Value = 0, Increase = 0, Max = 1, Enable = false})
DefineVariables("TradePlayer",{Value = 0, Increase = 0, Max = 16, Enable = false})
DefineVariables("TradeMin",{Value = 0, Increase = 0, Max = 1000000, Enable = false})
DefineVariables("TradeEng",{Value = 0, Increase = 0, Max = 1000000, Enable = false})

InitFuncs:add(function()
SetDamageFormula(Max(0,Mul(NotEqual(Add(GreaterThan(AttackerVar("Confusion"), 0), GreaterThan(Rand(100), AttackerVar("ConfusionReduce"))), 2),
	-- then
	Div(Mul(Sub(100, Mul(GreaterThan(AttackerVar("SoulHarvesting"),0),
	Add(19, Mul(6, AttackerVar("Veterancy"))))), Mul(Add(Sub(Add(71,
	Mul(Sub(AttackerVar("Veterancy"),1),25)),
	Mul(Sub(DefenderVar("Veterancy"),1),15)),
	 Rand(50)),Max(1,Mul(AttackerVar("BasicDamage"),Add(Add(Add(Add(Add(Add(Add(Add(Add(Add(
	Mul(AttackerVar("LightArmorDamage"),DefenderVar("IsLightArmor")),
	Mul(AttackerVar("CombatArmorDamage"),DefenderVar("IsCombatArmor"))),
	Mul(AttackerVar("HeavyArmorDamage"),DefenderVar("IsHeavyArmor"))),
	Mul(AttackerVar("FleshArmorDamage"),DefenderVar("IsFleshArmor"))),
	Mul(AttackerVar("HeavyFleshArmorDamage"),DefenderVar("IsHeavyFleshArmor"))),
	Mul(AttackerVar("AirFleshArmorDamage"),DefenderVar("IsAirFleshArmor"))),
	Mul(AttackerVar("MechanicalArmorDamage"),DefenderVar("IsMechanicalArmor"))),
	Mul(AttackerVar("AirMechanicalArmorDamage"),DefenderVar("IsAirMechanicalArmor"))),
	Mul(AttackerVar("BuildingArmorDamage"),DefenderVar("IsBuildingArmor"))),
	Mul(AttackerVar("HeavyBuildingArmorDamage"),DefenderVar("IsHeavyBuildingArmor"))),
	Mul(AttackerVar("CursedArmorDamage"),DefenderVar("IsCursedArmor"))))))), 10000))))
	--damage = Div(Mul(GreaterThan(DefenderVar("SoulHarvesting"),0),66), 100) 
end)
--NoRandomPlacementMultiplayer()

SetTrainingQueue(true)

SetBuildingCapture(false)

SetRevealAttacker(false)

ResourcesMultiBuildersMultiplier(4)

RightButtonMoves()

SetClickMissile("missile-green-cross")

SetGrabMouse(true)

SetLeaveStops(true)

SetMouseScroll(true)

SetKeyScroll(true)

SetDoubleClickDelay(300)

SetHoldClickDelay(1000)

SetFogOfWar(true)

SetFogOfWarGraphics("graphics/tilesets/mars/terrain/mars.png")

SetMinimapTerrain(true)

SetFogOfWarOpacity(128)

Cycles = 0
tttttttttttttt = 0
mapname = "maps/(2)eternal_confrontation.smp.gz"
mapinfo = {
  playertypes = {nil, nil, nil, nil, nil, nil, nil, nil},
  description = "",
  nplayers = 1,
  allplayers = 1,
  w = 32,
  h = 32,
  id = 0,
  ums = {
    enabled = 0,
	ptype =  {-1, -1, -1, -1, -1, -1, -1, -1},
	pside =  {-1, -1, -1, -1, -1, -1, -1, -1},
	pteams = {-1, -1, -1, -1, -1, -1, -1, -1},
	rescount = -1,
	difficulty = -1,
	reveal_type = -1
  }
}

-- Load grahics before video init
function LoadGraphic(filename, width, height)
   DebugPrint("loading graphic (delayed) " .. filename .. "\n")
   local g = CGraphic:New(filename, width, height)
   table.insert(GraphicsDelayArray, g)
   return g
end

function LoadGraphicForce(filename, width, height)
   DebugPrint("loading graphic " .. filename .. "\n")
   local g = CGraphic:New(filename, width, height)
   g:Load()
   return g
end

function UMSSettingsReset()
  mapinfo.ums.enabled = 0
  mapinfo.ums.ptype =  {-1, -1, -1, -1, -1, -1, -1, -1}
  mapinfo.ums.pside =  {-1, -1, -1, -1, -1, -1, -1, -1}
  mapinfo.ums.pteams = {-1, -1, -1, -1, -1, -1, -1, -1}
  mapinfo.ums.rescount = -1
  mapinfo.ums.difficulty = -1
  mapinfo.ums.reveal_type = -1
end

function InitGameSettings()
  GameSettings.NetGameType = 1
  for i=0,PlayerMax-1 do
    GameSettings.Presets[i].Race = -1
    GameSettings.Presets[i].Team = -1
    GameSettings.Presets[i].Type = -1
  end
  GameSettings.Resources = -1
  GameSettings.Difficulty = -1
  GameSettings.NumUnits = -1
  GameSettings.Opponents = -1
  GameSettings.GameType = -1
  GameSettings.NoFogOfWar = false
  GameSettings.Inside = false
  GameSettings.RevealMap = -1
  GameSettings.MapRichness = -1
  Cycles = 0
  timerset = false
  maxscore = 0
  draw = false
  UMSSettingsReset()
end
InitGameSettings()

DefineDefaultIncomes(
  0, 100, 100, 100, 100, 100, 100)
  
DefineDefaultResourceMaxAmounts(
  -1, -1, -1, 0, -1, -1, -1)

DefineDefaultActions(
  "stop", _("collect"), _("mine"), _("gain"), _("gain"), "mine", "mine")

DefineDefaultResourceNames(
  "time", _("minerals"), "minerals_", _("energy"), _("hellpower"), "powercount", "gold")
  
DefineExtraDeathTypes(
  "basic", "extreme","fire", "shell", "melee", "demon_eating", "ressurect", "selfkill")

DefineDefaultResourceAmounts(
  "minerals", 1500)

-------------------------------------------------------------------------------

DefinePlayerColorIndex(256,1)

DefinePlayerColors({
  "red", {{164, 0, 0}},
  "blue", {{12, 72, 204}},
  "green", {{44, 180, 148}},
  "violet", {{152, 72, 176}},
  "orange", {{248, 140, 20}},
  "black", {{10, 10, 10}},
  "white", {{224, 224, 224}},
  "yellow", {{252, 252, 72}},
  "red", {{164, 0, 0}},
  "blue", {{12, 72, 204}},
  "green", {{44, 180, 148}},
  "violet", {{152, 72, 176}},
  "orange", {{248, 140, 20}},
  "black", {{40, 40, 60}},
  "white", {{224, 224, 224}},
  "yellow", {{252, 252, 72}},
})

InitFuncs:add(function()
  SetSpeeds(100)
end)

-------------------------------------------------------------------------------

AStar("fixed-unit-cost", 1000, "moving-unit-cost", 20, "know-unseen-terrain", "unseen-terrain-cost", 2)

SetMaxSelectable(255)

SetAllPlayersUnitLimit(16384)
SetAllPlayersBuildingLimit(16384)
SetAllPlayersTotalUnitLimit(16384)

function GameStarting()
	if (IsReplayGame() == true) then
		if GameSettings.RevealMap == 2 then
		  SetFogOfWar(false)
		  RevealMap()
		end
		if GameSettings.RevealMap == 1 then
		   RevealMap()
		end
	end
	MusicStopped()
	local resources = {"minerals", "energy"}
	if GameSettings.Difficulty == 1 or GameSettings.Difficulty == 5 then
		for player = 0, PlayerMax - 1 do
			if (GetPlayerData(player, "AiEnabled") == true) then
				if GameSettings.Difficulty == 1 then
					for j = 1,table.getn(resources) do
						SetSpeedResourcesHarvest(player, resources[j], 50)
						SetSpeedResourcesReturn(player, resources[j], 50)
					end
					SetSpeedBuild(player, 50)
					SetSpeedTrain(player, 50)
					SetSpeedUpgrade(player, 50)
					SetSpeedResearch(player, 50)
				elseif GameSettings.Difficulty == 5 then
					for j = 1,table.getn(resources) do
						SetSpeedResourcesHarvest(player, resources[j], 200)
						SetSpeedResourcesReturn(player, resources[j], 200)
					end
					SetSpeedBuild(player, 200)
					SetSpeedTrain(player, 200)
					SetSpeedUpgrade(player, 200)
					SetSpeedResearch(player, 200)
				end
			end
		end
	end
	if (doom.preferences.ShowTips and not IsReplayGame() and not IsNetworkGame()) then
		SetGamePaused(true)
		RunTipsMenu()
	end
	if GameSettings.NetGameType == 1 then
		if GameSettings.GameType==100 or GameSettings.GameType==103 then
			for plrs=0,7 do
				for plrs2=0,7 do
					if plrs==plrs2 then
					else
						if GameSettings.Presets[plrs].Team == 0 then
							SetDiplomacy(plrs, "enemy" , plrs2)
							SetSharedVision(plrs, false, plrs2)
						else
							if GameSettings.Presets[plrs].Team == GameSettings.Presets[plrs2].Team then
								SetDiplomacy(plrs, "allied" , plrs2)
								SetSharedVision(plrs, true, plrs2)
							else
								SetDiplomacy(plrs, "enemy" , plrs2)
								SetSharedVision(plrs, false, plrs2)
							end
						end
					end
				end
			end
		elseif GameSettings.GameType==101 then 
			for plrs=0,7 do
				for plrs2=0,7 do
					if mapinfo.playertypes[plrs+1]=="nobody" or mapinfo.playertypes[plrs2+1]=="nobody" or 
					mapinfo.playertypes[plrs+1]==nil or mapinfo.playertypes[plrs2+1]==nil or
					GameSettings.Presets[plrs].Type ==-1 then
					else
						if plrs==plrs2 then
						else
							SetDiplomacy(plrs, "enemy" , plrs2)
							SetSharedVision(plrs, false, plrs2)								
						end
					end
				end
			end 
		elseif GameSettings.GameType==102 then 
			for plrs=0,7 do
				for plrs2=0,7 do
					if mapinfo.playertypes[plrs+1]=="nobody" or mapinfo.playertypes[plrs2+1]=="nobody" or 
					mapinfo.playertypes[plrs+1]==nil or mapinfo.playertypes[plrs2+1]==nil or
					GameSettings.Presets[plrs].Type ==-1 then
					else
						if plrs==plrs2 then
						else
							if GetPlayerData(plrs, "RaceName") == "uac" then
								if GetPlayerData(plrs2, "RaceName") == "uac" then
									SetDiplomacy(plrs, "allied" , plrs2)
									SetSharedVision(plrs, true, plrs2)		
								else
									SetDiplomacy(plrs, "enemy" , plrs2)
									SetSharedVision(plrs, false, plrs2)	
								end
							else
								if GetPlayerData(plrs2, "RaceName") == "hell" then
									SetDiplomacy(plrs, "allied" , plrs2)
									SetSharedVision(plrs, true, plrs2)	
								else
									SetDiplomacy(plrs, "enemy" , plrs2)
									SetSharedVision(plrs, false, plrs2)	
								end
							end
						end
					end
				end
			end 
		end
	end
	if GameSettings.GameType == 103 then
		ActionSetTimer(GameSettings.MapRichness*30,false)
		ActionStartTimer()
	end
end

function AddStandardTriggers()
	local defeated={0,0,0,0,0,0,0,0}
	local cycle = 30
	AddTrigger(
    function() 
		Cycles = GameCycle
		return false end,
    function() return true end)
	
	AddTrigger(
    function() return GetPlayerData(GetThisPlayer(), "NumBuildings") == 0 end,
    function()
		if cycle == 30 then
			AddMessage("You failed your mission!")
			if GetPlayerData(GetThisPlayer(), "RaceName") == "uac" then
				PlaySound("uac defeat")
			elseif GetPlayerData(GetThisPlayer(), "RaceName") == "hell" then
				PlaySound("hell defeat")
			end
		end
		cycle = cycle - 1
		if cycle <= 0 then
			return ActionDefeat() 
		else
			return true
		end
	end) 

  AddTrigger(
    function()
		local player = GetThisPlayer()
		local n = 0
		for i = 0,7 do
			if (Players[i].Type ~= PlayerNobody and ThisPlayer.Index ~= i) then
				local buildingCount = GetPlayerData(i, "NumBuildings");

				if ((Players[player]:IsEnemy(Players[i])) or (Players[i]:IsEnemy(Players[player]))) then
					if buildingCount > 0 then
						n = n + 1
					end
				end
			end
		end
		return (n == 0)
	end,
	
    function() 
		if cycle == 30 then
			AddMessage("You are victorious!")
			if GetPlayerData(GetThisPlayer(), "RaceName") == "uac" then
				PlaySound("uac victory")
			elseif GetPlayerData(GetThisPlayer(), "RaceName") == "hell" then
				PlaySound("hell victory")
			end
		end
		cycle = cycle - 1
		if cycle <= 0 then
			return ActionVictory() 
		else
			return true
		end
		end) 
	
  --Player Defeated
  AddTrigger(
    function() 	
		for i=0,7 do
			if Players[i].Type ~= PlayerNobody then
				if GetPlayerData(i, "NumBuildings") == 0 and GameSettings.Presets[i].Type ~= -1 and defeated[i+1]==0 then
					AddMessage(""..GetPlayerData(i,"Name").."("..i..") defeated!")
					if GetPlayerData(GetThisPlayer(), "RaceName") == "uac" then
						PlaySound("uac player defeated")
					elseif GetPlayerData(GetThisPlayer(), "RaceName") == "hell" then
						PlaySound("hell player defeated")
					end
					ChangeUnitsOwner({0, 0}, {Map.Info.MapWidth - 1, Map.Info.MapHeight - 1}, i, 15)
					defeated[i+1] = 1
				end
			end
		end		
		return false
		end,
    function() return true end) 
end

function SinglePlayerTriggers()
	
  if (GameSettings.GameType ~= 104) then
	AddStandardTriggers()
  end

	-- Time Attack Mode
  AddTrigger(
    function() return GameSettings.GameType == 103 end,
    function()
		if GetTimer()==0 then
			maxscore=0
			for i=1,7 do
				if GetPlayerData(i,"Score")>GetPlayerData(maxscore,"Score") then
					maxscore=i
					draw=false
				elseif GetPlayerData(i,"Score")==GetPlayerData(maxscore,"Score") then
					draw=true
				end
			end
			if draw==true then
				timerset=false
				maxscore=0
				draw=false
				return ActionDraw()
			elseif GetThisPlayer()==maxscore then
				timerset=false
				maxscore=0
				draw=false
				return ActionVictory()
			else
				timerset=false
				maxscore=0
				draw=false
				return ActionDefeat()
			end
		else
			return true
		end
	end) 
end 

-------------------------------------------------------------------------------
--  Tables-Part
-------------------------------------------------------------------------------

Load("preferences.lua")

if (doom.preferences == nil) then
  doom.preferences = {
    VideoWidth = 640,
    VideoHeight = 480,
    VideoFullScreen = false,
    PlayerName = "Player",
    FogOfWar = true,
    ShowCommandKey = true,
    GroupKeys = "0123456789`",
    GameSpeed = 30,
    EffectsEnabled = true,
    EffectsVolume = 128,
    MusicEnabled = true,
    MusicVolume = 128,
	MusicRandom = false,
    StratagusTranslation = "scripts/translate/stratagus-en.po",
    GameTranslation = "scripts/translate/dw-en.po",
    TipNumber = 0,
    ShowTips = true,
    GrabMouse = false,
    UseOpenGL = false,
    MaxOpenGLTexture = 256,
	ShowDamage = false,
	ShowRadius = false,
	ShowOrders = true,
	MouseSpeed = 4,
	ShowMessages = true,
	BigScreen = false,
	ServerList = {},
	MetaServer = "localhost",
	MetaPort = 7775
	}
end


InitFuncs:add(function()
  if doom.preferences.ShowDamage == true then
	SetDamageMissile("missile-hit")
  else
	SetDamageMissile(nil)
  end 
  if doom.preferences.ShowRadius == true 
  then Preference.ShowSightRange = true
	   Preference.ShowAttackRange = true
	   Preference.ShowReactionRange = true
  else Preference.ShowSightRange = false
	   Preference.ShowAttackRange = false
	   Preference.ShowReactionRange = false
  end
  if doom.preferences.ShowOrders == true then
	Preference.ShowOrders = 1
  else 
	Preference.ShowOrders = 0
  end
  if doom.preferences.ShowMessages == true then
	Preference.ShowMessages = true
  else 
	Preference.ShowMessages = false
  end
  if doom.preferences.BigScreen == true then
	Preference.BigScreen = true
	UI.PieMenu.MouseButton = MiddleButton 
	UI.PieMenu:SetRadius(70)
  else 
	Preference.BigScreen = false
	UI.PieMenu.MouseButton = NoButton 
	UI.PieMenu:SetRadius(0)
  end
  SetMouseScrollSpeed(doom.preferences.MouseSpeed)
  SetMouseScrollSpeedDefault(doom.preferences.MouseSpeed)
  SetMouseScrollSpeedControl(doom.preferences.MouseSpeed*4) 
end)

if doom.preferences.UseOpenGL == true then
	SetUseOpenGL(true)
	SetUseTextureCompression(true)
else 
	SetUseOpenGL(false)
end

MetaClient:SetMetaServer(doom.preferences.MetaServer, doom.preferences.MetaPort)
SetVideoResolution(doom.preferences.VideoWidth, doom.preferences.VideoHeight)
SetVideoFullScreen(doom.preferences.VideoFullScreen)
SetMaxOpenGLTexture(doom.preferences.MaxOpenGLTexture)
SetLocalPlayerName(doom.preferences.PlayerName)
SetFogOfWar(doom.preferences.FogOfWar)
UI.ButtonPanel.ShowCommandKey = doom.preferences.ShowCommandKey
SetGroupKeys(doom.preferences.GroupKeys)
SetGameSpeed(doom.preferences.GameSpeed)
SetEffectsEnabled(doom.preferences.EffectsEnabled)
SetEffectsVolume(doom.preferences.EffectsVolume)
SetMusicEnabled(doom.preferences.MusicEnabled)
SetMusicVolume(doom.preferences.MusicVolume)
SetTranslationsFiles(doom.preferences.StratagusTranslation, doom.preferences.GameTranslation)
SetGrabMouse(doom.preferences.GrabMouse)

Load("scripts/translate/translate.lua")
Load("scripts/doom.lua")
Load("scripts/icons.lua")
Load("scripts/sound.lua")
Load("scripts/missiles.lua")
Load("scripts/constructions.lua")
Load("scripts/spells.lua")
Load("scripts/units.lua")
Load("scripts/upgrade.lua")
Load("scripts/fonts.lua")
Load("scripts/buttons.lua")
Load("scripts/ui.lua")
Load("scripts/ai.lua")
Load("scripts/commands.lua")
Load("scripts/cheats.lua")

DebugPrint("Ready!\n")