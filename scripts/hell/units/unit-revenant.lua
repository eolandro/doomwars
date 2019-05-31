-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local RevenantStill = {"frame 5", "wait 4", "random-goto 99 no-rotate", "frame 10", "wait 4",
"frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local RevenantMove = {"unbreakable begin",
	"if-var v_HitPoints.Percent <= 40 damaged40", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 1",
    "frame 5", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 4", "wait 1", 
	"frame 10", "move 2", "wait 1",
    "frame 15", "move 3", "wait 1", 
	"frame 15", "move 2", "wait 1",
    "frame 20", "move 4", "wait 1", 
	"frame 20", "move 2", "wait 1",
    "frame 25", "move 3", "wait 1", 
	"frame 25", "move 1", "wait 1", "goto end",
	"label damaged40",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 2",
    "frame 5", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 4", "wait 1", 
	"frame 10", "move 2", "wait 2",
    "frame 15", "move 3", "wait 1", 
	"frame 15", "move 2", "wait 2",
    "frame 20", "move 4", "wait 1", 
	"frame 20", "move 2", "wait 2",
    "frame 25", "move 3", "wait 1", 
	"frame 25", "move 1", "wait 2",
	"label end", "unbreakable end", "wait 1",}
local RevenantDeath = {"unbreakable begin", 
	"exact-frame 55", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"exact-frame 56", "wait 3", 
	"exact-frame 57", "wait 3", 
	"exact-frame 58", "wait 3", 
	"exact-frame 59", "spawn-unit unit-revenant-body 0 0 2 15 summoned",
"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",	"set-var RessurectPlayer.Value 0 l_this l", "wait 3",
	"exact-frame 59", "unbreakable end", "wait 1",}

DefineAnimations("animations-revenant-body", {
  Still = {"label begin","exact-frame 59","if-var v_Arg1.Value > 0 still", "exact-frame 59","wait 1", "goto end", 
  "label ressurect", 
  "set-var UnitFlags.Value &= "..unitFlags.UF_Raising,
  "sound vgavnonah", 
  "exact-frame 59","wait 3",
  "exact-frame 58","wait 3",
  "exact-frame 57","wait 3",
  "exact-frame 56","wait 3",
  "exact-frame 55","wait 3",
  "spawn-unit unit-revenant 0 0 2 v_RessurectPlayer.Value jointoai.summoned", "goto end",
  "label diedemon", "die demon_eating","wait 2",	
  "label still","exact-frame 59", "wait 1",
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= v_NeedToResurrect.Value ressurect",
  "set-var Arg1.Value 2 1","goto begin","label end","die ressurect","wait 2"},
  Death = {"unbreakable begin","exact-frame 59","wait 2","unbreakable end","wait 1",},
  Death_ressurect = {"unbreakable begin","exact-frame 59","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 59","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

DefineAnimations("animations-revenant", {
  Still = RevenantStill,
  Move = RevenantMove,
  Attack = {"unbreakable begin", 
  "frame 45", "wait 3", 
  "frame 50", 
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
  "if-var v_UnitFlags.Value & "..unitFlags.UF_UpgradeTracer.." tracer1",
  "spawn-missile missile-revenant-missile 0 0 0 0 damage.totarget 1",
  "spawn-missile missile-revenant-missile 0 0 0 0 damage.totarget 2",
  "goto tracer1cont",
  "label tracer1",
  "spawn-missile missile-revenant-tracer 0 0 0 0 damage.totarget 1",
  "spawn-missile missile-revenant-tracer 0 0 0 0 damage.totarget 2",
  "label tracer1cont",
  "wait 6", 
  "frame 0", "wait 40",
  "goto end",
  "label normal",
  "if-var v_UnitFlags.Value & "..unitFlags.UF_UpgradeTracer.." tracer2",
  "spawn-missile missile-revenant-missile 0 0 0 0 damage.totarget v_Weapon.Value", "goto tracer2cont",
  "label tracer2",
  "spawn-missile missile-revenant-tracer 0 0 0 0 damage.totarget v_Weapon.Value",
  "label tracer2cont",
  "sound revenant-attack", "wait 6", 
  "frame 0", "wait 33",
  "if-var v_Weapon.Value == 2 set1",
  "set-var Weapon.Value 0 2",
  "goto end",
  "label set1",
  "set-var Weapon.Value 0 1",
  "label end",
  "frame 0", "unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin", 
  "set-var DamageType 0 melee",
  "set-var ShieldPiercing.Value 0 1",
  "frame 30", "sound revenant-whoosh", "wait 4", "frame 35", "wait 4", "frame 40", 
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
  "attack", "sound revenant-punch",
    "wait 6",
    "frame 0", "wait 4",
    "frame 0", "unbreakable end", "wait 1",},
  Death = RevenantDeath,
})

UnitName = "unit-revenant"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
BaseDamage2 = UnitInfo(UnitName, const.Unit_BaseDmg2)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DamageType2 = UnitInfo(UnitName, const.Unit_DamageType2)
DefineUnitType(UnitName, { Name = _("Revenant"),
  -- Drawing
  Image = {"file", "graphics/hell/units/revenant.png", "size", {60, 60}},
  Animations = "animations-revenant", Icon = "icon-revenant",
  Shadow = {"file", "graphics/hell/units/revenant-s.png", "size",{60, 60},"offset", {0, 0}},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {34, 50}, BoxOffset = {0, 6},
  MissileOffsets = {{{-9, -12}, {-6, -15}, {10, -14}, {9, -12}, {13, -15}, {8, -12}, {-8, -8}, {-26, -11}},
					{{9, -15}, {8, -15}, {10, -8}, {-5, -11}, {-7, -16}, {-10, -10}, {-6, -16}, {3, -14}}},
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
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  CanCastSpell = {"spell-punch"},
  AutoCastActive = {"spell-punch"},
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  ShieldPiercing = {Value = 0, Max = 1, Enable = true, Increase = 0},
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-revenant-missile",
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
  PriorityTarget = {"organic", "false", "Mechanical", "only", "AirUnit", "only", "Building", "only"},
  RightMouseAction = "attack",
  Sounds = {
    "selected", "revenant-select",
    "acknowledge", "revenant-move",
    "ready", "revenant-select",
    "help", "hell unit under attack",
    "dead", "revenant-death"} } )

DefineUnitType("unit-revenant-body", { Name = _("Revenant Body"),
  Image = {"file", "graphics/hell/units/revenant.png", "size", {60, 60}},
  Animations = "animations-revenant-body", Icon = "icon-revenant",
  HitPoints = 120,
  Offset = {0, -10},
  DrawLevel = 10,
  Indestructible = 1,
  IsHeavyFleshArmor = 1,
  NeedToResurrect = 3,
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