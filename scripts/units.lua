-- Load the animations for the units.
Load("scripts/anim.lua")

const = {
	UnitArmor_Light = 1,
	UnitArmor_Medium = 2,
	UnitArmor_Heavy = 3,
	UnitArmor_Flesh = 4,
	UnitArmor_HeavyFlesh = 5,
	UnitArmor_AirFlesh = 6,
	UnitArmor_Mechanical = 7,
	UnitArmor_AirMechanical = 8,
	UnitArmor_Building = 9,
	UnitArmor_HeavyBuilding = 10,
	Unit_HP = 1,
	Unit_SP = 2,
	Unit_MinCost = 3,
	Unit_EngCost = 4,
	Unit_Build = 5,
	Unit_Points = 6,
	Unit_BaseDmg = 7,
	Unit_DamageType = 8,
	Unit_BaseDmg2 = 9,
	Unit_DamageType2 = 10,
	Unit_Draw = 11,
	Unit_Sight = 12,
	Unit_Person = 13,
	Unit_Comp = 14,
	Unit_AtkRange = 15,
	Unit_Mana = 16,
	Unit_Artifact = 17,
	Unit_Supply = 18,
	Unit_ALL = 18,
}

const = ProtectTable(const)

local damage_calc_table = {
--                      LP   MP   HP   LF   HF   AF    M   AM    B   HB
	"generic",         100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
	"bullet",           90,  60,  20, 100,  40,  15,  20,   5,  10,   5, -- Standard bullets
	"AA-bullet",        90,  60,  20, 100,  40,  75,  20,  75,  10,   5, 
	"shell",           100, 100,  50, 100, 100,  33,  30,  10,  15,   5,
	"explosion",        25,  25,  20,  35, 100,  33,  90,  33,  75,  60,
	"anti-air-missile", 25,  25,  20,  35, 100, 120,  90, 130,  75,  60,
	"high-explosion",   90,  80,  50, 100, 100, 100,  90, 100,  75,  60,
	"homing-missile",   35,  35,  20,  35, 100, 115,  90, 145,  75,  60,
	"plasma",           90,  85,  50, 100,  90,  30,  80,  25,  75,  50,
	"anti-flesh",      100, 100,  60, 100, 100,  33,  25,  10,  20,  25,
	"laser",            95,  90,  50, 100,  90,  30,  70,  28,  30,  20,
	"air-laser",        95,  90,  50, 100,  90,  85,  70,  90,  30,  20,
	"fire",            100,  80,  30, 100,  65,  25,  40,  15,  75,  30,
	"demonic",          25,  25,  20,  35, 100,  33,  90,  33,  75,  60,
	"air-demonic",      50,  35,  20,  30, 100, 100,  90, 100,  75,  60,
	"building-fire",    25,  25,  10,  20,  15,   5,  15,   5,  75,  60,
	"melee",           100, 100,  40, 100,  75,  40,  25,  30,  20,  15,
	"mental",          100, 100,  66,  50,  50,  50,   0,   0,   0,   0
}

local unit_info_table = {
--  UAC
--  Name                            HP   SP   MinCost EngCost Build Points BaseDmg           DamageType BaseDmg2          DamageType2 Draw Sight Person Comp AtkRange  Mana   Artifact  Supply
	"unit-robotworker",          {  40,   0,      500,      0,   30,    18,      4,            "plasma",       0,           "generic",  40,    4,     4,   6,       1,    0,         0,     1},
	"unit-shotgunner",           {  80,  30,      550,      0,   45,    30,     12,             "shell",       0,           "generic",  40,    5,     5,   7,       4,    0,         0,     1},
	"unit-technician",           {  60,  20,      600,     80,   50,    35,     18,         "explosion",       0,           "generic",  40,    6,     6,   8,       4,    0,         0,     1},
	"unit-ssg",                  { 100,  70,      750,    200,   40,    70,     36,             "shell",       0,           "generic",  40,    5,     5,   7,       3,    0,         0,     1},
	"unit-chaingunner",          { 100,  45,      870,    130,   65,    55,      8,         "AA-bullet",       0,           "generic",  40,    5,     5,   7,       5,    0,         0,     1},
	"unit-sawer",                { 100,  60,      850,    160,   60,    50,     24,             "melee",       0,           "generic",  40,    4,     6,   6,       1,    0,         0,     1},
	"unit-rocketmarine",         {  70,  20,     1250,    240,   65,    65,     50,  "anti-air-missile",      50,    "high-explosion",  40,    7,     7,   9,       8,    0,         0,     1},
	"unit-plasmamarine",         { 100,  70,     1300,    260,   90,    75,      8,            "plasma",       0,           "generic",  40,    5,     5,   7,       4,    0,         0,     1},
	"unit-bfgmarine",            { 120,  70,     2600,    650,  150,   150,    260,        "anti-flesh",       0,           "generic",  40,    6,     6,   8,       7,    0,         0,     2},
	"unit-hero",                 { 200, 200,     3400,    800,  300,   250,    100,             "shell",      70,  "anti-air-missile",  40,    8,     8,  10,       6,   80,         0,     2},
	"unit-medic",                {  60,  20,     1000,    200,   60,    45,      8,            "bullet",       0,           "generic",  40,    7,     7,   9,       4,   60,         0,     1},
	"unit-raider",               { 200,   0,     1150,    200,   85,    65,     18,             "laser",       0,           "generic",  40,    7,     7,   9,       6,    0,         0,     2},
	"unit-crusher",              { 340,   0,     1750,    300,  110,    90,     24,         "explosion",       0,           "generic",  40,    6,     6,   8,       6,    0,         0,     2},
	"unit-crusher-upgraded",     { 340,   0,      850,    200,   80,   110,     24,         "explosion",      20,  "anti-air-missile",  40,    6,     6,   8,       6,    0,         0,     3},
	"unit-thor",                 { 500,   0,     3000,    700,  180,   150,     60,            "plasma",       0,           "generic",  40,    6,     6,   8,       6,    0,         0,     4},
	"unit-uac-fighter",          { 180,   0,     1350,    280,  100,    80,     17,         "air-laser",      70,     "building-fire",  45,    8,     8,  10,       4,    0,         0,     2},
	"unit-uac-transport",        { 350,   0,     1800,    450,  115,    60,      0,           "generic",       0,           "generic",  45,    8,     8,  10,       0,    0,         0,     3},
	nil, {nil},
--  Hell
--  Name                            HP   SP   MinCost EngCost Build Points BaseDmg           DamageType BaseDmg2          DamageType2 Draw Sight Person Comp AtkRange  Mana	   Artifact  Supply
	"unit-lostsoul",             {  40,   0,      500,      0,   30,    18,      4,            "mental",       0,           "generic",  40,    4,     4,   6,       1,    0,         0,     1},
	"unit-advanced-lostsoul",    {  50,   0,      500,      0,   30,    20,     10,            "mental",       0,           "generic",  45,    5,     5,   7,       1,    0,         0,     1},
	"unit-zombieman",            {  35,   0,        0,      0,    0,    15,      8,            "bullet",       0,           "generic",  40,    4,     4,   6,       4,    0,        10,     0},
	"unit-sergeant",             {  60,   0,        0,      0,    0,    25,     12,             "shell",       0,           "generic",  40,    5,     5,   7,       5,    0,        14,     0},
	"unit-zombie-ssg",           {  80,   0,        0,      0,    0,    55,     32,             "shell",       0,           "generic",  40,    5,     5,   7,       4,    0,        22,     0},
	"unit-zombie-technician",    {  50,   0,        0,      0,    0,    40,    250,    "high-explosion",       0,           "generic",  40,    4,     4,   6,       1,    0,         0,     0},
	"unit-heavy-dude",           {  80,   0,        0,      0,    0,    45,      8,         "AA-bullet",       0,           "generic",  40,    5,     5,   7,       5,    0,        16,     0},
	"unit-zombie-saw",           {  80,   0,        0,      0,    0,    35,     22,             "melee",       0,           "generic",  40,    4,     6,   6,       1,    0,        16,     0},
	"unit-zombie-rocket",        {  55,   0,        0,      0,    0,    50,     50,  "anti-air-missile",      50,    "high-explosion",  40,    6,     6,   8,       8,    0,        20,     0},
	"unit-zombie-plasma",        {  80,   0,        0,      0,    0,    60,      8,            "plasma",       0,           "generic",  40,    5,     5,   7,       4,    0,        24,     0},
	"unit-zombie-bfg",           { 110,   0,        0,      0,    0,   100,    240,        "anti-flesh",       0,           "generic",  40,    5,     5,   7,       6,    0,        30,     0},
	"unit-phantom",              {  50,   0,      350,     35,   40,    25,      5,            "mental",       0,           "generic",  40,    6,     6,   8,       3,    0,         0,     1},
	"unit-new-phantom",          {  50,   0,      350,     35,   40,    25,      5,            "mental",       0,           "generic",  45,    6,     6,   8,       3,    0,         0,     1},
	"unit-imp",                  {  85,   0,      550,      0,   45,    35,     14,              "fire",      16,             "melee",  40,    5,     5,   7,       5,    0,        14,     1},
	"unit-devil",                {  85,   0,      250,     75,   45,    40,     14,       "air-demonic",      16,             "melee",  40,    5,     5,   7,       5,    0,        16,     1},
	"unit-demon",                { 150,   0,      800,    110,   60,    55,     30,             "melee",       0,           "generic",  40,    4,     4,   6,       1,    0,        25,     1},
	"unit-spectre",              { 130,   0,      750,    150,   60,    55,     25,             "melee",       0,           "generic",  40,    5,     5,   7,       1,    0,        40,     1},
	"unit-blood-demon",          { 250,   0,      650,    120,   60,    70,     45,             "melee",       0,           "generic",  40,    4,     4,   6,       1,    0,        32,     1},
	"unit-hellknight",           { 400,   0,     1300,    250,   85,    75,     16,           "demonic",      20,             "melee",  40,    6,     6,   8,       6,    0,        38,     2},
	"unit-baron",                { 800,   0,     1100,    300,   60,   110,     22,           "demonic",      25,             "melee",  40,    7,     7,   9,       7,    0,        60,     3},
	"unit-arachnotron",          { 380,   0,     1800,    370,  115,    85,      8,            "plasma",       0,           "generic",  40,    7,     7,   9,       5,    0,        48,     2},
	"unit-revenant",             { 200,   0,     1300,    300,  100,    85,     18,    "homing-missile",      20,             "melee",  40,    7,     7,   9,       8,    0,        35,     2},
	"unit-mancubus",             { 500,   0,     2700,    650,  160,   110,     25,              "fire",       0,           "generic",  40,    7,     7,   9,       6,    0,        50,     4},
	"unit-archvile",             { 600,   0,     2500,    750,  180,   140,     85,              "fire",       0,           "generic",  40,    9,     9,  11,       8,  200,        60,     4},
	"unit-belial",               {1000,   0,     4500,   1000,  400,   300,     35,       "air-demonic",      30,             "melee",  40,    8,     8,  10,       8,  250,       120,     4},
	"unit-cyberdemon",           {4000,   0,        0,      0,   10,   400,     95,    "high-explosion",       0,           "generic",  40,    9,     9,  11,       8,    0,       150,     1},
	"unit-spiderdemon",          {1500,   0,        0,      0,   10,   300,      8,         "AA-bullet",       0,           "generic",  40,    9,     9,  11,       8,    0,       150,     1},
	"unit-cacodemon",            { 250,   0,     1400,    250,   95,    80,     18,       "air-demonic",       0,           "generic",  45,    8,     8,  10,       5,    0,        40,     2},
	"unit-painelemental",        { 330,   0,     2000,    370,  110,    90,     24,            "mental",       0,           "generic",  45,    8,     8,  10,       6,   80,         0,     2},
	"unit-cacolich",             { 300,   0,     1250,    350,   60,   100,     28,       "air-demonic",      15,     "building-fire",  45,    8,     8,  10,       5,    0,        55,     3},
}

local function CalculateBalance()
	local sumtable = {}
	local items = {}
	for i = 1,const.Unit_ALL do
		sumtable[i] = 0
		items[i] = 0
	end
	
	for i = 0,table.getn(unit_info_table)/2 do
		if (unit_info_table[i*2 + 1] ~= nil) then
			for j = 1,const.Unit_ALL do
				local temp = tonumber(unit_info_table[i*2 + 2][j])
				if (temp ~= nil and temp ~= 0) then
					sumtable[j] = sumtable[j] + temp
					items[j] = items[j] + 1
				end
			end
		else
			DebugOut("\nSummary:\n")
			for j = 1,const.Unit_ALL do
				if (items[j] > 0) then
					DebugOut("\n " .. tostring(j) .. ": Sum " .. sumtable[j] .. ", Avg " .. sumtable[j]/items[j] .. "\n")
					sumtable[j] = 0
					items[j] = 0
				end
			end
			
		end
	end
end
CalculateBalance()

local damage_types = {
	"generic", "bullet", "AA-bullet", "shell", "explosion", "anti-air-missile", 
	"high-explosion", "homing-missile", "plasma", "anti-flesh", "laser", "air-laser",
	"fire", "demonic", "air-demonic", "building-fire", "melee", "mental"}

local function get_table_string_index(table_elem, str)
	local i
	for i = 1,table.getn(table_elem) do
		if table_elem[i] == str then
			return i
		end
	end
	DebugPrint("Error in " .. tostring(table_elem) .. " " .. str)
	Exit(0)
end

function MarineInvulnSphereHit(slot, attacker, damage)
	local bitset = bit.tobits(GetUnitVariable(slot, "UsedSpheres", "Value"))
	if (bitset[5] == 1) then
		SetUnitVariable(slot, "UsedSpheres", GetUnitVariable(slot, "UsedSpheres", "Value") - marineSpheres.S_AbsoluteDefence, "Value")
		SetUnitVariable(slot, "UnholyArmor", 300, "Max")
		SetUnitVariable(slot, "UnholyArmor", 300, "Value")
		SetUnitVariable(slot, "UnholyArmor", 1, "Enable")
	end
	if (bitset[6] == 1) then
		if (attacker ~= -1 and GetUnitBoolFlag(attacker, "Building") == false) then
			local dealDamage = math.max(0, 600 - GetUnitVariable(attacker, "Poison", "Value"))
			if (GetUnitVariable(slot, "AcidSphereMaxDamage", "Value") - dealDamage > 0) then
				SetUnitVariable(attacker, "Poison", 600, "Value")
				SetUnitVariable(slot, "AcidSphereMaxDamage", GetUnitVariable(slot, "AcidSphereMaxDamage", "Value") - dealDamage, "Value")
			else
				SetUnitVariable(attacker, "Poison", math.min(600, GetUnitVariable(attacker, "Poison", "Value") + GetUnitVariable(slot, "AcidSphereMaxDamage", "Value")), "Value")
				SetUnitVariable(slot, "UsedSpheres", GetUnitVariable(slot, "UsedSpheres", "Value") - marineSpheres.S_Acid, "Value")
				SetUnitVariable(slot, "AcidSphereMaxDamage", 0, "Value")
			end
		end
	end
end

function MarineCorruptionSphere(slot)
	local bitset = bit.tobits(GetUnitVariable(slot, "UsedSpheres", "Value"))
	if (bitset[1] == 1) then
		SetUnitVariable(slot, "ShieldPoints", 120, "Max")
		SetUnitVariable(slot, "ShieldPermeability", 0, "Value")
	end
	if (bitset[7] == 1) then
		local units = GetUnitsAroundUnit(slot, 1)
		for i = 1,table.getn(units) do
			local unit = units[i]
			if (unit ~= nil and slot ~= unit and GetUnitBoolFlag(unit, "Building") == false and GetUnitBoolFlag(unit, "Hell") == true) then
				if (GetUnitVariable(slot, "CorruptionSphereMaxDamage", "Value") > 15) then
					DamageUnit(slot, unit, 15)
					SetUnitVariable(slot, "CorruptionSphereMaxDamage", GetUnitVariable(slot, "CorruptionSphereMaxDamage", "Value") - 15, "Value")
				else
					DamageUnit(slot, unit, 15)
					SetUnitVariable(slot, "UsedSpheres", GetUnitVariable(slot, "UsedSpheres", "Value") - marineSpheres.S_Corruption, "Value")
					SetUnitVariable(slot, "CorruptionSphereMaxDamage", 0, "Value")
				end
			end
		end
	end
end

---- Damage calculating helper funcs
function GetArmorDamage(damage, damagetype, damagenum)
	return math.ceil(damage * damage_calc_table[get_table_string_index(damage_calc_table, damagetype) + damagenum] / 100)
end

function UnitInfo(unit, info)
	if (info < 1 or info > const.Unit_ALL) then
		DebugPrint("Error in " .. tostring(info) .. " " .. unit)
		Exit(0)
	end
	local tbl = unit_info_table[get_table_string_index(unit_info_table, unit) + 1]
	return tbl[info]
end

function GetCursedDamage(damage)
	return math.ceil(damage * 2)
end

function GetDamageTypeNum(damage)
	return get_table_string_index(damage_types, damage) - 1
end

function ResetSmoke(slot)
	SetUnitVariable(slot,"SmokeTime",30)
end

function ShieldEnableControl(shield)
	if shield ~= 0 then
		return true
	else
		return false
	end
end

function SmokeControl(slot, missiles, startpos, endpos)
	if ((table.getn(startpos) ~= table.getn(endpos)) and (table.getn(endpos) ~= (table.getn(missiles)))) then
		Exit(0)
	end
	local num = table.getn(missiles)
	for i = 1, num do
		CreateMissile(missiles[i], startpos[i], endpos[i], slot, slot, false)
	end
end

function SmokeControlRaider(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 40) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		local smoke = GetUnitVariable(slot,"SmokeBreak") + 1
		SetUnitVariable(slot,"SmokeBreak", smoke)
		if smoke == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			SmokeControl(slot, {"missile-vehicle-smoke"}, {{25, 10}}, {{25, 10}})
		end
	end
end

function SmokeControlCrusher(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 40) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			SmokeControl(slot, {"missile-vehicle-smoke"}, {{20, 13}}, {{20, 13}})
		end
	end
end

function SmokeControlThor(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 40) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			SmokeControl(slot, {"missile-vehicle-smoke"}, {{20, 4}}, {{20, 4}})
		end
	end
end

function SmokeControlFighter(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 40) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			SmokeControl(slot, {"missile-vehicle-smoke"}, {{24, -2}}, {{24, -2}})
		end
	end
end

function SmokeControlTransport(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 40) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			SmokeControl(slot, {"missile-vehicle-smoke"}, {{24, 20}}, {{24, 20}})
		end
	end
end

function SmokeControlCommandCenter(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 67, y)
			ParticleBuildingSmoke(x + 80, y + 36)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 67, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlAdvancedCommandCenter(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 70, y - 7)
			ParticleBuildingSmoke(x + 63, y + 23)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 63, y + 23, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlPowerPlant(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			SetUnitVariable(slot,"SmokeBreak", 0)
			ParticleBuildingSmoke(x + 90, y)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 90, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlThermoPowerPlant(slot)
	SetUnitVariable(slot,"SmokeBreak2", GetUnitVariable(slot,"SmokeBreak2") + 1)
	if GetUnitVariable(slot,"SmokeBreak2") == 8 then
		SetUnitVariable(slot,"SmokeBreak2", 0)
		local x = GetUnitVariable(slot, "PosX") * 32
		local y = GetUnitVariable(slot, "PosY") * 32
		if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) then
			ParticlePillarSmoke(x + 38, y - 55)
		else
			if math.random(100) >= 5 then
				ParticlePillarSmoke(x + 12, y - 54)
			end
			if math.random(100) >= 5 then
				ParticlePillarSmoke(x + 38, y - 55)
			end
		end
	end
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			SetUnitVariable(slot,"SmokeBreak", 0)
			ParticleBuildingSmoke(x + 30, y + 12)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 30, y + 12, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlSupplyDepot(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			SetUnitVariable(slot,"SmokeBreak", 0)
			ParticleBuildingSmoke(x + 64, y - 14)
			ParticleBuildingSmoke(x + 40, y + 20)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 64, y - 14, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlUACBarracks(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			SetUnitVariable(slot,"SmokeBreak", 0)
			ParticleBuildingSmoke(x + 37, y + 52)
			ParticleBuildingSmoke(x + 56, y + 25)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 37, y + 52, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlWeaponFactory(slot)
	if (GetUnitVariable(slot,"Research") > 0) then
		SetUnitVariable(slot,"SmokeBreak2", GetUnitVariable(slot,"SmokeBreak2") + 1)
		
		if GetUnitVariable(slot,"SmokeBreak2") == 8 then
			SetUnitVariable(slot,"SmokeBreak2", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticlePillarSmoke(x + 44, y - 22)
		end
	end
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			SetUnitVariable(slot,"SmokeBreak", 0)
			ParticleBuildingSmoke(x + 56, y + 35)
			ParticleBuildingSmoke(x + 70, y + 10)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 56, y + 35, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlUACVehicleFactory(slot)
	if (GetUnitVariable(slot,"Training") > 0) then
		SetUnitVariable(slot,"SmokeBreak2", GetUnitVariable(slot,"SmokeBreak2") + 1)
		if GetUnitVariable(slot,"SmokeBreak2") == 8 then
			SetUnitVariable(slot,"SmokeBreak2", 0)
			if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) then
			else
				local x = GetUnitVariable(slot, "PosX") * 32
				local y = GetUnitVariable(slot, "PosY") * 32
				ParticlePillarSmoke(x + 12, y - 24)
			end
		end
	end
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			SetUnitVariable(slot,"SmokeBreak", 0)
			ParticleBuildingSmoke(x + 24, y + 35)
			ParticleBuildingSmoke(x + 96, y + 29)
			ParticleBuildingSmoke(x + 64, y + 25)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 24, y + 35, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlRadar(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 53, y + 27)
			ParticleBuildingSmoke(x + 78, y + 30)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 53, y + 27, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlTechCenter(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 85, y + 81)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 85, y + 81, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlOrbitalControl(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 54, y + 22)
			ParticleBuildingSmoke(x + 63, y + 50)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 63, y + 50, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlUACTower(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 16, y + 16)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlHellKeep(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 64, y)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 64, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlGeneratorHell(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 24, y + 20)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 24, y + 20, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlAdvancedGeneratorHell(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 12 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 24, y + 20)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 24, y + 20, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlBloodPool(slot)
	if (GetUnitVariable(slot,"Research") > 0) then
		SetUnitVariable(slot,"SmokeBreak2", GetUnitVariable(slot,"SmokeBreak2") + 1)
		if GetUnitVariable(slot,"SmokeBreak2") == 8 then
			local x_set = {32, 43, 56, 68, 95}
			local y_set = { 0, 14, 14, 30, 28}
			SetUnitVariable(slot,"SmokeBreak2", 0)
			local num = math.random(table.getn(x_set))
			local x = GetUnitVariable(slot, "PosX") * 32 + x_set[num]
			local y = GetUnitVariable(slot, "PosY") * 32 + y_set[num]
			addChunkParticles(3 + math.random(5), nullgraphics, particle_welleffect, 1000, 66, x, y, 150, 250, 88, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
		end
	end
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 12 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 32, y - 17)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 32, y - 17, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlHellGate(slot)
	if (GetUnitVariable(slot,"Training") > 0) then
		SetUnitVariable(slot,"Op1", 1)
		SetUnitVariable(slot,"SmokeBreak2", GetUnitVariable(slot,"SmokeBreak2") + 1)
		if GetUnitVariable(slot,"SmokeBreak2") == 8 then
			SetUnitVariable(slot,"SmokeBreak2", 0)
			if (math.random(100) >= 66) then
				local x_set = {78, 82, 86, 90, 94}
				local y_set = {45, 42, 39, 35, 30}
				SetUnitVariable(slot,"SmokeBreak2", 0)
				local num = math.random(table.getn(x_set))
				local x = GetUnitVariable(slot, "PosX") * 32 + x_set[num]
				local y = GetUnitVariable(slot, "PosY") * 32 + y_set[num]
				addChunkParticles(1, particle_rocket_smoke_tiny, particle_lava_chunk, 33, 66, x, y, 0, 400, 66, 0, particle_lava_chunk_exp, 66, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
			end
		end
	else
		SetUnitVariable(slot,"Op1", 0)
	end
end

function SmokeControlTempleOfFire(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 12 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 89, y + 56)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 89, y + 56, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlFireTower(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 16, y + 16)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function SmokeControlHorrorTower(slot)
	if (GetUnitVariable(slot,"HitPoints","Value") * 100 / GetUnitVariable(slot,"HitPoints","Max") <= 50) 
	 and GetUnitVariable(slot,"SmokeTime") > 0 then
		SetUnitVariable(slot,"SmokeBreak", GetUnitVariable(slot,"SmokeBreak") + 1)
		if GetUnitVariable(slot,"SmokeBreak") == 8 then
			SetUnitVariable(slot,"SmokeBreak", 0)
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			ParticleBuildingSmoke(x + 32, y + 16)
			if math.random(100) >= 95 then
				addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 32, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
			end
		end
	end
end

function UpdateHandicap(slot)
	local bitset = bit.tobits(GetUnitVariable(slot, "UnitFlags", "Value"))
	local player = GetUnitVariable(slot,"Player")
	local handicap = (GetPlayerData(player, "UnitTypesCount", "unit-barracks") + GetPlayerData(player, "UnitTypesCount", "unit-monster-spawner")) * 25
		+ (GetPlayerData(player, "UnitTypesCount", "unit-weapon-factory") + GetPlayerData(player, "UnitTypesCount", "unit-blood-pool")) * 50
		+ GetPlayerData(player, "UnitTypesCount", "unit-radar") * 60
		+ (GetPlayerData(player, "UnitTypesCount", "unit-vehicle-factory") + GetPlayerData(player, "UnitTypesCount", "unit-hellgate")) * 75
		+ (GetPlayerData(player, "UnitTypesCount", "unit-tech-center") + GetPlayerData(player, "UnitTypesCount", "unit-temple-of-fire")) * 100
		+ (GetPlayerData(player, "UnitTypesCount", "unit-orbital-control") + GetPlayerData(player, "UnitTypesCount", "unit-death-pentagram")) * 200
		+ GetPlayerData(player, "UnitTypesCount", "unit-chaingun-tower") * 15
		+ GetPlayerData(player, "UnitTypesCount", "unit-missile-tower") * 30
		+ GetPlayerData(player, "UnitTypesCount", "unit-well") * 30
		+ GetPlayerData(player, "UnitTypesCount", "unit-fire-tower") * 15
		+ GetPlayerData(player, "UnitTypesCount", "unit-upgraded-fire-tower") * 25
		+ GetPlayerData(player, "UnitTypesCount", "unit-horror-tower") * 40
	local pcount = GetPlayerData(player, "UnitTypesCount", "unit-power-plant") * 10
		+ GetPlayerData(player, "UnitTypesCount", "unit-thermo-power-plant") * 25
		+ GetPlayerData(player, "UnitTypesCount", "unit-generator-hell") * 14
		+ GetPlayerData(player, "UnitTypesCount", "unit-advanced-generator-hell") * 18
	if (bitset[unitFlagsIndex.UFI_IsInfernoAnomaly] == 1) then
		pcount = pcount * 1.3
	end
	local demand = GetPlayerData(player, "Demand")
	local demandfactor = math.max(1, math.min(2000, demand*demand/22))
	handicap = math.floor((handicap + demandfactor) / pcount * 10)
	if handicap>100 then handicap = 100 end
	SetUnitVariable(slot,"TotalPowerHandicap",handicap)
end

function PowerPlantControlUACSmall(slot)
	UpdateHandicap(slot)
	local player = GetUnitVariable(slot,"Player")
	SetUnitVariable(slot,"ProductValue", GetUnitVariable(slot,"ProductValue") + 1)
	if GetUnitVariable(slot,"ProductValue") == GetUnitVariable(slot,"ProductMax") then
		SetUnitVariable(slot,"ProductValue", 0)
		local product
		if (GetUnitVariable(slot,"HitPoints","Value") * GetUnitVariable(slot,"HitPoints","Max") / 100 <= 50) then
			product = 25
		else
			product = 45
		end
		product = product * (100 - GetUnitVariable(slot,"TotalPowerHandicap")) / 100
		SetPlayerData(player, "StoredResources", "energy", 
			GetPlayerData(player, "StoredResources", "energy") + math.floor(product))
		SetPlayerData(player, "TotalResources", "energy", 
			GetPlayerData(player, "TotalResources", "energy") + math.floor(product))
	end
end

function PowerPlantControlUACBig(slot)
	UpdateHandicap(slot)
	local player = GetUnitVariable(slot,"Player")
	SetUnitVariable(slot,"ProductValue", GetUnitVariable(slot,"ProductValue") + 1)
	if GetUnitVariable(slot,"ProductValue") == GetUnitVariable(slot,"ProductMax") then
		SetUnitVariable(slot,"ProductValue", 0)
		local product
		if (GetUnitVariable(slot,"HitPoints","Value") * GetUnitVariable(slot,"HitPoints","Max") / 100 <= 50) then
			product = 65
		else
			product = 120
		end
		product = product * (100 - GetUnitVariable(slot,"TotalPowerHandicap")) / 100
		SetPlayerData(player, "StoredResources", "energy", 
			GetPlayerData(player, "StoredResources", "energy") + math.floor(product))
		SetPlayerData(player, "TotalResources", "energy", 
			GetPlayerData(player, "TotalResources", "energy") + math.floor(product))
	end
end

function PowerPlantControlHellSmall(slot)
	UpdateHandicap(slot)
	local player = GetUnitVariable(slot,"Player")
	SetUnitVariable(slot,"ProductValue", GetUnitVariable(slot,"ProductValue") + 1)
	if GetUnitVariable(slot,"ProductValue") == GetUnitVariable(slot,"ProductMax") then
		SetUnitVariable(slot,"ProductValue", 0)
		if (GetUnitVariable(slot,"HitPoints","Value") * GetUnitVariable(slot,"HitPoints","Max") / 100 > 50) then
			local x = GetUnitVariable(slot, "PosX") * 32
			local y = GetUnitVariable(slot, "PosY") * 32
			addStaticParticle(particle_generator_effect, 66, x + 86, y + 1, drawLevels.DL_PartGround)
		end
		local product
		if (GetUnitVariable(slot,"HitPoints","Value") * GetUnitVariable(slot,"HitPoints","Max") / 100 <= 50) then
			product = 30
		else
			product = 55
		end
		product = product * (100 - GetUnitVariable(slot,"TotalPowerHandicap")) / 100
		SetPlayerData(player, "StoredResources", "energy", 
			GetPlayerData(player, "StoredResources", "energy") + math.floor(product))
		SetPlayerData(player, "TotalResources", "energy", 
			GetPlayerData(player, "TotalResources", "energy") + math.floor(product))
	end
end

function PowerPlantControlHellBig(slot)
	UpdateHandicap(slot)
	local player = GetUnitVariable(slot,"Player")
	SetUnitVariable(slot,"ProductValue", GetUnitVariable(slot,"ProductValue") + 1)
	if GetUnitVariable(slot,"ProductValue") == GetUnitVariable(slot,"ProductMax") then
		SetUnitVariable(slot,"ProductValue", 0)
		local product
		if (GetUnitVariable(slot,"HitPoints","Value") * GetUnitVariable(slot,"HitPoints","Max") / 100 <= 50) then
			product = 45
		else
			product = 80
		end
		product = product * (100 - GetUnitVariable(slot,"TotalPowerHandicap")) / 100
		SetPlayerData(player, "StoredResources", "energy", 
			GetPlayerData(player, "StoredResources", "energy") + math.floor(product))
		SetPlayerData(player, "TotalResources", "energy", 
			GetPlayerData(player, "TotalResources", "energy") + math.floor(product))
	end
end

function AddEliteAbility(slot)
	local name = GetUnitVariable(slot, "Ident")
	if name == "unit-imp" then
		SetUnitVariable(slot, "AttackRange", GetUnitVariable(slot, "AttackRange") + 2)
	elseif name == "unit-chaingunner" then
		SetUnitVariable(slot, "Precision", 100)
	elseif name == "unit-hero" then
		SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 40, "Max")
	elseif name == "unit-heavydude" then
		SetUnitVariable(slot, "Precision", 100)
	elseif name == "unit-archvile" then
		SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 100, "Max")
	elseif name == "unit-painelemental" then
		SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 80, "Max")
	elseif name == "unit-cacolich" then
		SetUnitVariable(slot, "Mana", 80, "Max")
		SetUnitVariable(slot, "Mana", 80, "Value")
		SetUnitVariable(slot, "Mana", 1, "Enable")
		SetUnitVariable(slot, "Mana", 1, "Increase")
	end
end



function UpdateVeteranStatus(slot)
	MarineCorruptionSphere(slot)
	local player = GetUnitVariable(slot,"Player")
	if player ~= 15 and GetUnitVariable(slot,"HitPoints") > 0
		and GetUnitBoolFlag(slot,"Building") == false then
		if GetUnitVariable(slot,"Points") ~= 0 then		
			if GetUnitVariable(slot,"Xp") >= GetUnitVariable(slot,"Points") * 2 and GetUnitVariable(slot,"Veterancy") == 1 then
				SetUnitVariable(slot,"Veterancy",2)
				if GetUnitBoolFlag(slot, "UAC") == true then
					SetUnitVariable(slot,"VeterancyUAC",2)
					if (GetUnitVariable(slot, "Ident") == "unit-hero") then
						SetUnitVariable(slot, "DoomerInvisGive", GetUnitVariable(slot, "DoomerInvisGive", "Value") + 300, "Value")
						SetUnitVariable(slot, "DoomerDoomGive", GetUnitVariable(slot, "DoomerDoomGive", "Value") + 150, "Value")
						SetUnitVariable(slot, "DoomerInvulnGive", GetUnitVariable(slot, "DoomerInvulnGive", "Value") + 150, "Value")
						SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 40, "Max")
					end
					if player==GetThisPlayer() then
						PlaySound("uac unit promoted")
					end
				elseif GetUnitBoolFlag(slot, "Hell") == true then
					SetUnitVariable(slot,"VeterancyHell",2)
					if (GetUnitVariable(slot, "Ident") == "unit-belial") then
						SetUnitVariable(slot, "HitPoints", GetUnitVariable(slot, "HitPoints", "Max") + 100, "Max")
						SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 50, "Max")
					end
					if player==GetThisPlayer() then
						PlaySound("hell unit promoted")
					end
				else
					print("Unknown side of unit")
				end
			elseif GetUnitVariable(slot,"Xp")>=GetUnitVariable(slot,"Points")*4 and GetUnitVariable(slot,"Veterancy")==2 then
				SetUnitVariable(slot,"Veterancy",3)
				if GetUnitBoolFlag(slot, "UAC") == true then
					SetUnitVariable(slot,"VeterancyUAC",3)
					if (GetUnitVariable(slot, "Ident") == "unit-hero") then
						SetUnitVariable(slot, "DoomerInvisGive", GetUnitVariable(slot, "DoomerInvisGive", "Value") + 300, "Value")
						SetUnitVariable(slot, "DoomerDoomGive", GetUnitVariable(slot, "DoomerDoomGive", "Value") + 150, "Value")
						SetUnitVariable(slot, "DoomerInvulnGive", GetUnitVariable(slot, "DoomerInvulnGive", "Value") + 150, "Value")
						SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 40, "Max")
					end
					if player==GetThisPlayer() then
						PlaySound("uac unit promoted")
					end
				elseif GetUnitBoolFlag(slot, "Hell") == true then
					SetUnitVariable(slot,"VeterancyHell",3)
					if (GetUnitVariable(slot, "Ident") == "unit-belial") then
						SetUnitVariable(slot, "HitPoints", GetUnitVariable(slot, "HitPoints", "Max") + 100, "Max")
						SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 50, "Max")
					end
					if player==GetThisPlayer() then
						PlaySound("hell unit promoted")
					end
				else
					print("Unknown side of unit")
				end
			elseif GetUnitVariable(slot,"Xp")>=GetUnitVariable(slot,"Points") * 7 and GetUnitVariable(slot,"Veterancy")==3 then
				SetUnitVariable(slot,"RegenerationRate", GetUnitVariable(slot, "RegenerationRate") + 1)
				SetUnitVariable(slot,"Veterancy",4)
				AddEliteAbility(slot)
				if GetUnitBoolFlag(slot, "UAC") == true then
					SetUnitVariable(slot,"VeterancyUAC",4)
					if (GetUnitVariable(slot, "Ident") == "unit-hero") then
						SetUnitVariable(slot, "DoomerInvisGive", GetUnitVariable(slot, "DoomerInvisGive", "Value") + 300, "Value")
						SetUnitVariable(slot, "DoomerDoomGive", GetUnitVariable(slot, "DoomerDoomGive", "Value") + 150, "Value")
						SetUnitVariable(slot, "DoomerInvulnGive", GetUnitVariable(slot, "DoomerInvulnGive", "Value") + 150, "Value")
					end
					if player==GetThisPlayer() then
						PlaySound("uac unit promoted")
					end
				elseif GetUnitBoolFlag(slot, "Hell") == true then
					SetUnitVariable(slot,"VeterancyHell",4)
					if (GetUnitVariable(slot, "Ident") == "unit-belial") then
						SetUnitVariable(slot, "HitPoints", GetUnitVariable(slot, "HitPoints", "Max") + 100, "Max")
						SetUnitVariable(slot, "Mana", GetUnitVariable(slot, "Mana", "Max") + 50, "Max")
					end
					if player==GetThisPlayer() then
						PlaySound("hell unit promoted")
					end
				else
					print("Unknown side of unit")
				end
			end
		end
		if (GetUnitVariable(slot, "Ident") == "unit-hero") then
			if (GetUnitVariable(slot, "Bloodlust", "Value") > 0) then
				SetUnitVariable(slot, "BasicDamage", 2, "Max")
				SetUnitVariable(slot, "BasicDamage", 2, "Value")
			else
				SetUnitVariable(slot, "BasicDamage", 1, "Max")
				SetUnitVariable(slot, "BasicDamage", 1, "Value")
			end
		end
	end
end

function HandleDefibrillation(slot)
	local bitset = bit.tobits(GetUnitVariable(slot, "UnitFlags", "Value"))
	if bitset[unitFlagsIndex.UFI_StartDefibrillation] == 1 then
		local rand = SyncRand(101)
		local chance = math.min(100, math.max(0, math.sqrt(GetUnitVariable(slot, "Arg1") * 8) - 75))
		if (rand < chance) then
			SetUnitVariable(slot, "DoneDefibrillation", 1, "Value")
		else
			SetUnitVariable(slot, "DoneDefibrillation", 2, "Value")
		end
		bitset[unitFlagsIndex.UFI_StartDefibrillation] = 0
		SetUnitVariable(slot, "UnitFlags", bit.tonumb(bitset), "Value")
	end
end

function MineralSpriteUpdate(slot)
	local held = GetUnitVariable(slot, "ResourcesHeld")
	if held >= 1000 then
		SetUnitVariable(slot, "Op2", GetUnitVariable(slot, "Op1"))
	elseif held >= 800 then
		SetUnitVariable(slot, "Op2", GetUnitVariable(slot, "Op1") + 6)
	elseif held >= 600 then
		SetUnitVariable(slot, "Op2", GetUnitVariable(slot, "Op1") + 12)
	elseif held >= 400 then
		SetUnitVariable(slot, "Op2", GetUnitVariable(slot, "Op1") + 18)
	elseif held >= 200 then
		SetUnitVariable(slot, "Op2", GetUnitVariable(slot, "Op1") + 24)
	else
		SetUnitVariable(slot, "Op2", GetUnitVariable(slot, "Op1") + 30)
	end
end

DefineUnitType("unit-mineral-mine", { Name = _("Mineral mine"),
  Image = {"file","graphics/neutral/buildings/mineralmine.png" ,"size", {32, 59}},
  Shadow = {"file", "graphics/neutral/buildings/mineralmine-s.png", "size",{45, 59}, "offset",{5, 0}},
  Animations = "animations-mineral-mine", Icon = "icon-mineral-mine",
  NeutralMinimapColor = {0, 0, 255},
  HitPoints = 100,
  DrawLevel = 40,
  Offset = {0, -12},
  TileSize = {1, 1}, BoxSize = {32, 32},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Indestructible = 1,
  Building = true, VisibleUnderFog = true, IsNotSelectable = true,
  BuildingRules = { { "distance", { Distance = 3, DistanceType = ">", Type = "unit-command-center"}},
					{ "distance", { Distance = 3, DistanceType = ">", Type = "unit-hellkeep"}}
				  },
  Sounds = {} } )
	
DefineUnitType("unit-mineral-piece", { Name = _("Minerals patch"),
  Image = {"file","graphics/neutral/buildings/mineral-piece.png" ,"size", {32, 32}},
  Animations = "animations-mineral-piece", Icon = "icon-mineral-piece",
  NeutralMinimapColor = {0, 255, 255},
  HitPoints = 200,
  DrawLevel = 10,
  TileSize = {1, 1}, BoxSize = {32, 32},
  SightRange = 1,
  StartingResources = 1200,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  IsHeavyBuildingArmor = 1,
  OnEachSecond = MineralSpriteUpdate,
  NonSolid = true, Minerals = true,
  GivesResource = "minerals",  CanHarvest = true,
  Building = true, VisibleUnderFog = true, IsNotSelectable = true,
  Sounds = {} } )
  
DefineUnitType("unit-burning", { Name = "",
  Image = {"file","graphics/neutral/units/burn.png" ,"size", {48, 48}},
  Animations = "animations-burning", Icon = "icon-cancel", 
  HitPoints = 150,
  DrawLevel = 40,
  NumDirections = 1,
  TileSize = {1, 1}, BoxSize = {48, 48},
  SightRange = 0,
  BasicDamage = 100, PiercingDamage = 100, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  IsHeavyFleshArmor = 1,
  NonSolid = true,
  VisibleUnderFog = false, 
  IsNotSelectable = true, 
  Sounds = {} } )

BaseDamage = 100
DamageType = "fire"
DefineUnitType("unit-barrel", { Name = _("Explosive Barrel"),
  Image = {"file","graphics/neutral/units/barrel.png" ,"size", {40, 40}},
  Animations = "animations-barrel", Icon = "icon-cancel",
  NeutralMinimapColor = {70, 70, 70},
  HitPoints = 10,
  DrawLevel = 40,
  Offset = {0, -6},
  TileSize = {1, 1}, BoxSize = {20, 30},
  SightRange = 1,
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  -- Damage and armor part
  IsMechanicalArmor = 1,
  BaseDamage = BaseDamage,
  DamageType = "extreme",

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
  Priority = 0,
  Type = "land",
  NumDirections = 1,
  LandUnit = true,
  Coward = true,
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = false,
  VisibleUnderFog = true, IsNotSelectable = true, 
  Sounds = {} } )

BaseDamage = 300
DamageType = "fire"
DefineUnitType("unit-barrels", { Name = _("Explosive Barrels"),
  Image = {"file","graphics/neutral/units/barrels.png" ,"size", {60, 60}},
  Animations = "animations-barrels", Icon = "icon-cancel",
  NeutralMinimapColor = {70, 70, 70},
  HitPoints = 20,
  DrawLevel = 40,
  Offset = {0, -12},
  TileSize = {1, 1}, BoxSize = {26, 40},
  SightRange = 1,
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-none",
  -- Damage and armor part
  IsMechanicalArmor = 1,
  BaseDamage = BaseDamage,
  DamageType = "extreme",

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
  Priority = 0,
  Type = "land",
  NumDirections = 1,
  LandUnit = true,
  Coward = true,
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = false,
  VisibleUnderFog = true, IsNotSelectable = true, 
  Sounds = {} } )

DefineUnitType("unit-building1", { Name = "Civilian Building",
  Image = {"file","graphics/neutral/buildings/building1.png" ,"size", {96, 79}},
  --Shadow = {"file","graphics/neutral/units/stalagmite-s.png" ,"size", {40, 32}},FIXIT
  Animations = "animations-civilian-building", Icon = "icon-cancel",
  NeutralMinimapColor = {70, 70, 70},
  HitPoints = 400,
  DrawLevel = 40,
  TileSize = {3, 2}, BoxSize = {96, 79},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  IsBuildingArmor = 1,
  Priority = 0,
  Type = "land",
  Building = true,
  NumDirections = 1,
  VisibleUnderFog = true, IsNotSelectable = true, 
  Sounds = {} } )

DefineUnitType("unit-building2", { Name = "Civilian Building",
  Image = {"file","graphics/neutral/buildings/building2.png" ,"size", {124, 181}},
  --Shadow = {"file","graphics/neutral/units/stalagmite-s.png" ,"size", {40, 32}},FIXIT
  Animations = "animations-civilian-building", Icon = "icon-cancel",
  Offset = {0, -40},
  BoxOffset = {0, -40},
  NeutralMinimapColor = {70, 70, 70},
  HitPoints = 400,
  DrawLevel = 40,
  TileSize = {4, 3}, BoxSize = {124, 181},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  IsBuildingArmor = 1,
  Priority = 0,
  Type = "land",
  Building = true,
  NumDirections = 1,
  VisibleUnderFog = true, IsNotSelectable = true, 
  Sounds = {} } )

DefineUnitType("unit-lava-spawner", { Name = "Lava Spawner",
  Image = {"file","graphics/missiles/chain-bullet.png" ,"size", {16, 16}},
  Animations = "animations-lava-spawner", Icon = "icon-cancel",
  NeutralMinimapColor = {240, 100, 0},
  HitPoints = 100,
  DrawLevel = 0,
  TileSize = {1, 1}, BoxSize = {16, 16},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Indestructible = 1,
  NumDirections = 1, Flip = false, NonSolid = true,
  Decoration = true, VisibleUnderFog = false, IsNotSelectable = true,
  Sounds = {} } )

DefineUnitType("unit-stalagmite", { Name = "Stalagmite",
  Image = {"file","graphics/neutral/units/stalagmite.png" ,"size", {32, 32}},
  Shadow = {"file","graphics/neutral/units/stalagmite-s.png" ,"size", {40, 32}},
  Animations = "animations-building", Icon = "icon-cancel",
  NeutralMinimapColor = {100, 100, 100},
  HitPoints = 100,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Indestructible = 1,
  NumDirections = 1, Flip = false,
  Decoration = true, VisibleUnderFog = true, IsNotSelectable = true,
  Sounds = {} } )
  
DefineUnitType("unit-stalagmite2", { Name = "Stalagmite",
  Image = {"file","graphics/neutral/units/stalagmite2.png" ,"size", {29, 47}},
  Shadow = {"file","graphics/neutral/units/stalagmite2-s.png" ,"size", {35, 47}},
  Animations = "animations-building", Icon = "icon-cancel",
  NeutralMinimapColor = {100, 100, 100},
  HitPoints = 100,
  DrawLevel = 40,
  Offset = {0,-12},
  TileSize = {1, 1}, BoxSize = {28, 46},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Indestructible = 1,
  NumDirections = 1, Flip = false,
  Decoration = true, VisibleUnderFog = true, IsNotSelectable = true,
  Sounds = {} } )
  
DefineUnitType("unit-tree1", { Name = "Tree",
  Image = {"file","graphics/neutral/units/tree1.png" ,"size", {32, 44}},
  Shadow = {"file","graphics/neutral/units/tree1-s.png" ,"size", {40, 44}},
  Animations = "animations-building", Icon = "icon-cancel",
  NeutralMinimapColor = {100, 100, 100},
  HitPoints = 100,
  DrawLevel = 40,
  Offset = {0,-12},
  TileSize = {1, 1}, BoxSize = {31, 43},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Indestructible = 1,
  NumDirections = 1, Flip = false,
  Decoration = true, VisibleUnderFog = true, IsNotSelectable = true,
  Sounds = {} } )
  
DefineUnitType("unit-tree2", { Name = "Tree",
  Image = {"file","graphics/neutral/units/tree2.png" ,"size", {64, 64}},
  Shadow = {"file","graphics/neutral/units/tree2-s.png" ,"size", {80, 64}},
  Animations = "animations-building", Icon = "icon-cancel",
  NeutralMinimapColor = {100, 100, 100},
  HitPoints = 100,
  DrawLevel = 40,
  Offset = {0,-12},
  TileSize = {2, 1}, BoxSize = {63, 63},
  SightRange = 1,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Indestructible = 1,
  NumDirections = 1, Flip = false,
  Decoration = true, VisibleUnderFog = true, IsNotSelectable = true,
  Sounds = {} } )

DefineUnitType("unit-vehicle-explosion", { Name = "Destroyed Vehicle",
  Image = {"file","graphics/neutral/units/destroyed-vehicle.png","size", {48, 48}},
  Animations = "animations-destroyed-vehicle", Icon = "icon-cancel",  
  HitPoints = 255,
  DrawLevel = 10,
  TileSize = {1, 1}, BoxSize = {31, 31}, Offset = {0, 16},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-destroyed-1x1-place", { Name = "Destroyed 1x1 Place",
  Image = {"file","graphics/neutral/buildings/small_destroyed_site.png","size", {32, 32}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel",  
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-destroyed-2x2-place", { Name = "Destroyed 2x2 Place",
  Image = {"file","graphics/neutral/buildings/destroyed_site.png","size", {64, 64}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel",
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {2, 2}, BoxSize = {63, 63},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-destroyed-3x2-place", { Name = "Destroyed 2x2 Place",
  Image = {"file","graphics/neutral/buildings/destroyed_site.png","size", {64, 64}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel",
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {3, 2}, BoxSize = {95, 63},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-destroyed-2x3-place", { Name = "Destroyed 2x3 Place",
  Image = {"file","graphics/neutral/buildings/destroyed_site.png","size", {64, 64}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel", 
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {2, 3}, BoxSize = {63, 95},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-destroyed-3x3-place", { Name = "Destroyed 3x3 Place",
  Image = {"file","graphics/neutral/buildings/big_destroyed_site.png","size", {96, 96}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel",
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {3, 3}, BoxSize = {95, 95},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )
  
DefineUnitType("unit-destroyed-4x3-place", { Name = "Destroyed 4x3 Place",
  Image = {"file","graphics/neutral/buildings/big_destroyed_site.png","size", {96, 96}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel", 
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {4, 3}, BoxSize = {127, 95},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )
  
DefineUnitType("unit-destroyed-3x4-place", { Name = "Destroyed 3x4 Place",
  Image = {"file","graphics/neutral/buildings/big_destroyed_site.png","size", {96, 96}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel", 
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {3, 4}, BoxSize = {127, 95},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-destroyed-4x4-place", { Name = "Destroyed 4x4 Place",
  Image = {"file","graphics/neutral/buildings/big_destroyed_site.png","size", {96, 96}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel",
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {4, 4}, BoxSize = {127, 127},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )
  
DefineUnitType("unit-destroyed-5x3-place", { Name = "Destroyed 5x3 Place",
  Image = {"file","graphics/neutral/buildings/big_destroyed_site.png","size", {96, 96}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel",
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {5, 3}, BoxSize = {127, 127},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-destroyed-5x4-place", { Name = "Destroyed 5x4 Place",
  Image = {"file","graphics/neutral/buildings/big_destroyed_site.png","size", {96, 96}},
  Animations = "animations-destroyed-place", Icon = "icon-cancel",
  HitPoints = 255,
  DrawLevel = 9,
  TileSize = {5, 4}, BoxSize = {127, 127},
  SightRange = 0,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Vanishes = true,
  Sounds = {} } )

DefineUnitType("unit-revealer", { Name = "Dummy unit",
  Animations = "animations-building", Icon = "icon-cancel",
  HitPoints = 1,
  TileSize = {1, 1}, BoxSize = {1, 1},
  SightRange = 12,
  BasicDamage = 0, PiercingDamage = 0, Missile = "missile-none",
  Priority = 0,
  DecayRate = 1,
  Type = "land",
  Building = true, VisibleUnderFog = true,
  Revealer = true,
  DetectCloak = true,
  Sounds = {} } )

local function FountainTransferHP(slot)
	--print(tostring(GetUnitVariable(slot, "Xp", "Value")))
	if (GetUnitVariable(slot, "Xp", "Value") > GetUnitVariable(slot, "Arg3", "Value")) then
		local master = GetUnitVariable(slot, "Arg2", "Value")
		local diff = GetUnitVariable(slot, "Xp", "Value") - GetUnitVariable(slot, "Arg3", "Value")
		SetUnitVariable(master, "Xp", GetUnitVariable(master, "Xp", "Value") + diff, "Max")
		SetUnitVariable(master, "Xp", GetUnitVariable(master, "Xp", "Value") + diff, "Value")
		SetUnitVariable(slot, "Arg3", GetUnitVariable(slot, "Xp", "Value"), "Max")
		SetUnitVariable(slot, "Arg3", GetUnitVariable(slot, "Xp", "Value"), "Value")
	end
end

BaseDamage = 24
DamageType = "plasma"
DefineUnitType("unit-hell-fountain", { Name = "Hellish Fountain",
  Image = {"file","graphics/missiles/fountain.png" ,"size", {70, 70}},
  Animations = "animations-hell-fountain", Icon = "icon-cancel",
  HitPoints = 500,
  DrawLevel = drawLevels.DL_LowMissile,
  TileSize = {1, 1}, BoxSize = {32, 32},
  SightRange = 5,
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-fountain-ball",
  Priority = 0,
  Type = "land",
  Arg3 = 0,
 -- Damage and armor part
  IsBuildingArmor = 1,
  BaseDamage = BaseDamage,
  DamageType = "fire",

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
  Indestructible = 1,
  NumDirections = 1, 
  Flip = false,
  NonSolid = true,
  Building = true, 
  VisibleUnderFog = true,
  IsNotSelectable = true,
  CanAttack = true,
  CanTargetLand = true,
  CanTargetSea = true,
  CanTargetAir = false,
  Coward = true,
  OnEachSecond = FountainTransferHP,
  Sounds = {} } )

local list = ListFilesInDirectory("scripts/neutral/")
for i,f in ipairs(list) do
	if (string.find(f, "^unit-.*%.lua$")) then
		Load("scripts/neutral/"..f)
	end
end
-- Load the different races
Load("scripts/uac/units.lua")
Load("scripts/hell/units.lua")

UnitTypeHumanWall = UnitTypeByIdent("unit-uac-wall-compat");
UnitTypeOrcWall = UnitTypeByIdent("unit-hell-wall-compat"); 