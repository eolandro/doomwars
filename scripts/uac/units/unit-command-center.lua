-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

function HandleTrading(errorCode, minTran, engTran, fromPlayer, toPlayer)
	if (errorCode == 0) then
		AddMessage("Transfered " .. tostring(minTran) .. " minerals and " .. tostring(engTran) .. " energy from " ..
			GetPlayerData(fromPlayer, "Name") .. " to " .. GetPlayerData(toPlayer, "Name"))
	elseif (errorCode == 1) then
		AddMessage("Selected " .. GetPlayerData(toPlayer, "Name"))
	end
end

DefineAnimations("animations-command-center", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end", 
    "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 4", "wait 1",
	"label end", "wait 1",},
  Upgrade = {"frame 2", "wait 4", "frame 2", "wait 1",},
  Train = {"exact-frame 0", "if-var v_Build.Value != 0 end", 
    "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 2", "frame 5", "wait 2", "frame 6", "wait 2", "frame 7", "wait 2",
	"frame 6", "wait 2", "frame 5", "wait 2", "goto end",
	"label damaged50",
	"frame 4", "wait 2", "frame 8", "wait 2", "frame 9", "wait 2", "frame 10", "wait 2",
	"frame 9", "wait 2", "frame 8", "wait 2", 
	"label end", "wait 1",},
  Research = {"exact-frame 0", "if-var v_Build.Value != 0 end", 
    "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 2", "frame 5", "wait 2", "frame 6", "wait 2", "frame 7", "wait 2",
	"frame 6", "wait 2", "frame 5", "wait 2", "goto end",
	"label damaged50",
	"frame 4", "wait 2", "frame 8", "wait 2", "frame 9", "wait 2", "frame 10", "wait 2",
	"frame 9", "wait 2", "frame 8", "wait 2", 
	"label end", "wait 1",},
  SpellCast = {"unbreakable begin",
	"if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "goto next",
	"label damaged50",
	"frame 4",
	"label next",
	"if-var s_spell-enable-trade == 1 begintrade",
	"if-var s_spell-trading-prev-player == 1 prevplayer",
	"if-var s_spell-trading-next-player == 1 nextplayer",
	"if-var s_spell-trading-inc-min == 1 incminerals",
	"if-var s_spell-trading-dec-min == 1 decminerals",
	"if-var s_spell-trading-inc-eng == 1 incenergy",
	"if-var s_spell-trading-dec-eng == 1 decenergy",
	"if-var s_spell-trading-commit == 1 commit",
	"goto end",
	-- Enable trade
	"label begintrade",
	"set-var TradeMode.Value ! 1",
	"set-var TradeMode.Enable ! 1",
	"if-var v_TradeMode.Value == 0 end",
	"if-var v_TradePlayer.Value == l_this nextplayer",
	"goto end",
	-- Previous player
	"label prevplayer",
	"if-var v_TradePlayer.Value == 0 setmaxplayer",
	"set-var TradePlayer.Value -= 1", 
	"if-var v_TradePlayer.Value == l_this prevplayer", 
	"if-var p_(v_TradePlayer.Value).TotalNumUnits == 0 prevplayer",
	"goto end",
	"label setmaxplayer",
	"set-var TradePlayer.Value = 7", 
	"if-var v_TradePlayer.Value == l_this prevplayer", 
	"if-var p_(v_TradePlayer.Value).TotalNumUnits == 0 prevplayer",
	"goto end",
	-- Next player
	"label nextplayer",
	"if-var v_TradePlayer.Value == 7 setminplayer",
	"set-var TradePlayer.Value += 1",
	"if-var v_TradePlayer.Value == l_this nextplayer", 
	"if-var p_(v_TradePlayer.Value).TotalNumUnits == 0 nextplayer",
	"goto end",
	"label setminplayer",
	"set-var TradePlayer.Value = 0", 
	"if-var v_TradePlayer.Value == l_this nextplayer",
	"if-var p_(v_TradePlayer.Value).TotalNumUnits == 0 nextplayer",
	"goto end",
	-- Inc minerals
	"label incminerals",
	"set-var TradeMin.Value += 250", "goto end",
	-- Dec minerals
	"label decminerals",
	"set-var TradeMin.Value -= 250", "goto end",
	-- Inc energy
	"label incenergy",
	"set-var TradeEng.Value += 250", "goto end",
	-- Dec energy
	"label decenergy",
	"set-var TradeEng.Value -= 250", "goto end",
	-- Commit
	"label commit",
	"if-var v_TradeMin.Value <= p_this.Resources.minerals next1",
	"set-var TradeMin.Value = p_this.Resources.minerals",
	"label next1",
	"if-var v_TradeEng.Value <= p_this.Resources.energy next2",
	"set-var TradeEng.Value = p_this.Resources.energy",
	"label next2",
	"set-player-var l_this Resources -= v_TradeMin.Value minerals",
	"set-player-var l_this Resources -= v_TradeEng.Value energy",
	"set-player-var v_TradePlayer.Value Resources += v_TradeMin.Value minerals",
	"set-player-var v_TradePlayer.Value Resources += v_TradeEng.Value energy",
	"lua-callback HandleTrading 0 v_TradeMin.Value v_TradeEng.Value l_this v_TradePlayer.Value",
	"set-var TradeMin.Value = 0",
	"set-var TradeEng.Value = 0",
	"set-var TradeMode.Value = 0",
	"set-var TradeMode.Enable = 0",
	"label end",
	"attack",
	"unbreakable end",
	"wait 1",
	}
})

DefineAnimations("animations-advanced-command-center", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
    "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 1", "wait 1",
	"label end", "wait 1",},
  Train = {"exact-frame 0", "if-var v_Build.Value != 0 end", 
    "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 2", "frame 3", "wait 2", "frame 4", "wait 2", "frame 5", "wait 2",
	"frame 4", "wait 2", "frame 3", "wait 2", "goto end",
	"label damaged50",
	"frame 1", "wait 2", "frame 6", "wait 2", "frame 7", "wait 2", "frame 8", "wait 2",
	"frame 7", "wait 2", "frame 6", "wait 2", 
	"label end", "wait 1",},
  Research = {"exact-frame 0", "if-var v_Build.Value != 0 end", 
   "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 2", "frame 3", "wait 2", "frame 4", "wait 2", "frame 5", "wait 2",
	"frame 4", "wait 2", "frame 3", "wait 2", "goto end",
	"label damaged50",
	"frame 1", "wait 2", "frame 6", "wait 2", "frame 7", "wait 2", "frame 8", "wait 2",
	"frame 7", "wait 2", "frame 6", "wait 2", 
	"label end", "wait 1",},
  SpellCast = {"unbreakable begin",
	"if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "goto next",
	"label damaged50",
	"frame 4",
	"label next",
	"if-var s_spell-enable-trade == 1 begintrade",
	"if-var s_spell-trading-prev-player == 1 prevplayer",
	"if-var s_spell-trading-next-player == 1 nextplayer",
	"if-var s_spell-trading-inc-min == 1 incminerals",
	"if-var s_spell-trading-dec-min == 1 decminerals",
	"if-var s_spell-trading-inc-eng == 1 incenergy",
	"if-var s_spell-trading-dec-eng == 1 decenergy",
	"if-var s_spell-trading-commit == 1 commit",
	"goto end",
	-- Enable trade
	"label begintrade",
	"set-var TradeMode.Value ! 1",
	"set-var TradeMode.Enable ! 1",
	"if-var TradeMode.Value == 0 end",
	"if-var v_TradePlayer.Value == l_this nextplayer",
	"goto end",
	-- Previous player
	"label prevplayer",
	"if-var v_TradePlayer.Value == 0 setmaxplayer",
	"set-var TradePlayer.Value -= 1", 
	"if-var v_TradePlayer.Value == l_this prevplayer", 
	"lua-callback HandleTrading 1 v_TradeMin.Value v_TradeEng.Value l_this v_TradePlayer.Value", "goto end",
	"label setmaxplayer",
	"set-var TradePlayer.Value = 7", 
	"if-var v_TradePlayer.Value == l_this prevplayer", 
	"lua-callback HandleTrading 1 v_TradeMin.Value v_TradeEng.Value l_this v_TradePlayer.Value", "goto end",
	-- Next player
	"label nextplayer",
	"if-var v_TradePlayer.Value == 7 setminplayer",
	"set-var TradePlayer.Value += 1", 
	"if-var v_TradePlayer.Value == l_this nextplayer", 
	"lua-callback HandleTrading 1 v_TradeMin.Value v_TradeEng.Value l_this v_TradePlayer.Value", "goto end",
	"label setminplayer",
	"set-var TradePlayer.Value = 0", 
	"if-var v_TradePlayer.Value == l_this nextplayer", 
	"lua-callback HandleTrading 1 v_TradeMin.Value v_TradeEng.Value l_this v_TradePlayer.Value", "goto end",
	-- Inc minerals
	"label incminerals",
	"set-var TradeMin.Value += 250", "goto end",
	-- Dec minerals
	"label decminerals",
	"set-var TradeMin.Value -= 250", "goto end",
	-- Inc energy
	"label incenergy",
	"set-var TradeEng.Value += 250", "goto end",
	-- Dec energy
	"label decenergy",
	"set-var TradeEng.Value -= 250", "goto end",
	-- Commit
	"label commit",
	"if-var v_TradeMin.Value <= p_this.Resources.minerals next1",
	"set-var TradeMin.Value = p_this.Resources.minerals",
	"label next1",
	"if-var v_TradeEng.Value <= p_this.Resources.energy next2",
	"set-var TradeEng.Value = p_this.Resources.energy",
	"label next2",
	"set-player-var l_this Resources -= v_TradeMin.Value minerals",
	"set-player-var l_this Resources -= v_TradeEng.Value energy",
	"set-player-var v_TradePlayer.Value Resources += v_TradeMin.Value minerals",
	"set-player-var v_TradePlayer.Value Resources += v_TradeEng.Value energy",
	"lua-callback HandleTrading 0 v_TradeMin.Value v_TradeEng.Value l_this v_TradePlayer.Value",
	"set-var TradeMin.Value = 0",
	"set-var TradeEng.Value = 0",
	"set-var TradeMode.Value = 0",
	"set-var TradeMode.Enable = 0",
	"label end",
	"attack",
	"unbreakable end",
	"wait 1",
	}
})
--[[
local function UpdateProduction(slot)
	if (GameCycle ~= 0 and GameCycle mod 3600 == 0) then
		local player = GetUnitVariable(slot, "Player")
		SetUnitVariable(slot, "OldMinProduct", GetUnitVariable(slot, "MinProduct"))
		SetUnitVariable(slot, "OldEngProduct", GetUnitVariable(slot, "EngProduct"))
		SetUnitVariable(slot, "MinProduct", GetPlayerData(player, "Resources", "minerals") - GetUnitVariable(slot, "OldMinProduct"))
		SetUnitVariable(slot, "EngProduct", GetPlayerData(player, "Resources", "energy") - GetUnitVariable(slot, "OldEngProduct"))
	end
end]]

local function CommandCenterIncomeManagement(slot)
	if (GameCycle % 1800 == 0) then
		SetUnitVariable(slot, "OldMinProduct", GetUnitVariable(slot, "MinProduct", "Value"), "Value")
		SetUnitVariable(slot, "OldEngProduct", GetUnitVariable(slot, "EngProduct", "Value"), "Value")
		SetUnitVariable(slot, "MinProduct", GetPlayerData(GetUnitVariable(slot, "Player"), "Resources", "minerals"), "Value")
		SetUnitVariable(slot, "EngProduct", GetPlayerData(GetUnitVariable(slot, "Player"), "Resources", "energy"), "Value")
	end
end

UnitName = "unit-command-center"
DefineUnitType(UnitName, { Name = _("Command Center"),
  -- Drawing
  Image = {"file", "graphics/uac/buildings/command-center.png","size", {160, 155}},
  Shadow = {"file", "graphics/uac/buildings/command-center-s.png", "size",{160, 155}},
  Animations = "animations-command-center", Icon = "icon-command-center",
  Construction = "construction-command-center",
  Offset = {0, -16},
  BoxOffset = {0, -16},
  DrawLevel = 40,
  Type = "land",
  TileSize = {5, 4}, BoxSize = {159, 154},
  -- Properties
  Costs = {"time", 300, "minerals", 4000},
  RepairHp = 2,
  RepairCosts = {"minerals", 2, "energy", 1},
  Storing = {"energy", 400},
  HitPoints = 1800,
  AiAdjacentRange = 3,
  SightRange = 5,
  Priority = 10,
  Points = 250,
  Supply = 5,
  CanCastSpell = {"spell-enable-trade", "spell-trading-prev-player", "spell-trading-next-player", "spell-trading-inc-min",
  "spell-trading-dec-min", "spell-trading-inc-eng", "spell-trading-dec-eng", "spell-trading-commit"},
  IsBuildingArmor = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  -- Flags
  UAC = true,
  Center = true,
  Building = true,
  VisibleUnderFog = true,
  LandUnit = true,
  -- Other
  CanStore = {"minerals"},
  OnEachCycle = SmokeControlCommandCenter,
  OnEachSecond = CommandCenterIncomeManagement,
  --OnEachSecond = UpdateProduction,
  DeathExplosion = BigBuildingExplosion,
  Corpse = "unit-destroyed-5x4-place",
  OnHit = ResetSmoke,
  BuildingRules = { { "distance", { Distance = 1, DistanceType = ">", Type = "unit-mineral-mine"},
					  "distance", { Distance = 1, DistanceType = ">", Type = "unit-mineral-piece"}}
				  },
  AiBuildingRules = { {
					"distance", { Distance = 12, DistanceType = "<=", Type = "unit-mineral-piece"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 15, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 15, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 15, DistanceType = ">", Type = "unit-advanced-command-center"}}
				  },
  Sounds = {
    "selected", "command-center",
	"acknowledge", "uac new-rally-point",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

DefineUnitType("unit-advanced-command-center", { Name = _("Advanced Command Center"),
  -- Drawing
  Image = {"file", "graphics/uac/buildings/command-center-advanced.png","size", {160, 164}},
  Shadow = {"file", "graphics/uac/buildings/command-center-advanced-s.png", "size",{160, 164}},
  Animations = "animations-advanced-command-center", Icon = "icon-command-center-advanced",
  Construction = "construction-advanced-command-center",
  DrawLevel = 40,
  Offset = {0, -16},
  BoxOffset = {0, -16},
  TileSize = {5, 4}, BoxSize = {159, 163},
  DeathExplosion = BigBuildingExplosion,
  Type = "land",
  -- Properties
  Costs = {"time", 500, "minerals", 5500, "energy", 1000},
  RepairHp = 2,
  RepairCosts = {"minerals", 2, "energy", 1},
  Storing = {"energy", 400},
  ImproveProduction = {"minerals", 20},
  HitPoints = 2500,
  IsBuildingArmor = 1,
  OnHit = ResetSmoke,
  AiAdjacentRange = 3,
  SightRange = 5,
  CanCastSpell = {"spell-enable-trade", "spell-trading-prev-player", "spell-trading-next-player", "spell-trading-inc-min",
  "spell-trading-dec-min", "spell-trading-inc-eng", "spell-trading-dec-eng", "spell-trading-commit"},
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10,
  Points = 400,
  Supply = 5,
  -- Flags
  UAC = true,
  Center = true,
  Building = true,
  VisibleUnderFog = true,
  LandUnit = true,
  -- Other
  Corpse = "unit-destroyed-5x4-place",
  OnEachCycle = SmokeControlAdvancedCommandCenter,
  OnEachSecond = CommandCenterIncomeManagement,
  CanStore = {"minerals"},
  BuildingRules = { { "distance", { Distance = 1, DistanceType = ">", Type = "unit-mineral-mine"},
					  "distance", { Distance = 1, DistanceType = ">", Type = "unit-mineral-piece"}}
				  },
  AiBuildingRules = { {
					"distance", { Distance = 12, DistanceType = "<=", Type = "unit-mineral-piece"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					  "distance", { Distance = 25, DistanceType = ">", Type = "unit-hellkeep"},
					  "distance", { Distance = 25, DistanceType = ">", Type = "unit-command-center"}}
				  },
  Sounds = {
    "selected", "command-center",
	"acknowledge", "uac new-rally-point",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )