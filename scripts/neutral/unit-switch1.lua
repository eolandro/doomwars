-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-switch1", {
  Still = {"exact-frame v_Op1.Value",
  "wait 1"},
  Attack = {"unbreakable begin", 
  "if-var v_Op1.Value == 0 open",
  "exact-frame 1", "wait 1", "goto end",
  "label open",
  "sound switch-activate",
  "set-var Op1.Value = 1",
  "label end",
  "unbreakable end", "wait 1",},
})

UnitName = "unit-switch1"
DefineUnitType(UnitName, { Name = "Switch1",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/switch1.png", "size", {64, 64}},
  Shadow = {"file", "graphics/neutral/units/inside/switch1-s.png", "size",{72, 64}, "offset", {3, 3}},
  Animations = "animations-switch1", Icon = "icon-cancel",
  DrawLevel = 40,
  Offset = {0, -0},
  BoxOffset = {0, -0},
  TileSize = {2, 1}, BoxSize = {64, 64},
  Flip = false, NumDirections = 1,
  Type = "land",
  -- Properties
  Arg3 = 0,
  HitPoints = 100,
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 0,
  IsHeavyBuildingArmor = 1,
  Points = 0,
  -- Flags
  Indestructible = 1,
  VisibleUnderFog = true,
  IsNotSelectable = true,
  CanAttack = true,
  CanTargetLand = true,
  AirUnit = true,
  -- Other
  Sounds = {} } )