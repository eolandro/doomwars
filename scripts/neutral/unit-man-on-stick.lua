-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-man-on-stick", {
  Still = {"frame 0", "wait 3", "frame 1", "wait 3"},
  Death = UnitStill,
})

UnitName = "unit-man-on-stick"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/man-on-stick.png", "size", {26, 45}},
  Animations = "animations-man-on-stick", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/man-on-stick-s.png", "size",{30, 45},"offset", {0, 0}},
  DrawLevel = 40,
  Offset = {0, -10},
  BoxOffset = {0, -10},
  TileSize = {1, 1}, BoxSize = {26, 45},
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