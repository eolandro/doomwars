-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-candelabra", {
  Still = {"frame 0", "wait 4", "frame 0", "wait 1"},
  Death = UnitStill,
})

UnitName = "unit-candelabra"
DefineUnitType(UnitName, { Name = "Candelabra",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/candelabra.png", "size", {24, 50}},
  Animations = "animations-candelabra", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/candelabra-s.png", "size",{26, 50},"offset", {2, 0}},
  DrawLevel = 40,
  Offset = {0, -10},
  BoxOffset = {0, -10},
  TileSize = {1, 1}, BoxSize = {24, 50},
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