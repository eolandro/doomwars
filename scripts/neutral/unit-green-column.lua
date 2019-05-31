-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-green-column", {
  Still = {"frame 0", "wait 4", "frame 0", "wait 1"},
  Death = UnitStill,
})

UnitName = "unit-green-column"
DefineUnitType(UnitName, { Name = "green-column",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/green-column.png", "size", {26, 39}},
  Animations = "animations-green-column", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/green-column-s.png", "size",{27, 39},"offset", {7, 0}},
  DrawLevel = 40,
  Offset = {0, -5},
  BoxOffset = {0, -5},
  TileSize = {1, 1}, BoxSize = {26, 39},
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