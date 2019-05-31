-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-skulls-n-candles", {
  Still = {"frame 0", "wait 3", "frame 1", "wait 3"},
  Death = UnitStill,
})

UnitName = "unit-skulls-n-candles"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/skulls-n-candles.png", "size", {32, 33}},
  Animations = "animations-skulls-n-candles", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/skulls-n-candles-s.png", "size",{32, 33},"offset", {0, 0}},
  DrawLevel = 40,
  Offset = {0, -4},
  BoxOffset = {0, -4},
  TileSize = {1, 1}, BoxSize = {32, 33},
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