-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-5skulls", {
  Still = UnitStill,
  Death = UnitStill,
})

UnitName = "unit-5skulls"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/5skulls.png", "size", {26, 42}},
  Animations = "animations-5skulls", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/5skulls-s.png", "size",{26, 42},"offset", {0, 0}},
  DrawLevel = 40,
  Offset = {0, -8},BoxOffset = {0, -10},
  TileSize = {1, 1}, BoxSize = {26, 42},
  Flip = false, NumDirections = 1,
  Type = "land",
  -- Properties
  HitPoints = 100,
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  IsHeavyBuildingArmor = 1,
  Points = 0,
  -- Flags
  Indestructible = 1,
  VisibleUnderFog = true,
  IsNotSelectable = true,
  Decoration = true,
  Building = true,
  -- Other
  Sounds = {} } )