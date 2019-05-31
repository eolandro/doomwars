-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-blue-key", {
  Still = {"exact-frame 0",  "wait 9", "exact-frame 1",  "wait 9", },
  Attack = {"unbreakable begin", 
  "exact-frame 1", "wait 1", 
  "unbreakable end", "die", "wait 1",},
  Death = BuildingStill,
})

UnitName = "unit-blue-key"
DefineUnitType(UnitName, { Name = "Blue Key",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/blue-key.png", "size", {12, 14}},
  Animations = "animations-blue-key", Icon = "icon-cancel",
  DrawLevel = 40,
  Offset = {0, -0},
  BoxOffset = {0, -0},
  TileSize = {1, 1}, BoxSize = {12, 14},
  Flip = false, NumDirections = 1,
  Type = "land",
  -- Properties
  Arg3 = 0,
  HitPoints = 100,
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  MaxAttackRange = 0,
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
  NonSolid = true,
  -- Other
  Sounds = {} } )