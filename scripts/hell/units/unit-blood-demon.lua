-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local BloodDemonStill = {"frame 5", "wait 4", "random-goto 99 no-rotate", "frame 10", "wait 4",
"frame 15", "wait 4","frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local BloodDemonMove = {"unbreakable begin",
	"if-var v_HitPoints.Percent <= 40 damaged40", 
	"frame 0", 	"move 4", "wait 2", 
				"move 4", "wait 2", 
	"frame 5", 	"move 4", "wait 1", 
				"move 4", "wait 2", 
	"frame 10", "move 4", "wait 1", 
				"move 4", "wait 2", 
	"frame 15", "move 4", "wait 1", 
				"move 4", "wait 2", "goto end",
	"label damaged40",
	"frame 0", 	"move 4", "wait 2", 
				"move 4", "wait 2", 
	"frame 5", 	"move 4", "wait 2", 
				"move 4", "wait 2", 
	"frame 10", "move 4", "wait 2", 
				"move 4", "wait 2", 
	"frame 15", "move 4", "wait 2", 
				"move 4", "wait 2",
	"label end", "unbreakable end", "wait 1",}
local BloodDemonDeath = {"unbreakable begin", 
	"exact-frame 35", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"exact-frame 36", "wait 3", 
	"exact-frame 37", "wait 3", 
	"exact-frame 38", "wait 3", 
	"exact-frame 39", "wait 3", 
	"exact-frame 40", "spawn-unit unit-blood-demon-body 0 0 2 15 summoned", 
	"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
		"set-var RessurectPlayer.Value 0 l_this l", "wait 3",
    "unbreakable end", "wait 1",}
	
DefineAnimations("animations-blood-demon-body", {
  Still = {"label begin","exact-frame 40","if-var v_Arg1.Value > 0 still", "exact-frame 40","wait 1", "goto end", 
  "label ressurect", 
  "set-var UnitFlags.Value &= "..unitFlags.UF_Raising,
  "sound vgavnonah", 
  "exact-frame 40","wait 3",
  "exact-frame 39","wait 3",
  "exact-frame 38","wait 3",
  "exact-frame 37","wait 3",
  "exact-frame 36","wait 3",
  "exact-frame 35","wait 3",
  "spawn-unit unit-blood-demon 0 0 2 v_RessurectPlayer.Value jointoai.summoned", "goto end",
  "label diedemon", "die demon_eating","wait 2",	
  "label still","exact-frame 40", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "if-var v_Ressurect.Value >= v_NeedToResurrect.Value ressurect",
  "set-var Arg1.Value 2 1","goto begin","label end","die ressurect","wait 2"},
  Death = {"unbreakable begin","exact-frame 40","wait 2","unbreakable end","wait 1",},
  Death_ressurect = {"unbreakable begin","exact-frame 40","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 40","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

DefineAnimations("animations-blood-demon", {
  Still = BloodDemonStill,
  Move = BloodDemonMove,
  Upgrade = BloodDemonStill,
  Attack = {"unbreakable begin", 
  "if-var v_Veterancy.Value != 4 normal",
  "frame 20", "sound demon attack", "wait 4",
  "frame 25", "wait 4", 
  "frame 30", "spawn-missile missile-demon-bite-elite 0 0 0 0 damage.totarget", "wait 6",
  "frame 0", "wait 7", "goto end",
  "label normal",
  "frame 20", "sound demon attack", "wait 4",
  "frame 25", "wait 4", 
  "frame 30", "attack", "wait 6",
  "frame 0", "wait 7",
  "label end",
  "frame 0", "unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin",
  "if-var s_spell-eat-corpse == 1 eat",
  "frame 20", "wait 20", "frame 20", "attack", "goto end",
  "label eat",
  "frame 20", "sound demon attack", "wait 4",
  "frame 25", "wait 4", 
  "frame 30", "set-var DamageType 0 demon_eating", "attack", "set-var HitPoints.Value += 1000", "wait 6",
  "frame 0", "wait 7", "set-var DamageType 0 melee",
  "label end",
    "frame 0", "unbreakable end", "wait 1",},
  Death = BloodDemonDeath,
})

UnitName = "unit-blood-demon"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Blood Demon"),
  -- Drawing
  Image = {"file", "graphics/hell/units/blooddemon.png", "size", {52, 52}},
  Shadow = {"file", "graphics/hell/units/blooddemon-s.png", "size",{52, 52},"offset", {0, 0}},
  Animations = "animations-blood-demon", Icon = "icon-blood-demon",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {50, 45},
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  Type = "land",
  Flip = false, NumDirections = 8,
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  PoisonDrain = 1,
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = 1,
  Priority = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  DamageType = "melee",
  CanCastSpell = {"spell-eat-corpse", "spell-teleport", "spell-teleport-for-ai"},
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
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
  HeavyFlesh = true,
  Hell = true,
  ShieldPiercing = 1,
  SelectableByRectangle = true,
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  -- Other
  OnEachSecond = UpdateVeteranStatus,
  RightMouseAction = "attack",
  Sounds = {
    "selected", "demon sight",
    "acknowledge", "demons-move",
    "ready", "demon sight",
    "help", "hell unit under attack",
    "dead", "demon death"} } )
	
DefineUnitType("unit-blood-demon-body", { Name = _("Blood Demon Body"),
  Image = {"file", "graphics/hell/units/blooddemon.png", "size", {52, 52}},
  Animations = "animations-blood-demon-body", Icon = "icon-blood-demon",
  HitPoints = 150,
  DrawLevel = 10,
  NumDirections = 8, Flip = false,
  NoRandomPlacing = true,
  Indestructible = 1,
  NeedToResurrect = 3,
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