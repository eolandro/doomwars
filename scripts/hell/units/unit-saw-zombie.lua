-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local ZombieSawStill = {"frame 5", "wait 4", "random-goto 99 no-rotate", "frame 10", "wait 4",
"frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local ZombieSawMove = {"unbreakable begin",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 4", "wait 1",
	"frame 5", "move 4", "wait 1",
    "frame 10", "move 4", "wait 1", 
	"frame 15", "move 4", "wait 1",
    "frame 0", "move 4", "wait 1", 
	"frame 5", "move 4", "wait 1",
    "frame 10", "move 4", "wait 1",
	"frame 15", "move 4", "wait 1", "goto end",
	"label damaged50",
	"frame 0", "move 4", "wait 2",
	"frame 5", "move 4", "wait 2",
    "frame 10", "move 4", "wait 2", 
	"frame 15", "move 4", "wait 2",
    "frame 0", "move 4", "wait 2", 
	"frame 5", "move 4", "wait 2",
    "frame 10", "move 4", "wait 2",
	"frame 15", "move 4", "wait 2",
    "label end","unbreakable end", "wait 1",}
local ZombieSawDeath = {"unbreakable begin", 
	"exact-frame 30", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3",
	"exact-frame 31", "wait 3", 
	"exact-frame 32", "wait 3", 
	"exact-frame 33", "wait 3", 
	"exact-frame 34", "wait 3", 
	"exact-frame 35", "wait 3", 
	"exact-frame 36", "spawn-unit unit-zombie-saw-body 0 0 2 15 summoned", 
	"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
		"set-var RessurectPlayer.Value 0 l_this l",
	"exact-frame 36", "unbreakable end", "wait 1",}
local ZombieSawDeathExtreme = {"unbreakable begin", 
	"exact-frame 37", "spawn-missile missile-extreme-gibs 20 20 0 0 pixel", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3",
	"exact-frame 38", "wait 3", 
	"exact-frame 39", "wait 3", 
	"exact-frame 40", "wait 3", 
	"exact-frame 41", "wait 3", 
	"exact-frame 42", "wait 3", 
	"exact-frame 43", "wait 3", 
	"exact-frame 44", "wait 3", 
	"exact-frame 45", "wait 2000", 
	"exact-frame 45", "unbreakable end", "wait 1",}

DefineAnimations("animations-zombie-saw", {
  Still = ZombieSawStill,
  Move = ZombieSawMove,
  Attack = {"unbreakable begin", 
	"frame 20", "sound saw attack", "wait 3","attack", "frame 25", "wait 3",
	"if-var v_Veterancy.Value != 4 normal",
    "frame 0", "wait 6", "goto end",
	"label normal",
	"frame 0", "wait 12",
	"label end",
	"unbreakable end", "wait 1",},
  Death = ZombieSawDeath,
  Death_extreme = ZombieSawDeathExtreme,
  Death_fire = {"unbreakable begin","exact-frame 46","spawn-unit unit-burning 0 0 5 15","wait 100","unbreakable end","wait 1",},
})

DefineAnimations("animations-zombie-saw-body", {
  Still = {"label begin","exact-frame 36","if-var v_Arg1.Value > 0 still", "exact-frame 36","wait 1", "goto end", 
  "label ressurect", 
  "set-var UnitFlags.Value &= "..unitFlags.UF_Raising,
  "sound vgavnonah", 
  "exact-frame 36","wait 3",
  "exact-frame 35","wait 3",
  "exact-frame 34","wait 3",
  "exact-frame 33","wait 3",
  "exact-frame 32","wait 3",
  "exact-frame 31","wait 3",
  "exact-frame 30","wait 3",
  "spawn-unit unit-zombie-saw 0 0 2 v_RessurectPlayer.Value jointoai.summoned", "goto end",
  "label diedemon", "die demon_eating","wait 2",	
  "label still","exact-frame 36", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= v_NeedToResurrect.Value ressurect", 
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die ressurect","wait 2"},
  Death = {"unbreakable begin","exact-frame 36","wait 2","unbreakable end","wait 1",},
  Death_ressurect = {"unbreakable begin","exact-frame 36","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 36","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

UnitName = "unit-zombie-saw"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Former Berserker"),
  -- Drawing
  Image = {"file", "graphics/hell/units/sawzombie.png", "size", {51, 51}},
  Animations = "animations-zombie-saw", Icon = "icon-zombie-saw",
  Shadow = {"file", "graphics/hell/units/sawzombie-s.png", "size",{51, 51},"offset", {0, 0}},
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {33, 42},
  Flip = false, NumDirections = 8,
  Type = "land",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = 1,
  Priority = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  DamageType = "melee",
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  IsCombatArmor = 1,
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
  ShieldPiercing = 1,
  CanAttack = true,
  CanTargetLand = true,
  CanTargetSea = false,
  CanTargetAir = false,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  Sawer = true,
  -- Other
  RightMouseAction = "attack",
  OnEachSecond = UpdateVeteranStatus,
  CanTargetFlag = {"organic", "only", "Mechanical", "false", "Building", "false"},
  PriorityTarget = {"organic", "only", "AirUnit", "false", "Mechanical", "false", "Building", "false"},
  Sounds = {
    "selected", "zombie sight",
    "acknowledge", "zombie move",
    "ready", "zombie sight",
    "help", "hell unit under attack",
	"dead", "extreme","vgavnonah",
    "dead", "zombie death"} } )

DefineUnitType("unit-zombie-saw-body", { Name = _("Former Berserker Body"),
  Image = {"file", "graphics/hell/units/sawzombie.png", "size", {51, 51}},
  Animations = "animations-zombie-saw-body", Icon = "icon-zombie-saw",
  HitPoints = 100,
  DrawLevel = 10,
  Indestructible = 1,
  NumDirections = 8, Flip = false,
  NoRandomPlacing = true,
  IsResurrectable = true,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  Arg1 = 3600,
  IsHeavyFleshArmor = 1,
  NeedToResurrect = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  NonSolid = true,
  Hell = true,
  Dead = true,
  IsNotSelectable = true,
  Sounds = {} } )