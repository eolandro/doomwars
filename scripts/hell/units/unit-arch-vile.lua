-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local ArchStill = UnitStill
local ArchMove = {"unbreakable begin",
	"if-var v_HitPoints.Percent <= 40 damaged40", 
	"frame 0", "move 3", "wait 1", 
	"frame 0", "move 3", "wait 1", 
	"frame 5", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 1",
    "frame 10", "move 3", "wait 1", 
	"frame 10", "move 2", "wait 1",
	"frame 15", "move 3", "wait 1", 
	"frame 15", "move 3", "wait 1",
    "frame 20", "move 3", "wait 1", 
	"frame 20", "move 2", "wait 1", 
	"frame 25", "move 3", "wait 1", 
	"frame 25", "move 2", "wait 1", "goto end",
	"label damaged40",
	"frame 0", "move 3", "wait 1", 
	"frame 0", "move 3", "wait 2", 
	"frame 5", "move 3", "wait 1", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 3", "wait 1", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 3", "wait 1", 
	"frame 15", "move 3", "wait 2",
    "frame 20", "move 3", "wait 1", 
	"frame 20", "move 2", "wait 2", 
	"frame 25", "move 3", "wait 1", 
	"frame 25", "move 2", "wait 2",
	"label end", "unbreakable end", "wait 1",}
local ArchDeath = {"unbreakable begin", 
	"exact-frame 95", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"exact-frame 96", "wait 3", 
	"exact-frame 97", "wait 3", 
	"exact-frame 98", "wait 3", 
	"exact-frame 99", "wait 3", 
	"exact-frame 100", "wait 3", 
	"exact-frame 101", "wait 3", 
	"exact-frame 102", "wait 3", 
	"exact-frame 103", "spawn-unit unit-archvile-body 0 0 2 15",
	"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
	"exact-frame 103", "unbreakable end", "wait 1",}
local ArchDeathExtreme = {"unbreakable begin", 
	"exact-frame 104", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 3", 
	"exact-frame 105", "wait 3", 
	"exact-frame 106", "wait 3", 
	"exact-frame 107", "wait 3", 
	"exact-frame 108", "wait 3", 
	"exact-frame 109", "wait 3", 
	"exact-frame 110", "wait 3", 
	"exact-frame 111", "wait 3", 
	"exact-frame 112", "wait 2000", 
	"exact-frame 112", "unbreakable end", "wait 1",}

DefineAnimations("animations-archvile", {
  Still = {"frame 0", "wait 4", "random-goto 99 no-rotate", "frame 5", "wait 4", "frame 10", "wait 4",
  "frame 15", "wait 4","frame 20", "wait 4","frame 25", "wait 4","random-rotate 1", "label no-rotate", "wait 1",},
  Move = ArchMove,
  Attack = {"unbreakable begin", 
  "frame 30", "sound archvile attack", "attack", "wait 6", "rotate target",
  "frame 35", "wait 6", "rotate target", 
  "frame 40", "wait 5", "rotate target",
  "frame 45", "wait 5","rotate target", 
  "frame 50", "wait 5", "rotate target", 
  "frame 55", "wait 5", "rotate target",
  "frame 60", "wait 4", "rotate target",
  "frame 65", "wait 4", "rotate target",
  "frame 70", "wait 4", "sound archvile fire", "rotate target", 
  "frame 75", "wait 15", 
  "frame 0", "wait 18", 
  "unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin",
  "if-var s_spell-inferno == 1 inferno",
  "if-var s_spell-ressurect == 1 resurrect",
  "frame 80", "wait 15", 
  "frame 85", "wait 15", 
  "frame 90", "set-var RessurectPlayer.Value 0 l_this t", "attack",
  "if-var s_spell-invulnerability == 1 invuln",
  "if-var s_spell-destroy-armor == 1 destroy",
  "goto next",
  "label invuln",
  "sound invilerability", "goto next",
  "label destroy",
  "sound curse armor",
  "label next",
  "wait 15", "goto end",
  "label resurrect",
  "if-var v_Mana.Value < 20 end",
  "frame 80", "wait 15", 
  "frame 85", "wait 15", 
  "frame 90", "set-var Ressurect.Value += 1 t", "set-var Mana.Value -= 20",
  "if-var t_Ressurect.Value >= t_NeedToResurrect.Value good", "wait 15", "goto resurrect",
  "label good",
  "attack", "set-var RessurectPlayer.Value 0 l_this t", "wait 15", "goto end",
  "label inferno",
  "frame 80", "wait 15",
  "frame 85", "wait 15",
  "frame 90", "attack", "wait 15",
  "label end",
  "if-var s_spell-ressurect == 1 resend",
  "frame 0", "wait 18", 
  "label resend",
  "unbreakable end",  "wait 1",},
  Death = ArchDeath,
  Death_extreme = ArchDeathExtreme,
})

DefineAnimations("animations-archvile-body", {
  Still = {"label begin","exact-frame 103","if-var v_Arg1.Value > 0 still", "exact-frame 103","wait 1", "goto end",
  "label diedemon", "die demon_eating","wait 2",
  "label still","exact-frame 103", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die","wait 2"},
  Death = {"unbreakable begin","exact-frame 103","wait 2","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 103","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

UnitName = "unit-archvile"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Arch-Vile"),
  -- Drawing
  Image = {"file", "graphics/hell/units/vile.png", "size", {64, 64}},
  Shadow = {"file", "graphics/hell/units/vile-s.png", "size",{64, 64},"offset", {0, 0}},
  Animations = "animations-archvile", Icon = "icon-archvile",
  Flip = false, NumDirections = 8,
  Type = "land",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {42, 50}, BoxOffset = {0, 12},
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
  Mana = UnitInfo(UnitName, const.Unit_Mana),
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  CanCastSpell = {"spell-ressurect", "spell-invulnerability","spell-destroy-armor","spell-inferno"},
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-archvile-fire",
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
  HeavyFlesh = true,  
  CanAttack = true,
  CanTargetAir = false,
  CanTargetLand = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  -- Other
  PriorityTarget = {"organic", "only", "AirUnit", "false", "Mechanical", "false", "Building", "only"},
  OnEachSecond = UpdateVeteranStatus,
  RightMouseAction = "attack",
  Sounds = {
    "selected", "archvile sight",
    "acknowledge", "archvile active",
    "ready", "archvile sight",
    "help", "hell unit under attack",
    "dead", "archvile death"} } )

DefineUnitType("unit-archvile-body", { Name = _("Arch-Vile Body"),
  Image = {"file", "graphics/hell/units/vile.png", "size", {64, 64}},
  Animations = "animations-archvile-body", Icon = "icon-archvile",
  HitPoints = 150,
  Offset = {0, -20},
  DrawLevel = 10,
  Indestructible = 1,
  IsHeavyFleshArmor = 1,
  NumDirections = 8, Flip = false,
  NoRandomPlacing = true,
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