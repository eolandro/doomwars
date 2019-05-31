-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local SpiderdemonStill = {"frame 0", "wait 4", "random-goto 99 no-rotate", "frame 5", "wait 3",
"frame 10", "wait 3", "frame 15", "wait 3", "frame 20", "wait 3", "frame 25", "wait 3", "random-rotate 1", "label no-rotate", "wait 1",}
local SpiderdemonMove = {"unbreakable begin",
	"frame 0", "move 6", "wait 4", "sound spiderdemon hoof", 
	"frame 5", "move 5", "wait 3",
    "frame 10", "move 6", "wait 4", 
	"frame 15", "move 5", "wait 3", "sound spiderdemon hoof",
	"frame 20", "move 5", "wait 4",
	"frame 25", "move 5", "wait 3",
    "unbreakable end", "wait 1",}
local SpiderdemonDeath = {"unbreakable begin", 
	"exact-frame 40", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 5", 
	"exact-frame 41", "wait 5", 
	"exact-frame 42", "wait 5", 
	"exact-frame 43", "wait 5", 
	"exact-frame 44", "wait 5", 
	"exact-frame 45", "wait 5", 
	"exact-frame 46", "wait 5", 
	"exact-frame 47", "wait 5", 
	"exact-frame 48", "wait 5", 
	"exact-frame 49", "wait 5", 
	"exact-frame 49", "spawn-unit unit-spiderdemon-body 0 0 2 15", 
	"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
		"unbreakable end", "wait 1",}

DefineAnimations("animations-spiderdemon", {
  Still = SpiderdemonStill,
  Move = SpiderdemonMove,
  Attack = {"unbreakable begin", "frame 30", "wait 2", "frame 35",
    "spawn-missile missile-chain-bullet 0 0 0 0 damage.totarget",
	"spawn-missile missile-chain-bullet 0 0 r_-1.1 r_-1.1 damage.totarget",
	"spawn-missile missile-chain-bullet 0 0 r_-1.1 r_-1.1 damage.totarget", "sound chaingun attack", "wait 1",
    "frame 30", 
    "frame 30", "unbreakable end", "wait 1",},
  Death = SpiderdemonDeath,
})

DefineAnimations("animations-spiderdemon-body", {
  Still = {"label begin","exact-frame 49","if-var v_Arg1.Value > 0 still", "exact-frame 49","wait 1", "goto end",
  "label diedemon", "die demon_eating","wait 2",
  "label still","exact-frame 49", "wait 1",
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die","wait 2"},
  Death = {"unbreakable begin","exact-frame 49","wait 2","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 49","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

local function SpiderDemonAura(slot)
	local player = GetUnitVariable(slot,"Player")
	local units = GetUnitsAroundUnit(tonumber(slot), 2)
	
	for i = 1,table.getn(units) do
		local unit = units[i]
		if (slot ~= unit and GetUnitBoolFlag(unit, "Building") == false and GetUnitBoolFlag(unit, "Hell") == true) then
			SetUnitVariable(unit, "Haste", 45, "Max")
			SetUnitVariable(unit, "Haste", 45, "Value")
			SetUnitVariable(unit, "Haste", 1, "Enable")
		end
	end
	
	-- TTL
	if (GetUnitVariable(slot,"HellSuperweaponTTL", "Enable") == 1 and GetUnitVariable(slot,"HellSuperweaponTTL", "Value") <= 0) then
		SetUnitVariable(slot, "HitPoints", 1, "Value")
	end
end

UnitName = "unit-spiderdemon"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("The Spider Mastermind"),
  -- Drawing
  Image = {"file", "graphics/hell/units/spider.png", "size", {128, 128}},
  Shadow = {"file", "graphics/hell/units/spider-s.png", "size",{128, 128},"offset", {0, 0}},
  Animations = "animations-spiderdemon", Icon = "icon-spiderdemon",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  Offset = {0, -40},
  TileSize = {3, 1}, BoxSize = {127, 80},
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  Type = "land",
  Flip = false, NumDirections = 8,
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
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-spider-bullet",
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
  CanAttack = true,
  -- CanGroundAttack = true,
  GroundAttack = true,
  CanTargetLand = true,
  CanTargetSea = true,
  CanTargetAir = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  -- Other
  RightMouseAction = "attack",
  OnEachSecond = SpiderDemonAura,
  Sounds = {
    "selected", "spiderdemon sight",
    "acknowledge", "demons-move",
    "ready", "spiderdemon sight",
    "help", "hell unit under attack",
    "dead", "spiderdemon death"} } )

DefineUnitType("unit-spiderdemon-body", { Name = _("The Spider Mastermind Body"),
  Image = {"file", "graphics/hell/units/spider.png", "size", {128, 128}},
  Animations = "animations-spiderdemon-body", Icon = "icon-spiderdemon",
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
