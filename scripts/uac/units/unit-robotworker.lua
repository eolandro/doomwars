-- Some variables to make calculations much easier
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3
local UnitName

DefineAnimations("animations-robotworker", {
  Still = {"set-var Repair.Value 0 0","frame 0", "wait 4", 
	"random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1"},
  Move = {"unbreakable begin", 
	"set-var Repair.Value 0 1",
	"frame 0", "move 3", "wait 1",
	"frame 5", "move 3", "wait 1",
    "frame 5", "move 2", "wait 1",
	"frame 10", "move 3", "wait 1",
    "frame 15", "move 3", "wait 1",
	"frame 15", "move 2", "wait 1",
    "frame 20", "move 3", "wait 1",
	"frame 25", "move 3", "wait 1",
    "frame 25", "move 2", "wait 1",
	"frame 30", "move 3", "wait 1",
    "frame 35", "move 3", "wait 1",
	"frame 35", "move 2", "unbreakable end", "wait 1",},
  Attack = {"unbreakable begin", 
	"set-var Repair.Value 0 1",
	"frame 40", "wait 3", 
	"frame 40", "attack", "sound electro","wait 1", 
	"frame 45", "wait 3", 
	"frame 50", "wait 3", 
	"frame 0", "wait 10", 
	"unbreakable end", "wait 1",},
  Harvest_minerals = {"unbreakable begin", 
	"set-var Repair.Value 0 1",
	"frame 40", "wait 3", 
	"frame 40", "sound electro","wait 1", 
	"frame 45", "wait 3", 
	"frame 50", "wait 3", 
	"unbreakable end", "wait 1",},
  Build = {"unbreakable begin", 
	"set-var Repair.Value 0 1",
	"frame 40", "wait 3", 
	"frame 40", "sound electro", "wait 1", 
	"frame 45", "wait 3", 
	"frame 50", "wait 3", 
	"unbreakable end", "wait 1",},
  Repair = {"unbreakable begin", 
	"set-var Repair.Value 0 1",
	"frame 40", "wait 3", 
	"frame 40", "sound electro","wait 1", 
	"frame 45", "wait 3", 
	"frame 50", "wait 3", 
	"unbreakable end", "wait 1",},
  Death = {"unbreakable begin", 
	"frame 0", "wait 1", 
	"unbreakable end", "wait 1",},
})

UnitName = "unit-robotworker"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Worker Robot"),
  -- Drawing
  Image = {"file", "graphics/uac/units/worker.png", "size", {56, 56}},
  Shadow = {"file", "graphics/uac/units/worker-s.png", "size",{56, 56}},
  Offset = {0, -12},
  TileSize = {1, 1}, BoxSize = {28, 40},
  Animations = "animations-robotworker", Icon = "icon-robotworker",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  Flip = false, NumDirections = 8,
  Type = "land",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Points = UnitInfo(UnitName, const.Unit_Points),
  PoisonDrain = 1,
  AutoRepairRange = 8,
  Priority = 10,
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  RepairRange = 1,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
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
  SelectableByRectangle = true,
  CanAttack = true,
  CanTargetLand = true,
  Coward = true,
  ShowArmor = true,
  CanTargetAir = false,
  Mechanical = true,
  LandUnit = true,
  UAC = true,
  -- Other
  DeathExplosion = SmallVehicleExplosion,
  OnEachSecond = UpdateVeteranStatus,
  RightMouseAction = "harvest",
  CanGatherResources = {
   {"file-when-loaded", "graphics/uac/units/worker.png",
    "resource-id", "minerals",
	"harvest-from-outside",
     "resource-capacity", 100,
    "resource-step", 5,
    "wait-at-resource", 8,
    "wait-at-depot", 100}},
  Sounds = {
    "selected", "worker-selected",
    "acknowledge", "worker-acknowledge",
	"attack", "worker-attack",
	"repair", "worker-repair",
	"build", "worker-build",
	"harvest", "minerals", "worker-harvest",
    "ready", "worker-ready",
    "help", "uac worker under attack",
    "dead", "rocket explode"} } )