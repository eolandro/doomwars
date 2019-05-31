-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local ArachnotronStill = {"frame 0", "wait 4", "random-goto 99 no-rotate", "frame 5", "wait 3",
"frame 10", "wait 3", "frame 15", "wait 3", "frame 20", "wait 3", "frame 25", "wait 3", "random-rotate 1", "label no-rotate", "wait 1",}
local ArachnotronMove = {"unbreakable begin",
	"if-var v_HitPoints.Percent <= 40 damaged40", 
	"frame 0", "move 3", "wait 2", "sound arachnotron hoof", 
	"frame 0", "move 3", "wait 1",
	"frame 5", "move 3", "wait 1",
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 3", "wait 2", 
	"frame 10", "move 3", "wait 1", 
	"frame 15", "move 3", "wait 1", "sound arachnotron hoof", 
	"frame 15", "move 2", "wait 1",
	"frame 20", "move 3", "wait 2", 
	"frame 20", "move 2", "wait 1",
	"frame 25", "move 3", "wait 1",
	"frame 25", "move 2", "wait 1", "goto end",
	"label damaged40",
	"frame 0", "move 3", "wait 2", "sound arachnotron hoof", 
	"frame 0", "move 3", "wait 1",
	"frame 5", "move 3", "wait 2",
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 3", "wait 2", 
	"frame 10", "move 3", "wait 1", 
	"frame 15", "move 3", "wait 2", "sound arachnotron hoof", 
	"frame 15", "move 2", "wait 1",
	"frame 20", "move 3", "wait 2", 
	"frame 20", "move 2", "wait 1",
	"frame 25", "move 3", "wait 2",
	"frame 25", "move 2", "wait 1", 
    "label end", "unbreakable end", "wait 1",}
local ArachnotronDeath = {"unbreakable begin", 
	"frame 40", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 5", 
	"frame 45", "wait 4", 
	"frame 50", "wait 4",
	"frame 55", "wait 4", 
	"frame 60", "wait 4", 
	"frame 65", "wait 4",
	"frame 70", "spawn-unit unit-arachnotron-body 0 0 2 15 summoned",
		"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
		"set-var RessurectPlayer.Value 0 l_this l", "wait 3",
	"unbreakable end", "wait 1",}

DefineAnimations("animations-arachnotron-body", {
  Still = {"label begin","frame 70","if-var v_Arg1.Value > 0 still", "frame 70","wait 1", "goto end", 
  "label ressurect", 
  "set-var UnitFlags.Value &= "..unitFlags.UF_Raising,
  "sound vgavnonah", 
  "frame 70","wait 4",
  "frame 65","wait 4",
  "frame 60","wait 4",
  "frame 55","wait 4",
  "frame 50","wait 4",
  "frame 45","wait 4",
  "frame 40","wait 4",
  "spawn-unit unit-arachnotron 0 0 2 v_RessurectPlayer.Value jointoai.summoned", "goto end",
  "label diedemon", "die demon_eating","wait 2",
  "label still","frame 70", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= v_NeedToResurrect.Value ressurect", 
  "set-var Arg1.Value 2 1","goto begin","label end","die ressurect","wait 2"},
  Death = {"unbreakable begin","frame 70","wait 2","unbreakable end","wait 1",},
  Death_ressurect = {"unbreakable begin","exact-frame 70","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 70","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

DefineAnimations("animations-arachnotron", {
  Still = ArachnotronStill,
  Move = ArachnotronMove,
  Attack = {"unbreakable begin", 
  "if-var v_Veterancy.Value != 4 normal",
  "frame 30", "wait 1", 
  "frame 35", "attack", "sound plasma attack", "wait 1",
  "frame 30", "wait 1",
  "label normal",
  "frame 30", "wait 3", 
  "frame 35", "attack", "sound plasma attack", "wait 1",
  "frame 30", "wait 2",
  "label end",
  "frame 30", "unbreakable end", "wait 1",},
  Death = ArachnotronDeath,
})

UnitName = "unit-arachnotron"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Arachnotron"),
  -- Drawing
  Image = {"file", "graphics/hell/units/arachnotron.png", "size", {80, 36}},
  Animations = "animations-arachnotron", Icon = "icon-arachnotron",
  Shadow = {"file", "graphics/hell/units/arachnotron-s.png", "size",{80, 36},"offset", {0, 0}},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {75, 40},
  Flip = false, NumDirections = 8,
  Type = "land",
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  PoisonDrain = 1,
  DamageType = "fire",
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-arachnotron-plasma",
  IsHeavyFleshArmor = 1,
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
  HeavyFlesh = true,
  CanTargetLand = true, 
  CanTargetSea = true, 
  CanTargetAir = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  -- Other
  PriorityTarget = {"LandUnit", "only", "AirUnit", "false"},
  RightMouseAction = "attack",
  OnEachSecond = UpdateVeteranStatus,
  Sounds = {
    "selected", "arachnotron sight",
    "acknowledge", "arachnotron move",
    "ready", "arachnotron sight",
    "help", "hell unit under attack",
    "dead", "arachnotron death"} } )
	
DefineUnitType("unit-arachnotron-body", { Name = _("Arachnotron Body"),
  Image = {"file", "graphics/hell/units/arachnotron.png", "size", {80, 36}},
  Animations = "animations-arachnotron-body", Icon = "icon-arachnotron",
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