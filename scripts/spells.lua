DefineUnitType("unit-revealer", {})
DefineUnitType("unit-cyberdemon", {})
DefineUnitType("unit-zombieman", {})
DefineUnitType("unit-spiderdemon", {})
DefineUnitType("unit-phantom", {})
DefineUnitType("unit-new-phantom", {})
DefineUnitType("unit-technician-mine", {})
DefineUnitType("unit-technician-bomb", {})
DefineUnitType("unit-gate-exit", {})
DefineUnitType("unit-hell-fountain", {})
CUpgrade:New("upgrade-radar-eye")
CUpgrade:New("upgrade-spectre")
CUpgrade:New("upgrade-demon-teeth")
CUpgrade:New("upgrade-defibrillation")
CUpgrade:New("upgrade-technician-tools")
CUpgrade:New("upgrade-make-zombie")
CUpgrade:New("upgrade-portals")
CUpgrade:New("upgrade-blink")
CUpgrade:New("upgrade-imp-fireball")
CUpgrade:New("upgrade-cacoball")
CUpgrade:New("upgrade-torture-anomaly")
CUpgrade:New("upgrade-demon-strength-anomaly")
CUpgrade:New("upgrade-radar-research")
CUpgrade:New("upgrade-invisibility-anomaly")
CUpgrade:New("upgrade-souls")


DefineVariables("Mana", {Max = 0, Value = 0, Increase = 1, Enable = false})

-- Trading
DefineSpell("spell-enable-trade",
	"showname", _("enable trade"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-trading-prev-player",
	"showname", _("prev player"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-trading-next-player",
	"showname", _("next player"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-trading-dec-min",
	"showname", _("decrease minerals"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-trading-inc-min",
	"showname", _("increase minerals"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-trading-dec-eng",
	"showname", _("decrease energy"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-trading-inc-eng",
	"showname", _("increase energy"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-trading-commit",
	"showname", _("commit operation"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-medic-collect",
	"showname", _("collect samples"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"condition", {
		"Hell", "only",
		"Dead", "only",
		"ArtifactGive", {ExceptValue = 0},
	},
	"action", {{"adjust-variable", {Arg1 = {Value = 0}}}},
	"autocast", {"range", 8, "priority", {"Distance", false}},
	"ai-cast", {"range", 8, "combat", "false", "priority", {"Distance", false}}
)

DefineSpell("spell-medic-heal",
	"showname", _("heal"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"repeat-cast",
	"condition", {
		"Building", "false",
		"HitPoints", {MaxValuePercent = 100},
		"organic", "only",
		"alliance", "only"
	},
	"action", {{"adjust-vitals", "hit-points", 10,"max-multi-cast",1},
	{"adjust-variable", {Poison = 0}},
	{"adjust-variable", {Slow = 0}},
	{"adjust-variable", {SoulHarvesting = 0}}
	},
	"autocast", {"range", 8, "priority", {"Distance", false}},
	"ai-cast", {"range", 8, "priority", {"Distance", false}}
)

DefineSpell("spell-defibrillation",
	"showname", _("defibrillation"),
	"manacost", 30,
	"range", 1,
	"target", "unit",
	"condition", {
		"UAC", "only",
		"Dead", "only",
		"DoneDefibrillation", {MaxValue = 1},
	},
	"action", {{"adjust-variable", {UnitFlags = {AddValue = unitFlags.UF_StartDefibrillation}}}},
	"autocast", {"range", 8, "condition", {"alliance", "only"}},
	"ai-cast", {"range", 8, "condition", {"alliance", "only"}},
	"depend-upgrade", "upgrade-defibrillation"
)

DefineSpell("spell-medic-berserk",
	"showname", _("berserk"),
	"manacost", 30,
	"range", 1,
	"target", "unit",
	"condition", {
		"UAC", "only",
		"Building", "false",
		"organic", "only",
		"Haste", {ExactValue = 0},
		"Sawer", "false"
	},
	"action", {{"adjust-variable", {Haste = 300}}},
	"autocast", {"range", 4, "attacker", "only", "priority", {"Distance", false}, "condition", {"Medic", "false", "alliance", "only"}},
	"ai-cast", {"range", 4, "attacker", "only", "priority", {"Distance", false}, "condition", {"Medic", "false", "alliance", "only"}},
	"depend-upgrade", "upgrade-demon-strength-anomaly"
)

DefineSpell("spell-place-mine",
	"showname", _("Place mine"),
	"range", 1,
	"condition", {
		"Mines", {MinValue = 0, ConditionApplyOnCaster = true},
	},
	"target", "position",
	"action", {{"summon", "unit-type", "unit-technician-mine"},
		{"adjust-variable", {Mines = {AddValue = -1, TargetIsCaster = "caster"}}}},
	"depend-upgrade", "upgrade-technician-tools"
)

DefineSpell("spell-place-mine-for-ai",
	"showname", _("place mine"),
	"range", 1,
	"condition", {
		"Mines", {MinValue = 0, ConditionApplyOnCaster = true},
	},
	"target", "unit",
	"action", {{"summon", "unit-type", "unit-technician-mine"},
		{"adjust-variable", {Mines = {AddValue = -1, TargetIsCaster = "caster"}}}},
	"ai-cast", {"range", 10, "combat", "false", "condition", {"Minerals", "only"}},
	"depend-upgrade", "upgrade-technician-tools"
)

DefineSpell("spell-place-charge",
	"showname", _("place charge"),
	"range", 1,
	"condition", {
		"Building", "only",
		"Bombs", {MinValue = 0, ConditionApplyOnCaster = true},
		"Minerals", "false"
	},
	"target", "unit",
	"action", {{"summon", "unit-type", "unit-technician-bomb"},
		{"adjust-variable", {Bombs = {AddValue = -1, TargetIsCaster = "caster"}}}},
	"ai-cast", {"range", 4, "condition", {"opponent", "only"}},
	"depend-upgrade", "upgrade-technician-tools"
)

DefineSpell("spell-technician-armor-repair",
	"showname", _("repair armor"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"condition", {
		"ArmorShield", {ExactValue = 1}, 
		"ShieldPoints", {MaxValuePercent = 100, Enable = "only"},
		"Repair", {MaxValue = 1}, 
	},
	"action", {{"adjust-vitals", "shield-points", 1000,"max-multi-cast",1}},
	"autocast", {"range", 8, "priority", {"Distance", false}, "condition", {"alliance", "only", "ShieldPoints", {MaxValuePercent = 50}}},
	"ai-cast", {"range", 8, "priority", {"Distance", false}, "condition", {"alliance", "only", "ShieldPoints", {MaxValuePercent = 50}}}
)

DefineSpell("spell-technician-repair",
	"showname", _("repair"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"repeat-cast",
	"condition", {
		"Building", "false",
		"HitPoints", {MaxValuePercent = 100},
		"Mechanical", "only",	
	},
	"action", {{"adjust-vitals", "hit-points", 2,"max-multi-cast",1}},
	"autocast", {"range", 8, "priority", {"Distance", false}, "condition", {"alliance", "only"}},
	"ai-cast", {"range", 8, "priority", {"Distance", false}, "condition", {"alliance", "only"}}
)

DefineSpell("spell-hero-select-rl",
	"showname", _("select rl"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
				{"adjust-variable", {Weapon = 1}}}
)

DefineSpell("spell-hero-select-quad",
	"showname", _("select quad"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
				{"adjust-variable", {Weapon = 0}}}
)

DefineSpell("spell-hero-melee",
	"showname", _("melee"),
	"manacost", 0,
	"range", 1,
	"repeat-cast",
	"target", "unit",
	"condition", {
		"organic", "only",
		"Building", "false",
		"LandUnit", "only"
	},
	"action", {
				{"spawn-missile", "missile", "missile-claw-bite", "use-unit-var"}},
	"autocast", {"combat","only", "range", 1, "condition", {"opponent", "only"}},
	"ai-cast", {"combat","only", "priority", {"Distance", false}, "range", 2, "condition", {"opponent", "only"}}
)

DefineSpell("spell-hero-select-rl-for-ai",
	"showname", _("select rl"),
	"manacost", 0,
	"range", 0,
	"target", "unit",
	"action", {
				{"adjust-variable", {Weapon = {Value = 1, Max = 2, TargetIsCaster = "caster"}}}},
	"ai-cast", {"combat", "only", "range", 6, "condition", {"opponent", "only", 
		"Weapon", {ExceptValue = 1, ConditionApplyOnCaster = true},
		"IsLightArmor", {ExceptValue = 1},
		"IsCombatArmor", {ExceptValue = 1},
		"IsHeavyArmor", {ExceptValue = 1},
		"IsFleshArmor", {ExceptValue = 1},
		"IsCursedArmor", {ExceptValue = 1},
		"IsHeavyFleshArmor", {ExceptValue = 1}}}
)

DefineSpell("spell-hero-select-quad-for-ai",
	"showname", _("select quad"),
	"manacost", 0,
	"range", 0,
	"target", "unit",
	"action", {
				{"adjust-variable", {Weapon = {Value = 0, Max = 2, TargetIsCaster = "caster"}}}},
	"ai-cast", {"combat", "only", "range", 6, "condition", {"opponent", "only", 
		"Weapon", {ExceptValue = 0, ConditionApplyOnCaster = true},
		"IsAirFleshArmor", {ExceptValue = 1},
		"IsMechanicalArmor", {ExceptValue = 1},
		"IsAirMechanicalArmor", {ExceptValue = 1},
		"IsBuildingArmor", {ExceptValue = 1},
		"IsHeavyBuildingArmor", {ExceptValue = 1}}}
)

DefineSpell("spell-hero-select-unmaker",
	"showname", _("select quad"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"depend-upgrade", "upgrade-torture-anomaly",
	"action", {
				{"adjust-variable", {Weapon = 2}}}
)

DefineSpell("spell-hero-bfg",
	"showname", _("bfg shot"),
	"manacost", 40,
	"range", 7,
	"target", "position",
	"action", {
				{"spawn-missile", "missile", "missile-hero-bfgball", "use-unit-var"}},
	"autocast", {"combat","only", "range", 7, "condition", {"opponent", "only"}}
)

DefineSpell("spell-hero-bfg-for-ai",
	"showname", _("bfg shot"),
	"manacost", 40,
	"range", 7,
	"target", "unit",
	"action", {
				{"spawn-missile", "missile", "missile-hero-bfgball", "use-unit-var"}},
	"ai-cast", {"combat","only", "range", 7, "priority", {"HitPoints", false}, "condition", {"organic", "only", "opponent", "only", "HitPoints", {MinValue = 30}}}
)

DefineSpell("spell-hero-soulsphere",
	"showname", _("soulsphere"),
	"cooldown", 3600,
	"target", "self",
	"force-use-animation",
	"action", {{"adjust-vitals", "hit-points", 200}},
	"autocast", {"condition", {"HitPoints", {MaxValuePercent = 50, ConditionApplyOnCaster = true}}},
	"ai-cast", {"condition", {"HitPoints", {MaxValuePercent = 50, ConditionApplyOnCaster = true}}}
)

DefineSpell("spell-hero-invisibility",
	"showname", _("invisibility"),
	"cooldown", 3600,
	"target", "self",
	"force-use-animation",
	"autocast", {"combat","only"},
	"ai-cast", {"combat","only"}
)

DefineSpell("spell-hero-doomsphere",
	"showname", _("doom sphere"),
	"cooldown", 5400,
	"target", "self",
	"force-use-animation",
	"autocast", {"combat","only"},
	"ai-cast", {"combat","only"}
)

DefineSpell("spell-hero-invulnerability",
	"showname", _("invulnerability"),
	"cooldown", 5400,
	"target", "self",
	"force-use-animation",
	"autocast", {"combat","only"},
	"ai-cast", {"combat","only"}
)

DefineSpell("spell-fighter-invisibility",
	"showname", _("invisibility"),
	"cooldown", 2550,
	"target", "self",
	"action", {{"adjust-variable", {Invisible = 750}}},
	"autocast", {"combat","only"},
	"ai-cast", {"combat","only"},
	"depend-upgrade", "upgrade-invisibility-anomaly"
)

DefineSpell("spell-vehicle-repair",
	"showname", _("repair"),
	"manacost", 0,
	"res-cost", {0, 3, 0, 1, 0, 0, 0},
	"range", 1,
	"target", "unit",
	"repeat-cast",
	"condition", {
		"Building", "false",
		"HitPoints", {MaxValuePercent = 100},
		"Mechanical", "only",	
		"Repair", {MaxValue = 1}, 
	},
	"action", {{"adjust-vitals", "hit-points", 6,"max-multi-cast",1},
				{"spawn-missile", "missile", "missile-spark",
				"start-point", {"base", "target"}}},
	"autocast", {"range", 1, "condition", {"alliance", "only", "Repair", {MaxValue = 1}}},
	"ai-cast", {"range", 1, "condition", {"alliance", "only", "Repair", {MaxValue = 1}}}
)

local function CheckRadarEye(spell, unit, x, y, target)
	local bitset = bit.tobits(GetUnitVariable(unit, "UnitFlags", "Value"))
	if (bitset[unitFlagsIndex.UFI_ResearchActive] == 1) then
		return false
	end
	return true
end

DefineSpell("spell-radar-eye",
	"showname", _("radar eye"),
	"manacost", 0,
	"res-cost", {0, 0, 0, 600, 0, 0, 0},
	"condition", {
		"Charge", {MinValue = 119, ConditionApplyOnCaster = true},
		"callback", CheckRadarEye,
	},
	"range", "infinite",
	"target", "position",
	"action", {{"summon", "unit-type", "unit-revealer", "time-to-live", 300},
	{"adjust-variable", {Charge = {AddValue = -120, TargetIsCaster = "caster"}}}
	},
	"sound-when-cast", "radar eye effect",
	"depend-upgrade", "upgrade-radar-eye"
)

local function MakeRadarResearch(spell, unit, x, y, target)
	local player = GetUnitVariable(unit, "Player")
	SetUnitVariable(target, "ResearchedPlayers", GetUnitVariable(target, "ResearchedPlayers", "Value") + math.pow(2, player), "Value")
	SetUnitVariable(unit, "RadarResearchTarget", target, "Value")
	SetUnitVariable(unit, "RadarResearch", GetUnitVariable(target, "RadarResearch", "Value"), "Max")
	SetUnitVariable(unit, "RadarResearch", 0, "Value")
	SetUnitVariable(unit, "RadarResearch", 1, "Increase")
	SetUnitVariable(unit, "RadarResearch", 1, "Enable")
	SetUnitVariable(unit, "UnitFlags", GetUnitVariable(unit, "UnitFlags", "Value") + unitFlags.UF_ResearchActive, "Value")
	SetUnitVariable(unit, "RadarCharge", 0, "Enable")
	SetUnitVariable(unit, "RadarCharge", 0, "Max")
	SetUnitVariable(unit, "RadarCharge", 0, "Value")
	SetUnitVariable(unit, "RadarCharge", 0, "Increase")
	SetUnitVariable(unit, "Charge", 0, "Enable")
	SetUnitVariable(unit, "Charge", 0, "Increase")
	return false
end

local function CheckRadarResearch(spell, unit, x, y, target)
	local bitset = bit.tobits(GetUnitVariable(unit, "UnitFlags", "Value"))
	if (bitset[unitFlagsIndex.UFI_ResearchActive] == 1) then
		return false
	end
	bitset = bit.tobits(GetUnitVariable(target, "ResearchedPlayers", "Value"))
	local player = GetUnitVariable(unit, "Player")
	if (bitset[player + 1] == 1) then
		return false
	end
	return true
end

DefineSpell("spell-radar-research",
	"showname", _("radar research"),
	"manacost", 0,
	"res-cost", {0, 1000, 0, 500, 0, 0, 0},
	"condition", {
		"opponent", "only",
		"RadarCharge", {ExactValue = 60, ConditionApplyOnCaster = true},
		"Hell", "only",
		"Building", "only",
		"ArtifactGive", {ExceptValue = 0},
		"callback", CheckRadarResearch,
	},
	"range", "infinite",
	"target", "unit",
	"action", {{"lua-callback", MakeRadarResearch}},
	"depend-upgrade", "upgrade-radar-research",
	"ai-cast", {"range", 256}
)

DefineSpell("spell-superball",
	"showname", _("Orbiral attack"),
	"manacost", 0,
	"res-cost", {0, 0, 0, 1000, 0, 0, 0},
	"range", "infinite",
	"target", "position",
	"condition", {
		"Charge", {MinValue = 359, ConditionApplyOnCaster = true},
		"Op1", {ExactValue = 0, ConditionApplyOnCaster = true},
	},
	"autocast", {"range", 256, "condition", {"Building", "only", "opponent", "only"}}
)

DefineSpell("spell-superball-for-ai",
	"showname", _("Orbiral attack"),
	"manacost", 0,
	"res-cost", {0, 0, 0, 1000, 0, 0, 0},
	"range", "infinite",
	"target", "unit",
	"condition", {
		"Charge", {MinValue = 359, ConditionApplyOnCaster = true},
		"Op1", {ExactValue = 0, ConditionApplyOnCaster = true},
	},
	"ai-cast", {"range", 1024, "priority", {"Points", true}, "condition", {"Building", "only", "opponent", "only"}}
)

function CheckSpheres(spell, unit, x, y, target)
	if (target == -1) then
		return false
	end
	local spheres = GetUnitVariable(target, "UsedSpheres", "Value")
	
	local bits = bit.tobits(spheres)
	local bitnum
	--[[print(tostring(spheres))
	for i = 1,32 do
		print(tostring(i)..tostring(bits[i]))
	end]]
	if (spell == "spell-anomaly-shield-sphere") then
		bitnum = 1
	elseif (spell == "spell-anomaly-life-sphere") then
		bitnum = 2
	elseif (spell == "spell-anomaly-regeneration-sphere") then
		bitnum = 3
	elseif (spell == "spell-anomaly-skull-sphere") then
		bitnum = 4
	elseif (spell == "spell-anomaly-absolute-defence-sphere") then
		bitnum = 5
	elseif (spell == "spell-anomaly-acid-sphere") then
		bitnum = 6
	elseif (spell == "spell-anomaly-corruption-sphere") then
		bitnum = 7
	elseif (spell == "spell-anomaly-vampirism-sphere") then
		bitnum = 8
	end
	return bits[bitnum] == 0 or bits[bitnum] == nil
end

DefineSpell("spell-anomaly-shield-sphere",
	"showname", _("shield sphere"),
	"res-cost", {0, 0, 0, 0, 150, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {ShieldPoints = {Value = 120, Max = 120, Increase = 1, Enable = true}}},
				{"adjust-variable", {ShieldPermeability = {Value = 0, Max = 100, Increase = 0, Enable = true}}},
				{"adjust-variable", {ArmorShield = {Value = 0, Max = 1, Increase = 0, Enable = true}}},
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_Shield}}},
				{"spawn-missile", "missile", "missile-anomaly-shield-sphere",
			"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

DefineSpell("spell-anomaly-life-sphere",
	"showname", _("life sphere"),
	"res-cost", {0, 0, 0, 0, 40, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {HitPoints = {AddValue = 50, AddMax = 50, Enable = true}}},
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_Life}}},
				{"spawn-missile", "missile", "missile-anomaly-life-sphere",
			"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

DefineSpell("spell-anomaly-regeneration-sphere",
	"showname", _("regeneration sphere"),
	"res-cost", {0, 0, 0, 0, 30, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {HitPoints = {AddIncrease = 1}}},
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_Regeneration}}},
				{"spawn-missile", "missile", "missile-anomaly-regeneration-sphere",
			"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

DefineSpell("spell-anomaly-skull-sphere",
	"showname", _("skull sphere"),
	"res-cost", {0, 0, 0, 0, 45, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_Skull}}},
				{"spawn-missile", "missile", "missile-anomaly-skull-sphere",
			"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

DefineSpell("spell-anomaly-absolute-defence-sphere",
	"showname", _("absolute defence sphere"),
	"res-cost", {0, 0, 0, 0, 120, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_AbsoluteDefence}}},
				{"spawn-missile", "missile", "missile-anomaly-absolute-sphere",	"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

DefineSpell("spell-anomaly-acid-sphere",
	"showname", _("acid sphere"),
	"res-cost", {0, 0, 0, 0, 80, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {AcidSphereMaxDamage = {Value = 18000}}},
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_Acid}}},
				{"spawn-missile", "missile", "missile-anomaly-acid-sphere",
			"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

DefineSpell("spell-anomaly-corruption-sphere",
	"showname", _("sphere of corruption"),
	"res-cost", {0, 0, 0, 0, 100, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {CorruptionSphereMaxDamage = {Value = 600}}},
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_Corruption}}},
				{"spawn-missile", "missile", "missile-anomaly-corruption-sphere",
			"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

DefineSpell("spell-anomaly-vampirism-sphere",
	"showname", _("vampirism sphere"),
	"res-cost", {0, 0, 0, 0, 80, 0, 0},
	"condition", {
		"SphereMarine", "only",
		"callback", CheckSpheres
	},
	"range", 15,
	"target", "unit",
	"action", {
				{"adjust-variable", {VampirismSphereMaxDamage = {Value = 200}}},
				{"adjust-variable", {UsedSpheres = {AddValue = marineSpheres.S_Vampirism}}},
				{"spawn-missile", "missile", "missile-anomaly-vampirism-sphere",
			"start-point", {"base", "target"}}},
	"ai-cast", {"range", 15, "priority", {"Points", true}}
)

--[[-------------Hell---------------]]------------------------------------------------------------------

DefineSpell("spell-burn",
	"showname", _("burn"),
	"manacost", 10,
	"range", 7,
	"target", "position",
	"action", {
				{"spawn-missile", "missile", "missile-burn-ball", "use-unit-var"}},
	"autocast", {"combat","only", "range", 7, "condition", {"Building", "only"}},
	"ai-cast", {"combat","only", "range", 7, "condition", {"Building", "only"}},
	"depend-upgrade", "upgrade-imp-fireball"
)

DefineSpell("spell-burn-for-ai",
	"showname", _("burn"),
	"manacost", 10,
	"range", 7,
	"target", "unit",
	"action", {
				{"spawn-missile", "missile", "missile-burn-ball", "use-unit-var"}},
	"autocast", {"combat","only", "range", 7, "condition", {"Building", "only"}},
	"ai-cast", {"combat","only", "priority", {"Points", true}, "range", 7, "condition", {"Building", "only"}},
	"depend-upgrade", "upgrade-imp-fireball"
)

DefineSpell("spell-melee-attack",
	"showname", _("melee attack"),
	"manacost", 0,
	"range", 1,
	"repeat-cast",
	"target", "unit",
	"condition", {
		"organic", "only",
		"Building", "false",
		"LandUnit", "only"
	},
	"action", {
				{"spawn-missile", "missile", "missile-claw-bite", "use-unit-var"}},
	"autocast", {"combat","only", "range", 1, "condition", {"opponent", "only"}},
	"ai-cast", {"combat","only", "priority", {"Distance", false}, "range", 2, "condition", {"opponent", "only"}}
)

local function CheckNoSkullSphere(spell, unit, x, y, target)
	local bitset = bit.tobits(GetUnitVariable(target, "UsedSpheres", "Value"))
	if (bitset[4] == 1) then
		return false
	end
	return true
end

DefineSpell("spell-eat-corpse",
	"showname", _("eat corpse"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"depend-upgrade", "upgrade-demon-teeth",
	"condition", {
		"Dead", "only",
		"callback", CheckNoSkullSphere,
	},
	"action", {
				{"adjust-variable", {UnitFlags = {AddValue = unitFlags.UF_KillFromDemon}}}},
	"autocast", {"range", 3, "condition", {"HitPoints", {MaxValuePercent = 90, ConditionApplyOnCaster = true}}},
	"ai-cast", {"range", 2, "condition", {"HitPoints", {MaxValuePercent = 90, ConditionApplyOnCaster = true}}}
)

DefineSpell("spell-teleport",
	"showname", _("blink"),
	"manacost", 0,
	"range", 8,
	"cooldown", 90,
	"target", "position",
	"depend-upgrade", "upgrade-blink",
	"action", {
		{"spawn-missile", "missile", "missile-teleport-fog",
			"start-point", {"base", "caster"}},
				{"teleport"},
		{"spawn-missile", "missile", "missile-teleport-fog",
			"start-point", {"base", "caster"}}}
)

DefineSpell("spell-teleport-for-ai",
	"showname", _("blink"),
	"manacost", 0,
	"range", 8,
	"target", "unit",
	"depend-upgrade", "upgrade-blink",
	"action", {
		{"spawn-missile", "missile", "missile-teleport-fog",
			"start-point", {"base", "caster"}},
				{"teleport"},
		{"spawn-missile", "missile", "missile-teleport-fog",
			"start-point", {"base", "caster"}}},
	"ai-cast", {"range", 8, "combat", "only", "condition", {"opponent", "only"}}
)

DefineSpell("spell-punch",
	"showname", _("melee attack"),
	"manacost", 0,
	"range", 1,
	"repeat-cast",
	"target", "unit",
	"condition", {
		"organic", "only",
		"Building", "false",
		"LandUnit", "only"
	},
	"action", {
				{"spawn-missile", "missile", "missile-claw-bite", "use-unit-var"}},
	"autocast", {"combat","only", "range", 1, "condition", {"opponent", "only"}},
	"ai-cast", {"combat","only", "priority", {"Distance", false}, "range", 2, "condition", {"opponent", "only"}}
)

DefineSpell("spell-zombifie",
	"showname", _("zombifie"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"condition", {
		"UAC", "only",
		"Dead", "only",
		"ToZombifie", {ExactValue = 0},
		"callback", CheckNoSkullSphere,
		}, 
	"action", {{"capture", "join-to-ai-force"}, {"adjust-variable", {Ressurect = {AddValue = 2}}}, {"adjust-variable", {ToZombifie = {AddValue = 4}}},
	{"adjust-variable", {ToZombifie = {AddValue = 4, TargetIsCaster = "caster"}}}},
	"autocast", {"range", 5, "priority", {"Points", true}},
	"ai-cast", {"range", 5, "priority", {"Points", true}}
)

DefineSpell("spell-make-zombie",
	"showname", _("raise zombie"),
	"manacost", 30,
	"range", 8,
	"target", "unit",
	"condition", {
		"UAC", "only",
		"Dead", "only",
		"callback", CheckNoSkullSphere,
	},
	"action", {{"adjust-variable", {Ressurect = {AddValue = 1}}}},
	"autocast", {"range", 8, "priority", {"Points", true}},
	"ai-cast", {"range", 8, "priority", {"Points", true}},
	"depend-upgrade", "upgrade-make-zombie"
)

DefineSpell("spell-summon-soul",
	"showname", _("summon phantom"),
	"manacost", 80,
	"range", 7,
	"condition", {
		"UnitFlags", {MaxValue = unitFlags.UF_SoulsResearch, ConditionApplyOnCaster = true},
	},
	"target", "position",
	"action", {{"summon", "join-to-ai-force", "unit-type", "unit-phantom", "time-to-live", 1800}},
	"autocast", {"combat","only", "range", 8},
	"ai-cast", {"combat","only", "range", 8, "condition", {"organic", "only"}}
)

DefineSpell("spell-summon-soul-for-ai",
	"showname", _("summon phantom"),
	"manacost", 80,
	"range", 7,
	"condition", {
		"UnitFlags", {MaxValue = unitFlags.UF_SoulsResearch, ConditionApplyOnCaster = true},
	},
	"target", "unit",
	"action", {{"summon", "join-to-ai-force", "unit-type", "unit-phantom", "time-to-live", 1800}},
	"autocast", {"combat","only", "range", 8},
	"ai-cast", {"range", 8, "condition", {"UAC", "only", "Dead", "only", "callback", CheckNoSkullSphere}}
)

DefineSpell("spell-summon-soul-new",
	"showname", _("summon phantom"),
	"manacost", 80,
	"range", 7,
	"target", "position",
	"action", {{"summon", "join-to-ai-force", "unit-type", "unit-new-phantom", "time-to-live", 1800}},
	"autocast", {"combat","only", "range", 8},
	"ai-cast", {"combat","only", "range", 8, "condition", {"organic", "only"}},
	"depend-upgrade", "upgrade-souls"
)

DefineSpell("spell-summon-soul-for-ai-new",
	"showname", _("summon phantom"),
	"manacost", 80,
	"range", 7,
	"target", "unit",
	"action", {{"summon", "join-to-ai-force", "unit-type", "unit-new-phantom", "time-to-live", 1800}},
	"autocast", {"combat","only", "range", 8},
	"ai-cast", {"range", 8, "condition", {"UAC", "only", "Dead", "only", "callback", CheckNoSkullSphere}},
	"depend-upgrade", "upgrade-souls"
)

DefineSpell("spell-lichflame",
	"showname", "burn",
	"manacost", 1,
	"range", 4,
	"target", "unit",
	"condition", {
		"Veterancy", {MinValue = 3, ConditionApplyOnCaster = true},
	}, 
	"repeat-cast",
	"action", {},
	"autocast", {"combat","only", "range", 6, "condition", {"opponent", "only", "Building", "only"}},
	"ai-cast", {"combat","only", "range", 6, "condition", {"opponent", "only", "Building", "only"}}
)

local function CheckResurrectRaising(spell, unit, x, y, target)	
	local bitset = bit.tobits(GetUnitVariable(target, "UnitFlags", "Value"))
	if (bitset[unitFlagsIndex.UFI_Raising] == 1) then
		return false
	end
	return true
end

DefineSpell("spell-ressurect",
	"showname", _("resurrect"),
	"range", 1,
	"repeat-cast",
	"condition", {
		"Mana", {MinValue = 19, ConditionApplyOnCaster = true},
		"Dead", "only",
		"Hell", "only",
		"IsResurrectable", "only",
		"callback", CheckResurrectRaising,
	},
	"target", "unit",
	"action", {{"capture", "join-to-ai-force"}},
	"autocast", {"range", 6, "priority", {"Points", false}},
	"ai-cast", {"range", 6, "priority", {"Points", false}}
)

DefineSpell("spell-destroy-armor",
	"showname", _("curse armor"),
	"manacost", 100,
	"range", 8,
	"target", "unit",
	"action", {{"spawn-missile", "missile", "missile-destroy-armor", "start-point", {"base", "target"}},
				{"adjust-variable", {IsLightArmor = 0}},
				{"adjust-variable", {IsCombatArmor = 0}},
				{"adjust-variable", {IsHeavyArmor = 0}},
				{"adjust-variable", {IsFleshArmor = 0}},
				{"adjust-variable", {IsHeavyFleshArmor = 0}},
				{"adjust-variable", {IsAirFleshArmor = 0}},
				{"adjust-variable", {IsMechanicalArmor = 0}},
				{"adjust-variable", {IsAirMechanicalArmor = 0}},
				{"adjust-variable", {IsBuildingArmor = 0}},
				{"adjust-variable", {IsHeavyBuildingArmor = 0}},
				{"adjust-variable", {IsCursedArmor = 1}},
				{"area-adjust-vitals", "range", 1, "shield-points", -200}},
	"autocast", {"range", 8, "condition", {"opponent", "only", "ShieldPoints", {MinValuePercent = 10}}},
	"ai-cast", {"range", 8, "priority", {"ShieldPoints", true}, "condition", {"opponent", "only","ShieldPoints", {MinValuePercent = 10}}}
)

DefineSpell("spell-invulnerability",
	"showname", _("invulnerability"),
	"manacost", 150,
	"range", 8,
	"condition", {
		"organic", "only"
	},
	"target", "unit",
	"action", {{"adjust-variable", {UnholyArmor = 450}}},
	"autocast", {"attacker", "only","range", 8, "priority", {"Points", true}, "condition", {"Coward", "false", "alliance", "only"}},
	"ai-cast", {"attacker", "only", "range", 8, "priority", {"Points", true}, "condition", {"Coward", "false", "alliance", "only"}}
)

DefineSpell("spell-inferno",
	"showname", _("inferno"),
	"manacost", 200,
	"range", 8,
	"target", "position",
	"condition", {
		"Veterancy", {MinValue = 3, ConditionApplyOnCaster = true},
	}, 
	"action", {{"area-bombardment", "missile", "missile-archvile-inferno-fire",
		"damage", 2,
		 "fields", 30,
		 "shards", 5,
		 "start-offset-x", 0,
		 "start-offset-y", 0}},
	"autocast", {"combat","only", "range", 6, "condition", {"opponent", "only"}},
	"ai-cast", {"combat","only", "range", 6, "condition", {"opponent", "only"}}
)

DefineSpell("spell-rage",
	"showname", _("rage"),
	"manacost", 60,
	"range", 6,
	"target", "unit",
	"condition", {
		"Building", "false",
		"Dead", "false",
		"Hell", "only",
		"organic", "only",	
	},
	"action", {{"adjust-variable", {Haste = 600}}},
	"autocast", {"attacker", "only", "range", 6, "condition", {"alliance", "only"}},
	"ai-cast", {"attacker", "only", "priority", {"Points", true}, "range", 6, "condition", {"alliance", "only"}}
)

DefineSpell("spell-hellfire-launch",
	"showname", "hellfire launch",
	"manacost", 85,
	"range", 6,
	"target", "unit",
	"action", {
				{"spawn-missile", "missile", "missile-hellfire", "damage", 185}},
	"autocast", {"combat","only", "range", 6, "condition", {"opponent", "only"}},
	"ai-cast", {"combat","only", "range", 6, "condition", {"opponent", "only"}}
)

DefineSpell("spell-demonic-storm",
	"showname", _("acid storm"),
	"manacost", 200,
	"range", 8,
	"target", "position",
	"action", {
				{"summon", "unit-type", "unit-hell-fountain"}},
	"autocast", {"combat","only", "range", 7, "condition", {"opponent", "only"}}
)

DefineSpell("spell-demonic-storm-for-ai",
	"showname", _("acid storm"),
	"manacost", 200,
	"range", 8,
	"target", "unit",
	"action", {
				{"summon", "unit-type", "unit-hell-fountain"}},
	"ai-cast", {"combat","only", "priority", {"Points", true}, "range", 7, "condition", {"opponent", "only"}}
)

DefineSpell("spell-possess",
	"showname", _("corrupt"),
	"manacost", 40,
	"range", 8,
	"target", "unit",
	"condition", {
		"Hero", "false",
		"UAC", "only",
		"Dead", "false",
		"organic", "only",
		"callback", CheckNoSkullSphere
	},
	"action", {{"spawn-missile", "missile", "missile-claw-bite", "damage", 10000}},
	"autocast", {"combat","only", "priority", {"Points", true}, "range", 8, "condition", {"opponent", "only"}},
	"ai-cast", {"combat","only", "priority", {"Points", true}, "range", 8, "condition", {"opponent", "only"}}
)

DefineSpell("spell-belial-teleport",
	"showname", _("teleport"),
	"manacost", 120,
	"range", "infinite",
	"target", "position",
	"action", {{"spawn-missile", "missile", "missile-teleport-fog",
			"start-point", {"base", "caster"}},
				{"teleport"},
		{"spawn-missile", "missile", "missile-teleport-fog",
			"start-point", {"base", "caster"}}}
)

DefineSpell("spell-belial-vampirism",
	"showname", _("belial vampirism"),
	"manacost", 0,
	"range", 1,
	"repeat-cast",
	"target", "unit",
	"condition", {
		"organic", "only",
		"Building", "false",
		"LandUnit", "only"
	},
	"action", {
				{"spawn-missile", "missile", "missile-belial-vampirism", "use-unit-var"}},
	"autocast", {"combat","only", "range", 1, "condition", {"opponent", "only"}},
	"ai-cast", {"combat","only", "priority", {"Distance", false}, "range", 2, "condition", {"opponent", "only"}}
)

DefineSpell("spell-well-heal",
	"showname", _("heal"),
	"manacost", 5,
	"range", 1,
	"target", "unit",
	"repeat-cast",
	"condition", {
		"Building", "false",
		"HitPoints", {MaxValuePercent = 100},
		"organic", "only",
		"Hell", "only",
		"Dead", "false",
	},
	"action", {{"adjust-vitals", "hit-points", 4,"max-multi-cast",1},
				{"spawn-missile", "missile", "missile-well-effect",
				"start-point", {"base", "caster", "add-y", -24}},
				{"adjust-variable", {Poison = 0}}},
	"autocast", {"range", 1, "priority", {"HitPoints", false}, "condition", {"alliance", "only"}},
	"ai-cast", {"range", 1, "priority", {"HitPoints", false}, "condition", {"alliance", "only"}}
)

DefineSpell("spell-well-charge",
	"showname", _("charge"),
	"manacost", 5,
	"range", 1,
	"target", "unit",
	"repeat-cast",
	"condition", {
		"Building", "false",
		"Mana", {MaxValuePercent = 100, Enable = "only"},
		"organic", "only",
		"Hell", "only",
		"Dead", "false",
	},
	"action", {{"adjust-vitals", "mana-points", 3,"max-multi-cast",1},
				{"spawn-missile", "missile", "missile-well-effect",
				"start-point", {"base", "caster", "add-y", -24}}},
	"autocast", {"range", 1, "condition", {"alliance", "only"}},
	"ai-cast", {"range", 1, "condition", {"alliance", "only"}}
)

DefineSpell("spell-gate-exit",
	"showname", _("create portal link"),
	"manacost", 0,
	"range", "infinite",
	"res-cost", {0, 0, 0, 1000, 0, 0, 0},
	"condition", {
		"Op1", {ExactValue = 0, ConditionApplyOnCaster = true},
		"Charge", {MinValue = 359, ConditionApplyOnCaster = true}
	},
	"target", "position",
	"depend-upgrade", "upgrade-portals",
	"action", {
		{"spawn-portal", "portal-type", "unit-gate-exit", "time-to-live", 1200, "current-player"},
		{"adjust-variable", {Charge = {AddValue = -360, TargetIsCaster = "caster"}}}}
)

DefineSpell("spell-pentagram-select-cyberdemon",
	"showname", _("summon cyberdemon"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
				{"adjust-variable", {Weapon = 0}}}
)

DefineSpell("spell-pentagram-select-spiderdemon",
	"showname", _("summon spiderdemon"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
				{"adjust-variable", {Weapon = 1}}}
)

DefineSpell("spell-cyber-summon",
	"showname", _("cyberdemon summon"),
	"manacost", 0,
	"res-cost", {0, 0, 0, 1000, 0, 0, 0},
	"condition", {
		"Charge", {MinValue = 359, ConditionApplyOnCaster = true},
	},
	"range", "infinite",
	"target", "position",
	"action", {{"summon", "unit-type", "unit-cyberdemon","time-to-live", 1800},
	{"spawn-missile", "missile", "missile-cyber-summon",
			"start-point", {"base", "target"}},
	{"adjust-variable", {Charge = {AddValue = -360, TargetIsCaster = "caster"}}},
	{"adjust-variable", {UnitFlags = {AddValue = -unitFlags.UF_SuperweaponCharged, TargetIsCaster = "caster"}}}},
	"sound-when-cast", "cyber summon"
)

DefineSpell("spell-spider-summon",
	"showname", _("spiderdemon summon"),
	"manacost", 0,
	"res-cost", {0, 0, 0, 1000, 0, 0, 0},
	"condition", {
		"Charge", {MinValue = 359, ConditionApplyOnCaster = true},
	},
	"range", "infinite",
	"target", "position",
	"action", {{"summon", "unit-type", "unit-spiderdemon","time-to-live", 1800},
	{"spawn-missile", "missile", "missile-cyber-summon",
			"start-point", {"base", "target"}},
	{"adjust-variable", {Charge = {AddValue = -360, TargetIsCaster = "caster"}}},
	{"adjust-variable", {UnitFlags = {AddValue = -unitFlags.UF_SuperweaponCharged, TargetIsCaster = "caster"}}}},
	"sound-when-cast", "cyber summon"
)

DefineSpell("spell-cyber-summon-for-ai",
	"showname", _("cyberdemon summon"),
	"manacost", 0,
	"res-cost", {0, 0, 0, 1000, 0, 0, 0},
	"condition", {
		"Charge", {MinValue = 359, ConditionApplyOnCaster = true},
	},
	"range", "infinite",
	"target", "unit",
	"action", {{"summon", "unit-type", "unit-cyberdemon","time-to-live", 1800},
	{"spawn-missile", "missile", "missile-cyber-summon",
			"start-point", {"base", "target"}},
	{"adjust-variable", {Charge = {AddValue = -360, TargetIsCaster = "caster"}}},
	{"adjust-variable", {UnitFlags = {AddValue = -unitFlags.UF_SuperweaponCharged, TargetIsCaster = "caster"}}}},
	"sound-when-cast", "cyber summon",
	"ai-cast", {"range", 1024,"condition", {"Center", "only", "opponent", "only"}}
)