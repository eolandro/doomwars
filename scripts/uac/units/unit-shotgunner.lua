-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local ShotgunStill = {"set-var Repair.Value = 0","frame 5", "wait 4", "random-goto 99 no-rotate", 
	"frame 10", "wait 4",
	"frame 15", "wait 4",
	"frame 0", "wait 4","random-rotate 1", 
	"label no-rotate", "wait 1",}
local ShotgunMove = {"unbreakable begin",
	"set-var Repair.Value = 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 1", 
	"frame 5", "move 3", "wait 1",
    "frame 10", "move 2", "wait 1", 
	"frame 10", "move 3", "wait 1",
	"frame 15", "move 2", "wait 1", 
	"frame 15", "move 3", "wait 1",
	"frame 0", "move 2", "wait 1", 
	"frame 5", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 3", "wait 1", 
	"frame 10", "move 2", "wait 1",
	"frame 15", "move 2", "wait 1","goto end",
	"label damaged50",
	"frame 0", "move 3", "wait 2", 
	"frame 5", "move 2", "wait 1", 
	"frame 5", "move 3", "wait 2",
    "frame 10", "move 2", "wait 1", 
	"frame 10", "move 3", "wait 2",
	"frame 15", "move 2", "wait 1", 
	"frame 15", "move 3", "wait 2",
	"frame 0", "move 2", "wait 1", 
	"frame 5", "move 3", "wait 2", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 3", "wait 1", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 1",
	"label end", "unbreakable end", "wait 1",}
local ShotgunDeath = {"unbreakable begin", 
	"frame 30", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"frame 35", "wait 3", 
	"frame 40", "wait 3", 
	"frame 45", "wait 3", 
	"frame 50", "wait 3", 
	"frame 55", "wait 3", 
	"frame 60", "wait 3", "spawn-unit unit-shotgunner-body 0 0 2 15", "set-var RessurectPlayer.Value 0 l_this l",
	"if-var v_UsedSpheres.Value & "..marineSpheres.S_Skull.." skull",
	"if-var v_ZombificationTime.Value == 0 normal",
	"if-var v_VeteranOfPain.Value == 4 elite",
	"if-var r_100 >= 33 normal",
	"label elite",
	"set-var RessurectPlayer.Value 0 v_RessurectPlayerPain.Value l",
	"set-var Ressurect.Value 0 5 l",
	"goto normal",
	"label skull",
	"set-var UsedSpheres.Value += "..marineSpheres.S_Skull.." l",
	"label normal",
    "frame 60", "unbreakable end", "wait 1",}
local ShotgunDeathExtreme = {"unbreakable begin", 
	"frame 65", "spawn-missile missile-extreme-gibs 20 20 0 0 pixel", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"frame 70", "wait 3", 
	"frame 75", "wait 3", 
	"frame 80", "wait 3", 
	"frame 85", "wait 3", 
	"frame 90", "wait 3",
	"frame 95", "wait 3",
	"frame 100", "wait 3",
	"frame 105", "wait 2000",
    "frame 105", "unbreakable end", "wait 1",}
	
DefineAnimations("animations-shotgunner", {
  Still = ShotgunStill,
  Move = ShotgunMove,
  Attack = {"unbreakable begin", 
  "set-var Repair.Value = 1",
	"frame 20", "wait 3", 
	"frame 25", "attack", "sound shotgun attack", "wait 5", 
	"if-var v_Veterancy.Value != 4 normal",
	"frame 20", "wait 3", 
	"frame 25", "attack", "sound shotgun attack", "wait 5", 
	"label normal",
	"frame 20", "wait 3","sound shotgun reload","wait 12",
	"unbreakable end", "wait 1",},
  Death = ShotgunDeath,
  Death_fire = {"unbreakable begin","frame 110","spawn-unit unit-burning 0 0 5 15","wait 100","unbreakable end","wait 1",},
  Death_extreme = ShotgunDeathExtreme
})

DefineAnimations("animations-shotgunner-body", {
  Still = {"label begin","frame 60","if-var v_Arg1.Value > 0 still", "frame 60","wait 1", "goto end", 
  "label ressurect", 
  "spawn-unit unit-sergeant-body 0 0 2 v_RessurectPlayer.Value jointoai", "set-var RessurectPlayer.Value 0 v_RessurectPlayer.Value l", "set-var Ressurect.Value 0 2 l",  "goto end",
  "label defibrillation",
  "spawn-unit unit-shotgunner 0 0 2 v_RessurectPlayer.Value",
  "set-var HitPoints.Percent 0 30 l",
  "set-var ShieldPoints.Value == 0 l",
  "goto end",
  "label diedemon", "die demon_eating","wait 2",
  "label still","frame 60", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= 1 ressurect", 
  "if-var v_DoneDefibrillation.Value == 1 defibrillation",
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die ressurect","wait 2"},
  Death_demon_eating = {"unbreakable begin","frame 60","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",},
  Death = {"unbreakable begin","frame 60","unbreakable end","wait 1",}
})

UnitName = "unit-shotgunner"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType("unit-shotgunner", { Name = _("Shotgunner"),
  -- Drawing
  Image = {"file", "graphics/uac/units/sergeant.png", "size", {42, 42}},
  Shadow = {"file", "graphics/uac/units/sergeant-s.png", "size",{42, 42},"offset", {0, 0}},
  Animations = "animations-shotgunner", Icon = "icon-shotgunner",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {30, 45},
  Type = "land",
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  Flip = false, NumDirections = 8,
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  ShieldPoints = {Value = UnitInfo(UnitName, const.Unit_SP), Max = UnitInfo(UnitName, const.Unit_SP), Increase = 0, Enable = ShieldEnableControl(UnitInfo(UnitName, const.Unit_SP))},
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  ShieldPermeability = 50,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  DamageType = "shell",
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-shotgun-shot",
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
  ArmorShield = 1,
  UAC = true,
  CanAttack = true,
  ShowArmor = true,
  CanTargetLand = true,
  CanTargetAir = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  SphereMarine = true,
  -- Other
  RightMouseAction = "attack",
  PriorityTarget = {"organic", "only", "AirUnit", "false", "Mechanical", "false", "Building", "false"},
  OnEachSecond = UpdateVeteranStatus,
  OnHit = MarineInvulnSphereHit,
  Sounds = {
    "selected", "shotgunner-selected",
    "acknowledge", "shotgunner-acknowledge",
	"attack","shotgunner-attack",
    "ready", "shotgunner-ready",
    "help", "uac unit under attack",
	"dead", "extreme","vgavnonah",
	"dead", "fire","marine fire death",
    "dead", "uac marine death"} } )

DefineUnitType("unit-shotgunner-body", { Name = _("Shotgunner Body"),
  Image = {"file", "graphics/uac/units/sergeant.png", "size", {42, 42}},
  Animations = "animations-shotgunner-body", Icon = "icon-cancel",
  HitPoints = 100,
  DrawLevel = 10,
  IsHeavyFleshArmor = 1,
  Indestructible = 1,
  NumDirections = 8, Flip = false,
  NoRandomPlacing = true,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  Arg1 = 3600,
  OnEachCycle = HandleDefibrillation,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  NonSolid = true,
  UAC = true,
  Dead = true,
  IsNotSelectable = true,
  Sounds = {} })