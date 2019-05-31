-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

UnitName = "unit-box1"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/box/box3.png", "size", {20, 20}},
  Animations = "animations-building", Icon = "icon-cancel",
  --Shadow = {"file", "graphics/neutral/units/inside/box/tech-pillar4-s.png", "size",{26, 70},"offset", {0, 0}},
  DrawLevel = 40,
  Offset = {0, 4},
  BoxOffset = {0, 4},
  TileSize = {1, 1}, BoxSize = {21, 21},
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