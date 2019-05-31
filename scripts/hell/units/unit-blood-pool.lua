-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local DamageType
local DamageType2
local DamageType3

DefineAnimations("animations-blood-pool", {
  Still = {"exact-frame 0", "if-var v_Build.Value != 0 end",
  "if-var v_HitPoints.Percent <= 50 damaged50",
  "exact-frame 0", "wait 4", "exact-frame 1", "wait 4", "exact-frame 2", "wait 4", "goto end",
  "label damaged50",
  "exact-frame 6", "wait 4", "exact-frame 7", "wait 4", "exact-frame 8", "wait 4", 
   "label end","wait 1",},
})

DefineUnitType("unit-blood-pool", { Name = _("Blood Pool"),
  Image = {"file","graphics/hell/buildings/bloodpool.png","size", {128, 135}},
  Animations = "animations-blood-pool", Icon = "icon-blood-pool",
  Shadow = {"file", "graphics/hell/buildings/bloodpool-s.png", "size",{128, 135}},
  Costs = {"time", 200, "minerals", 2200, "energy", 400},
  RepairHp = 2,
  Offset = {0, -20},
  BoxOffset = {0, -20},
  AiAdjacentRange = 0,
  RepairCosts = {"minerals", 2, "energy", 1},
  Construction = "construction-blood-pool",
  HitPoints = 900,
  DrawLevel = 40,
  ArtifactGive = 60,
  RadarResearch = 50,
  TileSize = {4, 3}, BoxSize = {127, 134},
  SightRange = 3,
  IsBuildingArmor = 1,
  Hell = true,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  AiBuildingRules = { {"distance", { Distance = 2, DistanceType = ">", Type = "unit-barracks"},
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
					"distance", { Distance = 3, DistanceType = ">", Type = "unit-lostsoul"},
					  "distance", { Distance = 3, DistanceType = ">", Type = "unit-advanced-lostsoul"}}
				  },
  Priority = 10,
  Points = 60,
  OnHit = ResetSmoke,
  Corpse = "unit-destroyed-4x3-place",
  OnEachCycle = SmokeControlBloodPool,
  DeathExplosion = MediumBuildingExplosion,
  Type = "land",
  LandUnit = true,
  Building = true, VisibleUnderFog = true, 
  Sounds = {
    "selected", "blood-pool",
    "help", "hell base under attack",
    "dead", "building destroyed"} } )