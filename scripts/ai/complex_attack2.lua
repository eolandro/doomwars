complex2player = nil

InitFuncs:add(function()
  ai_complex2_attack_func = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  ai_complex2_attack_end_loop_func = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
end)

---------------------------------------------------
------ Functions for AI script --------------------
---------------------------------------------------
local end_loop_complex2_funcs2_easy = {
		function() print("Looping !") return false end,
		function() return AiForce(0, {"unit-demon", 1, "unit-phantom", 2, "unit-hellknight", 1, "unit-cacodemon", 1, "unit-arachnotron", 1}) end,
		function() return AiForce(1, {"unit-hellknight", 3, "unit-revenant", 1, "unit-arachnotron", 1,
			 "unit-cacodemon", 1, "unit-painelemental", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function() ai_complex2_attack_end_loop_func[complex2player] = 0; return false end,
}

local end_loop_complex2_funcs2_medium = {
		function() print("Looping !") return false end,
		function() return AiForce(0, {"unit-phantom", 2,"unit-imp",1, "unit-cacodemon", 1}) end,
		function() return AiForce(1, {"unit-mancubus", 3, "unit-blood-demon", 2, "unit-archvile", 2, "unit-revenant", 4, 
			"unit-phantom", 5, "unit-baron", 4, "unit-cacolich", 3, "unit-painelemental", 3, "unit-arachnotron", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function() ai_complex2_attack_end_loop_func[complex2player] = 0; return false end,
}

local end_loop_complex2_funcs2_hard = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiForce(0, {"unit-blood-demon", 1, "unit-phantom", 2, "unit-devil", 1, "unit-hellknight", 2, "unit-cacodemon", 1, "unit-arachnotron", 1}) end,
		function() return AiForce(1, {"unit-mancubus", 3, "unit-blood-demon", 2, "unit-archvile", 2, "unit-revenant", 4, 
			"unit-phantom", 5, "unit-baron", 4, "unit-cacolich", 3, "unit-painelemental", 3, "unit-arachnotron", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function() ai_complex2_attack_end_loop_func[complex2player] = 0; return false end,
}


local end_loop_complex2_funcs2 = {end_loop_complex2_funcs2_easy, end_loop_complex2_funcs2_medium, end_loop_complex2_funcs2_hard}

local end_loop_complex2_funcs_easy = {
		function() print("Looping !") return false end,
		function() return AiForce(0, {"unit-chaingunner", 2, "unit-rocketmarine", 1, "unit-plasmamarine", 1, "unit-raider", 1}) end,
		function() return AiForce(1, {"unit-rocketmarine", 2, "unit-plasmamarine", 2, "unit-medic", 1, "unit-raider", 2, 
			"unit-crusher", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function() ai_complex2_attack_end_loop_func[complex2player] = 0; return false end,
}

local end_loop_complex2_funcs_medium = {
		function() print("Looping !") return false end,
		function() return AiForce(0, {"unit-shotgunner", 1, "unit-chaingunner", 2, "unit-rocketmarine", 1, "unit-medic", 1}) end,
		function() return AiForce(1, {"unit-technician", 2, "unit-rocketmarine", 2, "unit-ssg", 4, "unit-plasmamarine", 4, "unit-bfgmarine", 1, "unit-medic", 2, "unit-raider", 2, 
			"unit-crusher-upgraded", 5, "unit-thor", 3, "unit-uac-fighter", 4}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function() ai_complex2_attack_end_loop_func[complex2player] = 0; return false end,
}

local end_loop_complex2_funcs_hard = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiForce(0, {"unit-chaingunner", 2, "unit-rocketmarine", 1, "unit-plasmamarine", 2, "unit-raider", 2, "unit-crusher-upgraded", 2, "unit-uac-fighter", 1}) end,
		function() return AiForce(1, {"unit-rocketmarine", 2, "unit-ssg", 4, "unit-plasmamarine", 4, "unit-bfgmarine", 1, "unit-medic", 1, "unit-raider", 2, 
			"unit-crusher-upgraded", 5, "unit-thor", 2, "unit-uac-fighter", 4}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function() ai_complex2_attack_end_loop_func[complex2player] = 0; return false end,
}


local end_loop_complex2_funcs = {end_loop_complex2_funcs_easy, end_loop_complex2_funcs_medium, end_loop_complex2_funcs_hard }

local complex2_funcs2_easy = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-hellkeep") end,
		function() return AiSet("unit-lostsoul", 5) end,
		function() return AiNeed("unit-generator-hell") end,
		function() return AiNeed("unit-monster-spawner") end,
		function() return AiWait("unit-monster-spawner") end,
		function() return AiSleep(500) end,
		function() return AiForce(0, {"unit-phantom", 1,"unit-imp",1}) end,		

		function() return AiSet("unit-lostsoul", 10) end,
		function() return AiNeed("unit-blood-pool") end,
		function() return AiWait("unit-blood-pool") end,
		function() return AiNeed("unit-generator-hell") end,
		function() return AiSleep(500) end,
		function() return AiForce(0, {"unit-phantom", 2, "unit-imp",1}) end,
		function() return AiForce(1, {"unit-imp", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSet("unit-fire-tower", 2) end,
		function() return AiSet("unit-lostsoul", 15) end,
		function() return AiResearch("upgrade-light-monster-flesh1") end,
		function() return AiNeed("unit-generator-hell") end,
		function() return AiNeed("unit-hellgate") end,
		function() return AiWait("unit-hellgate") end,
		function() return AiNeed("unit-generator-hell") end,
		function() return AiForce(0, {"unit-phantom", 2, "unit-imp",1, "unit-hellknight", 1}) end,
		function() return AiNeed("unit-generator-hell") end,
		function() return AiNeed("unit-temple-of-fire") end,
		function() return AiWait("unit-temple-of-fire") end,
		function() return AiSet("unit-lostsoul", 20) end,
		function() return AiNeed("unit-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiNeed("unit-hellkeep") end,
		function() return AiWait("unit-hellkeep") end,
		function() return AiSet("unit-fire-tower", 4) end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiSet("unit-horror-tower", 1) end,
		function() return AiResearch("upgrade-light-monster-flesh2") end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-acidballs") end,

		function() return AiForce(0, {"unit-demon", 1, "unit-phantom", 2, "unit-hellknight", 1, "unit-cacodemon", 1, "unit-arachnotron", 1}) end,
		function() return AiForce(1, {"unit-hellknight", 3, "unit-revenant", 1, "unit-arachnotron", 1,
			 "unit-cacodemon", 1, "unit-painelemental", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		
		function() return AiSet("unit-horror-tower", 3) end,

		function() return AiComplexAttackEndloop2() end,
}

local complex2_funcs2_medium = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-hellkeep") end,
		function() return AiSet("unit-lostsoul", 10) end,
		function() return AiSet("unit-generator-hell", 1) end,
		function() return AiNeed("unit-monster-spawner") end,
		function() return AiWait("unit-monster-spawner") end,
		function() return AiForce(0, {"unit-phantom", 2,"unit-imp",1}) end,
		function() return AiForce(1, {"unit-imp", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,

		function() return AiSet("unit-generator-hell", 2) end,
		function() return AiSet("unit-lostsoul", 15) end,
		function() return AiNeed("unit-blood-pool") end,
		function() return AiWait("unit-blood-pool") end,
		function() return AiSet("unit-generator-hell", 4) end,
		function() return AiForce(1, {"unit-demon", 1, "unit-devil",1}, true) end,
		function() return AiSet("unit-fire-tower", 2) end,
		function() return AiSet("unit-lostsoul", 20) end,
		function() return AiResearch("upgrade-light-monster-flesh1") end,
		function() return AiNeed("unit-hellgate") end,
		function() return AiSet("unit-generator-hell", 6) end,
		function() return AiForce(0, {"unit-phantom", 2,"unit-imp", 1, "unit-cacodemon", 1}) end,
		function() return AiForce(1, {"unit-imp",2, "unit-demon", 2, "unit-devil", 1, "unit-hellknight", 2, "unit-cacodemon", 1}, false) end,
		function() return AiNeed("unit-temple-of-fire") end,
		function() return AiWait("unit-temple-of-fire") end,
		function() return AiSet("unit-lostsoul", 25) end,
		function() return AiSet("unit-generator-hell", 8) end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiResearch("upgrade-soul") end,
		function() return AiResearch("upgrade-spectre") end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiSet("unit-hellkeep", 2) end,
		function() return AiWait("unit-hellkeep") end,
		function() return AiSet("unit-generator-hell", 10) end,
		function() return AiSet("unit-fire-tower", 4) end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		
		function() return AiSet("unit-horror-tower", 1) end,
		function() return AiForce(1, {"unit-imp",2, "unit-demon", 2, "unit-devil", 1, "unit-hellknight", 3, "unit-cacodemon", 2, 
			"unit-phantom", 4, "unit-revenant", 3, "unit-painelemental", 1,	"unit-arachnotron", 2}, false) end,
		function() return AiForce(2, {"unit-spectre", 3}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiWaitForce(2) end,
		function() return AiAttackWithForce(1) end,
		function() return AiAttackWithForce(2) end,

		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiSet("unit-generator-hell", 11) end,
		function() return AiSet("unit-horror-tower", 2) end,
		function() return AiNeed("unit-blood-pool") end,
		function() return AiResearch("upgrade-blood-demon") end,
		function() return AiResearch("upgrade-light-monster-flesh2") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-temple-of-fire") end,	
		function() return AiResearch("upgrade-acidballs") end,
		function() return AiResearch("upgrade-monster-regeneration") end,
		function() return AiNeed("unit-death-pentagram") end,

		function() return AiForce(1, {"unit-mancubus", 3, "unit-blood-demon", 2, "unit-archvile", 2, "unit-revenant", 4, 
			"unit-phantom", 5, "unit-baron", 4, "unit-cacolich", 3, "unit-painelemental", 3, "unit-arachnotron", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		
		function() return AiSet("unit-horror-tower", 5) end,

		function() return AiComplexAttackEndloop2() end,
}

local complex2_funcs2_hard = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiNeed("unit-hellkeep") end,
		function() return AiSet("unit-lostsoul", 10) end,
		function() return AiSet("unit-generator-hell", 1) end,
		function() return AiNeed("unit-monster-spawner") end,
		function() return AiWait("unit-monster-spawner") end,
		function() return AiForce(0, {"unit-phantom", 2,"unit-imp",1}) end,
		function() return AiForce(1, {"unit-imp", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,

		function() return AiSet("unit-generator-hell", 2) end,
		function() return AiSet("unit-lostsoul", 15) end,
		function() return AiNeed("unit-blood-pool") end,
		function() return AiWait("unit-blood-pool") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiSet("unit-generator-hell", 4) end,
		function() return AiForce(1, {"unit-demon", 1, "unit-devil",1}, true) end,
		function() return AiSet("unit-fire-tower", 2) end,
		function() return AiSet("unit-lostsoul", 20) end,
		function() return AiResearch("upgrade-light-monster-flesh1") end,
		function() return AiNeed("unit-hellgate") end,
		function() return AiSet("unit-generator-hell", 6) end,
		function() return AiForce(0, {"unit-phantom", 2,"unit-imp", 1, "unit-cacodemon", 1}) end,
		function() return AiForce(1, {"unit-imp",2, "unit-demon", 2, "unit-devil", 1, "unit-hellknight", 2, "unit-cacodemon", 1}, false) end,
		function() return AiNeed("unit-temple-of-fire") end,
		function() return AiWait("unit-temple-of-fire") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiSet("unit-lostsoul", 25) end,
		function() return AiSet("unit-generator-hell", 8) end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiResearch("upgrade-soul") end,
		function() return AiResearch("upgrade-spectre") end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiSet("unit-hellkeep", 2) end,
		function() return AiWait("unit-hellkeep") end,
		function() return AiSet("unit-generator-hell", 10) end,
		function() return AiSet("unit-fire-tower", 4) end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		
		function() return AiSet("unit-horror-tower", 1) end,
		function() return AiForce(1, {"unit-imp",2, "unit-demon", 2, "unit-devil", 1, "unit-hellknight", 3, "unit-cacodemon", 2, 
			"unit-phantom", 4, "unit-revenant", 3, "unit-painelemental", 1,	"unit-arachnotron", 2}, false) end,
		function() return AiForce(2, {"unit-spectre", 3}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiWaitForce(2) end,
		function() return AiAttackWithForce(1) end,
		function() return AiAttackWithForce(2) end,

		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiSet("unit-generator-hell", 11) end,
		function() return AiSet("unit-horror-tower", 2) end,
		function() return AiNeed("unit-blood-pool") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-blood-demon") end,
		function() return AiResearch("upgrade-light-monster-flesh2") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-temple-of-fire") end,	
		function() return AiResearch("upgrade-acidballs") end,
		function() return AiResearch("upgrade-monster-regeneration") end,
		function() return AiNeed("unit-death-pentagram") end,

		function() return AiForce(1, {"unit-mancubus", 3, "unit-blood-demon", 2, "unit-archvile", 2, "unit-revenant", 4, 
			"unit-phantom", 5, "unit-baron", 4, "unit-cacolich", 3, "unit-painelemental", 3, "unit-arachnotron", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		
		function() return AiSet("unit-horror-tower", 5) end,
		function() return AiComplexAttackEndloop2() end,
}

local complex2_funcs2 = {complex2_funcs2_easy, complex2_funcs2_medium, complex2_funcs2_hard }

local complex2_funcs_easy = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-command-center") end,
		function() return AiSet("unit-robotworker", 5) end,
		function() return AiNeed("unit-power-plant") end,
		function() return AiNeed("unit-barracks") end,
		function() return AiWait("unit-barracks") end,
		function() return AiSleep(500) end,
		function() return AiForce(0, {"unit-shotgunner", 1,"unit-technician",1}) end,
		function() return AiSet("unit-robotworker", 8) end,
		function() return AiNeed("unit-power-plant") end,
		function() return AiNeed("unit-weapon-factory") end,
		function() return AiWait("unit-weapon-factory") end,
		function() return AiNeed("unit-power-plant") end,
		function() return AiSleep(500) end,
		function() return AiForce(0, {"unit-chaingunner", 2, "unit-shotgunner", 1,"unit-technician",1}) end,
		function() return AiForce(1, {"unit-chaingunner", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSet("unit-chaingun-tower", 2) end,
		function() return AiSet("unit-robotworker", 15) end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiNeed("unit-radar") end,
		function() return AiNeed("unit-vehicle-factory") end,
		function() return AiWait("unit-radar") end,
		function() return AiNeed("unit-power-plant") end,
		function() return AiNeed("unit-power-plant") end,
		function() return AiSleep(500) end,
		function() return AiWait("unit-vehicle-factory") end,
		function() return AiForce(0, {"unit-chaingunner", 3, "unit-rocketmarine", 1, "unit-raider", 1}) end,
		function() return AiNeed("unit-tech-center") end,
		function() return AiWait("unit-tech-center") end,
		function() return AiSet("unit-robotworker", 20) end,
		function() return AiNeed("unit-thermo-power-plant") end,
		function() return AiNeed("unit-command-center") end,
		function() return AiWait("unit-command-center") end,
		function() return AiSet("unit-missile-tower", 2) end,
		function() return AiNeed("unit-thermo-power-plant") end,
		function() return AiResearch("upgrade-armor2") end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,		
		function() return AiForce(0, {"unit-chaingunner", 3, "unit-rocketmarine", 1, "unit-plasmamarine", 1, "unit-raider", 1}) end,
		function() return AiForce(1, {"unit-rocketmarine", 2, "unit-plasmamarine", 2, "unit-medic", 1, "unit-raider", 2, 
			"unit-crusher", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSet("unit-missile-tower", 5) end,

		function() return AiComplexAttackEndloop() end,
}

local complex2_funcs_medium = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-command-center") end,
		function() return AiSet("unit-robotworker", 10) end,
		function() return AiSet("unit-power-plant", 2) end,
		function() return AiNeed("unit-barracks") end,
		function() return AiWait("unit-barracks") end,
		function() return AiForce(1, {"unit-shotgunner", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSet("unit-robotworker", 15) end,
		function() return AiSet("unit-power-plant", 4) end,
		function() return AiNeed("unit-weapon-factory") end,
		function() return AiWait("unit-weapon-factory") end,
		function() return AiSet("unit-robotworker", 20) end,
		function() return AiForce(0, {"unit-chaingunner", 2, "unit-technician",1}) end,
		function() return AiSet("unit-chaingun-tower", 2) end,
		function() return AiSet("unit-power-plant", 6) end,
		function() return AiNeed("unit-radar") end,
		function() return AiNeed("unit-vehicle-factory") end,
		function() return AiSet("unit-power-plant", 10) end,
		function() return AiNeed("unit-tech-center") end,
		function() return AiWait("unit-tech-center") end,
		function() return AiSet("unit-robotworker", 25) end,
		function() return AiSet("unit-thermo-power-plant", 5) end,
		function() return AiSet("unit-command-center", 2) end,
		function() return AiWait("unit-command-center") end,
		function() return AiSet("unit-missile-tower", 4) end,
		function() return AiUpgradeTo("unit-advanced-command-center") end,
		function() return AiWait("unit-advanced-command-center") end,
		function() return AiNeed("unit-orbital-control") end,
		function() return AiResearch("upgrade-crusher") end,

		function() return AiForce(0, {"unit-shotgunner", 1, "unit-chaingunner", 2, "unit-rocketmarine", 1, "unit-medic", 1}) end,
		function() return AiForce(1, {"unit-technician", 2, "unit-rocketmarine", 2, "unit-ssg", 4, "unit-plasmamarine", 4, "unit-bfgmarine", 1, "unit-medic", 2, "unit-raider", 2, 
			"unit-crusher-upgraded", 5, "unit-thor", 3, "unit-uac-fighter", 4}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,

		function() return AiSet("unit-missile-tower", 6) end,

		function() return AiComplexAttackEndloop() end,
}

local complex2_funcs_hard = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiNeed("unit-command-center") end,
		function() return AiSet("unit-robotworker", 10) end,
		function() return AiSet("unit-power-plant", 2) end,
		function() return AiNeed("unit-barracks") end,
		function() return AiWait("unit-barracks") end,
		function() return AiForce(1, {"unit-shotgunner", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSet("unit-robotworker", 15) end,
		function() return AiSet("unit-power-plant", 4) end,
		function() return AiNeed("unit-weapon-factory") end,
		function() return AiWait("unit-weapon-factory") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiSet("unit-robotworker", 20) end,
		function() return AiForce(0, {"unit-chaingunner", 2, "unit-technician",1}) end,
		function() return AiSet("unit-chaingun-tower", 2) end,
		function() return AiSet("unit-power-plant", 6) end,
		function() return AiNeed("unit-radar") end,
		function() return AiNeed("unit-vehicle-factory") end,
		function() return AiSet("unit-power-plant", 10) end,
		function() return AiNeed("unit-tech-center") end,
		function() return AiWait("unit-tech-center") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiSet("unit-robotworker", 25) end,
		function() return AiSet("unit-thermo-power-plant", 5) end,
		function() return AiSet("unit-command-center", 2) end,
		function() return AiWait("unit-command-center") end,
		function() return AiSet("unit-missile-tower", 4) end,
		function() return AiUpgradeTo("unit-advanced-command-center") end,
		function() return AiWait("unit-advanced-command-center") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiNeed("unit-orbital-control") end,
		function() return AiResearch("upgrade-crusher") end,


		function() return AiForce(0, {"unit-shotgunner", 1, "unit-chaingunner", 2, "unit-rocketmarine", 1, "unit-medic", 1}) end,
		function() return AiForce(1, {"unit-technician", 2, "unit-rocketmarine", 2, "unit-ssg", 4, "unit-plasmamarine", 4, "unit-bfgmarine", 1, "unit-medic", 2, "unit-raider", 2, 
			"unit-crusher-upgraded", 5, "unit-thor", 3, "unit-uac-fighter", 4}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,

		function() return AiSet("unit-missile-tower", 6) end,

		function() return AiComplex2AttackEndloop() end,
}

local complex2_funcs = {complex2_funcs_easy, complex2_funcs_medium, complex2_funcs_hard}

function AiComplex2AttackEndloop2()
  local ret
  local difficulty = GameSettings.Difficulty
  if difficulty == 1 or difficulty == 2 then
	difficulty = 1
  elseif difficulty == 3 then
	difficulty = 2
  elseif difficulty == 4 or difficulty == 5 then
	difficulty = 3
  end

  while (true) do
	ret = end_loop_complex2_funcs2[difficulty][ai_complex2_attack_end_loop_func[complex2player]]()
	if (ret) then
	  break
	end
	ai_complex2_attack_end_loop_func[complex2player] = ai_complex2_attack_end_loop_func[complex2player] + 1
  end
  return true
end

function AiComplex2AttackEndloop()
  local ret
  local difficulty = GameSettings.Difficulty
  if difficulty == 1 or difficulty == 2 then
	difficulty = 1
  elseif difficulty == 3 then
	difficulty = 2
  elseif difficulty == 4 or difficulty == 5 then
	difficulty = 3
  end

  while (true) do
	ret = end_loop_complex2_funcs[difficulty][ai_complex2_attack_end_loop_func[complex2player]]()
	if (ret) then
	  break
	end
	ai_complex2_attack_end_loop_func[complex2player] = ai_complex2_attack_end_loop_func[complex2player] + 1
  end
  return true
end

function AiComplex2Attack2()
  local ret
  local difficulty = GameSettings.Difficulty
  if difficulty == 1 or difficulty == 2 then
	difficulty = 1
  elseif difficulty == 3 then
	difficulty = 2
  elseif difficulty == 4 or difficulty == 5 then
	difficulty = 3
  else
    error("unknown difficulty")
  end
  
  complex2player = AiPlayer() + 1
  
  while (true) do
	ret = complex2_funcs2[difficulty][ai_complex2_attack_func[complex2player]]()
	if (ret) then
		break
	end
	ai_complex2_attack_func[complex2player] = ai_complex2_attack_func[complex2player] + 1
  end
end

function AiComplex2Attack()
  local ret
  local difficulty = GameSettings.Difficulty
  if difficulty == 1 or difficulty == 2 then
	difficulty = 1
  elseif difficulty == 3 then
	difficulty = 2
  elseif difficulty == 4 or difficulty == 5 then
	difficulty = 3
  else
    error("unknown difficulty")
  end
  
  complex2player = AiPlayer() + 1
  
  while (true) do
	ret = complex2_funcs[difficulty][ai_complex2_attack_func[complex2player]]()
	if (ret) then
		break
	end
	ai_complex2_attack_func[complex2player] = ai_complex2_attack_func[complex2player] + 1
  end
end

DefineAi("complex2-attack", "uac", "complex2-attack", AiComplex2Attack)
DefineAi("complex2-attack", "hell", "complex2-attack", AiComplex2Attack2)