local upgrades = {
  {"upgrade-demon-teeth", "icon-demon-teeth", _("Upgrade demon teeth"),
    {   320,   1200,   0,     300,     0,     0,     0}},
  {"upgrade-claws", "icon-claws", _("Upgrade claws"),
    {   350,   1700,   0,     450,     0,     0,     0}},
  {"upgrade-souls", "icon-souls", _("Research souls power"),
    {   450,   1900,   0,     500,     0,     0,     0}},
  {"upgrade-archvile-power", "icon-archvile-strength", _("Upgrade arch-vile power"),
    {   450,   2200,   0,     650,     0,     0,     0}},
  {"upgrade-imp-fireball", "icon-imp-fireball", _("Upgrade fireballs"),
    {   350,   1300,   0,     350,     0,     0,     0}},
  {"upgrade-cacoball", "icon-upgrade-cacoballs", _("Upgrade cacoballs"),
    {   380,   1700,   0,     450,     0,     0,     0}},
  {"upgrade-acidballs", "icon-upgrade-acidballs", _("Research acidballs"),
    {   400,   2000,   0,     500,     0,     0,     0}},
  {"upgrade-arachnotron-plasma", "icon-arachnotron-plasma", _("Upgrade arachnotron plasma"),
    {   400,   1600,   0,     550,     0,     0,     0}},
  {"upgrade-mancubus-fireball", "icon-mancubus-fireball", _("Upgrade mancubus fireballs"),
    {   450,   2200,   0,     650,     0,     0,     0}},
  {"upgrade-revenant-missile", "icon-revenant-missile", _("Upgrade revenant missiles"),
    {   450,   1700,   0,     550,     0,     0,     0}},
  {"upgrade-light-monster-flesh1", "icon-light-monster-flesh1", _("Upgrade light monsters flesh"),
    {   350,   1400,   0,     350,     0,     0,     0}},
  {"upgrade-light-monster-flesh2", "icon-light-monster-flesh2", _("Upgrade light monsters flesh"),
    {   400,   2400,   0,     600,     0,     0,     0}},
  {"upgrade-light-monster-flesh3", "icon-light-monster-flesh3", _("Upgrade light monsters flesh"),
    {   450,   2800,   0,     800,     0,     0,     0}},
  {"upgrade-heavy-monster-flesh1", "icon-heavy-monster-flesh1", _("Upgrade heavy monsters flesh"),
    {   350,   2000,   0,     500,     0,     0,     0}},
  {"upgrade-heavy-monster-flesh2", "icon-heavy-monster-flesh2", _("Upgrade heavy monsters flesh"),
    {   420,   2700,   0,     650,     0,     0,     0}},
  {"upgrade-heavy-monster-flesh3", "icon-heavy-monster-flesh3", _("Upgrade heavy monsters flesh"),
    {   500,   3000,   0,     800,     0,     0,     0}},
  {"upgrade-monsters-sight", "icon-monsters-sight", _("Upgrade monsters sight"),
    {   400,   2000,   0,     600,     0,     0,     0}},
  {"upgrade-spectre", "icon-upgrade-spectre", _("Spectre ability research"),
    {   370,   2000,   0,     550,     0,     0,     0}},
  {"upgrade-zombification", "icon-zombification", _("Research zombification"),
    {   450,   2700,   0,     700,     0,     0,     0}},
  {"upgrade-blood-demon", "icon-upgrade-blood-demon", _("Blood demon research"),
    {   350,   1900,   0,     500,     0,     0,     0}},
  {"upgrade-blink", "icon-blink", _("Blink teleporting ability"),
    {   300,   1500,   0,     400,     0,     0,     0}},
  {"upgrade-cacodemon-speed", "icon-upgrade-cacodemon-speed", _("Upgrade cacodemon speed"),
    {   400,   1600,   0,     450,     0,     0,     0}},
  {"upgrade-hell-building-armor1", "icon-hell-building-armor1", _("Upgrade building armor"),
    {   320,   1400,   0,     350,     0,     0,     0}},
  {"upgrade-hell-building-armor2", "icon-hell-building-armor2", _("Upgrade building armor"),
    {   420,   2400,   0,     550,     0,     0,     0}},
  {"upgrade-monster-regeneration", "icon-monster-regeneration", _("Research monsters regeneration"),
    {   450,   3000,   0,     850,     0,     0,     0}},
  {"upgrade-soul", "icon-upgrade-soul", _("Upgrade Lost Soul workers"),
    {   450,   2800,   0,     700,     0,     0,     0}},
  {"upgrade-temple-of-fire", "icon-upgrade-temple-of-fire", _("Upgrade Temple of Fire"),
    {   550,   3200,   0,     800,     0,     0,     0}},
  {"upgrade-make-zombie", "icon-upgrade-make-zombie", _("Zombie raising research"),
    {   420,   2600,   0,     700,     0,     0,     0}},
  {"upgrade-portals", "icon-portals", _("Portals research"),
    {   500,   3000,   0,     800,     0,     0,     0}}
}

DebugOut("\nHell upgrades debug\n")
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
  
DefineModifier("upgrade-demon-teeth",
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
  {"apply-to", "unit-demon"}, {"apply-to", "unit-blood-demon"}, {"apply-to", "unit-spectre"})
  
DefineModifier("upgrade-imp-fireball",
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
  {"AttackRange", 1},
  {"apply-to", "unit-imp"}, {"apply-to", "unit-devil"})

DefineModifier("upgrade-imp-fireball",
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
  {"apply-to", "unit-fire-tower"})

DefineModifier("upgrade-imp-fireball",
  {"Mana", {Max = 20, Enable = true}},
  {"apply-to", "unit-imp"})
  
DefineModifier("upgrade-cacoball",
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
  {"UnitFlags", unitFlags.UF_UpgradeCacoBall},
  {"apply-to", "unit-cacodemon"})

DefineModifier("upgrade-cacoball",
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
  {"AttackRange", 1},
  {"apply-to", "unit-cacolich"})

DefineModifier("upgrade-acidballs",
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
  {"UnitFlags", unitFlags.UF_UpgradeAcid},
  {"AttackRange", 1},
  {"apply-to", "unit-hellknight"}, {"apply-to", "unit-baron"}, {"apply-to", "unit-belial"})

DefineModifier("upgrade-acidballs",
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
  {"apply-to", "unit-horror-tower"})

DefineModifier("upgrade-mancubus-fireball",
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
  {"apply-to", "unit-mancubus"})
  
DefineModifier("upgrade-revenant-missile",
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
  {"AttackRange", 1},
  {"UnitFlags", unitFlags.UF_UpgradeTracer},
  {"apply-to", "unit-revenant"})

DefineModifier("upgrade-revenant-missile",
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
  {"UnitFlags", unitFlags.UF_UpgradeTracer},
  {"apply-to", "unit-upgraded-fire-tower"})
  
DefineModifier("upgrade-arachnotron-plasma",
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
  {"apply-to", "unit-arachnotron"})

DefineModifier("upgrade-light-monster-flesh1",
  {"HitPoints", 15},
  {"apply-to", "unit-zombieman"}, {"apply-to", "unit-sergeant"}, {"apply-to", "unit-zombie-ssg"},
  {"apply-to", "unit-zombie-technician"}, {"apply-to", "unit-heavy-dude"}, {"apply-to", "unit-zombie-saw"},
  {"apply-to", "unit-zombie-rocket"}, {"apply-to", "unit-zombie-plasma"}, {"apply-to", "unit-zombie-bfg"},
  {"apply-to", "unit-phantom"}, {"apply-to", "unit-new-phantom"}, {"apply-to", "unit-imp"},  {"apply-to", "unit-revenant"},  {"apply-to", "unit-devil"})
  
DefineModifier("upgrade-light-monster-flesh2",
  {"HitPoints", 20},
  {"apply-to", "unit-zombieman"}, {"apply-to", "unit-sergeant"}, {"apply-to", "unit-zombie-ssg"},
  {"apply-to", "unit-zombie-technician"}, {"apply-to", "unit-heavy-dude"}, {"apply-to", "unit-zombie-saw"},
  {"apply-to", "unit-zombie-rocket"}, {"apply-to", "unit-zombie-plasma"}, {"apply-to", "unit-zombie-bfg"},
  {"apply-to", "unit-phantom"}, {"apply-to", "unit-new-phantom"}, {"apply-to", "unit-imp"},  {"apply-to", "unit-revenant"},  {"apply-to", "unit-devil"})
  
DefineModifier("upgrade-light-monster-flesh3",
  {"HitPoints", 25},
  {"apply-to", "unit-zombieman"}, {"apply-to", "unit-sergeant"}, {"apply-to", "unit-zombie-ssg"},
  {"apply-to", "unit-zombie-technician"}, {"apply-to", "unit-heavy-dude"}, {"apply-to", "unit-zombie-saw"},
  {"apply-to", "unit-zombie-rocket"}, {"apply-to", "unit-zombie-plasma"}, {"apply-to", "unit-zombie-bfg"},
  {"apply-to", "unit-phantom"}, {"apply-to", "unit-new-phantom"}, {"apply-to", "unit-imp"},  {"apply-to", "unit-revenant"},  {"apply-to", "unit-devil"})
  
DefineModifier("upgrade-heavy-monster-flesh1",
  {"HitPoints", 25},
  {"apply-to", "unit-demon"}, {"apply-to", "unit-spectre"}, {"apply-to", "unit-blood-demon"}, {"apply-to", "unit-hellknight"}, 
  {"apply-to", "unit-baron"}, {"apply-to", "unit-arachnotron"}, {"apply-to", "unit-cacolich"},  
  {"apply-to", "unit-mancubus"}, {"apply-to", "unit-archvile"}, {"apply-to", "unit-cacodemon"}, {"apply-to", "unit-belial"},
  {"apply-to", "unit-painelemental"})
  
DefineModifier("upgrade-heavy-monster-flesh2",
  {"HitPoints", 35},
  {"apply-to", "unit-demon"}, {"apply-to", "unit-spectre"}, {"apply-to", "unit-blood-demon"}, {"apply-to", "unit-hellknight"}, 
  {"apply-to", "unit-baron"}, {"apply-to", "unit-arachnotron"}, {"apply-to", "unit-cacolich"},  
  {"apply-to", "unit-mancubus"}, {"apply-to", "unit-archvile"}, {"apply-to", "unit-cacodemon"}, {"apply-to", "unit-belial"},
  {"apply-to", "unit-painelemental"})
  
DefineModifier("upgrade-heavy-monster-flesh3",
  {"HitPoints", 45},
  {"apply-to", "unit-demon"}, {"apply-to", "unit-spectre"}, {"apply-to", "unit-blood-demon"}, {"apply-to", "unit-hellknight"}, 
  {"apply-to", "unit-baron"}, {"apply-to", "unit-arachnotron"}, {"apply-to", "unit-cacolich"},
  {"apply-to", "unit-mancubus"}, {"apply-to", "unit-archvile"}, {"apply-to", "unit-cacodemon"}, {"apply-to", "unit-belial"},
  {"apply-to", "unit-painelemental"})
  
DefineModifier("upgrade-monsters-sight",
  {"SightRange", 2},
  {"apply-to", "unit-zombieman"}, {"apply-to", "unit-sergeant"}, {"apply-to", "unit-zombie-ssg"},
  {"apply-to", "unit-zombie-technician"}, {"apply-to", "unit-heavy-dude"}, {"apply-to", "unit-zombie-saw"},
  {"apply-to", "unit-zombie-rocket"}, {"apply-to", "unit-zombie-plasma"}, {"apply-to", "unit-zombie-bfg"}, {"apply-to", "unit-imp"},
  {"apply-to", "unit-revenant"}, {"apply-to", "unit-phantom"},{"apply-to", "unit-new-phantom"},  {"apply-to", "unit-demon"}, {"apply-to", "unit-blood-demon"},
  {"apply-to", "unit-spectre"}, {"apply-to", "unit-hellknight"}, {"apply-to", "unit-baron"}, {"apply-to", "unit-arachnotron"},
  {"apply-to", "unit-mancubus"}, {"apply-to", "unit-archvile"}, {"apply-to", "unit-cacodemon"}, {"apply-to", "unit-belial"},
  {"apply-to", "unit-painelemental"}, {"apply-to", "unit-devil"}, {"apply-to", "unit-cacolich"})
  
DefineModifier("upgrade-monster-regeneration",
  {"regeneration-rate", 1},
  {"apply-to", "unit-lostsoul"}, {"apply-to", "unit-advanced-lostsoul"},  
  {"apply-to", "unit-zombieman"}, {"apply-to", "unit-sergeant"}, {"apply-to", "unit-zombie-ssg"},
  {"apply-to", "unit-zombie-technician"}, {"apply-to", "unit-heavy-dude"}, {"apply-to", "unit-zombie-saw"},
  {"apply-to", "unit-zombie-rocket"}, {"apply-to", "unit-zombie-plasma"}, {"apply-to", "unit-zombie-bfg"}, 
  {"apply-to", "unit-imp"}, {"apply-to", "unit-devil"}, {"apply-to", "unit-cacolich"},  
  {"apply-to", "unit-revenant"}, {"apply-to", "unit-phantom"},{"apply-to", "unit-new-phantom"},  {"apply-to", "unit-demon"}, {"apply-to", "unit-hellknight"}, 
  {"apply-to", "unit-baron"}, {"apply-to", "unit-arachnotron"}, {"apply-to", "unit-blood-demon"}, {"apply-to", "unit-spectre"},
  {"apply-to", "unit-mancubus"}, {"apply-to", "unit-archvile"}, {"apply-to", "unit-cacodemon"}, {"apply-to", "unit-belial"},
  {"apply-to", "unit-painelemental"})

DefineModifier("upgrade-cacodemon-speed",
  {"UnitFlags", unitFlags.UF_UpgradeSpeed},
  {"apply-to", "unit-cacodemon"}, {"apply-to", "unit-cacolich"})
  
DefineModifier("upgrade-hell-building-armor1",
  {"HitPoints", 150},
  {"apply-to", "unit-generator-hell"}, {"apply-to", "unit-advanced-generator-hell"}, {"apply-to", "unit-monster-spawner"},
  {"apply-to", "unit-temple-of-fire"}, {"apply-to", "unit-hellgate"}, {"apply-to", "unit-hellkeep"},
  {"apply-to", "unit-death-pentagram"}, {"apply-to", "unit-blood-pool"}, {"apply-to", "unit-well"})
  
DefineModifier("upgrade-hell-building-armor1",
  {"HitPoints", 45},
  {"apply-to", "unit-fire-tower"}, {"apply-to", "unit-upgraded-fire-tower"}, {"apply-to", "unit-horror-tower"},
  {"apply-to", "unit-hell-wall"})
  
DefineModifier("upgrade-hell-building-armor2",
  {"HitPoints", 200},
  {"apply-to", "unit-generator-hell"}, {"apply-to", "unit-advanced-generator-hell"}, {"apply-to", "unit-monster-spawner"},
  {"apply-to", "unit-temple-of-fire"}, {"apply-to", "unit-hellgate"}, {"apply-to", "unit-hellkeep"},
  {"apply-to", "unit-death-pentagram"}, {"apply-to", "unit-blood-pool"}, {"apply-to", "unit-well"})
  
DefineModifier("upgrade-hell-building-armor2",
  {"HitPoints", 55},
  {"apply-to", "unit-fire-tower"}, {"apply-to", "unit-upgraded-fire-tower"}, {"apply-to", "unit-horror-tower"},
  {"apply-to", "unit-hell-wall"})

DefineModifier("upgrade-souls",
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
  {"apply-to", "unit-phantom"}, {"apply-to", "unit-new-phantom"},{"apply-to", "unit-painelemental"})

DefineModifier("upgrade-souls",
{"apply-to", "unit-phantom"},{"convert-to", "unit-new-phantom"})

DefineModifier("upgrade-souls",
{"UnitFlags", unitFlags.UF_SoulsResearch},
{"apply-to", "unit-painelemental"})

DefineModifier("upgrade-souls",
  {"Mana", 80},
  {"apply-to", "unit-painelemental"}
)

DefineModifier("upgrade-archvile-power", 
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
  {"Mana", 50},
  {"apply-to", "unit-archvile"})
  
DefineModifier("upgrade-claws", 
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
  {"apply-to", "unit-imp"}, {"apply-to", "unit-hellknight"}, {"apply-to", "unit-baron"},
  {"apply-to", "unit-revenant"}, {"apply-to", "unit-devil"}, {"apply-to", "unit-belial"})
  
DefineModifier("upgrade-soul",
  {"allow-unit", "unit-lostsoul", 0},
  {"apply-to", "unit-lostsoul"}, {"convert-to", "unit-advanced-lostsoul"})

DefineModifier("upgrade-make-zombie",
	{"Mana", {Max = 90, Enable = true}},
	{"apply-to", "unit-horror-tower"})

DefineModifier("upgrade-blink",
	{"apply-to", "unit-blood-demon"})

DefineModifier("upgrade-zombification",
	{"UnitFlags", unitFlags.UF_UpgradeZombification},
	{"apply-to", "unit-painelemental"})

DefineModifier("upgrade-portals",
	{"UnitFlags", unitFlags.UF_UpgradePortal},
	{"apply-to", "unit-hellgate"})

--	NOTE: Save can generate this table.

InitFuncs:add(function()
	DefineAllow("unit-lostsoul",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-advanced-lostsoul",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-zombieman",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-sergeant",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-heavy-dude",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-imp",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-devil",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-demon",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-spectre",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-blood-demon",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-phantom",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-new-phantom",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-hellknight",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-baron",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-arachnotron",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-revenant",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-mancubus",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-archvile",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-cyberdemon",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-spiderdemon",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-belial",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-cacodemon",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-painelemental",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-cacolich",			"AAAAAAAAAAAAAAAA")

	DefineAllow("unit-hellkeep",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-generator-hell",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-advanced-generator-hell",			"AAAAAAAAAAAAAAAA")
    DefineAllow("unit-monster-spawner",		"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-blood-pool",		"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-hellgate",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-temple-of-fire",		"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-death-pentagram",	"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-well",	"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-gate-exit",			"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-fire-tower",	"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-upgraded-fire-tower",	"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-horror-tower",	"AAAAAAAAAAAAAAAA")
	DefineAllow("unit-hell-wall",			"AAAAAAAAAAAAAAAA")

	DefineUnitAllow("unit-death-pentagram", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
	DefineUnitAllow("unit-belial", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)      
	
	DefineAllow("upgrade-imp-fireball",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-light-monster-flesh1",		"AAAAAAAAAAAAAAAA")	
	
	DefineAllow("upgrade-light-monster-flesh1",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-hell-building-armor1",		"AAAAAAAAAAAAAAAA")
	
	DefineAllow("upgrade-monsters-sight",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-cacoball",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-acidballs",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-demon-teeth",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-heavy-monster-flesh1",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-claws",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-revenant-missile",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-arachnotron-plasma",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-light-monster-flesh2",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-heavy-monster-flesh2",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-mancubus-fireball",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-hell-building-armor2",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-monster-regeneration",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-souls",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-spectre",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-blood-demon",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-light-monster-flesh3",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-heavy-monster-flesh3",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-archvile-power",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-soul",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-temple-of-fire",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-make-zombie",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-portals",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-zombification",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-blink",		"AAAAAAAAAAAAAAAA")
	DefineAllow("upgrade-cacodemon-speed",		"AAAAAAAAAAAAAAAA")
end)

--	NOTE: Save can generate this table.

DefineDependency("unit-devil",
  {"unit-blood-pool"})
DefineDependency("unit-demon",
  {"unit-blood-pool"})
DefineDependency("unit-blood-demon",
  {"upgrade-blood-demon"})
DefineDependency("unit-spectre",
  {"upgrade-spectre"})
DefineDependency("unit-mancubus",
  {"unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("unit-archvile",
  {"unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("unit-cacolich",
  {"unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("unit-painelemental",
  {"unit-temple-of-fire"})
DefineDependency("unit-revenant",
  {"unit-temple-of-fire"})
DefineDependency("unit-arachnotron",
  {"unit-temple-of-fire"})
DefineDependency("unit-baron",
  {"unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("unit-belial",
  {"unit-temple-of-fire"})
DefineDependency("unit-advanced-lostsoul",
  {"upgrade-soul"}) 
DefineDependency("unit-new-phantom",
  {"upgrade-souls"}) 

DefineDependency("unit-upgraded-fire-tower",
  {"unit-hellgate","unit-blood-pool","unit-monster-spawner","unit-hellkeep"})
DefineDependency("unit-fire-tower",
  {"unit-blood-pool", "unit-monster-spawner","unit-hellkeep"})
DefineDependency("unit-horror-tower",
  {"unit-temple-of-fire","unit-monster-spawner","unit-hellkeep"})
DefineDependency("unit-generator-hell",
  {"unit-hellkeep"})
DefineDependency("unit-advanced-generator-hell",
  {"unit-hellkeep", "unit-temple-of-fire"})
DefineDependency("unit-monster-spawner",
  {"unit-hellkeep"})
DefineDependency("unit-blood-pool",
  {"unit-hellkeep","unit-monster-spawner"})
DefineDependency("unit-hellgate",
  {"unit-hellkeep","unit-monster-spawner","unit-blood-pool"})
DefineDependency("unit-well",
  {"unit-hellkeep", "unit-blood-pool", "unit-hellgate"})
DefineDependency("unit-temple-of-fire",
  {"unit-hellkeep","unit-blood-pool","unit-hellgate"})
DefineDependency("unit-death-pentagram",
  {"unit-hellkeep","unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("unit-hell-wall",
  {"unit-hellkeep","unit-monster-spawner"})
  
DefineDependency("upgrade-souls",
  {"unit-hellgate", "unit-temple-of-fire"})
DefineDependency("upgrade-archvile-power",
  {"unit-hellgate", "unit-temple-of-fire", "upgrade-temple-of-fire"})

DefineDependency("upgrade-cacoball",
  {"unit-hellgate"})
DefineDependency("upgrade-acidballs",
  {"unit-hellgate"})
DefineDependency("upgrade-mancubus-fireball",
  {"unit-hellgate", "unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("upgrade-revenant-missile",
  {"unit-hellgate", "unit-temple-of-fire"})
DefineDependency("upgrade-arachnotron-plasma",
  {"unit-hellgate", "unit-temple-of-fire"})

DefineDependency("upgrade-light-monster-flesh2",
  {"upgrade-light-monster-flesh1", "unit-temple-of-fire"})
DefineDependency("upgrade-light-monster-flesh3",
  {"upgrade-light-monster-flesh2", "unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("upgrade-heavy-monster-flesh2",
  {"upgrade-heavy-monster-flesh1", "unit-hellgate", "unit-temple-of-fire"})
DefineDependency("upgrade-heavy-monster-flesh3",
  {"upgrade-heavy-monster-flesh2", "unit-hellgate", "unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("upgrade-spectre",
  {"unit-hellgate"})
DefineDependency("upgrade-blood-demon",
  {"unit-hellgate"})
DefineDependency("upgrade-monsters-sight",
  {"unit-hellgate"})
DefineDependency("upgrade-zombification",
  {"unit-hellgate", "unit-temple-of-fire", "upgrade-temple-of-fire"})
DefineDependency("upgrade-blink",
  {"unit-temple-of-fire", "upgrade-blood-demon"})
DefineDependency("upgrade-cacodemon-speed",
  {"unit-temple-of-fire"})


DefineDependency("upgrade-portals",
  {"unit-hellgate", "unit-temple-of-fire"})
DefineDependency("upgrade-make-zombie",
  {"unit-temple-of-fire", "unit-blood-pool", "unit-monster-spawner"})
DefineDependency("upgrade-hell-building-armor1",
  {"unit-blood-pool"})
DefineDependency("upgrade-hell-building-armor2",
  {"upgrade-hell-building-armor1", "unit-temple-of-fire", "unit-blood-pool"})