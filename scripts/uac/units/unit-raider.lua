-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local RaiderStill = {"set-var Repair.Value 0 0","frame 55", "wait 8", 
	"random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",}
local RaiderMove = {"unbreakable begin",
	"set-var Repair.Value 0 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 3", "wait 1",
	"frame 5", "move 3", "wait 1",
	"frame 10", "move 2", "wait 1",
	"frame 15", "move 3", "wait 1",
	"frame 20", "move 3", "wait 1",
	"frame 25", "move 2", "wait 1",
	"frame 30", "move 3", "wait 1",
	"frame 35", "move 3", "wait 1", 
	"frame 40", "move 2", "wait 1",
	"frame 45", "move 3", "wait 1",
	"frame 50", "move 3", "wait 1",
	"frame 55", "move 2", "wait 1", "goto end",
	"label damaged50",
	"frame 0", "move 3", "wait 2",
	"frame 5", "move 3", "wait 1",
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 3", "wait 1",
	"frame 20", "move 3", "wait 2",
	"frame 25", "move 2", "wait 1",
	"frame 30", "move 3", "wait 2",
	"frame 35", "move 3", "wait 1", 
	"frame 40", "move 2", "wait 2",
	"frame 45", "move 3", "wait 1",
	"frame 50", "move 3", "wait 1",
	"frame 55", "move 2", "wait 2",  
	"label end", "unbreakable end", "wait 1",}
local RaiderDeath = {"unbreakable begin", 
	"frame 0", "wait 4", 
	"unbreakable end", "wait 1",}

DefineAnimations("animations-raider", {
  Still = RaiderStill,
  Move = RaiderMove,
  Attack = {"unbreakable begin", 
  "set-var Repair.Value 0 1",
  "frame 60", "wait 7",
  "if-var v_Veterancy.Value != 4 normal",
  "frame 60", "spawn-missile missile-raider-laser 0 0 0 0 damage.totarget 1", "sound raider attack",
  "frame 60", "spawn-missile missile-raider-laser 0 0 0 0 damage.totarget 2", "sound raider attack", "wait 2",
  "goto reload",
  "label normal",
  "frame 60", "spawn-missile missile-raider-laser 0 0 0 0 damage.totarget v_Weapon.Value", "sound raider attack", "wait 2",
  "label reload",
  "frame 60", "wait 19", 
  "if-var v_Weapon.Value == 2 set1",
  "set-var Weapon.Value 0 2",
  "goto end",
  "label set1",
  "set-var Weapon.Value 0 1",
  "label end",
  "unbreakable end", "wait 1",},
  Death = RaiderDeath,
})

UnitName = "unit-raider"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Raider"),
  -- Drawing
  Image = {"file", "graphics/uac/units/raider.png", "size", {95, 95}},
  Shadow = {"file", "graphics/uac/units/raider-s.png", "size",{95, 95},"offset", {0, 0}},
  Animations = "animations-raider", Icon = "icon-raider",
  Type = "land",
  Flip = false, NumDirections = 8,
  MissileOffsets = {{{-9, -26}, {12, -28}, {24, -20}, {26, -5}, {12, 4}, {-6, 0}, {-19, -10}, {-22, -18}},
					{{11, -26}, {22, -19}, {23, -10}, {9, 0}, {-10, 5}, {-25, -4}, {-21, -19}, {-8, -24}}},
  TileSize = {1, 1}, BoxSize = {44, 44},
  BoxOffset = {0, -6},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
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
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-raider-laser",
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
  CanTargetAir = true,
  LandUnit = true,
  ShowArmor = true,
  BigUnit = true,
  SelectableByRectangle = true,
  -- Other
  OnHit = ResetSmoke,
  DeathExplosion = VehicleExplosion,
  OnEachSecond = UpdateVeteranStatus,
  OnEachCycle = SmokeControlRaider,
  RightMouseAction = "attack",
  PriorityTarget = {"organic", "only", "AirUnit", "false", "Mechanical", "only", "Building", "false"},
  Corpse = "unit-vehicle-explosion",
  Sounds = {
    "selected", "raider-selected",
    "acknowledge", "raider-acknowledge",
	"attack", "raider-attack",
    "ready", "raider-ready",
    "help", "uac unit under attack",
    "dead", "robot explode"} } )