-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-big-door", {
  Still = {"exact-frame v_Op1.Value", "wait 1", 
  "if-var v_Op1.Value == 1 close", "goto end",
  "label close",
  "sound door-close",
  "set-var Op1.Value = 0",
  "label end",
  "wait 1"},
  Attack = {"unbreakable begin", 
  "if-var v_Op1.Value == 0 open",
  "exact-frame 1", "wait 1", "goto end",
  "label open",
  "sound door-open",
  "set-var Op1.Value = 1",
  "label end",
  "unbreakable end", "wait 1",},
  Death = UnitStill,
})

UnitName = "unit-big-door"
DefineUnitType(UnitName, { Name = "Big Door",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/door.png", "size", {64, 36}},
  Animations = "animations-big-door", Icon = "icon-cancel",
  DrawLevel = drawLevels.DL_MissileAirExp,
  Offset = {0, -0},
  BoxOffset = {0, -0},
  TileSize = {1, 1}, BoxSize = {64, 36},
  Flip = false, NumDirections = 1,
  Type = "fly",
  -- Properties
  HitPoints = 100,
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  MaxAttackRange = 2,
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