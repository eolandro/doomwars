-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local PainStill = {"frame 5", "wait 4", "random-goto 99 no-rotate","frame 10", "wait 4",
"frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local PainMove = {"unbreakable begin", 
	"if-var v_HitPoints.Percent <= 40 damaged40", 
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 1",
	"frame 5", "move 3", "wait 2", 
	"frame 5", "move 2", "wait 1",
	"frame 10", "move 3", "wait 2", 
	"frame 10", "move 2", "wait 1",
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 1",
	"frame 5", "move 3", "wait 2", 
	"frame 5", "move 2", "wait 1",
	"frame 10", "move 3", "wait 2", 
	"frame 10", "move 2", "wait 1", "goto end",
	"label damaged40",
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 2",
	"frame 5", "move 3", "wait 2", 
	"frame 5", "move 2", "wait 1",
	"frame 10", "move 3", "wait 2", 
	"frame 10", "move 2", "wait 2",
	"frame 0", "move 3", "wait 2", 
	"frame 0", "move 3", "wait 1",
	"frame 5", "move 3", "wait 2", 
	"frame 5", "move 2", "wait 2",
	"frame 10", "move 3", "wait 2", 
	"frame 10", "move 2", "wait 1",
	"label end", "unbreakable end", "wait 1"}
local PainDeath = {"unbreakable begin", 
	"exact-frame 30", "spawn-missile missile-brown-gibs 20 20 0 0 pixel", "wait 5", 
	"exact-frame 31", "wait 5", 
	"exact-frame 32", "wait 5", 
	"exact-frame 33", "wait 5", 
	"exact-frame 34", "wait 5", 
	"exact-frame 35", "wait 5", 
    "exact-frame 35", "unbreakable end","wait 1",}

DefineAnimations("animations-painelemental", {
  Still = PainStill,
  Move = PainMove,
  Attack = {"unbreakable begin", 
  "frame 0", "wait 2", 
  "frame 15", "wait 2",
  "frame 20", "wait 2",  
  "frame 25", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_UpgradeZombification.." zombie",
  "attack", "sound lostsoul attack", "wait 8", "goto next",
  "label zombie",
  "spawn-missile missile-zombie-soul 0 0 0 0 damage.totarget", "sound lostsoul attack", "wait 8",
  "label next",
  "frame 0", "wait 26", 
    "unbreakable end", "wait 1"},
  SpellCast = {"unbreakable begin", 
  "frame 0", "wait 2", 
  "frame 15", "wait 2",
  "frame 20", "wait 2",  
  "frame 25", 
  "attack", "set-var HellSuperweaponTTL.Enable = 1 l", "set-var HellSuperweaponTTL.Max 0 1800 l", "set-var HellSuperweaponTTL.Value 0 1800 l","sound lostsoul attack", "wait 8",
  "frame 0", "wait 26", 
    "unbreakable end", "wait 1"},
  Death = PainDeath  
})

UnitName = "unit-painelemental"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Pain Elemental"),
  -- Drawing
  Image = {"file", "graphics/hell/units/pain.png", "size", {80, 80}},
  Shadow = {"file", "graphics/hell/units/pain-s.png", "size",{80, 80},"offset", {24, 24}},
  Animations = "animations-painelemental", Icon = "icon-painelemental",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {60, 44},
  Impact = {"shell", "missile-green-shell-meat", "melee", "missile-green-melee-meat"},
  Type = "fly",
  Flip = false, NumDirections = 8,
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  CanCastSpell = {"spell-summon-soul", "spell-summon-soul-for-ai", "spell-summon-soul-new", "spell-summon-soul-for-ai-new"},
  Priority = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Mana = UnitInfo(UnitName, const.Unit_Mana),
  PoisonDrain = 1,
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-soul",
  IsAirFleshArmor = 1,
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
  SaveCargo = true,  
  CanAttack = true,
  ShieldPiercing = 1,
  CanTargetLand = true,
  CanTargetSea = true,
  CanTargetAir = true,
  AirUnit = true,
  DetectCloak = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  Soul = true,
  -- Other
  CanTransport = {"lostsoul","only"},
  CanTargetFlag = {"organic", "only", "Building", "false", "Soul", "false"},
  MaxOnBoard = 4,
  RightMouseAction = "attack",
  OnEachSecond = UpdateVeteranStatus,
  Sounds = {
    "selected", "pain elemental sight",
    "acknowledge", "demons-move",
    "ready", "pain elemental sight",
	"dead", "pain elemental death",
    "help", "hell unit under attack"} } )