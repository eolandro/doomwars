-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

local TransportStill = {"set-var Repair.Value 0 0","frame 0", "wait 4", 
	"random-goto 99 no-rotate", "random-rotate 1", "label no-rotate", "wait 1",}
local TransportMove = {"unbreakable begin",
	"set-var Repair.Value 0 1",
	"frame 0", "if-var v_HitPoints.Percent <= 40 damaged50",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 1",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 1", 
	"frame 0", "move 4", "wait 2", 
	"frame 0", "move 2", "wait 1", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 2",
	"frame 0", "move 2", "wait 1", "goto end",
	"label damaged50",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 2",
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 4", "wait 2", 
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 4", "wait 1", 
	"frame 0", "move 2", "wait 2", 
	"frame 0", "move 4", "wait 2", 
	"frame 0", "move 2", "wait 2",
	"frame 0", "move 2", "wait 1",
	"label end", "unbreakable end", "wait 1",}
local TransportDeath = {"unbreakable begin", 
	"frame 5", "wait 4", 
	"frame 10", "wait 4", 
	"frame 15", "wait 4", 
	"frame 20", "wait 4",
	"unbreakable end", "wait 1",}
	
DefineAnimations("animations-uac-transport", {
  Still = TransportStill,
  Move = TransportMove,
  Death = TransportDeath,
})

UnitName = "unit-uac-transport"
DefineUnitType(UnitName, { Name = _("Transport"),
  -- Drawing
  Image = {"file", "graphics/uac/units/transport.png", "size", {130, 130}},
  Offset = {0, 0},
  Shadow = {"file", "graphics/uac/units/transport-s.png", "size",{100, 100},"offset", {30, 30}},
  Animations = "animations-uac-transport", Icon = "icon-uac-transport",
  DrawLevel = UnitInfo(UnitName, const.Unit_Draw),
  TileSize = {1, 1}, BoxSize = {55, 45},
  Type = "fly",
  -- Properties
  Costs = {"time", UnitInfo(UnitName, const.Unit_Build), "minerals", UnitInfo(UnitName, const.Unit_MinCost), "energy", UnitInfo(UnitName, const.Unit_EngCost)},
  HitPoints = UnitInfo(UnitName, const.Unit_HP),
  SightRange = UnitInfo(UnitName, const.Unit_Sight), ComputerReactionRange = UnitInfo(UnitName, const.Unit_Comp),
  PersonReactionRange = UnitInfo(UnitName, const.Unit_Person),
  MaxOnBoard = 6,
  PoisonDrain = 1,
  Priority = 20,
  Points = UnitInfo(UnitName, const.Unit_Points),
  Demand = UnitInfo(UnitName, const.Unit_Supply),
  ButtonLevelForTransporter = 1,
  -- Damage and armor part
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  IsAirMechanicalArmor = 1,
  ---------------------
  -- Flags
  Transporter = true,
  DetectCloak = true,
  Mechanical = true,
  ShowArmor = true,
  AirUnit = true,
  SelectableByRectangle = true,
  UAC = true, 
  -- Other
  OnHit = ResetSmoke,
  Corpse = "unit-fighter-exp",
  CanTransport = {"LandUnit", "only", "UAC", "only"},
  RightMouseAction = "move",
  DeathExplosion = TransportExplosion,
  OnEachSecond = UpdateVeteranStatus,
  OnEachCycle = SmokeControlTransport,
  Sounds = {
    "selected", "transport-selected",
    "acknowledge", "transport-acknowledge",
    "ready", "transport-ready",
    "help", "uac unit under attack",
    "dead", "robot explode"} } )