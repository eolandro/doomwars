--- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local ZombieTechnicianStill = {"frame 5", "wait 4", "random-goto 99 no-rotate", 
	"frame 10", "wait 4",
	"frame 15", "wait 4",
	"frame 0", "wait 4","random-rotate 1", 
	"label no-rotate", "wait 1",}
local ZombieTechnicianMove = {"unbreakable begin",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 4", "wait 1", 
	"frame 5", "move 4", "wait 2", 
    "frame 10", "move 4", "wait 1", 
	"frame 15", "move 4", "wait 2", 
	"frame 0", "move 4", "wait 1", 
	"frame 5", "move 4", "wait 2",
    "frame 10", "move 4", "wait 1", 
	"frame 15", "move 4", "wait 2","goto end",
	"label damaged50",
	"frame 0", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 2", 
	"frame 5", "move 3", "wait 1",
    "frame 10", "move 2", "wait 2", 
	"frame 10", "move 3", "wait 1",
	"frame 15", "move 2", "wait 2", 
	"frame 15", "move 3", "wait 1",
	"frame 0", "move 2", "wait 2", 
	"frame 5", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 3", "wait 1", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 1",
	"label end", "unbreakable end", "wait 1",}
local ZombieTechnicianDeath = {"unbreakable begin", 
	"exact-frame 20", "spawn-missile missile-bomber-explode 0 0 0 0 damage", 
	"spawn-missile missile-extreme-gibs 20 20 0 0 pixel", "wait 3",
	"exact-frame 21", "wait 3",
	"exact-frame 22", "wait 3",
	"exact-frame 23", "wait 3",
	"exact-frame 24", "wait 3",
	"exact-frame 25", "wait 3",
	"exact-frame 26", "wait 3",
	"exact-frame 27", "wait 3",
	"exact-frame 28", "wait 2000",
	"exact-frame 28", "unbreakable end", "wait 1",}

DefineAnimations("animations-zombie-technician", {
  Still = ZombieTechnicianStill,
  Move = ZombieTechnicianMove,
  Attack = {"unbreakable begin", 
  "frame 0", "rotate target", "wait 5", "rotate target", "wait 1",
  "label end","unbreakable end", "die selfkill", "wait 1",},
  Death = ZombieTechnicianDeath,
  Death_selfkill = ZombieTechnicianDeath,
  Death_fire = {"unbreakable begin","exact-frame 29","spawn-unit unit-burning 0 0 5 15","wait 100","unbreakable end","wait 1",}
})

UnitName = "unit-zombie-technician"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Former Technician"),
  -- Drawing
  Image = {"file", "graphics/hell/units/bomber.png", "size", {59, 59}},
  Animations = "animations-zombie-technician", Icon = "icon-zombie-bomber",
  Shadow = {"file", "graphics/hell/units/bomber-s.png", "size",{59, 59},"offset", {0, 0}},
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {33, 42}, BoxOffset = {0, 9},
  Flip = false, NumDirections = 8,
  Type = "land",
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
  PoisonDrain = 1,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  IsLightArmor = 1,
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
  Hell = true,
  Zombie = true,
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  -- Other
  RightMouseAction = "attack",
  PriorityTarget = {"organic", "only", "AirUnit", "false", "Mechanical", "only", "Building", "only"},
  OnEachSecond = UpdateVeteranStatus,
  Sounds = {
    "selected", "zombie sight",
    "acknowledge", "zombie move",
    "ready", "zombie sight",
    "help", "hell unit under attack",
    "dead", "vgavnonah"} } )