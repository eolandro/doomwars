-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-tech-pillar", {
  Still = {"frame 0", "wait 3", "frame 0", "wait 3"},
  Death = UnitStill,
})

UnitName = "unit-tech-pillar"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/tech-pillar.png", "size", {19, 64}},
  Animations = "animations-tech-pillar", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/tech-pillar-s.png", "size",{27, 64},"offset", {3, 1}},
  DrawLevel = 40,
  Offset = {0, -16},
  BoxOffset = {0, -16},
  TileSize = {1, 1}, BoxSize = {20, 65},
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