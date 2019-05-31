-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local PlaneStill = {"set-var Repair.Value 0 0","frame 0", "wait 8", 
	"random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",}
local PlaneMove = {"unbreakable begin",
	"set-var Repair.Value 0 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 2",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 2", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 1", "goto end",
	"label damaged50",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 2",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 2", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 2", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 4", "wait 2", 
	"label end", "unbreakable end", "wait 1",}
local PlaneDeath = {"unbreakable begin", 
	"frame 5", "wait 2", 
	"frame 10", "wait 2", 
	"frame 15", "wait 2", 
	"frame 20", "wait 2",
	"frame 25", "wait 2", 
	"frame 30", "wait 2", 
	"unbreakable end", "wait 1",}
	
DefineAnimations("animations-uac-plane", {
  Still = PlaneStill,
  Move = PlaneMove,
  Attack = {"unbreakable begin",
  "set-var Repair.Value 0 1",
  "if-var g_Building == 0 normal",
  "if-var v_Veterancy.Value != 4 normal",
  "frame 0", "wait 7",
  "set-var LightArmorDamage.Value 0 v_LightArmorDamage3.Value",
  "set-var CombatArmorDamage.Value 0 v_CombatArmorDamage3.Value",
  "set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage3.Value",
  "set-var FleshArmorDamage.Value 0 v_FleshArmorDamage3.Value",
  "set-var HeavyFleshArmorDamage.Value 0 v_HeavyFleshArmorDamage3.Value",
  "set-var AirFleshArmorDamage.Value 0 v_AirFleshArmorDamage3.Value",
  "set-var MechanicalArmorDamage.Value 0 v_MechanicalArmorDamage3.Value",
  "set-var AirMechanicalArmorDamage.Value 0 v_AirMechanicalArmorDamage3.Value",
  "set-var BuildingArmorDamage.Value 0 v_BuildingArmorDamage3.Value",
  "set-var HeavyBuildingArmorDamage.Value 0 v_HeavyBuildingArmorDamage3.Value",
  "set-var CursedArmorDamage.Value 0 v_CursedArmorDamage3.Value",
  "frame 0", "wait 7", "frame 0",
  "spawn-missile missile-fighter-superlaser 0 0 0 0 damage.totarget", "frame 0", "wait 45", "goto end",
  "label normal",
  "set-var LightArmorDamage.Value 0 v_LightArmorDamage2.Value",
  "set-var CombatArmorDamage.Value 0 v_CombatArmorDamage2.Value",
  "set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage2.Value",
  "set-var FleshArmorDamage.Value 0 v_FleshArmorDamage2.Value",
  "set-var HeavyFleshArmorDamage.Value 0 v_HeavyFleshArmorDamage2.Value",
  "set-var AirFleshArmorDamage.Value 0 v_AirFleshArmorDamage2.Value",
  "set-var MechanicalArmorDamage.Value 0 v_MechanicalArmorDamage2.Value",
  "set-var AirMechanicalArmorDamage.Value 0 v_AirMechanicalArmorDamage2.Value",
  "set-var BuildingArmorDamage.Value 0 v_BuildingArmorDamage2.Value",
  "set-var HeavyBuildingArmorDamage.Value 0 v_HeavyBuildingArmorDamage2.Value",
  "set-var CursedArmorDamage.Value 0 v_CursedArmorDamage2.Value",
  "frame 0", "wait 7", "frame 0",
  "attack", "frame 0", "wait 25",
  "label end",
   "unbreakable end", "wait 1",},
  Death = PlaneDeath,
})

DefineAnimations("animations-fighter-exp", {
  Death = {"unbreakable begin", 
  "exact-frame 0", "wait 2", 
  "exact-frame 1", "wait 2", 
  "exact-frame 2", "wait 2", 
  "exact-frame 3", "wait 2",
   "exact-frame 4", "wait 2",
   "exact-frame 5", "wait 2",
   "exact-frame 6", "wait 2",
   "exact-frame 7", "wait 2",
   "exact-frame 8", "wait 2",  
   "exact-frame 9", "wait 2",
   "exact-frame 10", "wait 2",
   "exact-frame 11", "wait 2",
   "exact-frame 12", "wait 2",
   "exact-frame 13", "wait 2",
   "exact-frame 14", "wait 2",
   "exact-frame 15", "wait 2",
   "unbreakable end", "wait 1",},
})

UnitName = "unit-uac-fighter"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
BaseDamage2 = UnitInfo(UnitName, const.Unit_BaseDmg2)
DamageType2 = UnitInfo(UnitName, const.Unit_DamageType2)
DefineUnitType(UnitName, { Name = _("Fighter"),
  -- Drawing
  Image = {"file", "graphics/uac/units/uac-fighter.png", "size", {84, 84}},
  Offset = {0, 0},
  Shadow = {"file", "graphics/uac/units/uac-fighter-s.png", "size",{84, 84},"offset", {30, 25}},
  Animations = "animations-uac-plane", Icon = "icon-uac-plane",
  TileSize = {1, 1}, BoxSize = {56, 45}, BoxOffset = {0, -8},
  Type = "fly",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  MissileOffsets = {{{0, -18}, {5, -16}, {3, -14}, {10, -10}, {0, 0}, {-5, -7}, {-3, -10}, {-1, -14}}},
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
  CanCastSpell = {"spell-fighter-invisibility"},
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-fighter-laser",
  IsAirMechanicalArmor = 1,
  BaseDamage = BaseDamage,

  LightArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 1),
  CombatArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 2),
  HeavyArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 3),
  
  FleshArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 4),
  HeavyFleshArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 5),
  AirFleshArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 6),
  
  MechanicalArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 7),
  AirMechanicalArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 8),
  
  BuildingArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 9),
  HeavyBuildingArmorDamage2 = GetArmorDamage(BaseDamage, DamageType, 10),
  
  CursedArmorDamage2 = GetCursedDamage(BaseDamage),
  
  LightArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 1),
  CombatArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 2),
  HeavyArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 3),
  
  FleshArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 4),
  HeavyFleshArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 5),
  AirFleshArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 6),
  
  MechanicalArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 7),
  AirMechanicalArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 8),
  
  BuildingArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 9),
  HeavyBuildingArmorDamage3 = GetArmorDamage(BaseDamage2, DamageType2, 10),
  
  CursedArmorDamage3 = GetCursedDamage(BaseDamage2),
  ---------------------- 
  -- Flags
  UAC = true,
  CanAttack = true,
  Mechanical = true,
  ShowArmor = true,
  CanTargetAir = true,
  CanTargetLand = true,
  AirUnit = true,
  SelectableByRectangle = true,
  -- Other
  PriorityTarget = {"Building", "false"},
  OnHit = ResetSmoke,
  DeathExplosion = VehicleExplosion,
  OnEachSecond = UpdateVeteranStatus,
  OnEachCycle = SmokeControlFighter,
  Corpse = "unit-fighter-exp",
  RightMouseAction = "attack",
  Sounds = {
    "selected", "uacfighter-selected",
    "acknowledge", "uacfighter-acknowledge",
    "ready", "uacfighter-ready",
	"attack", "uacfighter-attack",
    "help", "uac unit under attack",
    "dead", "robot explode"} } )

DefineUnitType("unit-fighter-exp", { Name = "Fighter Exp",
  Image = {"file", "graphics/missiles/rocket-exp2.png", "size", {64, 64}},
  Animations = "animations-fighter-exp", Icon = "icon-cancel",
  HitPoints = 255,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Vanishes = true,
  IsNotSelectable = true,
  Sounds = {} } )