-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-column-with-heart", {
  Still = {"frame 0", "wait 3", "frame 1", "wait 3",},
  Death = UnitStill,
})

UnitName = "unit-column-with-heart"
DefineUnitType(UnitName, { Name = "Blue big firestick",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/column-with-heart.png", "size", {26, 32}},
  Animations = "animations-column-with-heart", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/column-with-heart-s.png", "size",{28, 32},"offset", {3, -2}},
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {26, 32},
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