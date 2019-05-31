-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

UnitName = "unit-box3"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/box/box6.png", "size", {40, 40}},
  Animations = "animations-building", Icon = "icon-cancel",
  Shadow = {"file", "graphics/neutral/units/inside/box/box6-s.png", "size",{47, 28},"offset", {4, 5}},
  DrawLevel = 40,
  Offset = {0, -4},
  BoxOffset = {0, -4},
  TileSize = {1, 1}, BoxSize = {41, 41},
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