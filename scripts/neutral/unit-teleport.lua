-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

-- Animations
DefineAnimations("animations-teleporter", {
  Still = {"frame 0", "wait 3"},
  Death = UnitStill,
})

UnitName = "unit-teleporter"
DefineUnitType(UnitName, { Name = "5 Skulls",
  -- Drawing
  Image = {"file", "graphics/neutral/units/inside/teleport.png", "size", {36, 18}},
  Animations = "animations-teleporter", Icon = "icon-cancel",
  DrawLevel = 5,
  Offset = {0, 16},
  BoxOffset = {0, 16},
  TileSize = {1, 1}, BoxSize = {37, 19},
  Flip = false, NumDirections = 1,
  Type = "land",
  -- Properties
  HitPoints = 100,
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  IsHeavyBuildingArmor = 1,
  Points = 0,
  TeleportEffectIn = ParticleTeleportFlashOnGate,
  TeleportEffectOut = ParticleTeleportFlashOnGate,
  -- Flags
  Indestructible = 1,
  VisibleUnderFog = true,
  Building = true,
  NonSolid = true,
  Teleporter = true,
  -- Other
  Sounds = {} } )