-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

DefineAnimations("animations-phantom", {
  Still = {"frame 0", "wait 8", "frame 5", "wait 8", "random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",},
  Move = {"unbreakable begin", 
	"frame 0", "move 3", "wait 1", 
	"frame 0", "move 3", "wait 1", 
	"frame 5", "move 3", "wait 1", 
    "frame 10", "move 3", "wait 1", 
	"frame 15", "move 3", "wait 1", 
    "frame 0", "move 3", "wait 1", 
	"frame 0", "move 3", "wait 1", 
	"frame 5", "move 3", "wait 1", 
    "frame 10", "move 3", "wait 1", 
	"frame 15", "move 3", "wait 1", 
	"frame 15", "move 2", "wait 1",
	"unbreakable end", "wait 1",},
  Attack = {"unbreakable begin", 
	"frame 20", "wait 3", 
	"frame 25", "attack", "sound lostsoul attack", "wait 2",
	"frame 0","wait 18", "unbreakable end", "wait 1",},
  SpellCast = {"unbreakable begin", 
	"frame 20", "if-var t_ToZombifie.Value > 0 fail", "wait 45",
	"frame 25", "if-var t_ToZombifie.Value > 0 fail",
	"attack", "set-var RessurectPlayer.Value 0 l_this t", "sound lostsoul attack",
	"label fail",
	"unbreakable end",
	"if-var v_ToZombifie.Value == 0 notdie",
	"label die",
	"sound zombie dwell",
	"die selfkill",
	"label notdie", "wait 1",},
  Death = {"unbreakable begin", 
	"exact-frame 30", "wait 4", 
	"exact-frame 31", "wait 4", 
	"exact-frame 32", "wait 4", 
	"exact-frame 33", "wait 4", 
	"exact-frame 34", "wait 4", 
	"exact-frame 35", "wait 4", 
	"exact-frame 36", "wait 4",
    "unbreakable end", "wait 1",},
   Death_selfkill = {"unbreakable begin", 
	"exact-frame 37", "wait 1", 
    "unbreakable end", "wait 1",},
})

local function PhantomTTL(slot)
	UpdateVeteranStatus(slot)
		-- TTL
	if (GetUnitVariable(slot,"HellSuperweaponTTL", "Enable") == 1 and GetUnitVariable(slot,"HellSuperweaponTTL") <= 0) then
		SetUnitVariable(slot, "HitPoints", 1, "Value")
	end
end

UnitName = "unit-phantom"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Phantom"),
  -- Drawing
  Image = {"file", "graphics/hell/units/phantom.png", "size", {52, 52}},
  Shadow = {"file", "graphics/hell/units/phantom-s.png", "size",{52, 52}, "offset", {15, 15}},
  Animations = "animations-phantom", Icon = "icon-phantom",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  NumDirections = 8, Flip = false,
  TileSize = {1, 1}, BoxSize = {30, 30},
  Type = "land",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  CanCastSpell = {"spell-zombifie"},
  AutoCastActive = {"spell-zombifie"},
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
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
  CanAttack = true,
  CanTargetLand = true,
  CanTargetSea = true,
  CanTargetAir = true,
  LandUnit = true,
  ShieldPiercing = 1,
  organic = true,
  Hell = true,
  lostsoul = true,
  DetectCloak = true,
  ShowArmor = true,
  SelectableByRectangle = true,
  Soul = true,
  -- Other
  CanTargetFlag = {"organic", "only", "Building", "false", "Soul", "false"},
  RightMouseAction = "attack",
  OnEachSecond = PhantomTTL,
  Sounds = {
    "selected", "lostsoul attack",
    "acknowledge", "demons-move",
    "ready", "lostsoul attack",
    "help", "hell unit under attack",
    "dead", "fire explosion"} } )

UnitName = "unit-new-phantom"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Phantom"),
  -- Drawing
  Image = {"file", "graphics/hell/units/phantom.png", "size", {52, 52}},
  Shadow = {"file", "graphics/hell/units/phantom-s.png", "size",{52, 52}, "offset", {15, 15}},
  Animations = "animations-phantom", Icon = "icon-phantom",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  NumDirections = 8, Flip = false,
  TileSize = {1, 1}, BoxSize = {30, 30},
  Type = "fly",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  CanCastSpell = {"spell-zombifie"},
  AutoCastActive = {"spell-zombifie"},
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  PoisonDrain = 1,
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
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
  CanAttack = true,
  CanTargetLand = true,
  CanTargetSea = true,
  CanTargetAir = true,
  AirUnit = true,
  ShieldPiercing = 1,
  organic = true,
  Hell = true,
  lostsoul = true,
  DetectCloak = true,
  ShowArmor = true,
  SelectableByRectangle = true,
  Soul = true,
  -- Other
  CanTargetFlag = {"organic", "only", "Building", "false", "Soul", "false"},
  RightMouseAction = "attack",
  OnEachSecond = PhantomTTL,
  Sounds = {
    "selected", "lostsoul attack",
    "acknowledge", "demons-move",
    "ready", "lostsoul attack",
    "help", "hell unit under attack",
    "dead", "fire explosion"} } )