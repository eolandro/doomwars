local list = ListFilesInDirectory("scripts/uac/units/")
for i,f in ipairs(list) do
	if (string.find(f, "^unit-.*%.lua$")) then
		Load("scripts/uac/units/"..f)
	end
end
	
DefineUnitType("unit-power-plant", { Name = _("Power Plant"),
  Image = {"file", "graphics/uac/buildings/power-plant.png", "size", {96, 87}},
  Shadow = {"file", "graphics/uac/buildings/power-plant-s.png", "size",{96, 87}},
  Animations = "animations-power-plant", Icon = "icon-power-plant",
  Costs = {"time", 75, "minerals", 750},
  Offset = {0, -12},
  BoxOffset = {0, -16},
  RepairHp = 2,
  Storing = {"energy", 100},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-power-plant",
  HitPoints = 600,
  ProductMax = 12,
  DrawLevel = 40,
  AiBuildingRules = { {"distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"}}
				  },
  TileSize = {3, 2}, BoxSize = {95, 84},
  SightRange = 3,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10, 
  Points = 60,
  AiAdjacentRange = 0,
  OnHit = ResetSmoke,
  OnEachCycle = SmokeControlPowerPlant,
  OnEachSecond = PowerPlantControlUACSmall,
  DeathExplosion = SmallBuildingExplosion,
  IsBuildingArmor = 1,
  UAC = true,
  PlantValue = true,
  Corpse = "unit-destroyed-3x2-place",
  Type = "land",
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "powerplant-selected",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )
	
DefineUnitType("unit-supply-depot", { Name = _("Supply Depot"),
  Image = {"file", "graphics/uac/buildings/depot.png", "size", {96, 102}},
  Shadow = {"file", "graphics/uac/buildings/depot-s.png", "size",{96, 102}},
  Animations = "animations-supply-depot", Icon = "icon-supply-depot",
  Costs = {"time", 75, "minerals", 700},
  RepairHp = 2,
  Offset = {0, -10},
  BoxOffset = {0, -14},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-depot",
  HitPoints = 600,
  DrawLevel = 40,
  TileSize = {3, 2}, BoxSize = {96, 101},
  SightRange = 3,
  OnHit = ResetSmoke,
  AiAdjacentRange = 0,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"}}
				  },
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10, 
  Points = 60,
  IsBuildingArmor = 1,
  Supply = 7,
  UAC = true,
  DeathExplosion = SmallBuildingExplosion,
  OnEachCycle = SmokeControlSupplyDepot,
  Corpse = "unit-destroyed-3x2-place",
  Type = "land",
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "supply-depot",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

DefineUnitType("unit-barracks", { Name = _("Barracks"),
  Image = {"file","graphics/uac/buildings/barracks.png","size", {128, 103}},
  Shadow = {"file", "graphics/uac/buildings/barracks-s.png", "size",{128, 103}},
  Animations = "animations-uac-barracks", Icon = "icon-barracks",
  Costs = {"time", 160, "minerals", 1500},
  RepairHp = 2,
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-uac-barracks",
  HitPoints = 850,
  DrawLevel = 40,
  OnHit = ResetSmoke,
  TileSize = {4, 3}, BoxSize = {127, 102},
  SightRange = 3,
  IsBuildingArmor = 1,
  AiAdjacentRange = 2,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"}}
				  },
  Armor = 0, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10, 
  Points = 70,
  UAC = true,
  OnEachCycle = SmokeControlUACBarracks,
  DeathExplosion = MediumBuildingExplosion,
  Corpse = "unit-destroyed-4x3-place",
  Type = "land",
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "barracks",
	"acknowledge", "uac new-rally-point",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )
	
DefineUnitType("unit-weapon-factory", { Name = _("Weapon Factory"),
  Image = {"file","graphics/uac/buildings/weapon-factory.png","size",  {128, 162}},
  Shadow = {"file", "graphics/uac/buildings/weapon-factory-s.png", "size",{128, 162}},
  Animations = "animations-weapon-factory", Icon = "icon-weapon-factory",
  Costs = {"time", 200, "minerals", 2000, "energy", 350},
  RepairHp = 2,
  Offset = {0, -32},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-weapon-factory", 
  HitPoints = 900,
  DrawLevel = 40,
  IsBuildingArmor = 1,
  OnHit = ResetSmoke,
  AiAdjacentRange = 0,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"}}
				  },
  TileSize = {4, 3}, BoxSize = {128, 140}, BoxOffset = {0, -28},
  SightRange = 3,
  UAC = true,
  Armor = 0, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10,
  Points = 60,
  OnEachCycle = SmokeControlWeaponFactory,
  DeathExplosion = MediumBuildingExplosion,
  Corpse = "unit-destroyed-4x3-place",
  Type = "land", LandUnit = true,
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "weaponfactory-select",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

local function RadarStart(slot)
	local bitset = bit.tobits(GetUnitVariable(slot, "UnitFlags", "Value"))
	if (bitset[unitFlagsIndex.UFI_RadarEye] == 1 and bitset[unitFlagsIndex.UFI_Init] ~= 1) then
		SetUnitVariable(slot, "Charge", 1, "Enable")
		SetUnitVariable(slot, "Charge", 120, "Max")
		SetUnitVariable(slot, "Charge", 0, "Value")
		SetUnitVariable(slot, "Charge", 1, "Increase")
		bitset[unitFlagsIndex.UFI_Init] = 1
		SetUnitVariable(slot, "UnitFlags", bit.tonumb(bitset), "Value")
	end
	if (bitset[unitFlagsIndex.UFI_RadarResearch] == 1) then
		SetUnitVariable(slot, "RadarCharge", 1, "Enable")
		SetUnitVariable(slot, "RadarCharge", 60, "Max")
		SetUnitVariable(slot, "RadarCharge", 0, "Value")
		SetUnitVariable(slot, "RadarCharge", 1, "Increase")
		bitset[unitFlagsIndex.UFI_RadarResearch] = 0
		SetUnitVariable(slot, "UnitFlags", bit.tonumb(bitset), "Value")
	end
	if (bitset[unitFlagsIndex.UFI_ResearchActive] == 1) then
		if (GetUnitVariable(slot, "RadarResearch", "Value") == GetUnitVariable(slot, "RadarResearch", "Max") or GetUnitVariable(GetUnitVariable(slot, "RadarResearchTarget", "Value"), "IsAlive", "Value") == 0) then
			bitset[unitFlagsIndex.UFI_ResearchActive] = 0
			SetUnitVariable(slot, "UnitFlags", bit.tonumb(bitset), "Value")
			SetUnitVariable(slot, "RadarCharge", 1, "Enable")
			SetUnitVariable(slot, "RadarCharge", 60, "Max")
			SetUnitVariable(slot, "RadarCharge", 0, "Value")
			SetUnitVariable(slot, "RadarCharge", 1, "Increase")
			SetUnitVariable(slot, "RadarResearch", 0, "Max")
			SetUnitVariable(slot, "RadarResearch", 0, "Value")
			SetUnitVariable(slot, "RadarResearch", 0, "Increase")
			SetUnitVariable(slot, "RadarResearch", 0, "Enable")
			if (bitset[unitFlagsIndex.UFI_RadarEye] == 1) then
				SetUnitVariable(slot, "Charge", 1, "Enable")
				SetUnitVariable(slot, "Charge", 1, "Increase")
			end
			if (GetUnitVariable(GetUnitVariable(slot, "RadarResearchTarget", "Value"), "IsAlive", "Value") == 1) then
				local player = GetUnitVariable(slot, "Player")
				SetPlayerData(player, "Resources", "hellpower", GetPlayerData(player, "Resources", "hellpower") + GetUnitVariable(GetUnitVariable(slot, "RadarResearchTarget", "Value"), "ArtifactGive", "Value"))
				--tttttttttttttt = tttttttttttttt + GetUnitVariable(GetUnitVariable(slot, "RadarResearchTarget", "Value"), "ArtifactGive", "Value")
			end
		end
	end
end

DefineUnitType("unit-radar", { Name = _("Radar Station"),
  Image = {"file","graphics/uac/buildings/radar.png","size",  {160, 190}},
  Shadow = {"file", "graphics/uac/buildings/radar-s.png", "size",{160, 190}},
  Animations = "animations-radar", Icon = "icon-radar",
  Costs = {"time", 180, "minerals", 1800, "energy", 500},
  RepairHp = 2,
  Offset = {0, -44},
  BoxOffset = {0, -26},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-radar", 
  CanCastSpell = {"spell-radar-eye", "spell-radar-research"},
  HitPoints = 700,
  DrawLevel = 40,
  IsBuildingArmor = 1,
  Superweapon = true,
  OnHit = ResetSmoke,
  AiAdjacentRange = 0,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"}}
				  },
  TileSize = {5, 3}, BoxSize = {159, 150},
  SightRange = 17,
  RadarRange = 35,
  Armor = 0, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10,
  Points = 60,
  UAC = true,
  OnEachCycle = SmokeControlRadar,
  OnEachSecond = RadarStart,
  DeathExplosion = MediumBuildingExplosion,
  Corpse = "unit-destroyed-5x3-place",
  Type = "land",
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "radar-selected",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )
	
DefineUnitType("unit-vehicle-factory", { Name = _("Vehicle Factory"),
  Image = {"file","graphics/uac/buildings/factory.png","size", {170, 175}},
  Shadow = {"file", "graphics/uac/buildings/factory-s.png", "size",{170, 175}},
  Animations = "animations-factory", Icon = "icon-vehicle-factory",
  Costs = {"time", 220, "minerals", 2400, "energy", 450},
  RepairHp = 2,
  Offset = {0, -16},
  BoxOffset = {0, -16},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-factory", 
  HitPoints = 1000,
  DrawLevel = 40,
  OnHit = ResetSmoke,
  AiAdjacentRange = 2,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"}}
				  },
  CanCastSpell = {"spell-vehicle-repair"},
  AutoCastActive = {"spell-vehicle-repair"},
  TileSize = {5, 4}, BoxSize = {170, 170},
  SightRange = 3,
  IsBuildingArmor = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10, 
  Points = 80,
  UAC = true,
  OnEachCycle = SmokeControlUACVehicleFactory,
  DeathExplosion = BigBuildingExplosion,
  Corpse = "unit-destroyed-5x4-place",
  Type = "land",
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "vehiclefactory-selected",
	"acknowledge", "uac new-rally-point",
	"attack", "dummy",	
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

DefineUnitType("unit-tech-center", { Name = _("Tech Center"),
  Image = {"file","graphics/uac/buildings/tech-center.png","size", {160, 149}},
  Shadow = {"file", "graphics/uac/buildings/tech-center-s.png", "size",{160, 149}},
  Animations = "animations-tech-center", Icon = "icon-tech-center",
  Costs = {"time", 280, "minerals", 3200, "energy", 600},
  RepairHp = 2,
  Offset = {0, -2},
  BoxOffset = {0, -2},
  CanCastSpell = {"spell-anomaly-shield-sphere", "spell-anomaly-life-sphere", "spell-anomaly-regeneration-sphere", "spell-anomaly-skull-sphere", 
  "spell-anomaly-absolute-defence-sphere", "spell-anomaly-acid-sphere", "spell-anomaly-corruption-sphere", "spell-anomaly-vampirism-sphere"},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-tech-center",
  HitPoints = 1000,
  DrawLevel = 40,
  IsBuildingArmor = 1,
  OnHit = ResetSmoke,
  AiAdjacentRange = 0,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"}}
				  },
  TileSize = {5, 4}, BoxSize = {159, 148},
  SightRange = 3,
  Armor = 0, BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 10, 
  Points = 90,
  UAC = true,
  Corpse = "unit-destroyed-5x4-place",
  Type = "land",
  DeathExplosion = BigBuildingExplosion,
  OnEachCycle = SmokeControlTechCenter,
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "tech-center",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

local function OrbitalControlStart(slot)
	local bitset = bit.tobits(GetUnitVariable(slot, "UnitFlags", "Value"))
	if (bitset[unitFlagsIndex.UFI_Init] ~= 1) then
		SetUnitVariable(slot, "Charge", 1, "Enable")
		SetUnitVariable(slot, "Charge", 360, "Max")
		SetUnitVariable(slot, "Charge", 0, "Value")
		SetUnitVariable(slot, "Charge", 1, "Increase")
		bitset[unitFlagsIndex.UFI_Init] = 1
		bitset[unitFlagsIndex.UFI_SuperweaponCharged] = 0
		SetUnitVariable(slot, "UnitFlags", bit.tonumb(bitset), "Value")
	end
	
	if (bitset[unitFlagsIndex.UFI_SuperweaponCharged] ~= 1 and GetUnitVariable(slot, "Charge", "Value") == 360) then
		if (GetUnitVariable(slot, "Player") == GetThisPlayer()) then
			AddMessage("Orbital cannon is ready to fire!")
			PlaySound("uac orbital cannon")
		end
		bitset[unitFlagsIndex.UFI_SuperweaponCharged] = 1
		SetUnitVariable(slot, "UnitFlags", bit.tonumb(bitset), "Value")
	end
end

BaseDamage = 240
DamageType = "generic"
DefineUnitType("unit-orbital-control", { Name = _("Orbital Control"),
  Image = {"file","graphics/uac/buildings/orbital-control.png","size",  {160, 182}},
  Shadow = {"file", "graphics/uac/buildings/orbital-control-s.png", "size",{176, 182}},
  Animations = "animations-orbital-control", Icon = "icon-orbital-control",
  Costs = {"time", 400, "minerals", 5000, "energy", 1000},
  RepairHp = 2,
  Offset = {0, -28},
  BoxOffset = {0, -28},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-orbital-control",
  HitPoints = 1500,
  DrawLevel = 40,
  OnHit = ResetSmoke,
  AiAdjacentRange = 0,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"}}
  },
  -- Damage and armor part
  IsBuildingArmor = 1,
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
  Superweapon = true,
  DamageType = "extreme",
  TileSize = {5, 4}, BoxSize = {159, 181},
  SightRange = 9, ComputerReactionRange = 192, PersonReactionRange = 192,
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  Priority = 10,
  Points = 180,
  UAC = true, Coward = true,
  DeathExplosion = BigBuildingExplosion,
  OnEachCycle = SmokeControlOrbitalControl,
  OnEachSecond = OrbitalControlStart,
  Corpse = "unit-destroyed-5x4-place",
  CanCastSpell = {"spell-superball", "spell-superball-for-ai"},
  Type = "land",
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = true,
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "orbital-cannon",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

BaseDamage = 600
DamageType = "fire"
DefineUnitType("unit-thermo-power-plant", { Name = _("Nuclear Power Plant"),
  Image = {"file", "graphics/uac/buildings/thermo-plant.png", "size", {96, 154}},
  Shadow = {"file", "graphics/uac/buildings/thermo-plant-s.png", "size",{96, 154}},
  Animations = "animations-thermo-power-plant", Icon = "icon-thermo-plant",
  Costs = {"time", 180, "minerals", 1900, "energy", 400},
  RepairHp = 2,
  Storing = {"energy", 150},
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-thermo-power-plant",
  HitPoints = 800,
  DrawLevel = 40,
  PlantValue = true,
  ProductMax = 16,
  DamageType = "fire",
  AiAdjacentRange = 0,
  AiBuildingRules = { { "distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-command-center"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-vehicle-factory"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-chaingun-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-missile-tower"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-monster-spawner"},
					"distance", { Distance = 2, DistanceType = ">", Type = "unit-hellgate"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-upgraded-fire-tower"},
					"distance", { Distance = 1, DistanceType = ">", Type = "unit-horror-tower"},
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"}}
				  },
  -- Damage and armor part
  IsBuildingArmor = 1,
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
  OnHit = ResetSmoke,
  OnEachCycle = SmokeControlThermoPowerPlant,
  OnEachSecond = PowerPlantControlUACBig,
  TileSize = {3, 3}, BoxSize = {95, 128},
  Offset = {0, -28},
  BoxOffset = {0, -15},
  SightRange = 3,
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  Priority = 20, 
  Points = 100,
  Coward = true,
  UAC = true,
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = true,
  Corpse = "unit-destroyed-3x3-place",
  DeathExplosion = ThermoBuildingExplosion,
  Type = "land",
  Building = true, VisibleUnderFog = true, LandUnit = true,
  Sounds = {
    "selected", "thermo-plant",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

BaseDamage = 10
DamageType = "AA-bullet"
DefineUnitType("unit-chaingun-tower", { Name = _("Chaingun Turret"),
  Image = {"file","graphics/uac/buildings/chainguntower.png","size", {36, 44}},
  Shadow = {"file", "graphics/uac/buildings/chainguntower-s.png", "size",{36, 44},"offset", {3, -9}},
  Animations = "animations-chaingun-tower", Icon = "icon-chaingun-tower",
  Costs = {"time", 90, "minerals", 800, "energy", 130},
  RepairHp = 2,
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-chaingun-tower",  
  HitPoints = 150,
  DrawLevel = 40,
  OnHit = ResetSmoke,
  OnEachCycle = SmokeControlUACTower,
  AiAdjacentRange = 1,
  TileSize = {1, 1}, BoxSize = {33, 35},
  SightRange = 9, ComputerReactionRange = 9, PersonReactionRange = 9,
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-chain-bullet",
  MaxAttackRange = 5,
  Precision = 70,
  AiBuildingRules = { { "distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-power-plant"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-supply-depot"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-barracks"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-weapon-factory"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-radar"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-vehicle-factory"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-tech-center"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-orbital-control"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-thermo-power-plant"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-chaingun-tower"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-missile-tower"}}
				  },
  -- Damage and armor part
  IsHeavyBuildingArmor = 1,
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
  UAC = true,
  Priority = 30, 
  Points = 60,
  Corpse = "unit-destroyed-1x1-place",
  DeathExplosion = TinyBuildingExplosion,
  RightMouseAction = "attack",
  Type = "land",
  DetectCloak = true,
  BuilderOutside = true,
  CanTargetAir = true, Building = true,
  NumDirections = 8, Flip = false,
  CanAttack = true,  LandUnit = true,
  CanTargetLand = true, CanTargetSea = true, 
  VisibleUnderFog = true, 
  Sounds = {
    "selected", "chaingun-tower",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )

BaseDamage = 32
DamageType = "homing-missile"
DefineUnitType("unit-missile-tower", { Name = _("Missile Turret"),
  Image = {"file","graphics/uac/buildings/rockettower.png","size", {36, 44}},
  Shadow = {"file", "graphics/uac/buildings/chainguntower-s.png", "size",{36, 44},"offset", {3, -9}},
  Animations = "animations-rocket-tower", Icon = "icon-rocket-tower",
  Costs = {"time", 110, "minerals", 1500, "energy", 350},
  RepairHp = 2,
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-rocket-tower",  
  HitPoints = 220,
  DrawLevel = 40,
  UAC = true,
  AiAdjacentRange = 1,
  OnHit = ResetSmoke,
  OnEachCycle = SmokeControlUACTower,
  AiBuildingRules = { { "distance", { Distance = 3, DistanceType = ">", Type = "unit-robotworker"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-power-plant"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-supply-depot"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-barracks"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-weapon-factory"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-radar"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-vehicle-factory"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-tech-center"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-orbital-control"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-thermo-power-plant"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-chaingun-tower"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-missile-tower"}}
				  },
  -- Damage and armor part
  IsHeavyBuildingArmor = 1,
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
  TileSize = {1, 1}, BoxSize = {32, 32},
  SightRange = 9, ComputerReactionRange = 9, PersonReactionRange = 9,
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-tower-rocket",
  MaxAttackRange = 8,
  Priority = 30,
  Points = 90,
  Corpse = "unit-destroyed-1x1-place",
  DeathExplosion = TinyBuildingExplosion,
  RightMouseAction = "attack",
  Type = "land",
  CanAttack = true,
  BuilderOutside = true,
  Building = true, CanTargetLand = true, CanTargetSea = true, CanTargetAir = true, 
  NumDirections = 8, Flip = false,
  VisibleUnderFog = true, LandUnit = true,
  DetectCloak = true,
  Sounds = {
    "selected", "rocket-tower",
    "help", "uac base under attack",
    "dead", "building destroyed"} } )	

DefineUnitType("unit-uac-wall", { Name = _("Wall"),
  Image = {"file","graphics/uac/buildings/wall.png", "size", {32, 32}},
  Animations = "animations-uac-wall", Icon = "icon-uac-wall",
  Costs = {"time", 30, "minerals", 50},
  Construction = "construction-uac-wall",
  HitPoints = 120,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  IsHeavyBuildingArmor = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0, 
  Points = 0,
  NumDirections = 16, Flip = false,
  Corpse = "unit-destroyed-1x1-place",
  Type = "land", LandUnit = true,
  BuilderOutside = true,
  Coward = true,
  Building = true, VisibleUnderFog = false, Wall = true,
  IsNotSelectable = true,
  Sounds = {
    "dead", "building destroyed"} } )

DefineUnitType("unit-uac-wall-compat", { Name = _("Wall"),
  Image = {"file","graphics/uac/buildings/wall.png", "size", {32, 32}},
  Animations = "animations-uac-wall", Icon = "icon-uac-wall",
  Costs = {"time", 30, "minerals", 50},
  Construction = "construction-uac-wall",
  HitPoints = 120,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  IsHeavyBuildingArmor = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0, 
  Points = 0,
  NumDirections = 16, Flip = false,
  Corpse = "unit-destroyed-1x1-place",
  Type = "land", LandUnit = true,
  BuilderOutside = true,
  Coward = true,
  Building = true, VisibleUnderFog = false, Wall = true,
  IsNotSelectable = true,
  Sounds = {
    "dead", "building destroyed"} } )