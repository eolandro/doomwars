-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local RocketguyStill = {"set-var Repair.Value = 0", "frame 5", "wait 4", "random-goto 99 no-rotate", "frame 10", "wait 4",
"frame 15", "wait 4","frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local RocketguyMove = {"unbreakable begin",
	"set-var Repair.Value = 1",
	"if-var v_HitPoints.Percent <= 40 damaged50", 
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
	"frame 15", "move 2", "wait 1", "goto end",
	"label damaged50",
    "frame 0", "move 2", "wait 2", 
	"frame 0", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 2", "wait 2", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 2", 
	"frame 15", "move 2", "wait 2",
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 2", "wait 2", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 2", 
	"frame 15", "move 2", "wait 2",
	"label end","unbreakable end", "wait 1",}
local RocketguyDeath = {"unbreakable begin", 
	"exact-frame 30", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3",
	"exact-frame 31", "wait 3", 
	"exact-frame 32", "wait 3", 
	"exact-frame 33", "wait 3", 
	"exact-frame 34", "wait 3", 
	"exact-frame 35", "wait 3", 
	"exact-frame 36", "spawn-unit unit-rocketguy-body 0 0 2 15", "set-var RessurectPlayer.Value 0 l_this l",
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
	"exact-frame 36", "unbreakable end", "wait 1",}
local RocketguyDeathExtreme = {"unbreakable begin", 
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

DefineAnimations("animations-rocketguy-body", {
  Still = {"label begin","exact-frame 36","if-var v_Arg1.Value > 0 still", "exact-frame 36","wait 1", "goto end", 
  "label ressurect", 
  "spawn-unit unit-zombie-rocket-body 0 0 2 v_RessurectPlayer.Value jointoai", "set-var RessurectPlayer.Value 0 v_RessurectPlayer.Value l", "set-var Ressurect.Value 0 2 l", "goto end",
  "label defibrillation",
  "spawn-unit unit-rocketmarine 0 0 2 v_RessurectPlayer.Value",
  "set-var HitPoints.Percent 0 30 l",
  "set-var ShieldPoints.Value == 0 l",
  "goto end",
  "label diedemon", "die demon_eating","wait 2",
  "label still","exact-frame 36", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= 1 ressurect", 
  "if-var v_DoneDefibrillation.Value == 1 defibrillation",
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die ressurect","wait 2"},
  Death_demon_eating = {"unbreakable begin","exact-frame 36","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",},
  Death = {"unbreakable begin","exact-frame 36","unbreakable end","wait 1",}
})

DefineAnimations("animations-rockeyguy", {
  Still = RocketguyStill,
  Move = RocketguyMove,
  Attack = {"unbreakable begin",
  "set-var Repair.Value = 1",
  "frame 20", "wait 5",
  "if-var v_Veterancy.Value != 4 normal",
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
	  "goto fire",
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
  "label fire",
  "frame 25", 
  "if-var g_AirUnit != 0 normalfire",
  "spawn-missile missile-rocket 0 0 0 0 damage.totarget", "goto endfire",
  "label normalfire",
  "spawn-missile missile-homing-rocket 0 0 0 0 damage.totarget",
  "label endfire",
  "sound rocket launch", "wait 3",
  "frame 20", "wait 10", "sound rocket reload","wait 67",
  "unbreakable end", "wait 1",},
  Death = RocketguyDeath,
  Death_extreme = RocketguyDeathExtreme,
  Death_fire = {"unbreakable begin","exact-frame 46","spawn-unit unit-burning 0 0 5 15","wait 100","unbreakable end","wait 1",},
})

UnitName = "unit-rocketmarine"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
BaseDamage2 = UnitInfo(UnitName, const.Unit_BaseDmg2)
DamageType2 = UnitInfo(UnitName, const.Unit_DamageType2)
DefineUnitType(UnitName, { Name = _("Rocket Launcher Trooper"),
  -- Drawing
  Image = {"file", "graphics/uac/units/rocketsquad.png", "size", {42, 42}},
  Animations = "animations-rockeyguy", Icon = "icon-rockeyguy",
  Shadow = {"file", "graphics/uac/units/rocketsquad-s.png", "size",{42, 42},"offset", {0, 0}},
  Flip = false, NumDirections = 8,
  TileSize = {1, 1}, BoxSize = {30, 45},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  MissileOffsets = {{{5, -6}, {8, -12}, {16, -11}, {12, -8}, {-7, -12}, {-13, -6}, {-21, -10}, {-10, -16}}},
  Type = "land",
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  ShieldPoints = {Value = UnitInfo(UnitName, const.Unit_SP), Max = UnitInfo(UnitName, const.Unit_SP), Increase = 0, Enable = ShieldEnableControl(UnitInfo(UnitName, const.Unit_SP))},
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  ShieldPermeability = 50,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  DamageType = "extreme",
  PoisonDrain = 1,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-rocket",
  IsLightArmor = 1,
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
  ArmorShield = 1,
  UAC = true,
  -- CanGroundAttack = true,
  GroundAttack = true,
  ShowArmor = true,
  CanAttack = true,
  BigUnit = true,
  CanTargetLand = true,
  CanTargetSea = true,
  LandUnit = true,
  organic = true,
  CanTargetAir = true,
  SelectableByRectangle = true,
  SphereMarine = true,
  -- Other
  OnEachSecond = UpdateVeteranStatus,
  OnHit = MarineInvulnSphereHit,
  RightMouseAction = "attack",
  PriorityTarget = {"organic", "false", "AirUnit", "only", "Mechanical", "only", "Building", "only"},
  Sounds = {
    "selected", "rocketmarine-selected",
    "acknowledge", "rocketmarine-acknowledge",
	"attack", "rocketmarine-attack",
    "ready", "rocketmarine-ready",
    "help", "uac unit under attack",
	"dead", "extreme","vgavnonah",
	"dead", "fire","marine fire death",
    "dead", "uac marine death"} } )

DefineUnitType("unit-rocketguy-body", { Name = _("Rocket Launcher Trooper Body"),
  Image = {"file", "graphics/uac/units/rocketsquad.png", "size", {42, 42}},
  Animations = "animations-rocketguy-body", Icon = "icon-cancel",
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
