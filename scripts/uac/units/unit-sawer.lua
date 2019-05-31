-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local SawStill = {"set-var Repair.Value = 0", "frame 5", "wait 4", "random-goto 99 no-rotate", "frame 10", "wait 4",
"frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local SawMove = {"unbreakable begin",
	"set-var Repair.Value = 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 4", "wait 1",
	"frame 5", "move 4", "wait 1",
    "frame 10", "move 4", "wait 1", 
	"frame 15", "move 4", "wait 2",
    "frame 0", "move 4", "wait 1", 
	"frame 5", "move 4", "wait 1",
    "frame 10", "move 4", "wait 1",
	"frame 15", "move 4", "wait 2", "goto end",
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
local SawDeath = {"unbreakable begin", 
	"exact-frame 25", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3",
	"exact-frame 26", "wait 3", 
	"exact-frame 27", "wait 3", 
	"exact-frame 28", "wait 3", 
	"exact-frame 29", "wait 3", 
	"exact-frame 30", "wait 3", 
	"exact-frame 31", "spawn-unit unit-sawer-body 0 0 2 15", "set-var RessurectPlayer.Value 0 l_this l",
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
	"exact-frame 31", "unbreakable end", "wait 1",}
local SawDeathExtreme = {"unbreakable begin", 
	"exact-frame 32", "spawn-missile missile-extreme-gibs 20 20 0 0 pixel", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3",
	"exact-frame 33", "wait 3", 
	"exact-frame 34", "wait 3", 
	"exact-frame 35", "wait 3", 
	"exact-frame 36", "wait 3", 
	"exact-frame 37", "wait 3", 
	"exact-frame 38", "wait 3", 
	"exact-frame 39", "wait 3", 
	"exact-frame 40", "wait 2000", 
	"exact-frame 40", "unbreakable end", "wait 1",}

DefineAnimations("animations-sawer-body", {
  Still = {"label begin","exact-frame 31","if-var v_Arg1.Value > 0 still", "exact-frame 31","wait 1", "goto end", 
  "label ressurect", 
  "spawn-unit unit-zombie-saw-body 0 0 2 v_RessurectPlayer.Value jointoai", "set-var RessurectPlayer.Value 0 v_RessurectPlayer.Value l", "set-var Ressurect.Value 0 2 l", "goto end",
  "label defibrillation",
  "spawn-unit unit-sawer 0 0 2 v_RessurectPlayer.Value",
  "set-var HitPoints.Percent 0 30 l",
  "set-var ShieldPoints.Value == 0 l",
  "goto end",
  "label diedemon", "die demon_eating","wait 2",
  "label still","exact-frame 31", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= 1 ressurect",
  "if-var v_DoneDefibrillation.Value == 1 defibrillation",
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die ressurect","wait 2"},
  Death_demon_eating = {"unbreakable begin","exact-frame 31","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",},
  Death = {"unbreakable begin","exact-frame 31","unbreakable end","wait 1",}
})

DefineAnimations("animations-sawmarine", {
  Still = SawStill,
  Move = SawMove,
  Attack = {"unbreakable begin", 
  "set-var Repair.Value = 1",
	"frame 20", "sound saw attack", "wait 3","attack", "wait 3",
	"if-var v_Veterancy.Value != 4 normal",
    "frame 0", "wait 6", "goto end",
	"label normal",
	"frame 0", "wait 11",
	"label end",
	"unbreakable end", "wait 1",},
  Death = SawDeath,
  Death_extreme = SawDeathExtreme,
  Death_fire = {"unbreakable begin","exact-frame 41","spawn-unit unit-burning 0 0 5 15","wait 100","unbreakable end","wait 1",},
})

UnitName = "unit-sawer"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Berserker"),
  -- Drawing
  Image = {"file", "graphics/uac/units/sawer.png", "size", {42, 42}},
  Animations = "animations-sawmarine", Icon = "icon-sawmarine",
  Shadow = {"file", "graphics/uac/units/sawer-s.png", "size",{42, 42},"offset", {0, 0}},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {30, 45},
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  Flip = false, NumDirections = 8,
  Type = "land",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  ShieldPoints = {Value = UnitInfo(UnitName, const.Unit_SP), Max = UnitInfo(UnitName, const.Unit_SP), Increase = 0, Enable = ShieldEnableControl(UnitInfo(UnitName, const.Unit_SP))},
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = 1,
  Priority = 30,
  ShieldPermeability = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  DamageType = "melee",
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-saw-hit",
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
  ArmorShield = 1,
  UAC = true,
  ShieldPiercing = 1,
  CanAttack = true,
  ShowArmor = true,
  CanTargetLand = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sawer = true,
  SphereMarine = true,
  -- Other
  CanTargetFlag = {"organic", "only", "Mechanical", "false", "Building", "false"},
  RightMouseAction = "attack",
  OnEachSecond = UpdateVeteranStatus,
  OnHit = MarineInvulnSphereHit,
  Sounds = {
    "selected", "sawmarine-select",
    "acknowledge", "sawmarine-acknowledge",
    "ready", "sawmarine-ready",
    "help", "uac unit under attack",
	"dead", "extreme","vgavnonah",
	"dead", "fire","marine fire death",
    "dead", "uac marine death"} } )

DefineUnitType("unit-sawer-body", { Name = _("Berserker Body"),
  Image = {"file", "graphics/uac/units/sawer.png", "size", {42, 42}},
  Animations = "animations-sawer-body", Icon = "icon-cancel",
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