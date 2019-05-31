-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3
local UnitName

local CrusherStill = {"set-var Repair.Value 0 0","frame 0", "wait 8", 
	"random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",}
local CrusherMove = {"unbreakable begin",
	"set-var Repair.Value 0 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 3", "wait 1", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 1", 
	"frame 0", "move 3", "wait 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 1", 
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 1", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 1",
	"frame 0", "move 3", "wait 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 2", "wait 1", "goto end",
	"label damaged50",
	"frame 0", "move 3", "wait 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 2",
	"frame 0", "move 3", "wait 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 2", "spawn-missile missile-tank-track 0 0 0 0 pixel.setdirection 3",
	"frame 0", "move 2", "wait 2", 
	"label end", "unbreakable end", "wait 1",}
local CrusherDeath = {"unbreakable begin", 
	"frame 0", "wait 4", 
	"unbreakable end", "wait 1",}

DefineAnimations("animations-crusher", {
  Still = CrusherStill,
  Move = CrusherMove,
  Attack = {"unbreakable begin", 
  "set-var Repair.Value 0 1",
  "frame 0", "wait 7",
  "if-var v_Veterancy.Value != 4 normal",
  "frame 5", "attack", "sound cannon shot", "wait 2",
  "frame 10", "wait 3", 
   "frame 5", "attack", "sound cannon shot", "wait 2",
  "frame 10", "wait 3", 
  "frame 0", "wait 32", 
  "goto end",
  "label normal",
  "frame 5", "attack", "sound cannon shot", "wait 2",
  "frame 10", "wait 2", 
  "frame 0", "wait 24", 
  "label end",
  "unbreakable end", "wait 1",},
  Death = CrusherDeath,
})

DefineAnimations("animations-crusher-upgraded", {
  Still = CrusherStill,
  Move = CrusherMove,
  Attack = {"unbreakable begin", "frame 0",
  "set-var Repair.Value 0 1",
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
  "frame 0", "wait 7",
  "frame 0", "if-var g_AirUnit != 0 air1",
  "if-var v_Veterancy.Value != 4 normal",
  "frame 5", "attack", "sound cannon shot", "wait 2",
  "frame 10", "wait 3", 
   "frame 5", "attack", "sound cannon shot", "wait 2",
  "frame 10", "wait 3", 
  "frame 0", "wait 20", 
  "goto end",
  "label normal",
  "frame 5", "attack", "sound cannon shot", "wait 2",
  "frame 10", "wait 2", 
  "frame 0", "wait 14", 
  "label end",
  "label air1",
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
  "frame 15", "spawn-missile missile-crusher-missile 0 0 0 0 damage.totarget 4", "wait 7",
  "frame 20", "spawn-missile missile-crusher-missile 0 0 0 0 damage.totarget 5", "wait 31",
  "frame 0", "wait 2", 
  "unbreakable end", "wait 1",},
  Death = CrusherDeath,
})

UnitName = "unit-crusher"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Crusher"),
  -- Drawing
  Image = {"file", "graphics/uac/units/crusher.png", "size", {100, 100}},
  Animations = "animations-crusher", Icon = "icon-crusher",
  Shadow = {"file", "graphics/uac/units/crusher-s.png", "size",{100, 100}},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  Flip = false, NumDirections = 8,
  Type = "land",
  TileSize = {1, 1}, BoxSize = {72, 48},
  MissileOffsets = {{{0, -25}, {30, -20}, {44, -2}, {32, 16}, {-8, 20}, {-38, 5}, {-50, -8}, {-36, -36}},
					{{0, 32}, {-10, 20}, {-18, 18}, {10, 4}, {32, 8}, {40, 14}, {40, 26}, {18, 25}},
					{{32, 32}, {16, 30}, {-10, 28}, {-10, 16}, {0, 8}, {22, 10}, {40, 16}, {36, 15}}},
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
  BoardSize = 2,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-crusher-shell",
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
  -- Other
  Corpse = "unit-vehicle-explosion",
  PriorityTarget = {"organic", "false", "AirUnit", "false", "HeavyFlesh", "only", "Mechanical", "only", "Building", "only"},
  RightMouseAction = "attack",
  OnHit = ResetSmoke,
  DeathExplosion = VehicleExplosion,
  OnEachSecond = UpdateVeteranStatus,
  OnEachCycle = SmokeControlCrusher,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "crusher-selected",
    "acknowledge", "crusher-acknowledge",
	"attack", "crusher-attack",
    "ready", "crusher-ready",
    "help", "uac unit under attack",
    "dead", "robot explode"} } )

UnitName = "unit-crusher-upgraded"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
BaseDamage2 = UnitInfo(UnitName, const.Unit_BaseDmg2)
DamageType2 = UnitInfo(UnitName, const.Unit_DamageType2)
DefineUnitType(UnitName, { Name = _("Crusher with Missile Launcher"),
  -- Drawing
  Image = {"file", "graphics/uac/units/crusher-upgraded.png", "size", {100, 100}},
  Animations = "animations-crusher-upgraded", Icon = "icon-crusher-upgraded",
  Shadow = {"file", "graphics/uac/units/crusher-s.png", "size",{100, 100}},
  Offset = {0, 0},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {80, 52},
  MissileOffsets = {{{0, -25}, {30, -20}, {44, -2}, {32, 16}, {-8, 20}, {-38, 5}, {-50, -8}, {-36, -36}},
					{{0, 32}, {-10, 20}, {-18, 18}, {10, 4}, {32, 8}, {40, 14}, {40, 26}, {16, 25}},
					{{32, 32}, {16, 30}, {-10, 28}, {-10, 16}, {0, 8}, {22, 10}, {40, 16}, {34, 15}},
					{{-3, 0}, {-9, -24}, {-21, -17}, {-4, -22}, {4, -19}, {16, -22}, {22, -17}, {2, -17}},
					{{3, 0}, {0, -20}, {-21, -14}, {-16, -22}, {-2, -15}, {12, -25}, {22, -22}, {12, -20}}},
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
  Demand = 1,
  BoardSize = 2,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-crusher-shell",
  IsMechanicalArmor = 1,
  BaseDamage = BaseDamage,
  BaseDamage2 = BaseDamage2,

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
  Mechanical = true,
  CanAttack = true,
  CanTargetLand = true,
  CanTargetAir = true,
  LandUnit = true,
  ShowArmor = true,
  BigUnit = true,
  SelectableByRectangle = true,
  OnHit = ResetSmoke,
  -- Other
  Corpse = "unit-vehicle-explosion",
  PriorityTarget = {"organic", "false", "AirUnit", "only", "HeavyFlesh", "only", "Mechanical", "only", "Building", "only"},
  RightMouseAction = "attack",
  DeathExplosion = VehicleExplosion,
  OnEachCycle = SmokeControlCrusher,
  OnEachSecond = UpdateVeteranStatus,
  
  Sounds = {
    "selected", "crusher-selected",
    "acknowledge", "crusher-acknowledge",
	"attack", "crusher-attack",
    "ready", "crusher-ready",
    "help", "uac unit under attack",
    "dead", "robot explode"} } )