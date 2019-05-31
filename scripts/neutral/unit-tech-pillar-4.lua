-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-tech-pillar4", {
  Still = {"frame 0", "wait 3", "frame 1", "wait 3", "frame 2", "wait 3", "frame 3", "wait 3"},
  Death = UnitStill,
})

UnitName = "unit-tech-pillar4"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/tech-pillar4.png", "size", {20, 70}},
  Animations = "animations-tech-pillar4", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/tech-pillar4-s.png", "size",{26, 70},"offset", {6, 2}},
  DrawLevel = 40,
  Offset = {0, -18},
  BoxOffset = {0, -18},
  TileSize = {1, 1}, BoxSize = {21, 71},
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