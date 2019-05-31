-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local HellknightStill = UnitStill
local HellknightMove = {"unbreakable begin",
	"if-var v_HitPoints.Percent <= 40 damaged40", 
	"frame 0", "move 2", "wait 1", 
	"frame 0", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 2", "wait 1", 
	"frame 10", "move 2", "wait 1",
	"frame 15", "move 2", "wait 1", 
	"frame 15", "move 2", "wait 1",
    "frame 0", "move 2", "wait 1", 
	"frame 0", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 2", "wait 1", 
	"frame 10", "move 2", "wait 1",
	"frame 15", "move 2", "wait 1", 
	"frame 15", "move 2", "wait 1", "goto end",
	"label damaged40",
	"frame 0", "move 2", "wait 1", 
	"frame 0", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 2", "wait 1", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 1", 
	"frame 15", "move 2", "wait 2",
    "frame 0", "move 2", "wait 1", 
	"frame 0", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 2", "wait 1", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 1", 
	"frame 15", "move 2", "wait 2",
	"label end", "unbreakable end", "wait 1",}
local HellknightDeath = {"unbreakable begin", 
	"exact-frame 50", "spawn-missile missile-brown-gibs 20 20 0 0 pixel",  "wait 3", 
	"exact-frame 51", "wait 3", 
	"exact-frame 52", "wait 3",
	"exact-frame 53", "wait 3",
	"exact-frame 54", "wait 3",
	"exact-frame 55", "wait 3",
	"exact-frame 56", "spawn-unit unit-hellknight-body 0 0 2 15 summoned", 
	"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
		"set-var RessurectPlayer.Value 0 l_this l", "wait 3",
	"unbreakable end", "wait 1",}
local HellknightDeathExtreme = {"unbreakable begin", 
	"exact-frame 57", "spawn-missile missile-green-extreme-gibs 20 20 0 0 pixel",  "wait 3", 
	"exact-frame 58", "wait 3", 
	"exact-frame 59", "wait 3",
	"exact-frame 60", "wait 3",
	"exact-frame 61", "wait 3",
	"exact-frame 62", "wait 3",
	"exact-frame 63", "wait 2000",
	"exact-frame 63", "unbreakable end", "wait 1",}
	
DefineAnimations("animations-hellknight-body", {
  Still = {"label begin","exact-frame 56","if-var v_Arg1.Value > 0 still", "exact-frame 56","wait 1", "goto end", 
  "label ressurect", 
  "set-var UnitFlags.Value &= "..unitFlags.UF_Raising,
  "sound vgavnonah", 
  "exact-frame 56","wait 3",
  "exact-frame 55","wait 3",
  "exact-frame 54","wait 3",
  "exact-frame 53","wait 3",
  "exact-frame 52","wait 3",
  "exact-frame 51","wait 3",
  "exact-frame 50","wait 3",
  "spawn-unit unit-hellknight 0 0 2 v_RessurectPlayer.Value jointoai.summoned", "goto end",
  "label diedemon", "die demon_eating","wait 2",	
  "label still","exact-frame 56", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= v_NeedToResurrect.Value ressurect", 
  "set-var Arg1.Value 2 1","goto begin","label end","die ressurect","wait 2"},
  Death = {"unbreakable begin","exact-frame 56","wait 2","unbreakable end","wait 1",},
  Death_ressurect = {"unbreakable begin","exact-frame 56","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 56","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

DefineAnimations("animations-hellknight", {
  Still = {"frame 5", "wait 4", "random-goto 99 no-rotate","frame 10", "wait 4","frame 15", "wait 4", 
"frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",},
  Move = HellknightMove,
  Attack = {"unbreakable begin", 
  "frame 20", "wait 4", 
  "frame 25", "wait 4", 
  "frame 30", 
  "set-var DamageType 0 basic",
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
  "attack", "sound fireball launch", "wait 6",
  "if-var v_Veterancy.Value != 4 normal",
  "frame 35", "wait 4", 
  "frame 40", "wait 4", 
  "frame 45", "attack", "sound fireball launch", "wait 6",
  "label normal",
  "frame 0", "wait 22",
  "frame 0", "unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin", 
  "frame 20", "wait 4", "frame 25", "wait 4", "frame 30",
  "set-var DamageType 0 melee",
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
  "attack", "sound claw attack",
    "wait 6",
    "frame 0", "wait 4",
    "frame 0", "unbreakable end", "wait 1",},
  Death = HellknightDeath,
  Death_extreme = HellknightDeathExtreme,
})

UnitName = "unit-hellknight"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
BaseDamage2 = UnitInfo(UnitName, const.Unit_BaseDmg2)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DamageType2 = UnitInfo(UnitName, const.Unit_DamageType2)
DefineUnitType(UnitName, { Name = _("Hell Knight"),
  -- Drawing
  Image = {"file", "graphics/hell/units/hellknight.png", "size", {56, 56}},
  Animations = "animations-hellknight", Icon = "icon-hellknight",
  Shadow = {"file", "graphics/hell/units/hellknight-s.png", "size",{56, 56},"offset", {0, 0}},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {47, 51},
  Type = "land",
  Flip = false, NumDirections = 8,
  Impact = {"shell", "missile-green-shell-meat", "melee", "missile-green-melee-meat"},
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  Points = UnitInfo(UnitName, const.Unit_Points),
  PoisonDrain = 1,
  CanCastSpell = {"spell-melee-attack"},
  AutoCastActive = {"spell-melee-attack"},
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-baronball",
  IsHeavyFleshArmor = 1,
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
  HeavyFlesh = true,
  Hell = true,
  CanAttack = true,
  CanTargetLand = true,
  CanTargetAir = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  -- Other
  OnEachSecond = UpdateVeteranStatus,
  PriorityTarget = {"organic", "false", "AirUnit", "false", "Mechanical", "only", "Building", "only"},
  RightMouseAction = "attack",
  Sounds = {
    "selected", "hell knight sight",
    "acknowledge", "demons-move",
    "ready", "hell knight sight",
    "help", "hell unit under attack",
    "dead", "hell knight death"} } )
	
DefineUnitType("unit-hellknight-body", { Name = _("Hell Knight Body"),
  Image = {"file", "graphics/hell/units/hellknight.png", "size", {56, 56}},
  Animations = "animations-hellknight-body", Icon = "icon-hellknight",
  HitPoints = 150,
  DrawLevel = 10,
  Indestructible = 1,
  IsHeavyFleshArmor = 1,
  NeedToResurrect = 4,
  NumDirections = 8, Flip = false,
  NoRandomPlacing = true,
  IsResurrectable = true,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  Arg1 = 3600,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  NonSolid = true,
  Hell = true,
  Dead = true,
  IsNotSelectable = true,
  Sounds = {} } )