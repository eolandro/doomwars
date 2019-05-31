complexplayer = nil

InitFuncs:add(function()
  ai_complex_init = false
  ai_complex_attack_func = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  ai_complex_attack_end_loop_func = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  ai_complex_attack_end_loop_tactic = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
end)

---------------------------------------------------
------ Functions for AI script --------------------
---------------------------------------------------

local end_loop_complex_funcs2_easy1 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiForce(1, {"unit-phantom", 2,"unit-mancubus", 2, "unit-revenant", 4}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(1500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

local end_loop_complex_funcs2_easy2 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiForce(1, {"unit-phantom", 2,"unit-cacodemon", 5, "unit-painelemental", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(1500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

local end_loop_complex_funcs2_easy3 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiForce(1, {"unit-phantom", 2,"unit-cacodemon", 3, "unit-arachnotron", 3, "unit-archvile", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(1500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Mass Mancubi and Revenants Archies
local end_loop_complex_funcs2_medium1 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-mancubus-fireball") end,
		function() return AiResearch("upgrade-revenant-missile") end,
		function() return AiForce(1, {"unit-phantom", 5,"unit-mancubus", 5, "unit-revenant", 8, "unit-archvile", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Mass Flyers
local end_loop_complex_funcs2_medium2 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-cacoball") end,
		function() return AiResearch("upgrade-cacodemon-speed") end,
		function() return AiResearch("upgrade-zombification") end,
		function() return AiForce(1, {"unit-phantom", 5,"unit-cacolich", 5, "unit-cacodemon", 8, "unit-painelemental", 4}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Spectres
local end_loop_complex_funcs2_medium3 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-spectre") end,
		function() return AiResearch("upgrade-demon-teeth") end,
		function() return AiForce(1, {"unit-phantom", 5,"unit-spectre", 8}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Arachnotrons with cacodemons and archviles
local end_loop_complex_funcs2_medium4 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-arachnotron-plasma") end,
		function() return AiResearch("upgrade-archvile-power") end,
		function() return AiResearch("upgrade-cacoball") end,
		function() return AiForce(1, {"unit-phantom", 5,"unit-cacodemon", 6, "unit-arachnotron", 8, "unit-archvile", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Belial and mass barons with revenants
local end_loop_complex_funcs2_medium5 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-acidballs") end,
		function() return AiResearch("upgrade-revenant-missile") end,
		function() return AiForce(1, {"unit-phantom", 5, "unit-belial", 1, "unit-baron", 9, "unit-revenant", 5}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c)
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Mass Mancubi and Revenants Archies
local end_loop_complex_funcs2_hard1 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-mancubus-fireball") end,
		function() return AiResearch("upgrade-revenant-missile") end,
		function() return AiForce(1, {"unit-phantom", 6, "unit-mancubus", 7, "unit-revenant", 10, "unit-archvile", 3}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Mass Flyers
local end_loop_complex_funcs2_hard2 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-cacoball") end,
		function() return AiResearch("upgrade-cacodemon-speed") end,
		function() return AiResearch("upgrade-zombification") end,
		function() return AiForce(1, {"unit-phantom", 6, "unit-cacolich", 6, "unit-cacodemon", 12, "unit-painelemental", 5}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Spectres
local end_loop_complex_funcs2_hard3 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-spectre") end,
		function() return AiResearch("upgrade-demon-teeth") end,
		function() return AiForce(1, {"unit-phantom", 6, "unit-spectre", 12}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Arachnotrons with cacodemons and archviles
local end_loop_complex_funcs2_hard4 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-arachnotron-plasma") end,
		function() return AiResearch("upgrade-archvile-power") end,
		function() return AiResearch("upgrade-cacoball") end,
		function() return AiForce(1, {"unit-phantom", 6, "unit-cacodemon", 8, "unit-arachnotron", 10, "unit-archvile", 3}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Belial and mass barons with revenants
local end_loop_complex_funcs2_hard5 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-heavy-monster-flesh1") end,
		function() return AiResearch("upgrade-heavy-monster-flesh2") end,
		function() return AiResearch("upgrade-acidballs") end,
		function() return AiResearch("upgrade-revenant-missile") end,
		function() return AiForce(1, {"unit-phantom", 6,  "unit-belial", 1, "unit-baron", 11, "unit-revenant", 7, "unit-archvile", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c)
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

local end_loop_complex_funcs2_easy = {end_loop_complex_funcs2_easy1, end_loop_complex_funcs2_easy2, end_loop_complex_funcs2_easy3}
local end_loop_complex_funcs2_medium = {end_loop_complex_funcs2_medium1, end_loop_complex_funcs2_medium2, end_loop_complex_funcs2_medium3, end_loop_complex_funcs2_medium4, end_loop_complex_funcs2_medium5}
local end_loop_complex_funcs2_hard = {end_loop_complex_funcs2_hard1, end_loop_complex_funcs2_hard2, end_loop_complex_funcs2_hard3, end_loop_complex_funcs2_hard4, end_loop_complex_funcs2_hard5}
local end_loop_complex_funcs2 = {end_loop_complex_funcs2_easy, end_loop_complex_funcs2_medium, end_loop_complex_funcs2_hard}

local end_loop_complex_funcs_easy1 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiForce(1, {"unit-ssg", 2, "unit-plasmamarine", 3, "unit-rocketmarine", 2, "unit-medic", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

local end_loop_complex_funcs_easy2 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiResearch("upgrade-crusher") end,
		function() return AiForce(1, {"unit-thor", 2, "unit-crusher-upgraded", 3, "unit-technician",1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

local end_loop_complex_funcs_easy3 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiForce(1, {"unit-crusher", 5, "unit-uac-fighter", 4, "unit-technician",1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Attack using plasmers, SSG guys, rocket marines and medics
local end_loop_complex_funcs_medium1 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiResearch("upgrade-armor2") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-long-ranged-missile") end,
		function() return AiSet("unit-barracks", 2) end,
		function() return AiForce(1, {"unit-ssg", 6, "unit-plasmamarine", 5, "unit-rocketmarine", 5, "unit-medic", 3, "unit-technician",2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Attack using mass Thors and Crushers with missile launchers
local end_loop_complex_funcs_medium2 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiResearch("upgrade-uac-mech-armor2") end,
		function() return AiResearch("upgrade-vehicle-energy") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-vehicle-attack-range") end,
		function() return AiResearch("upgrade-crusher") end,
		function() return AiForce(1, {"unit-thor", 5, "unit-crusher-upgraded", 6, "unit-technician",2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Attack using mass Crushers and Fighters
local end_loop_complex_funcs_medium3 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiResearch("upgrade-uac-mech-armor2") end,
		function() return AiResearch("upgrade-vehicle-energy") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-fighter-shield") end,
		function() return AiForce(1, {"unit-crusher", 9, "unit-uac-fighter", 6, "unit-technician",2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Troopers with hero
local end_loop_complex_funcs_medium4 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiResearch("upgrade-armor2") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-shotguns") end,
		function() return AiResearch("upgrade-long-ranged-missile") end,
		function() return AiForce(1, {"unit-hero", 1, "unit-bfgmarine", 2, "unit-plasmamarine", 6, "unit-rocketmarine", 4, "unit-medic", 3, "unit-technician",2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Mass Thors and Rocketmarines 
local end_loop_complex_funcs_medium5 = {
		function() print("Looping !") return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiResearch("upgrade-uac-mech-armor2") end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiResearch("upgrade-armor2") end,
		function() return AiResearch("upgrade-vehicle-energy") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-fighter-shield") end,
		function() return AiForce(1, {"unit-rocketmarine", 7, "unit-thor", 5,  "unit-technician",2, "unit-medic", 2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Attack using plasmers, SSG guys, rocket marines and medics
local end_loop_complex_funcs_hard1 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiResearch("upgrade-armor2") end,
		function() return AiResearch("upgrade-armor3") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-long-ranged-missile") end,
		function() return AiSet("unit-barracks", 2) end,
		function() return AiForce(1, {"unit-ssg", 9, "unit-plasmamarine", 7, "unit-rocketmarine", 7, "unit-medic", 4, "unit-technician",2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Attack using mass Thors and Crushers with missile launchers
local end_loop_complex_funcs_hard2 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiResearch("upgrade-uac-mech-armor2") end,
		function() return AiResearch("upgrade-uac-mech-armor3") end,
		function() return AiResearch("upgrade-vehicle-energy") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-vehicle-attack-range") end,
		function() return AiResearch("upgrade-crusher") end,
		function() return AiForce(1, {"unit-thor", 6, "unit-crusher-upgraded", 8, "unit-technician",3}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Attack using mass Crushers and Fighters
local end_loop_complex_funcs_hard3 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiResearch("upgrade-uac-mech-armor2") end,
		function() return AiResearch("upgrade-uac-mech-armor3") end,
		function() return AiResearch("upgrade-vehicle-energy") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-fighter-shield") end,
		function() return AiForce(1, {"unit-crusher", 12, "unit-uac-fighter", 8, "unit-technician",3}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Troopers with hero
local end_loop_complex_funcs_hard4 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiResearch("upgrade-armor2") end,
		function() return AiResearch("upgrade-armor3") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-shotguns") end,
		function() return AiResearch("upgrade-long-ranged-missile") end,
		function() return AiForce(1, {"unit-hero", 1, "unit-bfgmarine", 3, "unit-plasmamarine", 9, "unit-rocketmarine", 7, "unit-medic", 4, "unit-technician",2}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

-- Mass Thors and Rocketmarines 
local end_loop_complex_funcs_hard5 = {
		function() print("Looping !") return false end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiResearch("upgrade-uac-mech-armor1") end,
		function() return AiResearch("upgrade-uac-mech-armor2") end,
		function() return AiResearch("upgrade-uac-mech-armor3") end,
		function() return AiResearch("upgrade-armor1") end,
		function() return AiResearch("upgrade-armor2") end,
		function() return AiResearch("upgrade-armor3") end,
		function() return AiResearch("upgrade-vehicle-energy") end,
		function() return AiResearch("upgrade-explosive-weapons") end,
		function() return AiResearch("upgrade-fighter-shield") end,
		function() return AiForce(1, {"unit-rocketmarine",9, "unit-thor", 6,  "unit-technician",3, "unit-medic", 3}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSleep(500) end,
		function(c) 
			ai_complex_attack_end_loop_tactic[complexplayer] = c
			ai_complex_attack_end_loop_func[complexplayer] = 0
			return false
		end,
}

local end_loop_complex_funcs_easy = {end_loop_complex_funcs_easy1, end_loop_complex_funcs_easy2, end_loop_complex_funcs_easy3}
local end_loop_complex_funcs_medium = {end_loop_complex_funcs_medium1, end_loop_complex_funcs_medium2, end_loop_complex_funcs_medium3, end_loop_complex_funcs_medium4, end_loop_complex_funcs_medium5}
local end_loop_complex_funcs_hard = {end_loop_complex_funcs_hard1, end_loop_complex_funcs_hard2, end_loop_complex_funcs_hard3, end_loop_complex_funcs_hard4, end_loop_complex_funcs_hard5}
local end_loop_complex_funcs = {end_loop_complex_funcs_easy, end_loop_complex_funcs_medium, end_loop_complex_funcs_hard }

local complex_funcs2_easy = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-hellkeep") end,
		function() return AiSet("unit-lostsoul", 6) end,
		function() return AiSet("unit-generator-hell", 1) end,
		function() return AiNeed("unit-monster-spawner") end,
		function() return AiWait("unit-monster-spawner") end,
		function() return AiForce(1, {"unit-imp", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,

		function() return AiSet("unit-generator-hell", 2) end,
		function() return AiSet("unit-lostsoul", 12) end,
		function() return AiNeed("unit-blood-pool") end,
		function() return AiWait("unit-blood-pool") end,
		function() return AiSet("unit-generator-hell", 4) end,
		function() return AiSet("unit-fire-tower", 1) end,
		function() return AiSet("unit-lostsoul", 15) end,
		function() return AiNeed("unit-hellgate") end,
		function() return AiForce(0, {"unit-phantom", 2, "unit-devil",2, "unit-hellknight", 1}) end,
		function() return AiSet("unit-generator-hell", 6) end,
		function() return AiNeed("unit-temple-of-fire") end,
		function() return AiWait("unit-temple-of-fire") end,
		function() return AiSet("unit-lostsoul", 20) end,
		function() return AiSet("unit-generator-hell", 7) end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiUpgradeTo("unit-advanced-generator-hell") end,
		function() return AiResearch("upgrade-soul") end,
		function() return AiSet("unit-generator-hell", 8) end,
		function() return AiSet("unit-fire-tower", 3) end,
		function() return AiResearch("upgrade-temple-of-fire") end,	
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		
		function() return AiSet("unit-horror-tower", 1) end,

		function() return AiSet("unit-generator-hell", 9) end,
		
		function() return AiSet("unit-horror-tower", 2) end,

		function() return AiComplexAttackEndloop2() end,
}

local complex_funcs2_medium = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-hellkeep") end,
		function() return AiSet("unit-lostsoul", 10) end,
		function() return AiSet("unit-generator-hell", 1) end,
		function() return AiNeed("unit-monster-spawner") end,
		function() return AiWait("unit-monster-spawner") end,
		function() return AiForce(1, {"unit-imp", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,

		function() return AiSet("unit-generator-hell", 3) end,
		function() return AiSet("unit-lostsoul", 15) end,
		function() return AiNeed("unit-blood-pool") end,
		function() return AiWait("unit-blood-pool") end,
		function() return AiSet("unit-generator-hell", 5) end,
		function() return AiSet("unit-fire-tower", 2) end,
		function() return AiSet("unit-lostsoul", 20) end,
		function() return AiNeed("unit-hellgate") end,
		function() return AiForce(0, {"unit-phantom", 2, "unit-devil",2, "unit-hellknight", 1}) end,
		function() return AiSet("unit-generator-hell", 7) end,
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
		function() return AiSet("unit-hellkeep", 2) end,
		function() return AiWait("unit-hellkeep") end,
		function() return AiSet("unit-generator-hell", 10) end,
		function() return AiSet("unit-fire-tower", 4) end,
		function() return AiResearch("upgrade-temple-of-fire") end,	
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		
		function() return AiSet("unit-horror-tower", 1) end,

		function() return AiSet("unit-generator-hell", 12) end,
		function() return AiSet("unit-horror-tower", 2) end,
		function() return AiResearch("upgrade-monster-regeneration") end,
		function() return AiNeed("unit-death-pentagram") end,
		
		function() return AiSet("unit-horror-tower", 4) end,

		function() return AiComplexAttackEndloop2() end,
}

local complex_funcs2_hard = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiNeed("unit-hellkeep") end,
		function() return AiSet("unit-lostsoul", 10) end,
		function() return AiSet("unit-generator-hell", 1) end,
		function() return AiNeed("unit-monster-spawner") end,
		function() return AiWait("unit-monster-spawner") end,
		function() return AiForce(1, {"unit-imp", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,

		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiSet("unit-generator-hell", 3) end,
		function() return AiSet("unit-lostsoul", 15) end,
		function() return AiNeed("unit-blood-pool") end,
		function() return AiWait("unit-blood-pool") end,
		function() return AiSet("unit-generator-hell", 5) end,
		function() return AiSet("unit-fire-tower", 2) end,
		function() return AiSet("unit-lostsoul", 20) end,
		function() return AiNeed("unit-hellgate") end,
		function() return AiForce(0, {"unit-phantom", 2, "unit-devil",2, "unit-hellknight", 1}) end,
		function() return AiSet("unit-generator-hell", 7) end,
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
		function() return AiSet("unit-hellkeep", 2) end,
		function() return AiWait("unit-hellkeep") end,
		function() return AiSet("unit-generator-hell", 10) end,
		function() return AiSet("unit-fire-tower", 4) end,
		function() return AiResearch("upgrade-temple-of-fire") end,	
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		function() return AiUpgradeTo("unit-upgraded-fire-tower") end,
		
		function() return AiSet("unit-horror-tower", 1) end,

		function() return AiSet("unit-generator-hell", 12) end,
		function() return AiSet("unit-horror-tower", 2) end,
		function() return AiResearch("upgrade-monster-regeneration") end,
		function() return AiNeed("unit-death-pentagram") end,
		
		function() return AiSet("unit-horror-tower", 4) end,

		function() return AiComplexAttackEndloop2() end,
}

local complex_funcs2 = {complex_funcs2_easy, complex_funcs2_medium, complex_funcs2_hard }

local complex_funcs_easy = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-command-center") end,
		function() return AiSet("unit-robotworker", 6) end,
		function() return AiSet("unit-power-plant", 1) end,
		function() return AiNeed("unit-barracks") end,
		function() return AiWait("unit-barracks") end,
		function() return AiForce(1, {"unit-shotgunner", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSet("unit-robotworker", 12) end,
		function() return AiSet("unit-power-plant", 3) end,
		function() return AiNeed("unit-weapon-factory") end,
		function() return AiWait("unit-weapon-factory") end,
		function() return AiSet("unit-robotworker", 15) end,
		function() return AiForce(0, {"unit-chaingunner", 2, "unit-technician",1}) end,
		function() return AiSet("unit-chaingun-tower", 2) end,
		function() return AiSet("unit-power-plant", 5) end,
		function() return AiNeed("unit-radar") end,
		function() return AiNeed("unit-vehicle-factory") end,
		function() return AiSet("unit-power-plant", 7) end,
		function() return AiNeed("unit-tech-center") end,
		function() return AiWait("unit-tech-center") end,
		function() return AiSet("unit-robotworker", 20) end,
		function() return AiSet("unit-thermo-power-plant", 2) end,
		function() return AiForce(0, {"unit-crusher", 1, "unit-plasmagunner", 2, "unit-chaingunner", 2, "unit-technician",1}) end,
		function() return AiSet("unit-missile-tower", 1) end,
		function() return AiUpgradeTo("unit-advanced-command-center") end,
		function() return AiSet("unit-missile-tower", 3) end,

		function() return AiComplexAttackEndloop() end,
}

local complex_funcs_medium = {
		function() return AiSleep(AiGetSleepCycles()) end,
		function() return AiNeed("unit-command-center") end,
		function() return AiSet("unit-robotworker", 10) end,
		function() return AiSet("unit-power-plant", 2) end,
		function() return AiNeed("unit-barracks") end,
		function() return AiWait("unit-barracks") end,
		function() return AiForce(0, {"unit-technician",1}) end,
		function() return AiForce(1, {"unit-shotgunner", 1}, true) end,
		function() return AiWaitForce(1) end,
		function() return AiAttackWithForce(1) end,
		function() return AiSet("unit-robotworker", 15) end,
		function() return AiSet("unit-power-plant", 4) end,
		function() return AiNeed("unit-weapon-factory") end,
		function() return AiWait("unit-weapon-factory") end,
		function() return AiSet("unit-robotworker", 20) end,
		function() return AiForce(0, {"unit-chaingunner", 2, "unit-technician",1}) end,
		function() return AiSet("unit-chaingun-tower", 3) end,
		function() return AiSet("unit-power-plant", 6) end,
		function() return AiNeed("unit-radar") end,
		function() return AiNeed("unit-vehicle-factory") end,
		function() return AiSet("unit-power-plant", 10) end,
		function() return AiNeed("unit-tech-center") end,
		function() return AiWait("unit-tech-center") end,
		function() return AiSet("unit-robotworker", 25) end,
		function() return AiSet("unit-thermo-power-plant", 5) end,
		function() return AiSet("unit-command-center", 2) end,
		function() return AiForce(0, {"unit-crusher", 1, "unit-plasmagunner", 2, "unit-chaingunner", 2, "unit-technician",1}) end,
		function() return AiWait("unit-command-center") end,
		function() return AiSet("unit-missile-tower", 4) end,
		function() return AiUpgradeTo("unit-advanced-command-center") end,
		function() return AiResearch("upgrade-radar-research") end,
		function() return AiNeed("unit-orbital-control") end,
		function() return AiResearch("upgrade-flesh-weakness") end,
		function() return AiResearch("upgrade-heavy-flesh-weakness") end,
		function() return AiResearch("upgrade-levitation-anomaly") end,
		function() return AiResearch("upgrade-torture-anomaly") end,
		function() return AiResearch("upgrade-inferno-anomaly") end,
		function() return AiResearch("upgrade-demon-strength-anomaly") end,
		function() return AiSet("unit-missile-tower", 6) end,

		function() return AiComplexAttackEndloop() end,
}

local complex_funcs_hard = {
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
		function() return AiSet("unit-chaingun-tower", 3) end,
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
		function() return AiForce(0, {"unit-crusher", 1, "unit-plasmagunner", 2, "unit-chaingunner", 2, "unit-technician",1}) end,
		function() return AiWait("unit-command-center") end,
		function() return AiSet("unit-missile-tower", 4) end,
		function() return AiUpgradeTo("unit-advanced-command-center") end,
		function() SetPlayerData(AiPlayer(), "Resources", "minerals", GetPlayerData(AiPlayer(), "Resources", "minerals") + 10000)
				   SetPlayerData(AiPlayer(), "Resources", "energy", GetPlayerData(AiPlayer(), "Resources", "energy") + 2500)
				   return false end,
		function() return AiNeed("unit-orbital-control") end,
		function() return AiResearch("upgrade-radar-research") end,
		function() return AiResearch("upgrade-flesh-weakness") end,
		function() return AiResearch("upgrade-heavy-flesh-weakness") end,
		function() return AiResearch("upgrade-levitation-anomaly") end,
		function() return AiResearch("upgrade-torture-anomaly") end,
		function() return AiResearch("upgrade-inferno-anomaly") end,
		function() return AiResearch("upgrade-demon-strength-anomaly") end,
		function() return AiSet("unit-missile-tower", 6) end,

		function() return AiComplexAttackEndloop() end,
}

local complex_funcs = {complex_funcs_easy, complex_funcs_medium, complex_funcs_hard}

function AiComplexAttackEndloop2()
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
	local c = SyncRand(table.getn(end_loop_complex_funcs2[difficulty])) + 1
	DebugOut(tostring(c).. "\n")
	DebugOut(tostring(table.getn(end_loop_complex_funcs2[difficulty][c])))
	ret = end_loop_complex_funcs2[difficulty][ai_complex_attack_end_loop_tactic[complexplayer]][ai_complex_attack_end_loop_func[complexplayer]](c)
	if (ret) then
	  break
	end
	ai_complex_attack_end_loop_func[complexplayer] = ai_complex_attack_end_loop_func[complexplayer] + 1
  end
  return true
end

function AiComplexAttackEndloop()
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
	local c = SyncRand(table.getn(end_loop_complex_funcs[difficulty])) + 1
	DebugOut(tostring(c).. "\n")
	DebugOut(tostring(table.getn(end_loop_complex_funcs[difficulty][c])))
	ret = end_loop_complex_funcs[difficulty][ai_complex_attack_end_loop_tactic[complexplayer]][ai_complex_attack_end_loop_func[complexplayer]](c)
	if (ret) then
	  break
	end
	ai_complex_attack_end_loop_func[complexplayer] = ai_complex_attack_end_loop_func[complexplayer] + 1
  end
  return true
end

function AiComplexAttack2()
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
  
  complexplayer = AiPlayer() + 1
  
  if (not ai_complex_init) then
	for i = 1, table.getn(ai_complex_attack_end_loop_tactic) do
		local c = SyncRand(table.getn(end_loop_complex_funcs[difficulty])) + 1
		DebugOut(tostring(c).. "\n")
		DebugOut(tostring(table.getn(end_loop_complex_funcs[difficulty][c])))
		ai_complex_attack_end_loop_tactic[i] = c
	  end
	  ai_complex_init = true
  end
  
  while (true) do
	ret = complex_funcs2[difficulty][ai_complex_attack_func[complexplayer]]()
	if (ret) then
		break
	end
	ai_complex_attack_func[complexplayer] = ai_complex_attack_func[complexplayer] + 1
  end
end

function AiComplexAttack()
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
  
  if (not ai_complex_init) then
	for i = 1, table.getn(ai_complex_attack_end_loop_tactic) do
		local c = SyncRand(table.getn(end_loop_complex_funcs[difficulty])) + 1
		DebugOut(tostring(c).. "\n")
		DebugOut(tostring(table.getn(end_loop_complex_funcs[difficulty][c])))
		ai_complex_attack_end_loop_tactic[i] = c
	  end
	  ai_complex_init = true
  end
  
  complexplayer = AiPlayer() + 1
  
  while (true) do
	ret = complex_funcs[difficulty][ai_complex_attack_func[complexplayer]]()
	if (ret) then
		break
	end
	ai_complex_attack_func[complexplayer] = ai_complex_attack_func[complexplayer] + 1
  end
end

DefineAi("complex-attack", "uac", "complex-attack", AiComplexAttack)
DefineAi("complex-attack", "hell", "complex-attack", AiComplexAttack2)