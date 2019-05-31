-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local DevilStill = {"frame 5", "wait 4", "random-goto 99 no-rotate","frame 10", "wait 4","frame 15", "wait 4", 
"frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local DevilMove = {"unbreakable begin", 
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
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 2", "wait 2", 
	"frame 10", "move 2", "wait 1",
	"frame 15", "move 2", "wait 2", 
	"frame 15", "move 2", "wait 1",
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 2", "wait 1", 
	"frame 5", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 2", "wait 2", 
	"frame 10", "move 2", "wait 1",
	"frame 15", "move 2", "wait 2",
	"frame 15", "move 2", "wait 1",
	"label end", "unbreakable end", "wait 1",}
local DevilDeath = {"unbreakable begin", 
	"exact-frame 35", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 4", 
	"exact-frame 36", "wait 4",
	"exact-frame 37", "wait 4", 
	"exact-frame 38", "wait 4", 
	"exact-frame 39", "spawn-unit unit-devil-body 0 0 2 15 summoned", 
	"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
		"set-var RessurectPlayer.Value 0 l_this l", "wait 3",
    "unbreakable end", "wait 1",}
local DevilDeathExtreme = {"unbreakable begin", 
	"exact-frame 40", "spawn-missile missile-extreme-gibs 20 20 0 0 pixel", "wait 4",
	"exact-frame 41", "wait 4",
	"exact-frame 42", "wait 4",
	"exact-frame 43", "wait 4", 
	"exact-frame 44", "wait 4", 
	"exact-frame 45", "wait 4",
	"exact-frame 46", "wait 4",
	"exact-frame 47", "wait 2000",
    "exact-frame 47", "unbreakable end", "wait 1",}

DefineAnimations("animations-devil-body", {
  Still = {"label begin","exact-frame 39","if-var v_Arg1.Value > 0 still", "exact-frame 39","wait 1", "goto end", 
  "label ressurect", 
  "set-var UnitFlags.Value &= "..unitFlags.UF_Raising,
  "sound vgavnonah", 
  "exact-frame 39","wait 3",
  "exact-frame 38","wait 3",
  "exact-frame 37","wait 3",
  "exact-frame 36","wait 3",
  "exact-frame 35","wait 3",
  "spawn-unit unit-devil 0 0 2 v_RessurectPlayer.Value jointoai.summoned", "goto end",
  "label diedemon", "die demon_eating","wait 2",	
  "label still","exact-frame 39", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= v_NeedToResurrect.Value ressurect", 
  "set-var Arg1.Value 2 1","goto begin","label end","die ressurect","wait 2"},
  Death = {"unbreakable begin","exact-frame 39","wait 2","unbreakable end","wait 1",},
  Death_ressurect = {"unbreakable begin","exact-frame 39","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 39","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})
	
DefineAnimations("animations-devil", {
  Still = DevilStill,
  Move = DevilMove,
  Attack = {"unbreakable begin", "frame 20", "wait 3", "frame 25", "wait 3", "frame 30", 
  "set-var DamageType 0 basic",
  "set-var ShieldPiercing.Value 0 0",
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
  "if-var v_Veterancy.Value != 4 normal",
  "spawn-missile missile-devil-ball-elite 0 0 0 0 damage.totarget", "goto next",
  "label normal",
  "attack", 
  "label next",
  "sound fireball launch", "wait 5",
    "frame 0", "wait 14", "frame 0", "unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin", 
  "frame 20", "wait 3", "frame 25", "wait 3", "frame 30",
  "set-var DamageType 0 melee",
  "set-var ShieldPiercing.Value 0 1",
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
  "wait 5",
    "frame 0", "wait 4", "frame 0", "unbreakable end", "wait 1",},
  Death = DevilDeath,
  Death_extreme = DevilDeathExtreme,
})

UnitName = "unit-devil"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
BaseDamage2 = UnitInfo(UnitName, const.Unit_BaseDmg2)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DamageType2 = UnitInfo(UnitName, const.Unit_DamageType2)
DefineUnitType(UnitName, { Name = _("Devil"),
  -- Drawing
  Image = {"file", "graphics/hell/units/devil.png", "size", {46, 46}},
  Shadow = {"file", "graphics/hell/units/devil-s.png", "size",{46, 46},"offset", {0, 0}},
  Animations = "animations-devil", Icon = "icon-devil",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {29, 42},
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  Flip = false, NumDirections = 8,
  Type = "land",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  Points = UnitInfo(UnitName, const.Unit_Points),
  CanCastSpell = {"spell-melee-attack"},
  AutoCastActive = {"spell-melee-attack"},
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  ShieldPiercing = {Value = 0, Max = 1, Enable = true, Increase = 0},
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-devil-ball",
  IsFleshArmor = 1,
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
  Hell = true, 
  CanAttack = true,
  CanTargetLand = true,
  CanTargetSea = true,
  CanTargetAir = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  -- Other
  RightMouseAction = "attack",
  OnEachSecond = UpdateVeteranStatus,
  PriorityTarget = {"organic", "false", "AirUnit", "only", "Mechanical", "only", "Building", "only"},
  Sounds = {
    "selected", "imp sight",
    "acknowledge", "imp active",
    "ready", "imp sight",
    "help", "hell unit under attack",
	"dead", "extreme","vgavnonah",
    "dead", "imp death"} } )
	
DefineUnitType("unit-devil-body", { Name = _("Devil Body"),
  Image = {"file", "graphics/hell/units/devil.png", "size", {46, 46}},
  Animations = "animations-devil-body", Icon = "icon-imp",
  HitPoints = 100,
  DrawLevel = 10,
  Indestructible = 1,
  NeedToResurrect = 2,
  NumDirections = 8, Flip = false,
  NoRandomPlacing = true,
  IsResurrectable = true,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  Arg1 = 3600,
  IsHeavyFleshArmor = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  NonSolid = true,
  Hell = true,
  Dead = true,
  IsNotSelectable = true,
  Sounds = {} } )