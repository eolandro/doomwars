-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local ThorStill = {"set-var Repair.Value 0 0","frame 0", "wait 8", 
	"random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",}
local ThorMove = {"unbreakable begin",
	"set-var Repair.Value 0 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 2", "wait 2",
	"goto end",
	"label damaged50",
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 3",
	"frame 0", "move 3", "wait 3", 
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 3", 
	"frame 0", "move 3", "wait 3", 
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 3",
	"frame 0", "move 3", "wait 3", 
	"frame 0", "move 3", "wait 3", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 2", "wait 3", 
	"label end", "unbreakable end", "wait 1",}
local ThorDeath = {"unbreakable begin", 
	"frame 0", "wait 4",
	"unbreakable end", "wait 1",}

DefineAnimations("animations-thor", {
  Still = ThorStill,
  Move = ThorMove,
  Attack = {"unbreakable begin", 
  "set-var Repair.Value 0 1",
  "frame 0", "wait 7",
  "if-var v_Veterancy.Value != 4 normal",
  "frame 0", "wait 7",
  "frame 5", "attack", "attack", "sound railgun attack", "wait 3",
  "frame 10", "wait 2", 
  "frame 0", "wait 42", 
  "goto end",
  "label normal",
  "frame 5", "attack", "sound railgun attack", "wait 3",
  "frame 10", "wait 2", 
  "frame 0", "wait 37", 
  "label end",
  "unbreakable end", "wait 1",},
  Death = ThorDeath,
})

UnitName = "unit-thor"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Thor"),
  -- Drawing
  Image = {"file", "graphics/uac/units/thor.png", "size", {130, 130}},
  Animations = "animations-thor", Icon = "icon-thor",
  Shadow = {"file", "graphics/uac/units/thor-s.png", "size",{130, 130}},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  Offset = {0, -8},
  TileSize = {1, 1}, BoxSize = {92, 56},
  MissileOffsets = {{{0, -40}, {36, -27}, {40, -10}, {35, 4}, {0, 16}, {-35, 3}, {-34, -8}, {-29, -28}},
					{{0, 36}, {-20, 26}, {-24, 18}, {4, 4}, {32, 2}, {44, 20}, {40, 32}, {28, 35}},
					{{32, 36}, {6, 36}, {-16, 35}, {-16, 16}, {0, 0}, {24, 16}, {40, 16}, {44, 25}}},
  Type = "land",
  Flip = false, NumDirections = 8,
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  DamageType = "extreme",
  OnHit = ResetSmoke,
  BoardSize = 3,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-thor-rail",
  IsMechanicalArmor = 1,
  BaseDamage = BaseDamage,

  LightArmorDamage = GetArmorDamage(BaseDamage, DamageType, 1),
  CombatArmorDamage = GetArmorDamage(BaseDamage, DamageType, 2),
  HeavyArmorDamage = GetArmorDamage(BaseDamage, DamageType, 3),
  
  FleshArmorDamage = GetArmorDamage(BaseDamage, DamageType, 4),
  HeavyFleshArmorDamage = GetArmorDamage(BaseDamage, DamageType, 5),
  AirFleshArmorDamage = GetArmorDamage(BaseDamage, DamageType, 6),
  
  MechanicalArmorDamage = GetArmorDamage(BaseDamage, DamageType, 7),
  AirMechanicalArmorDamage = GetArmorDamage(BaseDamage, DamageType, 8),
  
  BuildingArmorDamage = GetArmorDamage(BaseDamage, DamageType, 9),
  HeavyBuildingArmorDamage = GetArmorDamage(BaseDamage, DamageType, 10),
  
  CursedArmorDamage = GetCursedDamage(BaseDamage),
  ----------------------
  -- Flags
  UAC = true,
  Mechanical = true,
  CanAttack = true,
  CanTargetLand = true,
  CanTargetAir = false,
  LandUnit = true,
  ShowArmor = true,
  BigUnit = true,
  SelectableByRectangle = true,
  -- Other
  Corpse = "unit-vehicle-explosion",
  PriorityTarget = {"organic", "only", "AirUnit", "false", "Mechanical", "only", "Building", "only"},
  DeathExplosion = VehicleExplosion,
  OnEachSecond = UpdateVeteranStatus,
  OnEachCycle = SmokeControlThor,
  RightMouseAction = "attack",
  Sounds = {
    "selected", "thor-selected",
    "acknowledge", "thor-acknowledge",
	"attack", "thor-attack",
    "ready", "thor-ready",
    "help", "uac unit under attack",
    "dead", "robot explode"} } )