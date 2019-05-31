local upgrades = {
  {"upgrade-shotguns", "icon-shotgun", _("Upgrade shotguns"),
    {   300,   1500,     0,     350,     0,     0,     0}},
  {"upgrade-bullet-weapons", "icon-upgrade-bullet", _("Upgrade bullet weapons"),
    {   350,   1800,     0,     450,     0,     0,     0}},
  {"upgrade-explosive-weapons", "icon-upgrade-explosive", _("Upgrade explosive weapons"),
    {   400,   2600,     0,     650,     0,     0,     0}},
  {"upgrade-infantry-energy", "icon-upgrade-infantry-energy", _("Upgrade infantry energy weapons"),
    {   450,   3000,     0,     900,     0,     0,     0}},
  {"upgrade-vehicle-energy", "icon-upgrade-vehicle-energy", _("Upgrade vehicle energy weapons"),
    {   500,   3500,     0,    1100,     0,     0,     0}},
  {"upgrade-chainsaw", "icon-chainsaw", _("Upgrade chainsaws"),
    {   300,   1000,     0,     250,     0,     0,     0}},

  {"upgrade-grenade-launcher-range", "icon-grenade-launcher-range", _("Upgrade grenade launcher range"),
    {   300,   1300,     0,     320,     0,     0,     0}},
  {"upgrade-chaingun-accuracy", "icon-chaingun-accuracy", _("Upgrade chaingun accuracy"),
    {   400,   1500,     0,     400,     0,     0,     0}}, 
  {"upgrade-long-ranged-missile", "icon-long-ranged-missile", _("Research long ranged missiles"),
    {   450,   2500,     0,     650,     0,     0,     0}},
  {"upgrade-armor1", "icon-armor1", _("Upgrade marines armor"),
    {   300,   1300,     0,     300,     0,     0,     0}},
  {"upgrade-armor2", "icon-armor2", _("Research Megaarmor"),
    {   400,   2400,     0,     650,     0,     0,     0}},
  {"upgrade-armor3", "icon-armor3", _("Research marine ultra protection armor"),
    {   500,   3200,     0,     850,     0,     0,     0}},
  {"upgrade-visors", "icon-visors", _("Research light amplification visors"),
    {   350,   2000,     0,     500,     0,     0,     0}},
  {"upgrade-technician-tools", "icon-technician-tools", _("Research technician mining tools"),
    {   350,   2000,     0,     500,     0,     0,     0}},
  {"upgrade-defibrillation", "icon-research-defibrillation", _("Research defibrillation"),
    {   370,   2200,     0,     550,     0,     0,     0}},
  
  {"upgrade-crusher", "icon-upgrade-crusher", _("Research crusher's missile launcher"),
    {   450,   2800,     0,     650,     0,     0,     0}},
  {"upgrade-fighter-shield", "icon-fighter-shield", _("Research fighter shield"),
    {   400,   2500,     0,     700,     0,     0,     0}},
  {"upgrade-uac-mech-armor1", "icon-uac-mech-armor1", _("Upgrade vehicle armor"),
    {   300,   2000,     0,     500,     0,     0,     0}},
  {"upgrade-uac-mech-armor2", "icon-uac-mech-armor2", _("Upgrade vehicle armor"),
    {   400,   2700,     0,     700,     0,     0,     0}},
  {"upgrade-uac-mech-armor3", "icon-uac-mech-armor3", _("Upgrade vehicle armor"),
    {   500,   3500,     0,     900,     0,     0,     0}},
  {"upgrade-vehicle-attack-range", "icon-vehicle-attack-range",  _("Upgrade vehicle attack range"),
    {   400,   3000,     0,     800,     0,     0,     0}},
  {"upgrade-radar-eye", "icon-radar-eye", _("Research radar eye"),
    {   400,   2800,     0,     650,     0,     0,     0}},
  {"upgrade-radar-research", "icon-upgrade-radar-research", _("Hell anomalies radar research"),
    {   350,   2200,     0,     650,     0,     0,     0}},
  {"upgrade-uac-building-armor1", "icon-uac-building-armor1", _("Upgrade building armor"),
    {   300,   1750,     0,     400,     0,     0,     0}},
  {"upgrade-uac-building-armor2", "icon-uac-building-armor2", _("Upgrade building armor"),
    {   450,   2800,     0,     600,     0,     0,     0}},
  {"upgrade-building-shield", "icon-building-shield", _("Research building shield"),
    {   350,   2600,     0,     700,     0,     0,     0}},
  {"upgrade-tower-shield", "icon-tower-shield", _("Research tower shield"),
    {   400,   2200,     0,     650,     0,     0,     0}},

  {"upgrade-flesh-weakness", "icon-flesh-weakness", _("Research flesh weakness"),
    {   350,   0,     0,     0,     200,     0,     0}},
  {"upgrade-heavy-flesh-weakness", "icon-heavy-flesh-weakness", _("Research heavy flesh weakness"),
    {   350,   0,     0,     0,     270,     0,     0}},
  {"upgrade-levitation-anomaly", "icon-levitation-anomaly", _("Research levitation anomaly"),
    {   350,   0,     0,     0,     235,     0,     0}},
  {"upgrade-torture-anomaly", "icon-torture-anomaly", _("Research torture anomaly"),
    {   400,   0,     0,     0,     250,     0,     0}},
  {"upgrade-inferno-anomaly", "icon-inferno-anomaly", _("Research inferno anomaly"),
    {   400,   0,     0,     0,     380,     0,     0}},
  {"upgrade-demon-strength-anomaly", "icon-demon-strength-anomaly", _("Research demon strength anomaly"),
    {   450,   0,     0,     0,     320,     0,     0}},
  {"upgrade-invisibility-anomaly", "icon-invisibility-anomaly", _("Research invisibility anomaly"),
    {   450,   0,     0,     0,     450,     0,     0}}
  
}

DebugOut("\nUAC upgrades debug\n")
local upgradessum = {0, 0, 0, 0, 0, 0, 0}
for i = 1,table.getn(upgrades) do
  u = CUpgrade:New(upgrades[i][1])
  u.Icon = Icons[upgrades[i][2]]
  u.Name = upgrades[i][3]
  for j = 1,table.getn(upgrades[i][4]) do
    u.Costs[j - 1] = upgrades[i][4][j]
	upgradessum[j] = upgradessum[j] + upgrades[i][4][j]
  end
end
DebugOut("\nTotal\n")
for j = 1,7 do
	DebugOut("\n Sum " .. tostring(upgradessum[j]) .. ", Avg " .. tostring(upgradessum[j]/table.getn(upgrades)) .. "\n")
end


--	NOTE: Save can generate this table.
DefineModifier("upgrade-shotguns",
  {"BaseDamage", 20, "Percent"},
  {"LightArmorDamage", 20, "Percent"},
  {"CombatArmorDamage", 20, "Percent"},
  {"HeavyArmorDamage", 20, "Percent"},
  {"FleshArmorDamage", 20, "Percent"},
  {"HeavyFleshArmorDamage", 20, "Percent"},
  {"AirFleshArmorDamage", 20, "Percent"},
  {"MechanicalArmorDamage", 20, "Percent"},
  {"AirMechanicalArmorDamage", 20, "Percent"},
  {"BuildingArmorDamage", 20, "Percent"},
  {"HeavyBuildingArmorDamage", 20, "Percent"},
  {"CursedArmorDamage", 20, "Percent"},
  {"AttackRange", 1},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-ssg"})

DefineModifier("upgrade-shotguns",
  {"BaseDamage", 20, "Percent"},
  {"LightArmorDamage2", 20, "Percent"},
  {"CombatArmorDamage2", 20, "Percent"},
  {"HeavyArmorDamage2", 20, "Percent"},
  {"FleshArmorDamage2", 20, "Percent"},
  {"HeavyFleshArmorDamage2", 20, "Percent"},
  {"AirFleshArmorDamage2", 20, "Percent"},
  {"MechanicalArmorDamage2", 20, "Percent"},
  {"AirMechanicalArmorDamage2", 20, "Percent"},
  {"BuildingArmorDamage2", 20, "Percent"},
  {"HeavyBuildingArmorDamage2", 20, "Percent"},
  {"CursedArmorDamage2", 20, "Percent"},
  {"apply-to", "unit-hero"})
  
DefineModifier("upgrade-bullet-weapons",
  {"BaseDamage", 15, "Percent"},
  {"LightArmorDamage", 15, "Percent"},
  {"CombatArmorDamage", 15, "Percent"},
  {"HeavyArmorDamage", 15, "Percent"},
  {"FleshArmorDamage", 15, "Percent"},
  {"HeavyFleshArmorDamage", 15, "Percent"},
  {"AirFleshArmorDamage", 15, "Percent"},
  {"MechanicalArmorDamage", 15, "Percent"},
  {"AirMechanicalArmorDamage", 15, "Percent"},
  {"BuildingArmorDamage", 15, "Percent"},
  {"HeavyBuildingArmorDamage", 15, "Percent"},
  {"CursedArmorDamage", 15, "Percent"},
  {"apply-to", "unit-chaingunner"}, {"apply-to", "unit-medic"}, {"apply-to", "unit-chaingun-tower"})

DefineModifier("upgrade-explosive-weapons",
  {"BaseDamage", 20, "Percent"},
  {"LightArmorDamage", 20, "Percent"},
  {"CombatArmorDamage", 20, "Percent"},
  {"HeavyArmorDamage", 20, "Percent"},
  {"FleshArmorDamage", 20, "Percent"},
  {"HeavyFleshArmorDamage", 20, "Percent"},
  {"AirFleshArmorDamage", 20, "Percent"},
  {"MechanicalArmorDamage", 20, "Percent"},
  {"AirMechanicalArmorDamage", 20, "Percent"},
  {"BuildingArmorDamage", 20, "Percent"},
  {"HeavyBuildingArmorDamage", 20, "Percent"},
  {"CursedArmorDamage", 20, "Percent"},
  {"apply-to", "unit-technician"}, {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-crusher"}, {"apply-to", "unit-missile-tower"})

DefineModifier("upgrade-explosive-weapons",
  {"BaseDamage", 20, "Percent"},
  {"LightArmorDamage2", 20, "Percent"},
  {"CombatArmorDamage2", 20, "Percent"},
  {"HeavyArmorDamage2", 20, "Percent"},
  {"FleshArmorDamage2", 20, "Percent"},
  {"HeavyFleshArmorDamage2", 20, "Percent"},
  {"AirFleshArmorDamage2", 20, "Percent"},
  {"MechanicalArmorDamage2", 20, "Percent"},
  {"AirMechanicalArmorDamage2", 20, "Percent"},
  {"BuildingArmorDamage2", 20, "Percent"},
  {"HeavyBuildingArmorDamage2", 20, "Percent"},
  {"CursedArmorDamage2", 20, "Percent"},
  {"apply-to", "unit-crusher-upgraded"})

DefineModifier("upgrade-explosive-weapons",
  {"BaseDamage2", 20, "Percent"},
  {"LightArmorDamage3", 20, "Percent"},
  {"CombatArmorDamage3", 20, "Percent"},
  {"HeavyArmorDamage3", 20, "Percent"},
  {"FleshArmorDamage3", 20, "Percent"},
  {"HeavyFleshArmorDamage3", 20, "Percent"},
  {"AirFleshArmorDamage3", 20, "Percent"},
  {"MechanicalArmorDamage3", 20, "Percent"},
  {"AirMechanicalArmorDamage3", 20, "Percent"},
  {"BuildingArmorDamage3", 20, "Percent"},
  {"HeavyBuildingArmorDamage3", 20, "Percent"},
  {"CursedArmorDamage3", 20, "Percent"},
  {"apply-to", "unit-crusher-upgraded"})

DefineModifier("upgrade-explosive-weapons",
  {"BaseDamage2", 20, "Percent"},
  {"LightArmorDamage3", 20, "Percent"},
  {"CombatArmorDamage3", 20, "Percent"},
  {"HeavyArmorDamage3", 20, "Percent"},
  {"FleshArmorDamage3", 20, "Percent"},
  {"HeavyFleshArmorDamage3", 20, "Percent"},
  {"AirFleshArmorDamage3", 20, "Percent"},
  {"MechanicalArmorDamage3", 20, "Percent"},
  {"AirMechanicalArmorDamage3", 20, "Percent"},
  {"BuildingArmorDamage3", 20, "Percent"},
  {"HeavyBuildingArmorDamage3", 20, "Percent"},
  {"CursedArmorDamage3", 20, "Percent"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-hero"})

DefineModifier("upgrade-infantry-energy",
  {"BaseDamage", 20, "Percent"},
  {"LightArmorDamage", 20, "Percent"},
  {"CombatArmorDamage", 20, "Percent"},
  {"HeavyArmorDamage", 20, "Percent"},
  {"FleshArmorDamage", 20, "Percent"},
  {"HeavyFleshArmorDamage", 20, "Percent"},
  {"AirFleshArmorDamage", 20, "Percent"},
  {"MechanicalArmorDamage", 20, "Percent"},
  {"AirMechanicalArmorDamage", 20, "Percent"},
  {"BuildingArmorDamage", 20, "Percent"},
  {"HeavyBuildingArmorDamage", 20, "Percent"},
  {"CursedArmorDamage", 20, "Percent"},
  {"AttackRange", 1},
  {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-bfgmarine"})

DefineModifier("upgrade-infantry-energy",
  {"BaseDamage3", 20, "Percent"},
  {"LightArmorDamage4", 20, "Percent"},
  {"CombatArmorDamage4", 20, "Percent"},
  {"HeavyArmorDamage4", 20, "Percent"},
  {"FleshArmorDamage4", 20, "Percent"},
  {"HeavyFleshArmorDamage4", 20, "Percent"},
  {"AirFleshArmorDamage4", 20, "Percent"},
  {"MechanicalArmorDamage4", 20, "Percent"},
  {"AirMechanicalArmorDamage4", 20, "Percent"},
  {"BuildingArmorDamage4", 20, "Percent"},
  {"HeavyBuildingArmorDamage4", 20, "Percent"},
  {"CursedArmorDamage4", 20, "Percent"},
  {"apply-to", "unit-hero"})

DefineModifier("upgrade-vehicle-energy",
  {"BaseDamage", 20, "Percent"},
  {"LightArmorDamage", 20, "Percent"},
  {"CombatArmorDamage", 20, "Percent"},
  {"HeavyArmorDamage", 20, "Percent"},
  {"FleshArmorDamage", 20, "Percent"},
  {"HeavyFleshArmorDamage", 20, "Percent"},
  {"AirFleshArmorDamage", 20, "Percent"},
  {"MechanicalArmorDamage", 20, "Percent"},
  {"AirMechanicalArmorDamage", 20, "Percent"},
  {"BuildingArmorDamage", 20, "Percent"},
  {"HeavyBuildingArmorDamage", 20, "Percent"},
  {"CursedArmorDamage", 20, "Percent"},
  {"apply-to", "unit-raider"}, {"apply-to", "unit-thor"})

DefineModifier("upgrade-vehicle-energy",
  {"BaseDamage", 20, "Percent"},
  {"BaseDamage2", 20, "Percent"},
  {"LightArmorDamage2", 20, "Percent"},
  {"CombatArmorDamage2", 20, "Percent"},
  {"HeavyArmorDamage2", 20, "Percent"},
  {"FleshArmorDamage2", 20, "Percent"},
  {"HeavyFleshArmorDamage2", 20, "Percent"},
  {"AirFleshArmorDamage2", 20, "Percent"},
  {"MechanicalArmorDamage2", 20, "Percent"},
  {"AirMechanicalArmorDamage2", 20, "Percent"},
  {"BuildingArmorDamage2", 20, "Percent"},
  {"HeavyBuildingArmorDamage2", 20, "Percent"},
  {"CursedArmorDamage2", 20, "Percent"},

  {"LightArmorDamage3", 20, "Percent"},
  {"CombatArmorDamage3", 20, "Percent"},
  {"HeavyArmorDamage3", 20, "Percent"},
  {"FleshArmorDamage3", 20, "Percent"},
  {"HeavyFleshArmorDamage3", 20, "Percent"},
  {"AirFleshArmorDamage3", 20, "Percent"},
  {"MechanicalArmorDamage3", 20, "Percent"},
  {"AirMechanicalArmorDamage3", 20, "Percent"},
  {"BuildingArmorDamage3", 20, "Percent"},
  {"HeavyBuildingArmorDamage3", 20, "Percent"},
  {"CursedArmorDamage3", 20, "Percent"},
  {"apply-to", "unit-uac-fighter"})

DefineModifier("upgrade-chainsaw",
  {"BaseDamage", 20, "Percent"},
  {"LightArmorDamage", 20, "Percent"},
  {"CombatArmorDamage", 20, "Percent"},
  {"HeavyArmorDamage", 20, "Percent"},
  {"FleshArmorDamage", 20, "Percent"},
  {"HeavyFleshArmorDamage", 20, "Percent"},
  {"CursedArmorDamage", 20, "Percent"},
  {"apply-to", "unit-sawer"})

DefineModifier("upgrade-grenade-launcher-range",
  {"AttackRange", 3},
  {"apply-to", "unit-technician"})

DefineModifier("upgrade-chaingun-accuracy",
  {"AttackRange", 1},
  {"AirFleshArmorDamage", 33, "Percent"},
  {"AirMechanicalArmorDamage", 33, "Percent"},
  {"Precision", 20},
  {"apply-to", "unit-chaingunner"}, {"apply-to", "unit-chaingun-tower"})

DefineModifier("upgrade-long-ranged-missile",
  {"AttackRange", 2},
  {"apply-to", "unit-rocketmarine"})

DefineModifier("upgrade-visors",
  {"SightRange", 2},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-technician"}, {"apply-to", "unit-sawer"}, {"apply-to", "unit-chaingunner"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-bfgmarine"}, {"apply-to", "unit-medic"},
  {"apply-to", "unit-ssg"}, {"apply-to", "unit-hero"}, {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"},
  {"apply-to", "unit-uac-transport"})
  
DefineModifier("upgrade-armor1",
  {"ShieldPoints", 15},
  {"ShieldPermeability", -5},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-technician"}, {"apply-to", "unit-sawer"}, {"apply-to", "unit-chaingunner"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-medic"})

DefineModifier("upgrade-armor1",
  {"ShieldPoints", 15},
  {"ShieldPermeability", -5},
   {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-ssg"}, {"apply-to", "unit-bfgmarine"})

DefineModifier("upgrade-armor2",
  {"ShieldPoints", 15},
  {"ShieldPermeability", -5},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-technician"}, {"apply-to", "unit-sawer"}, {"apply-to", "unit-chaingunner"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-medic"})

DefineModifier("upgrade-armor2",
  {"ShieldPoints", 15},
  {"ShieldPermeability", -5},
   {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-ssg"}, {"apply-to", "unit-bfgmarine"})

DefineModifier("upgrade-armor3",
  {"ShieldPoints", 20},
  {"ShieldPermeability", -5},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-technician"}, {"apply-to", "unit-sawer"}, {"apply-to", "unit-chaingunner"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-medic"})

DefineModifier("upgrade-armor3",
  {"ShieldPoints", 20},
  {"ShieldPermeability", -5},
   {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-ssg"}, {"apply-to", "unit-bfgmarine"})

DefineModifier("upgrade-uac-mech-armor1",
  {"HitPoints", 25},
  {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"},
  {"apply-to", "unit-uac-transport"})

DefineModifier("upgrade-uac-mech-armor2",
  {"HitPoints", 30},
  {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"},
  {"apply-to", "unit-uac-transport"})
  
DefineModifier("upgrade-uac-mech-armor3",
  {"HitPoints", 35},
  {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"},
  {"apply-to", "unit-uac-transport"})

DefineModifier("upgrade-vehicle-attack-range",
  {"AttackRange", 1},
  {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"})

DefineModifier("upgrade-fighter-shield",
  {"ShieldPoints", {Value = 60, Max = 60, Increase = 1, Enable = true}},
  {"apply-to", "unit-uac-fighter"}, {"apply-to", "unit-uac-transport"})

DefineModifier("upgrade-technician-tools",
  {"Bombs", 1},
  {"Mines", 3},
  {"apply-to", "unit-technician"})
  
DefineModifier("upgrade-radar-eye",
	{"UnitFlags", unitFlags.UF_RadarEye},
	{"apply-to", "unit-radar"})

DefineModifier("upgrade-radar-research",
	{"UnitFlags", unitFlags.UF_RadarResearch},
	{"apply-to", "unit-radar"})

DefineModifier("upgrade-inferno-anomaly",
	{"UnitFlags", unitFlags.UF_IsInfernoAnomaly},
	{"apply-to", "unit-power-plant"}, {"apply-to", "unit-thermo-power-plant"})

DefineModifier("upgrade-flesh-weakness",
  {"FleshArmorDamage", 15, "Percent"},
  {"FleshArmorDamage2", 15, "Percent"},
  {"FleshArmorDamage3", 15, "Percent"},
  {"FleshArmorDamage4", 15, "Percent"},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-technician"}, {"apply-to", "unit-sawer"}, {"apply-to", "unit-chaingunner"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-bfgmarine"}, {"apply-to", "unit-medic"},
  {"apply-to", "unit-ssg"}, {"apply-to", "unit-hero"}, {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"},
  {"apply-to", "unit-uac-transport"})

DefineModifier("upgrade-heavy-flesh-weakness",
  {"HeavyFleshArmorDamage", 15, "Percent"},
  {"HeavyFleshArmorDamage2", 15, "Percent"},
  {"HeavyFleshArmorDamage3", 15, "Percent"},
  {"HeavyFleshArmorDamage4", 15, "Percent"},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-technician"}, {"apply-to", "unit-sawer"}, {"apply-to", "unit-chaingunner"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-bfgmarine"}, {"apply-to", "unit-medic"},
  {"apply-to", "unit-ssg"}, {"apply-to", "unit-hero"}, {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"},
  {"apply-to", "unit-uac-transport"})

DefineModifier("upgrade-levitation-anomaly",
  {"AirFleshArmorDamage", 15, "Percent"},
  {"AirFleshArmorDamage2", 15, "Percent"},
  {"AirFleshArmorDamage3", 15, "Percent"},
  {"AirFleshArmorDamage4", 15, "Percent"},
  {"apply-to", "unit-shotgunner"}, {"apply-to", "unit-technician"}, {"apply-to", "unit-sawer"}, {"apply-to", "unit-chaingunner"},
  {"apply-to", "unit-rocketmarine"}, {"apply-to", "unit-plasmamarine"}, {"apply-to", "unit-bfgmarine"}, {"apply-to", "unit-medic"},
  {"apply-to", "unit-ssg"}, {"apply-to", "unit-hero"}, {"apply-to", "unit-raider"}, {"apply-to", "unit-crusher"},
  {"apply-to", "unit-crusher-upgraded"}, {"apply-to", "unit-thor"}, {"apply-to", "unit-uac-fighter"},
  {"apply-to", "unit-uac-transport"})

DefineModifier("upgrade-crusher",
	{"apply-to", "unit-crusher"})
  
DefineModifier("upgrade-uac-building-armor1",
  {"HitPoints", 150},
  {"apply-to", "unit-power-plant"}, {"apply-to", "unit-supply-depot"},
  {"apply-to", "unit-thermo-power-plant"}, {"apply-to", "unit-barracks"},
  {"apply-to", "unit-tech-center"},{"apply-to", "unit-command-center"}, {"apply-to", "unit-advanced-command-center"},
  {"apply-to", "unit-vehicle-factory"},{"apply-to", "unit-radar"},
  {"apply-to", "unit-orbital-control"},{"apply-to", "unit-weapon-factory"})
  
DefineModifier("upgrade-uac-building-armor1",
  {"HitPoints", 45},
  {"apply-to", "unit-chaingun-tower"}, {"apply-to", "unit-missile-tower"},
  {"apply-to", "unit-uac-wall"})
  
DefineModifier("upgrade-uac-building-armor2",
  {"HitPoints", 200},
  {"apply-to", "unit-power-plant"}, {"apply-to", "unit-supply-depot"},
  {"apply-to", "unit-thermo-power-plant"},{"apply-to", "unit-barracks"},
  {"apply-to", "unit-tech-center"},{"apply-to", "unit-command-center"}, {"apply-to", "unit-advanced-command-center"},
  {"apply-to", "unit-vehicle-factory"},{"apply-to", "unit-radar"},
  {"apply-to", "unit-orbital-control"},{"apply-to", "unit-weapon-factory"})
  
DefineModifier("upgrade-uac-building-armor2",
  {"HitPoints", 55},
  {"apply-to", "unit-chaingun-tower"}, {"apply-to", "unit-missile-tower"},
  {"apply-to", "unit-uac-wall"})

DefineModifier("upgrade-building-shield",
  {"ShieldPoints", {Value = 250, Max = 250, Increase = 1, Enable = true}},
  {"apply-to", "unit-power-plant"}, {"apply-to", "unit-supply-depot"},
  {"apply-to", "unit-thermo-power-plant"},{"apply-to", "unit-barracks"},
  {"apply-to", "unit-tech-center"},{"apply-to", "unit-command-center"}, {"apply-to", "unit-advanced-command-center"},
  {"apply-to", "unit-vehicle-factory"},{"apply-to", "unit-radar"},
  {"apply-to", "unit-orbital-control"},{"apply-to", "unit-weapon-factory"})
  
DefineModifier("upgrade-tower-shield",
  {"ShieldPoints", {Value = 80, Max = 80, Increase = 1, Enable = true}},
  {"apply-to", "unit-chaingun-tower"}, {"apply-to", "unit-missile-tower"})

--	NOTE: Save can generate this table.


InitFuncs:add(function()
	DefineAllow("unit-robotworker",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-shotgunner",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-technician",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-ssg",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-chaingunner",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-sawer",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-rocketmarine",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-plasmamarine",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-bfgmarine",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-medic",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-hero",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-raider",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-crusher",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-crusher-upgraded",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-thor",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-uac-fighter",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-uac-transport",			"AAAAAAAAAAAAAAAA")

	DefineAllow("unit-command-center",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-advanced-command-center",		"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-power-plant",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-supply-depot",			"AAAAAAAAAAAAAAAA")
    DefineAllow("unit-barracks",		"AAAAAAAAAAAAAAAA")	
	DefineAllow("unit-weapon-factory",		"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-vehicle-factory",		"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-radar",		"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-tech-center",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-orbital-control",			"AAAAAAAAAAAAAAAA")
    DefineAllow("unit-thermo-power-plant",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-chaingun-tower",	"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-missile-tower",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-uac-wall",			"AAAAAAAAAAAAAAAA")

	DefineUnitAllow("unit-hero", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
	DefineUnitAllow("unit-orbital-control", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
	DefineUnitAllow("unit-advanced-command-center", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
	
	DefineAllow("upgrade-shotguns",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-bullet-weapons",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-chainsaw",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-explosive-weapons",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-infantry-energy",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-vehicle-energy",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-grenade-launcher-range",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-chaingun-accuracy",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-long-ranged-missile",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-armor1",		"AAAAAAAAAAAAAAAA")	
	DefineAllow("upgrade-armor2",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-armor3",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-visors",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-crusher",		"AAAAAAAAAAAAAAAA")
	
	DefineAllow("upgrade-technician-tools",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-defibrillation",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-fighter-shield",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-uac-mech-armor1",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-uac-mech-armor2",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-uac-mech-armor3",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-vehicle-attack-range",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-uac-building-armor1",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-uac-building-armor2",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-building-shield",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-tower-shield",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-radar-eye",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-radar-research",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-flesh-weakness",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-heavy-flesh-weakness",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-levitation-anomaly",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-torture-anomaly",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-inferno-anomaly",			"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-demon-strength-anomaly",			"AAAAAAAAAAAAAAAA")	
	DefineAllow("upgrade-invisibility-anomaly",			"AAAAAAAAAAAAAAAA")	
end)

--	NOTE: Save can generate this table.

-- Units

DefineDependency("unit-chaingunner",
  {"unit-weapon-factory"})
DefineDependency("unit-sawer",
  {"unit-weapon-factory"})
DefineDependency("unit-rocketmarine",
  {"unit-weapon-factory", "unit-radar"})
DefineDependency("unit-plasmamarine",
  {"unit-tech-center"})
DefineDependency("unit-ssg",
  {"unit-tech-center"})
DefineDependency("unit-medic",
  {"unit-tech-center"})
DefineDependency("unit-bfgmarine",
  {"unit-tech-center", "unit-advanced-command-center"})
DefineDependency("unit-hero",
  {"unit-tech-center", "unit-radar"})
DefineDependency("unit-crusher",
  {"unit-tech-center"})
DefineDependency("unit-thor",
  {"unit-tech-center", "unit-advanced-command-center"})
DefineDependency("unit-uac-fighter",
  {"unit-radar"})
DefineDependency("unit-uac-transport",
  {"unit-tech-center", "unit-radar"})
DefineDependency("unit-crusher-upgraded",
  {"upgrade-crusher"})

DefineDependency("unit-power-plant",
  {"unit-command-center"}, "or", {"unit-advanced-command-center"})
DefineDependency("unit-barracks",
  {"unit-command-center"}, "or", {"unit-advanced-command-center"})
DefineDependency("unit-supply-depot",
  {"unit-command-center"}, "or", {"unit-advanced-command-center"})
DefineDependency("unit-weapon-factory",
  {"unit-barracks","unit-command-center","unit-power-plant"},"or", {"unit-barracks","unit-command-center","unit-thermo-power-plant"}, 
  "or", {"unit-barracks","unit-advanced-command-center","unit-power-plant"},"or", {"unit-barracks","unit-advanced-command-center","unit-thermo-power-plant"})
DefineDependency("unit-radar",
  {"unit-weapon-factory","unit-barracks","unit-command-center"}, "or", {"unit-weapon-factory","unit-barracks","unit-advanced-command-center"})
DefineDependency("unit-vehicle-factory",
  {"unit-barracks","unit-command-center","unit-weapon-factory"}, "or", {"unit-barracks","unit-advanced-command-center","unit-weapon-factory"})
DefineDependency("unit-tech-center",
  {"unit-weapon-factory","unit-command-center"}, "or", {"unit-weapon-factory","unit-advanced-command-center"})
DefineDependency("unit-thermo-power-plant",
  {"unit-tech-center","unit-command-center", "unit-radar"}, "or", {"unit-tech-center","unit-advanced-command-center", "unit-radar"})
DefineDependency("unit-orbital-control",
  {"unit-tech-center","unit-advanced-command-center"})

DefineDependency("unit-uac-wall",
  {"unit-barracks","unit-command-center"}, "or", {"unit-barracks","unit-advanced-command-center"})
DefineDependency("unit-chaingun-tower",
  {"unit-barracks","unit-command-center", "unit-weapon-factory"}, "or",  {"unit-barracks","unit-advanced-command-center", "unit-weapon-factory"})
DefineDependency("unit-missile-tower",
  {"unit-radar", "unit-tech-center","unit-barracks","unit-command-center"}, "or", {"unit-radar", "unit-tech-center","unit-barracks","unit-advanced-command-center"})
  
DefineDependency("unit-advanced-command-center",
  {"unit-radar", "unit-tech-center", "unit-command-center"})
  
-- Upgrades
DefineDependency("upgrade-explosive-weapons",
  {"unit-radar"})
DefineDependency("upgrade-infantry-energy",
  {"unit-tech-center"})
DefineDependency("upgrade-vehicle-energy",
  {"unit-radar", "unit-tech-center"})

DefineDependency("upgrade-chaingun-accuracy",
  {"unit-radar"})
DefineDependency("upgrade-long-ranged-missile",
  {"unit-radar", "unit-tech-center"})
DefineDependency("upgrade-visors",
  {"unit-radar"})
DefineDependency("upgrade-armor2",
  {"upgrade-armor1", "unit-radar","unit-tech-center"})
DefineDependency("upgrade-armor3",
  {"upgrade-armor2", "unit-radar","unit-tech-center","unit-advanced-command-center"})
DefineDependency("upgrade-crusher",
  {"unit-tech-center", "unit-advanced-command-center"})
DefineDependency("upgrade-defibrillation",
  {"unit-tech-center"})
DefineDependency("upgrade-fighter-shield",
  {"unit-radar","unit-tech-center","unit-vehicle-factory"})
DefineDependency("upgrade-uac-mech-armor1",
  {"unit-vehicle-factory"})
DefineDependency("upgrade-uac-mech-armor2",
  {"upgrade-uac-mech-armor1", "unit-radar","unit-tech-center","unit-vehicle-factory"})
DefineDependency("upgrade-uac-mech-armor3",
  {"upgrade-uac-mech-armor2", "unit-radar","unit-tech-center","unit-vehicle-factory","unit-advanced-command-center"})
DefineDependency("upgrade-vehicle-attack-range",
  {"unit-vehicle-factory", "unit-radar", "unit-tech-center", "unit-advanced-command-center"})

DefineDependency("upgrade-radar-eye",
  {"unit-radar", "unit-tech-center"})
DefineDependency("upgrade-uac-building-armor2",
  {"upgrade-uac-building-armor1", "unit-radar","unit-tech-center", "unit-weapon-factory"})
DefineDependency("upgrade-building-shield",
  {"unit-advanced-command-center"})
DefineDependency("upgrade-tower-shield",
  {"unit-advanced-command-center"})

DefineDependency("upgrade-inferno-anomaly",
	{"unit-tech-center", "unit-advanced-command-center"})
DefineDependency("upgrade-demon-strength-anomaly",
	{"unit-tech-center", "unit-advanced-command-center"})
DefineDependency("upgrade-torture-anomaly",
	{"unit-tech-center", "unit-advanced-command-center"})
DefineDependency("upgrade-invisibility-anomaly",
	{"unit-tech-center", "unit-advanced-command-center"})