-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-blue-big-firestick", {
  Still = {"frame 0", "wait 3", "frame 1", "wait 3", "frame 2", "wait 3", "frame 3", "wait 3"},
  Death = UnitStill,
})

UnitName = "unit-blue-big-firestick"
DefineUnitType(UnitName, { Name = "Blue big firestick",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/blue-big-firestick.png", "size", {20, 74}},
  Animations = "animations-blue-big-firestick", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/blue-big-firestick-s.png", "size",{20, 74},"offset", {3, -4}},
  DrawLevel = 40,
  Offset = {0, -32}, BoxOffset = {0, -32},
  TileSize = {1, 1}, BoxSize = {20, 74},
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