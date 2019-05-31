UnitStill = {"frame 0", "wait 4", "random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",}
BuildingStill = {"frame 0", "wait 4", "frame 0", "wait 1",}

Load("scripts/uac/anim.lua")
Load("scripts/hell/anim.lua")

DefineAnimations("animations-building", {
  Still = BuildingStill,
  Research = BuildingStill,
  Train = BuildingStill,
  Upgrade = BuildingStill,
})

DefineAnimations("animations-civilian-building", {
  Still = {"if-var v_HitPoints.Percent <= 50 damaged50",
	"frame 0", "wait 1", "goto end",
	"label damaged50",
	"frame 1", "wait 1",
	"label end",
	}
})

DefineAnimations("animations-lava-spawner", {
  Still = {"frame 0", "random-wait 60 250", "frame 0", "spawn-missile missile-lava-ball 0 0 0 0 pixel","frame 0", "wait 1", },
})

DefineAnimations("animations-mineral-mine", {
  Still = {"frame 0", "random-wait 3800 5000", "frame 0", "spawn-unit unit-mineral-piece 0 0 3 15","frame 0", "wait 1", },
  Research = BuildingStill,
  Train = BuildingStill,
  Upgrade = BuildingStill,
})

DefineAnimations("animations-mineral-piece", {
  Still = {
	"exact-frame 0",
    "set-var Op1.Value 0 r_0.5",
	"set-var Op2.Value 0 v_Op1.Value",
    "label normal",
	"exact-frame v_Op2.Value", "wait 30", "goto normal",
	"label end"},
  Death = {"unbreakable begin","frame v_Op2.Value", "wait 4", "frame v_Op2.Value", "unbreakable end", "wait 1",}
})

DefineAnimations("animations-burning", {
  Still = {"frame 0", "wait 2", "frame 1", "wait 2", "frame 2", "wait 2", "frame 3", "wait 2", "frame 4", "wait 2",
  "frame 5", "wait 2","frame 6", "wait 2","frame 7", "wait 2","frame 8", "wait 2","frame 9", "wait 2","frame 10", "wait 2",
  "frame 11", "wait 2","frame 12", "wait 2","frame 13", "wait 2","frame 14", "wait 2","frame 15", "wait 2","frame 16", "wait 2",
  "frame 17", "wait 2","frame 18", "wait 2","frame 19", "wait 2","frame 20", "wait 2","frame 21", "wait 200", "frame 21","die","wait 2"},
   Death = {"unbreakable begin", "frame 21",  "wait 4","frame 21","unbreakable end", "wait 1",}
})

DefineAnimations("animations-destroyed-place", {
  Death = {"unbreakable begin", "frame 0", "wait 300", "frame 1", "wait 300", "frame 1", "unbreakable end", "wait 1", },
})

DefineAnimations("animations-destroyed-vehicle", {
  Death = {"unbreakable begin", "frame 0", "wait 400", "frame 1", "wait 400", "frame 1", "unbreakable end", "wait 1", },
})

DefineAnimations("animations-barrel", {
  Still = {
	"frame 0", "wait 4", "frame 1", "wait 4", },
  Death = {"unbreakable begin", "frame 2", "wait 3", "frame 3", "wait 3",
	"spawn-missile missile-barrel-death 0 0 0 0 damage", "sound rocket explode", "frame 4", "wait 3",
	"frame 5", "wait 3", "frame 6", "wait 3", "unbreakable end", "wait 1",}
})

DefineAnimations("animations-barrels", {
  Still = {
	"frame 0", "wait 4", "frame 1", "wait 4", },
  Death = {"unbreakable begin", "frame 2", "wait 3", "frame 3", "wait 3",
	"spawn-missile missile-barrels-death 0 0 0 0 damage", "sound rocket explode", "frame 4", "wait 3",
	"frame 5", "wait 3", "frame 6", "wait 3", "unbreakable end", "wait 1",}
})

DefineAnimations("animations-hell-fountain", {
  Still = {"frame 0", 
  "label begin", "if-var v_Arg1.Value == 0 die", 
  "frame 0", "wait 3", "spawn-missile missile-fountain-ball 0 0 r_-3.3 r_-3.3 damage", "spawn-missile missile-fountain-ball 0 0 r_-3.3 r_-3.3 damage",
  "frame 1", "wait 3", "spawn-missile missile-fountain-ball 0 0 r_-3.3 r_-3.3 damage", "spawn-missile missile-fountain-ball 0 0 r_-3.3 r_-3.3 damage",
  "frame 2", "wait 3", "spawn-missile missile-fountain-ball 0 0 r_-3.3 r_-3.3 damage", "spawn-missile missile-fountain-ball 0 0 r_-3.3 r_-3.3 damage",
  "set-var Arg1.Value -= 6",
  "goto begin",
  "label die",
  "frame 0", "die", "wait 2",},
   Death = {"unbreakable begin", "frame 3",  "wait 3", 
   "spawn-missile missile-demonic-storm-explode 0 0 0 0 damage",
   "spawn-missile missile-demonic-storm-explode 0 0 0 0 damage",
   "spawn-missile missile-demonic-storm-explode 0 0 0 0 damage",
   "spawn-missile missile-demonic-storm-explode 0 0 0 0 damage",
   "spawn-missile missile-demonic-storm-explode 0 0 0 0 damage",
   "spawn-missile missile-demonic-storm-explode 0 0 0 0 damage",
   "frame 4", "wait 3", "frame 5", "wait 3",
    "frame 6", "wait 3", "frame 7", "wait 3", "frame 8", "wait 3",
   "frame 8","unbreakable end", "wait 1",}
})