-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

DefineAnimations("animations-lostsoul", {
  Still = {"frame 0", "wait 4", "frame 5", "wait 4", "random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",},
  Move = {"unbreakable begin", 
  "frame 0", "move 3", "wait 1", 
  "frame 0", "move 3", "wait 1",
  "frame 5", "move 3", "wait 1", 
  "frame 5", "move 2", "wait 1",
  "frame 0", "move 3", "wait 1", 
  "frame 0", "move 2", "wait 1",
  "frame 5", "move 3", "wait 1", 
  "frame 5", "move 3", "wait 1",
  "frame 0", "move 3", "wait 1", 
  "frame 0", "move 2", "wait 1",
  "frame 5", "move 3", "wait 1", 
  "frame 5", "move 2", 
  "unbreakable end", "wait 1",},
  Attack = {"unbreakable begin", 
  "frame 10", "wait 3", 
  "frame 15", "attack", "sound lostsoul attack", "wait 3",
  "frame 0","wait 15", 
  "unbreakable end", "wait 1",},
  Harvest_minerals = {"unbreakable begin", 
  "frame 10", "wait 3", 
  "frame 15", "wait 2", 
  "frame 10", "wait 3", 
  "frame 15", "wait 2", 
  "unbreakable end", "wait 1",},
  Repair = {"unbreakable begin", 
  "frame 10", "wait 3", 
  "frame 15", "wait 2", 
  "frame 10", "wait 3", 
  "frame 15", "wait 2", 
  "unbreakable end", "wait 1",},
  Build = {"unbreakable begin", 
  "frame 10", "wait 3", 
  "frame 15", "wait 2", 
  "frame 10", "wait 3", 
  "frame 15", "wait 2", 
  "unbreakable end", "wait 1",},
  Death = {"unbreakable begin", 
  "frame 20", "wait 4", 
  "frame 25", "wait 4", 
  "frame 30", "wait 4", 
  "frame 35", "wait 4", 
  "frame 40", "wait 4", 
  "frame 45", "wait 5",
  "unbreakable end", "wait 1",},
})

UnitName = "unit-lostsoul"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Lost Soul"),
  -- Drawing
  Image = {"file", "graphics/hell/units/lostsoul.png", "size", {48, 48}},
  Shadow = {"file", "graphics/hell/units/lostsoul-s.png", "size",{48, 48},"offset", {8, 8}},
  Animations = "animations-lostsoul", Icon = "icon-lostsoul",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {30, 35}, BoxOffset = {0, 6},
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = 1,
  AutoRepairRange = 8,
  Priority = 10,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  RepairRange = 1,
  Type = "land",
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  IsAirFleshArmor = 1,
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
  CanAttack = true, 
  CanTargetLand = true,
  CanTargetSea = true,
  CanTargetAir = true,
  lostsoul = true,
  ShowArmor = true,
  LandUnit = true,
  Coward = true,
  organic = true,
  Soul = true,
  SelectableByRectangle = true,
  -- Other
  OnEachSecond = UpdateVeteranStatus,
  RightMouseAction = "harvest",
  CanTargetFlag = {"organic", "only", "Building", "false", "Soul", "false"},
  CanGatherResources = {
   {"file-when-loaded", "graphics/hell/units/lostsoul_fullmineral.png",
   "resource-id", "minerals",
	"harvest-from-outside",
    "resource-capacity", 100,
    "resource-step", 5,
    "wait-at-resource", 8,
    "wait-at-depot", 100}},
  Sounds = {
    "selected", "lostsoul attack",
    "acknowledge", "demons-move",
    "ready", "lostsoul attack",
    "help", "hell worker under attack",
    "dead", "fire explosion"} } )

UnitName = "unit-advanced-lostsoul"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType("unit-advanced-lostsoul", { Name = _("Superior Lost Soul"),
  -- Drawing
  Image = {"file", "graphics/hell/units/lostsoul.png", "size", {48, 48}},
  Shadow = {"file", "graphics/hell/units/lostsoul-s.png", "size",{48, 48},"offset", {8, 8}},
  Animations = "animations-lostsoul", Icon = "icon-lostsoul",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {30, 30},
  Offset = {0, -6},
  Type = "fly",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  AutoRepairRange = 8,
  Priority = 10,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = 1,
  PoisonDrain = 1,
  RepairRange = 1,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  IsAirFleshArmor = 1,
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
  CanAttack = true,
  CanTargetLand = true,
  lostsoul = true,
  ShowArmor = true,
  AirUnit = true,
  Coward = true,
  organic = true,
  SelectableByRectangle = true,
  Soul = true,
  -- Other
  OnEachSecond = UpdateVeteranStatus,
  CanTargetFlag = {"organic", "only", "Building", "false", "Soul", "false"},
  RightMouseAction = "harvest",
  CanGatherResources = {
   {"file-when-loaded", "graphics/hell/units/lostsoul_fullmineral.png",
   "resource-id", "minerals",
	"harvest-from-outside",
    "resource-capacity", 120,
    "resource-step", 6,
    "wait-at-resource", 9,
    "wait-at-depot", 75}},
  Sounds = {
    "selected", "lostsoul attack",
    "acknowledge", "demons-move",
    "ready", "lostsoul attack",
    "help", "hell worker under attack",
    "dead", "fire explosion"} } )