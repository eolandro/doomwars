-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local MedicStill = {
	"set-var Repair.Value = 0",
	"frame 5", "wait 4", "random-goto 99 no-rotate", 
	"frame 10", "wait 4",
	"frame 15", "wait 4",
	"frame 0", "wait 4","random-rotate 1", 
	"label no-rotate", "wait 1",}
local MedicMove = {
	"unbreakable begin",
	"set-var Repair.Value = 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 3", "wait 2", 
	"frame 5", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 1", 
	"frame 10", "move 3", "wait 1", 
	"frame 10", "move 3", "wait 2",
	"frame 15", "move 2", "wait 1",
    "frame 0", "move 2", "wait 2",
	"frame 5", "move 3", "wait 1", 
	"frame 5", "move 3", "wait 1",
	"frame 10", "move 2", "wait 1", 
	"frame 10", "move 3", "wait 2",
	"frame 15", "move 3", "wait 1", "goto end",
	"label damaged50",
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 1", 
	"frame 0", "move 2", "wait 2", 
	"frame 5", "move 3", "wait 2", 
	"frame 5", "move 3", "wait 2",
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 2", "wait 2",
	"frame 10", "move 3", "wait 2", 
	"frame 10", "move 3", "wait 1",
	"frame 15", "move 2", "wait 2", 
	"frame 15", "move 3", "wait 2",
	"frame 15", "move 3", "wait 1",
	"label end", "unbreakable end", "wait 1",}
local MedicDeath = {"unbreakable begin", 
	"exact-frame 35", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"exact-frame 36", "wait 3", 
	"exact-frame 37", "wait 3", 
	"exact-frame 38", "wait 3", 
	"exact-frame 39", "wait 3", 
	"exact-frame 40", "wait 3", 
	"exact-frame 41", "spawn-unit unit-medic-body 0 0 2 15", "set-var RessurectPlayer.Value 0 l_this l",
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
    "exact-frame 41", "unbreakable end", "wait 1",}
local MedicExtreme = {"unbreakable begin", 
	"exact-frame 42", "spawn-missile missile-extreme-gibs 20 20 0 0 pixel", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"exact-frame 43", "wait 3", 
	"exact-frame 44", "wait 3", 
	"exact-frame 45", "wait 3", 
	"exact-frame 46", "wait 3", 
	"exact-frame 47", "wait 3", 
	"exact-frame 48", "wait 3",
	"exact-frame 49", "wait 3",
	"exact-frame 50", "wait 2000", 
    "exact-frame 50", "unbreakable end", "wait 1",}

DefineAnimations("animations-medic-body", {
  Still = {"label begin","exact-frame 41","if-var v_Arg1.Value > 0 still", "exact-frame 41","wait 1", "goto end", 
  "label ressurect", 
  "spawn-unit unit-zombieman-body 0 0 2 v_RessurectPlayer.Value jointoai", "set-var RessurectPlayer.Value 0 v_RessurectPlayer.Value l", "set-var Ressurect.Value 0 2 l", "goto end",
  "label defibrillation",
  "spawn-unit unit-medic 0 0 2 v_RessurectPlayer.Value",
  "set-var HitPoints.Percent 0 30 l",
  "set-var ShieldPoints.Value == 0 l",
  "goto end",
  "label diedemon", "die demon_eating","wait 2",
  "label still","exact-frame 41", "wait 1",
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= 1 ressurect",
  "if-var v_DoneDefibrillation.Value == 1 defibrillation", 
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die ressurect","wait 2"},
  Death_demon_eating = {"unbreakable begin","exact-frame 41","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",},
  Death = {"unbreakable begin","exact-frame 41","unbreakable end","wait 1",}
})

DefineAnimations("animations-medic", {
  Still = MedicStill,
  Move = MedicMove,
  Attack = {"unbreakable begin",
	"set-var Repair.Value = 1",
	"frame 20", "wait 3",
	"frame 25", "attack","sound pistol shot", "wait 3",
	"if-var v_Veterancy.Value != 4 normal",
	"frame 20", "wait 4",
	"frame 25", "attack","sound pistol shot", "wait 3",
	"frame 20", "wait 4",
	"frame 25", "attack","sound pistol shot", "wait 3",
	"label normal",
	"frame 20", "wait 17",
	"unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin",
	"set-var Repair.Value = 1",
	"if-var s_spell-defibrillation == 1 defib", 
	"if-var s_spell-medic-collect != 1 heal", 
	"frame 30", "wait 120", "attack", "set-player-var l_this Resources 1 t_ArtifactGive.Value hellpower",
	"set-var ArtifactGive.Value 0 0 t",
	"goto end",
	"label defib",
	"frame 30", "wait 40", "attack", "set-var RessurectPlayer.Value 0 l_this t", "sound defibrillation", "frame 0", "wait 40", "goto end",
	"label heal",
	"frame 30", "wait 17", "attack", "sound healing units", "frame 0", "wait 40", "label end", "unbreakable end","wait 1",},
  Death = MedicDeath,
  Death_fire = {"unbreakable begin","exact-frame 51","spawn-unit unit-burning 0 0 5 15","wait 100","unbreakable end","wait 1",},
  Death_extreme = MedicExtreme,
})

UnitName = "unit-medic"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Combat Medic"),
  -- Drawing
  Image = {"file", "graphics/uac/units/med.png", "size", {42, 42}},
  Shadow = {"file", "graphics/uac/units/med-s.png", "size",{42, 42},"offset", {0, 0}},
  Animations = "animations-medic", Icon = "icon-medic",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {30, 45},
  Type = "land",
  Flip = false, NumDirections = 8,
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  ShieldPoints = {Value = UnitInfo(UnitName, const.Unit_SP), Max = UnitInfo(UnitName, const.Unit_SP), Increase = 0, Enable = ShieldEnableControl(UnitInfo(UnitName, const.Unit_SP))},
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 31,
  ShieldPermeability = 50,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  CanCastSpell = {"spell-medic-heal", "spell-defibrillation", "spell-medic-berserk"},
  AutoCastActive = {"spell-medic-heal"},
  Mana = UnitInfo(UnitName, const.Unit_Mana),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-chain-bullet",
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
  Medic = true,
  ArmorShield = 1,
  CanAttack = true,
  ShowArmor = true,
  UAC = true,
  CanTargetLand = true,
  CanTargetAir = true,
  LandUnit = true,
  organic = true,
  Coward = true,
  SelectableByRectangle = true,
  SphereMarine = true,
  -- Other
  OnEachSecond = UpdateVeteranStatus,
  RightMouseAction = "spell-cast",
  OnHit = MarineInvulnSphereHit,
  Sounds = {
    "selected", "medic-selected",
    "acknowledge", "medic-acknowledge",
    "ready", "medic-ready",
    "help", "uac unit under attack",
	"dead", "extreme","vgavnonah",
	"dead", "fire","marine fire death",
    "dead", "uac marine death"} } )

DefineUnitType("unit-medic-body", { Name = _("Combat Medic Body"),
  Image = {"file", "graphics/uac/units/med.png", "size", {42, 42}},
  Animations = "animations-medic-body", Icon = "icon-cancel",
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