-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local CyberdemonStill = {"frame 5", "wait 4", "random-goto 99 no-rotate", "frame 10", "wait 4",
"frame 15", "wait 4","frame 0", "wait 4","random-rotate 1", "label no-rotate", "wait 1",}
local CyberdemonMove = {"unbreakable begin",
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 2", "wait 2", "sound cyberdemon hoof",
	"frame 5", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 2", "wait 2", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 2", 
	"frame 15", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", 
	"frame 0", "move 2", "wait 2",  "sound cyberdemon hoof",
	"frame 5", "move 2", "wait 2", 
	"frame 5", "move 2", "wait 2",
    "frame 10", "move 2", "wait 2", 
	"frame 10", "move 2", "wait 2",
	"frame 15", "move 2", "wait 2", 
	"frame 15", "move 2", "wait 2",
	"unbreakable end", "wait 2",}
local CyberdemonDeath = {"unbreakable begin", 
	"exact-frame 30", "spawn-missile missile-gibs 20 20 0 0 pixel", "wait 4", 
	"exact-frame 31", "wait 4", 
	"exact-frame 32", "wait 4", 
	"exact-frame 33", "wait 4", 
	"exact-frame 34", "wait 4", 
	"exact-frame 35", "wait 4", 
	"exact-frame 36", "wait 4", 
	"exact-frame 37", "wait 4", 
	"exact-frame 38", "spawn-unit unit-cyberdemon-body 0 0 2 15", 
	"set-var ArtifactGive.Max 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Value 0 v_ArtifactGive.Value l",
		"set-var ArtifactGive.Enable 0 1 l",
    "exact-frame 38", "unbreakable end", "wait 1",}

DefineAnimations("animations-cyberdemon", {
  Still = CyberdemonStill,
  Move = CyberdemonMove,
  Attack = {"unbreakable begin", "frame 20", 
  "wait 7", "frame 25", "rotate target", "attack", "sound cyber launch", 
  "wait 7", "frame 20", "wait 7", "frame 25", "rotate target", "attack", "sound cyber launch", 
  "wait 7", "frame 20", "wait 7", "frame 25", "rotate target", "attack", "sound cyber launch", 
  "wait 7", "frame 20", "wait 7", "frame 5", "wait 22",
    "frame 5", "unbreakable end", "wait 1",},
  Death = CyberdemonDeath,
})

DefineAnimations("animations-cyberdemon-body", {
  Still = {"label begin","exact-frame 38","if-var v_Arg1.Value > 0 still", "exact-frame 38","wait 1", "goto end",
  "label diedemon", "die demon_eating","wait 2",	
  "label still","exact-frame 38", "wait 1", 
  "if-var v_UnitFlags.Value & "..unitFlags.UF_KillFromDemon.." diedemon",
  "set-var Arg1.Value 2 1","goto begin","label end","wait 1","die","wait 2"},
  Death = {"unbreakable begin","exact-frame 38","wait 2","unbreakable end","wait 1",},
  Death_demon_eating = {"unbreakable begin","exact-frame 38","spawn-missile missile-gibs 20 20 0 0 pixel","wait 3","unbreakable end","wait 1",}
})

local function CyberDemonTTL(slot)
		-- TTL
	if (GetUnitVariable(slot,"HellSuperweaponTTL", "Enable") == 1 and GetUnitVariable(slot,"HellSuperweaponTTL") <= 0) then
		SetUnitVariable(slot, "HitPoints", 1, "Value")
	end
end

UnitName = "unit-cyberdemon"
BaseDamage = UnitInfo(UnitName, const.Unit_BaseDmg)
DamageType = UnitInfo(UnitName, const.Unit_DamageType)
DefineUnitType(UnitName, { Name = _("Cyberdemon"),
  -- Drawing
  Image = {"file", "graphics/hell/units/cyber.png", "size", {100, 100}},
  Shadow = {"file", "graphics/hell/units/cyber-s.png", "size",{100, 100},"offset", {0, 0}},
  Animations = "animations-cyberdemon", Icon = "icon-cyberdemon",
  MissileOffsets = {{{0, -40}, {32, -32}, {36, -36}, {50, -25}, {35, -27}, {-5, -32}, {-24, -32}, {-22, -34}}},
  Offset = {0, -40},
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {2, 1}, BoxSize = {60, 76}, BoxOffset = {0, -28},
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  Type = "land",
  Flip = false, NumDirections = 8,
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  PoisonDrain = 2,
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxAttackRange = UnitInfo(UnitName, const.Unit_AtkRange),
  Priority = 30,
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  Points = UnitInfo(UnitName, const.Unit_Points),
  DamageType = "extreme",
  ArtifactGive = UnitInfo(UnitName, const.Unit_Artifact),
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-cyber-rocket",
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
  -- CanGroundAttack = true,
  GroundAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = true,
  LandUnit = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  -- Other
  RightMouseAction = "attack",
  OnEachSecond = CyberDemonTTL,
  Sounds = {
    "selected", "cyberdemon sight",
    "acknowledge", "demons-move",
    "ready", "cyberdemon sight",
    "help", "hell unit under attack",
    "dead", "cyberdemon death"} } )

DefineUnitType("unit-cyberdemon-body", { Name = _("Cyberdemon Body"),
  Image = {"file", "graphics/hell/units/cyber.png", "size", {100, 100}},
  Animations = "animations-cyberdemon-body", Icon = "icon-cyberdemon",
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
