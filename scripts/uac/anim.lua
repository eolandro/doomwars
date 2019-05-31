DefineAnimations("animations-power-plant", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "frame 0", "if-var v_HitPoints.Percent <= 50 damaged50",
  "frame 0", "wait 1", 
  "goto end",
  "label damaged50",
  "frame 4", "wait 1",
  "label end", "wait 1",},
})

DefineAnimations("animations-thermo-power-plant", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "frame 0", "wait 1", 
  "goto end",
  "label damaged50",
  "frame 1", "wait 1",
  "label end", "wait 1",},
  Death = {"unbreakable begin", "frame 99", "if-var v_Build.Value != 0 normal",
  "spawn-missile missile-thermo-explode 1 1 1 1 damage",
  "spawn-missile missile-thermo-explode 1 2 1 2 damage",
  "label normal", "wait 4", "frame 99", "wait 1", "unbreakable end", "wait 1",}
})

DefineAnimations("animations-uac-barracks", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 4", "wait 1",
	"label end", "wait 1",},
  Train = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 2", "frame 5", "wait 2", "frame 6", "wait 2", "frame 7", "wait 2", "frame 8", "wait 2", 
	"frame 7", "wait 2", "frame 6", "wait 2", "frame 5", "wait 2", "goto end",
	"label damaged50",
	"frame 4", "wait 2", "frame 9", "wait 2", "frame 10", "wait 2", "frame 11", "wait 2", "frame 12", "wait 2",
	"frame 11", "wait 2", "frame 10", "wait 2", "frame 9", "wait 2",
	"label end", "wait 1",}
})

DefineAnimations("animations-supply-depot", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end", 
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 7", "wait 4", "exact-frame 8", "wait 4", "exact-frame 9", "wait 4", 
   "label end","wait 1",},
})

DefineAnimations("animations-weapon-factory", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 5", "wait 1",
	"label end", "wait 1"},
})

DefineAnimations("animations-factory", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 5", "wait 1",
	"label end", "wait 1",},
  SpellCast = {"unbreakable begin", "exact-frame 0",
    "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0",	"wait 6", "attack", "frame 0", "goto end",
	"label damaged50",
	"frame 5",	"wait 11", "attack", "frame 5", "wait 1",
	"label end", "unbreakable end", "wait 1",}
})

DefineAnimations("animations-radar", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "frame 0", "wait 2", "frame 6", "wait 2", "frame 7", "wait 2", "frame 8", "wait 2",
  "frame 7", "wait 2", "frame 6", "wait 2", "goto end",
  "label damaged50",
  "frame 5", "wait 1",
  "label end", "wait 1",},
})

DefineAnimations("animations-tech-center", {
  Still = {"exact-frame 0",  "if-var v_Build.Value != 0 end",
 "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 5", "wait 1",
	"label end", "wait 1",},
  Research = {"exact-frame 0",  "if-var v_Build.Value != 0 end",
 "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 4", "frame 6", "wait 1", "frame 7", "wait 1", "frame 8", "wait 4",
  "frame 7", "wait 1", "frame 6", "wait 1", "goto end",
	"label damaged50",
	"frame 5", "wait 4", "frame 9", "wait 1", "frame 10", "wait 1", "frame 11", "wait 4",
  "frame 10", "wait 1", "frame 9", "wait 1", 
	"label end", "wait 1",}
})

function OrbitalSoundPreparing(pos1x, pos1y, pos2x, pos2y, slot)
	CreateMissile("missile-superball-sound", {(pos1x) * 32, (pos1y) * 32}, {(pos2x) * 32, (pos2y) * 32}, slot, -1, false, true)
end

function OrbitalLaunchMissile(pos1x, pos1y, pos2x, pos2y, slot)
	local offx = SyncRand(8) - 4
	local offy = SyncRand(8) - 4
	CreateMissile("missile-superball", {(pos1x + offx - 3) * 32, (pos1y + offy - 5) * 32}, {(pos2x + offx) * 32, (pos2y + offy) * 32}, slot, -1, true, true)
end

DefineAnimations("animations-orbital-control", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 4", "wait 1",
  "label end", "wait 1",},
  SpellCast = {"unbreakable begin",
	"frame 0", "set-var Op1.Value = 1", "wait 1", 
	"attack",
	"lua-callback OrbitalSoundPreparing v_TargetPosX.Value v_TargetPosY.Value v_TargetPosX.Value v_TargetPosY.Value v_Slot.Value",
		"wait 60", "set-var Op1.Value = 10",
	"label begin",
	"if-var v_Op1.Value == 0 end",
	"frame 0", "lua-callback OrbitalLaunchMissile v_TargetPosX.Value v_TargetPosY.Value v_TargetPosX.Value v_TargetPosY.Value v_Slot.Value",
	"wait 25",
	"set-var Op1.Value -= 1",
	"goto begin",
	"label end",
	"set-var Op1.Value = 0", 
	"set-var UnitFlags.Value -= "..unitFlags.UF_SuperweaponCharged, 
	"set-var Charge.Value -= 360", 
	"unbreakable end", "wait 1",},
})

DefineAnimations("animations-uac-wall", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 16", "wait 1",
	"label end", "wait 1",},
	Death = {
	"frame 16", "wait 1"},
})

DefineAnimations("animations-chaingun-tower", {
  Still = {"frame 0", "wait 4", "frame 0", "wait 1",},
  Attack = {"unbreakable begin",
	"if-var v_Precision.Value >= r_100 fire",
	"frame 5", "sound chaingun tower shot", "wait 2", "frame 0", "wait 2", "goto end",
	"label fire",
	"frame 5", "sound chaingun tower shot", "attack", "wait 2", "frame 0", "wait 2",
	"label end","unbreakable end", "wait 1",},
})

DefineAnimations("animations-rocket-tower", {
  Still = {"frame 0", "wait 4", "frame 0", "wait 1",},
  Attack = {"unbreakable begin", "frame 0", "attack", "sound missile launch","wait 32",
    "frame 0", "unbreakable end", "wait 1",},
})