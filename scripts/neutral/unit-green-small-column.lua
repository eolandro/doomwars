-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-green-small-column", {
  Still = {"frame 0", "wait 4", "frame 0", "wait 1"},
  Death = UnitStill,
})

UnitName = "unit-green-small-column"
DefineUnitType(UnitName, { Name = "green-small-column",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/green-small-column.png", "size", {24, 27}},
  Animations = "animations-green-small-column", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/green-small-column-s.png", "size",{24, 27},"offset", {4, -1}},
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {24, 27},
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