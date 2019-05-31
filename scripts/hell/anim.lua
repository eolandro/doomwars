function HandleTrading(errorCode, minTran, engTran, fromPlayer, toPlayer)
	if (errorCode == 0) then
		AddMessage("Transfered " .. tostring(minTran) .. " minerals and " .. tostring(engTran) .. " energy from " ..
			GetPlayerData(fromPlayer, "Name") .. " to " .. GetPlayerData(toPlayer, "Name"))
	elseif (errorCode == 1) then
		AddMessage("Selected " .. GetPlayerData(toPlayer, "Name"))
	end
end

DefineAnimations("animations-hellkeep", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end", "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 1", "goto end",
  "label damaged50",
  "exact-frame 5", "wait 1",
   "label end","wait 1",},
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

local GeneratorStill = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "frame 0", "wait 4", "frame 1", "wait 4", "frame 2", "wait 4",
  "goto end",
  "label damaged50",
  "frame 6", "wait 4", "frame 7", "wait 4", "frame 8", "wait 4",
  "label end", "wait 1",}

DefineAnimations("animations-generator", {
  Still = GeneratorStill,
  Upgrade = GeneratorStill,
})

local AdvGeneratorStill = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "frame 9", "wait 4", "frame 10", "wait 4", "frame 11", "wait 4", 
  "goto end",
  "label damaged50",
  "frame 12", "wait 4", "frame 13", "wait 4", "frame 14", "wait 4", 
  "label end", "wait 1",}

DefineAnimations("animations-adv-generator", {
  Still = AdvGeneratorStill,
  Upgrade = AdvGeneratorStill,
  })

DefineAnimations("animations-monster-barracks", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 1", "goto end",
  "label damaged50",
  "exact-frame 4", "wait 1", 
  "label end","wait 1",},
})

DefineAnimations("animations-hellgate", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "set-var Op1.Value 0 0",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 6", "wait 4", "exact-frame 7", "wait 4", "exact-frame 8", "wait 4", 
  "label end","wait 1",},
  SpellCast = {"unbreakable begin", "set-var Op2.Value 0 1", "set-var Arg1.Value 0 25", "attack",
  "label start",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 6", "wait 4", "exact-frame 7", "wait 4", "exact-frame 8", "wait 4", 
  "label end",
  "set-var Arg1.Value 2 1",
  "if-var v_Arg1.Value > 0 start",
  "set-var Op2.Value 0 0",
  "unbreakable end", "wait 1",},
})

DefineAnimations("animations-well-of-souls", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 3", "wait 4", "exact-frame 4", "wait 4", "exact-frame 5", "wait 4", 
   "label end","wait 1",},
  SpellCast = {"unbreakable begin", "if-var v_Build.Value != 0 end",
  "attack",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 3", "wait 4", "exact-frame 4", "wait 4", "exact-frame 5", "wait 4", 
  "label end",
  "unbreakable end",
   "wait 1",},
})

DefineAnimations("animations-temple-of-fire", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 6", "wait 4", "exact-frame 7", "wait 4", "exact-frame 8", "wait 4", 
   "label end","wait 1",},
})

DefineAnimations("animations-deathpentagram", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 6", "wait 4", "exact-frame 7", "wait 4", "exact-frame 8", "wait 4", 
   "label end","wait 1",},
  SpellCast = {"unbreakable begin", "frame 0", "attack", "set-var HellSuperweaponTTL.Enable = 1 l", "set-var HellSuperweaponTTL.Max 0 1800 l", "set-var HellSuperweaponTTL.Value 0 1800 l",
    "sound fireball launch", "wait 4",
    "frame 0", "unbreakable end", "wait 1",},
})

DefineAnimations("animations-hell-wall", {
  Still = {"if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 16", "wait 1",
	"label end"},
	Death = {
	"frame 16", "wait 1"},
})

DefineAnimations("animations-fire-tower", {
  Still = {"frame 0",
  "wait 4", "frame 1", "wait 4",  "frame 2", "wait 4", "frame 0", "wait 1",},
  Upgrade = BuildingStill,
  Attack = {"unbreakable begin", "frame 3", "attack", "wait 4",
    "frame 0", "wait 17", "unbreakable end", "wait 1",},
})

DefineAnimations("animations-upgraded-fire-tower", {
  Still = {"frame 0", "wait 4", "frame 1", "wait 4",  "frame 2", "wait 4", "frame 0", "wait 1",},
  Upgrade = BuildingStill,
  Attack = {"unbreakable begin", "frame 3",
  "if-var v_UnitFlags.Value & "..unitFlags.UF_UpgradeTracer.." tracer",
  "attack", 
  "goto tracercont",
  "label tracer",
  "spawn-missile missile-revenant-tracer 0 0 0 0 damage.totarget",
  "label tracercont",
  "wait 3",
    "frame 0","wait 35", "unbreakable end", "wait 1",},
})

DefineAnimations("animations-tower-of-horror", {
  Still = {"frame 0", "wait 4", "frame 0", "wait 1",},
  Attack = {"unbreakable begin", "frame 0", "attack", "sound comet launch", "wait 40",
    "frame 0", "unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin", "frame 0", "set-var RessurectPlayer.Value 0 l_this t", "attack", "sound zombie dwell", "wait 60",
    "frame 0", "unbreakable end", "wait 1",},
})