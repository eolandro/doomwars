-- Some variables to make calculations much easier
local UnitName
local BaseDamage = 0
local BaseDamage2 = 0
local BaseDamage3 = 0
local BaseDamage4 = 0
local BaseDamage5 = 0
local BaseDamage6 = 0
local BaseDamage7 = 0
local BaseDamage8 = 0
local DamageType
local DamageType2
local DamageType3
local DamageType4
local DamageType5
local DamageType6
local DamageType7
local DamageType8

particle_puff = LoadGraphic("graphics/missiles/particles/puff.png", 15, 15)

function ParticleNewDoomerChaingunPuff(x, y)
	addStaticParticle(particle_puff, 100, x, y, drawLevels.DL_PartLow)
end

function ParticleNewDoomerShotgunPuff(x, y)
	addStaticParticle(particle_puff, 100, x, y, drawLevels.DL_PartLow)
end

DefineUnitType("unit-newdoomer-burning", { Name = "",
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

local function CheckIfPickupable(spell, unit, x, y, target)
	local health = GetUnitVariable(unit, "HitPoints", "Value")
	local ident = GetUnitVariable(target, "Ident")
	if (ident == "unit-deathmatch-stimpack" or ident == "unit-deathmatch-medikit") then
		return health < 100
	elseif (ident == "unit-deathmatch-bullet-clip" or ident == "unit-deathmatch-bullet-box") then
		return GetUnitVariable(unit, "AmmoBullets", "Value") < GetUnitVariable(unit, "AmmoBullets", "Max")
	elseif (ident == "unit-deathmatch-shells" or ident == "unit-deathmatch-shell-box") then
		return GetUnitVariable(unit, "AmmoShells", "Value") < GetUnitVariable(unit, "AmmoShells", "Max")
	elseif (ident == "unit-deathmatch-rocket" or ident == "unit-deathmatch-rocket-box") then
		return GetUnitVariable(unit, "AmmoRockets", "Value") < GetUnitVariable(unit, "AmmoRockets", "Max")
	elseif (ident == "unit-deathmatch-energy-cell" or ident == "unit-deathmatch-cell-pack") then
		return GetUnitVariable(unit, "AmmoCells", "Value") < GetUnitVariable(unit, "AmmoCells", "Max")
	elseif (ident == "unit-deathmatch-green-armor") then
		return GetUnitVariable(unit, "ShieldPoints", "Value") < 100
	elseif (ident == "unit-deathmatch-blue-armor") then
		return GetUnitVariable(unit, "ShieldPoints", "Value") < 200
	elseif (ident == "unit-deathmatch-chainsaw") then
		return GetUnitVariable(unit, "HasChainsaw", "Value") == 0
	elseif (ident == "unit-deathmatch-shotgun") then
		return GetUnitVariable(unit, "HasShotgun", "Value") == 0
	elseif (ident == "unit-deathmatch-ssg") then
		return GetUnitVariable(unit, "HasSSG", "Value") == 0
	elseif (ident == "unit-deathmatch-chaingun") then
		return GetUnitVariable(unit, "HasChaingun", "Value") == 0
	elseif (ident == "unit-deathmatch-rl") then
		return GetUnitVariable(unit, "HasRL", "Value") == 0
	elseif (ident == "unit-deathmatch-plasma-rifle") then
		return GetUnitVariable(unit, "HasPlasma", "Value") == 0
	elseif (ident == "unit-deathmatch-bfg9000") then
		return GetUnitVariable(unit, "HasBFG", "Value") == 0
	end
	return true
end

DefineSpell("spell-ai-gotoitem",
	"showname", _("ai-gotoitem"),
	"condition", {
		"Item", "only",
		"RespawnTime", {ExactValue = 0},
		"callback", CheckIfPickupable,
	},
	"manacost", 0,
	"range", 0,
	"target", "unit",
	"ai-cast", {"priority", {"Distance", false}, "range", 28, "min-range", 1, "combat", "false"}
)

DefineSpell("spell-newdoomer-prev-weapon",
	"showname", _("prev weapon"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-next-weapon",
	"showname", _("next weapon"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-fists",
	"showname", _("select fists"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-chainsaw",
	"showname", _("select chainsaw"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-pistol",
	"showname", _("select pistol"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-shotgun",
	"showname", _("select shotgun"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-ssg",
	"showname", _("select ssg"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-chaingun",
	"showname", _("select chaingun"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-rl",
	"showname", _("select rl"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-plasma",
	"showname", _("select plasma"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

DefineSpell("spell-newdoomer-select-bfg",
	"showname", _("select bfg"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation"
)

function DeathMatchHandleDoomerDeath(slot)
	local player = GetUnitVariable(slot, "Player")
	local killer = GetUnitVariable(slot, "PlayerKiller")
	local weaponKill = GetUnitVariable(slot, "WeaponKilled")
	if (player == killer) then
		AddMessage(GetPlayerData(player, "Name") .. " killed himself.")
		return
	end
	if (weaponKill == 0) then
		AddMessage(GetPlayerData(player, "Name") .. " chewed on " .. GetPlayerData(killer, "Name") .. "'s fist.")
	elseif (weaponKill == 1) then
		AddMessage(GetPlayerData(player, "Name") .. " was mowed over by " .. GetPlayerData(killer, "Name") .. "'s chainsaw.")
	elseif (weaponKill == 2) then
		AddMessage(GetPlayerData(player, "Name") .. " was tickled by " .. GetPlayerData(killer, "Name") .. "'s pea shooter.")
	elseif (weaponKill == 3) then
		AddMessage(GetPlayerData(player, "Name") .. " chewed on " .. GetPlayerData(killer, "Name") .. "'s boomstick.")
	elseif (weaponKill == 4) then
		AddMessage(GetPlayerData(player, "Name") .. " was splattered by " .. GetPlayerData(killer, "Name") .. "'s super shotgun.")
	elseif (weaponKill == 5) then
		AddMessage(GetPlayerData(player, "Name") .. " was mowed down by " .. GetPlayerData(killer, "Name") .. "'s chaingun.")
	elseif (weaponKill == 6) then
		AddMessage(GetPlayerData(player, "Name") .. " was blown up by " .. GetPlayerData(killer, "Name") .. "'s rocket.")
	elseif (weaponKill == 7) then
		AddMessage(GetPlayerData(player, "Name") .. " was melted by " .. GetPlayerData(killer, "Name") .. "'s plasma gun.")
	elseif (weaponKill == 8) then
		AddMessage(GetPlayerData(player, "Name") .. " was splintered by " .. GetPlayerData(killer, "Name") .. "'s BFG.")
	end
end

local NewDoomerStill = { 
	"frame 5", 
	"if-var v_Weapon.Value == 1 saw",
	"if-var v_Weapon.Value == 2 pist",
	"if-var v_Weapon.Value == 3 shot",
	"if-var v_Weapon.Value == 4 ssg",
	"if-var v_Weapon.Value == 5 cngn",
	"if-var v_Weapon.Value == 6 rl",
	"if-var v_Weapon.Value == 7 plas",
	"if-var v_Weapon.Value == 8 bfg",
	"frame 240", "wait 4", "random-goto 99 no-rotate", 
	"frame 245", "wait 4",
	"frame 250", "wait 4",
	"frame 235", "wait 4","random-rotate 1", "goto no-rotate",
	"label saw",
	"frame 125", "wait 4", "random-goto 99 no-rotate", 
	"frame 130", "wait 4",
	"frame 135", "wait 4",
	"frame 120", "wait 4","random-rotate 1", "goto no-rotate",
	"label pist",
	"frame 5", "wait 4", "random-goto 99 no-rotate", 
	"frame 10", "wait 4",
	"frame 15", "wait 4",
	"frame 0", "wait 4","random-rotate 1", "goto no-rotate",
	"label shot",
	"frame 35", "wait 4", "random-goto 99 no-rotate", 
	"frame 40", "wait 4",
	"frame 45", "wait 4",
	"frame 30", "wait 4","random-rotate 1", "goto no-rotate",
	"label ssg",
	"frame 65", "wait 4", "random-goto 99 no-rotate", 
	"frame 70", "wait 4",
	"frame 75", "wait 4",
	"frame 60", "wait 4","random-rotate 1", "goto no-rotate",
	"label cngn",
	"frame 95", "wait 4", "random-goto 99 no-rotate", 
	"frame 100", "wait 4",
	"frame 105", "wait 4",
	"frame 90", "wait 4","random-rotate 1", "goto no-rotate",
	"label rl",
	"frame 150", "wait 4", "random-goto 99 no-rotate", 
	"frame 155", "wait 4",
	"frame 160", "wait 4",
	"frame 145", "wait 4","random-rotate 1", "goto no-rotate",
	"label plas",
	"frame 180", "wait 4", "random-goto 99 no-rotate", 
	"frame 185", "wait 4",
	"frame 190", "wait 4",
	"frame 175", "wait 4","random-rotate 1", "goto no-rotate",
	"label bfg",
	"frame 210", "wait 4", "random-goto 99 no-rotate", 
	"frame 215", "wait 4",
	"frame 220", "wait 4",
	"frame 205", "wait 4","random-rotate 1", "goto no-rotate",
	"label no-rotate", "wait 1",}
local NewDoomerMove = {"unbreakable begin",
	"frame 0", 
	"if-var v_Weapon.Value == 1 prepsaw",
	"if-var v_Weapon.Value == 2 preppist",
	"if-var v_Weapon.Value == 3 prepshot",
	"if-var v_Weapon.Value == 4 prepssg",
	"if-var v_Weapon.Value == 5 prepcngn",
	"if-var v_Weapon.Value == 6 preprl",
	"if-var v_Weapon.Value == 7 prepplas",
	"if-var v_Weapon.Value == 8 prepbfg",
	"set-var Arg12.Value 0 235",
	"set-var Arg13.Value 0 240",
	"set-var Arg14.Value 0 245",
	"set-var Arg15.Value 0 250", "goto go",
	"label prepsaw",
	"set-var Arg12.Value 0 120",
	"set-var Arg13.Value 0 125",
	"set-var Arg14.Value 0 130",
	"set-var Arg15.Value 0 135", 
	"sound deathmatch-saw-idle", "goto go",
	"label preppist",
	"set-var Arg12.Value 0 0",
	"set-var Arg13.Value 0 5",
	"set-var Arg14.Value 0 10",
	"set-var Arg15.Value 0 15", "goto go",
	"label prepshot",
	"set-var Arg12.Value 0 30",
	"set-var Arg13.Value 0 35",
	"set-var Arg14.Value 0 40",
	"set-var Arg15.Value 0 45", "goto go",
	"label prepssg",
	"set-var Arg12.Value 0 60",
	"set-var Arg13.Value 0 65",
	"set-var Arg14.Value 0 70",
	"set-var Arg15.Value 0 75", "goto go",
	"label prepcngn",
	"set-var Arg12.Value 0 90",
	"set-var Arg13.Value 0 95",
	"set-var Arg14.Value 0 100",
	"set-var Arg15.Value 0 105", "goto go",
	"label preprl",
	"set-var Arg12.Value 0 145",
	"set-var Arg13.Value 0 150",
	"set-var Arg14.Value 0 155",
	"set-var Arg15.Value 0 160", "goto go",
	"label prepplas",
	"set-var Arg12.Value 0 175",
	"set-var Arg13.Value 0 180",
	"set-var Arg14.Value 0 185",
	"set-var Arg15.Value 0 190", "goto go",
	"label prepbfg",
	"set-var Arg12.Value 0 205",
	"set-var Arg13.Value 0 210",
	"set-var Arg14.Value 0 215",
	"set-var Arg15.Value 0 220", "goto go",
	"label go",
	"frame v_Arg12.Value", "move 4", "wait 1",
	"frame v_Arg13.Value", "move 4", "wait 1",
    "frame v_Arg14.Value", "move 4", "wait 1",
	"frame v_Arg15.Value", "move 4", "wait 1",
    "frame v_Arg12.Value", "move 4", "wait 1",
	"frame v_Arg13.Value", "move 4", "wait 1",
    "frame v_Arg14.Value", "move 4", "wait 1",
	"frame v_Arg15.Value", "move 4", "wait 1",
	"label end","unbreakable end", "wait 1",}
local NewDoomerDeath = {"unbreakable begin", 
	"lua-callback DeathMatchHandleDoomerDeath v_Slot.Value",
	"exact-frame 260", "wait 3",
	"exact-frame 261", "wait 3",
	"exact-frame 262", "wait 3",
	"exact-frame 263", "wait 3",
	"exact-frame 264", "wait 3",
	"exact-frame 265", "wait 3",
	"exact-frame 266", "wait 2000",
    "exact-frame 266", "unbreakable end", "wait 1",}
local NewDoomerDeathExtreme = {"unbreakable begin", 
	"lua-callback DeathMatchHandleDoomerDeath v_Slot.Value",
	"exact-frame 267", "spawn-missile missile-extreme-gibs 20 20 0 0 pixel", "wait 3",
	"exact-frame 268", "wait 3",
	"exact-frame 269", "wait 3",
	"exact-frame 270", "wait 3",
	"exact-frame 271", "wait 3",
	"exact-frame 272", "wait 3",
	"exact-frame 273", "wait 3",
	"exact-frame 274", "wait 3",
	"exact-frame 275", "wait 2000",
    "exact-frame 275", "unbreakable end", "wait 1",}

function HandleDoomerPWO(slot)
	if (GetUnitVariable(slot, "HasPlasma", "Value") == 1 and GetUnitVariable(slot, "AmmoCells", "Value") > 0) then
		SetUnitVariable(slot, "Weapon", 7, "Value") -- plasmagun
	elseif (GetUnitVariable(slot, "HasSSG", "Value") == 1 and GetUnitVariable(slot, "AmmoShells", "Value") > 1) then
		SetUnitVariable(slot, "Weapon", 4, "Value") -- SSG
	elseif (GetUnitVariable(slot, "HasChaingun", "Value") == 1 and GetUnitVariable(slot, "AmmoBullets", "Value") > 0) then
		SetUnitVariable(slot, "Weapon", 5, "Value") -- chaingun
	elseif (GetUnitVariable(slot, "HasShotgun", "Value") == 1 and GetUnitVariable(slot, "AmmoShells", "Value") > 0) then
		SetUnitVariable(slot, "Weapon", 3, "Value") -- shotgun
	elseif GetUnitVariable(slot, "AmmoBullets", "Value") > 0 then
		SetUnitVariable(slot, "Weapon", 2, "Value") -- pistol
	elseif (GetUnitVariable(slot, "HasChainsaw", "Value") == 1) then
		SetUnitVariable(slot, "Weapon", 1, "Value") -- chainsaw
	elseif (GetUnitVariable(slot, "HasRL", "Value") == 1 and GetUnitVariable(slot, "AmmoRockets", "Value") > 0) then
		SetUnitVariable(slot, "Weapon", 6, "Value") -- rocket launcher
	elseif (GetUnitVariable(slot, "HasBFG", "Value") == 1 and GetUnitVariable(slot, "AmmoCells", "Value") >= 40) then
		SetUnitVariable(slot, "Weapon", 8, "Value") -- BFG
	else
		SetUnitVariable(slot, "Weapon", 0, "Value") -- fists
	end
end
	
function HandleDoomerCheckWeaponAmmo(slot)
	local weapon = GetUnitVariable(slot, "Weapon", "Value")
	if (weapon == 8) then -- BFG
		if (GetUnitVariable(slot, "HasBFG", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 1, "Value")
			return
		elseif (GetUnitVariable(slot, "AmmoCells", "Value") < 40) then
			SetUnitVariable(slot, "Op1", 2, "Value")
			return
		end
	elseif (weapon == 7) then -- Plasma rifle
		if (GetUnitVariable(slot, "HasPlasma", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 1, "Value")
			return
		elseif (GetUnitVariable(slot, "AmmoCells", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 2, "Value")
			return
		end
	elseif (weapon == 6) then -- RL
		if (GetUnitVariable(slot, "HasRL", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 1, "Value")
			return
		elseif (GetUnitVariable(slot, "AmmoRockets", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 2, "Value")
			return
		end
	elseif (weapon == 5) then -- chaingun
		if (GetUnitVariable(slot, "HasChaingun", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 1, "Value")
			return
		elseif (GetUnitVariable(slot, "AmmoBullets", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 2, "Value")
			return
		end
	elseif (weapon == 4) then -- ssg
		if (GetUnitVariable(slot, "HasSSG", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 1, "Value")
			return
		elseif (GetUnitVariable(slot, "AmmoShells", "Value") < 2) then
			SetUnitVariable(slot, "Op1", 2, "Value")
			return
		end
	elseif (weapon == 3) then -- shotgun
		if (GetUnitVariable(slot, "HasShotgun", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 1, "Value")
			return
		elseif (GetUnitVariable(slot, "AmmoShells", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 2, "Value")
			return
		end
	elseif (weapon == 2) then -- pistol
		if (GetUnitVariable(slot, "AmmoBullets", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 2, "Value")
			return
		end
	elseif (weapon == 1) then -- chainsaw
		if (GetUnitVariable(slot, "HasChainsaw", "Value") == 0) then
			SetUnitVariable(slot, "Op1", 1, "Value")
			return
		end
	end
end

local function DoomerAttacked(attacker, target, damage)
	if (attacker == -1) then
		return
	else
		SetUnitVariable(target, "WeaponKilled", GetUnitVariable(attacker, "Weapon"))
		SetUnitVariable(target, "PlayerKiller", GetUnitVariable(attacker, "Player"))
	end
end

function DeathMatchDoomerAttackRange(slot, weapon)
	if (weapon <= 1) then
		SetUnitVariable(slot, "AttackRange", 1, "Max", true)
		SetUnitVariable(slot, "AttackRange", 1, "Value", true)
	elseif (weapon == 3 or weapon == 4) then
		SetUnitVariable(slot, "AttackRange", 3, "Max", true)
		SetUnitVariable(slot, "AttackRange", 3, "Value", true)
	else
		SetUnitVariable(slot, "AttackRange", 10, "Max", true)
		SetUnitVariable(slot, "AttackRange", 10, "Value", true)
	end
end

DefineMissileType("missile-newdoomer-fist",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100, AlwaysFire = true,
  ImpactSound = "revenant-punch", CorrectSphashDamage = true, Damage = Div(Mul(Add(70, Rand(130)), Add(8, Mul(GreaterThan(AttackerVar("BerserkTime"), 1), 48))), 100),
  OnImpact = DoomerAttacked,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 1 } )

DefineMissileType("missile-newdoomer-saw",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100, AlwaysFire = true,
  CorrectSphashDamage = true, Damage = Div(Mul(Add(70, Rand(130)), 8), 100),
  OnImpact = DoomerAttacked,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 1 } )

DefineMissileType("missile-newdoomer-bullet",
  { DrawLevel = drawLevels.DL_LowMissile, Frames = 1, NumDirections = 1, IgnoreWalls = false,
	Transparency = 100, AlwaysFire = true, CorrectSphashDamage = true, ImpactParticle = ParticleNewDoomerChaingunPuff,
	KillFirstUnit = true, MissileStopFlags = 0x400, Damage = Div(Mul(Add(70, Rand(130)), 8), 100),
	OnImpact = DoomerAttacked,
    Class = "missile-class-straight-fly", ImpactSound = "ricoshet", Sleep = 1, Speed = 64, Range = 1 } )

DefineMissileType("missile-newdoomer-shotgun",
  { DrawLevel = drawLevels.DL_LowMissile, Frames = 1, NumDirections = 1, IgnoreWalls = false,
	Transparency = 100, AlwaysFire = true, CorrectSphashDamage = true, ImpactParticle = ParticleNewDoomerShotgunPuff,
	KillFirstUnit = true, MissileStopFlags = 0x400,  Damage = Div(Mul(Add(70, Rand(130)), 5), 100),
	OnImpact = DoomerAttacked,
    Class = "missile-class-straight-fly", ImpactSound = "ricoshet", Sleep = 1, Speed = 64, Range = 1 } )

DefineMissileType("missile-newdoomer-rocket",
  { File = "graphics/missiles/missile.png", Size = {32, 32}, Frames = 17, NumDirections = 32,
  KillFirstUnit = true, MissileStopFlags = 0x400,  Damage = Div(Mul(Add(70, Rand(130)), 80), 100),
  DrawLevel = drawLevels.DL_LowMissile, ImpactSound = "rocket explode", Flip = false, CorrectSphashDamage = true,
  Class = "missile-class-straight-fly", Sleep = 1, Speed = 16, Range = 3, AlwaysFire = true, IgnoreWalls = false,
  OnImpact = DoomerAttacked,
  ImpactMissile = "missile-rocket-exp", SmokeParticle = ParticleRocketPuff,  SplashFactor = 3, ImpactParticle = RocketExplosion,
  CanHitOwner = true } )

DefineMissileType("missile-newdoomer-plasmaball",
  { File = "graphics/missiles/plasmaball.png", Size = {15, 14}, Frames = 10, NumDirections = 9,
  ImpactSound = "plasma explode1", AlwaysFire = true, CorrectSphashDamage = true, IgnoreWalls = false,
  KillFirstUnit = true, MissileStopFlags = 0x400, Damage = Div(Mul(Add(70, Rand(130)), 11), 100),
  OnImpact = DoomerAttacked,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-straight-fly", Sleep = 1, Speed = 32, Range = 1,
  ImpactMissile = "missile-plasmaball-exp"} )

DefineMissileType("missile-newdoomer-bfgball",
  { File = "graphics/missiles/bfgball.png", Size = {40, 40}, Frames = 2, NumDirections = 1, IgnoreWalls = false, 
  Damage = Div(Mul(Add(70, Rand(130)), 800), 100),
  ImpactSound = "bfg explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleBFGBallTrail,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-straight-fly", Sleep = 1, Speed = 16, Range = 6, 
  OnImpact = DoomerAttacked,
  ImpactParticle = ParticleBFGBallExplode, KillFirstUnit = true, MissileStopFlags = 0x400,
  ImpactMissile = "missile-bfgball-exp" , SplashFactor = 2} )
	
DefineAnimations("animations-newdoomer", {
  Still = NewDoomerStill,
  Move = NewDoomerMove,
  Attack = {"unbreakable begin",
	"if-var v_WeaponReloadTime.Value != 0 end",
	"set-var Op1.Value = 0",
	"lua-callback HandleDoomerCheckWeaponAmmo v_Slot.Value",
	"if-var v_Op1.Value != 0 pwo",
	"if-var v_Weapon.Value == 0 firefists",
	"if-var v_Weapon.Value == 1 firesaw",
	"if-var v_Weapon.Value == 2 firepistol",
	"if-var v_Weapon.Value == 3 fireshot",
	"if-var v_Weapon.Value == 4 firessg",
	"if-var v_Weapon.Value == 5 firechaingun",
	"if-var v_Weapon.Value == 6 firerl",
	"if-var v_Weapon.Value == 7 fireplasma",
	"if-var v_Weapon.Value == 8 firebfg",
	"goto end",
	-- fists
	"label firefists",
		"set-var DamageType = melee",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage2.Value",
		"frame 255", "spawn-missile missile-newdoomer-fist 0 0 0 0 damage.totarget",
		"wait 6",
		"frame 240",
		"set-var WeaponReloadTime.Value = 16",
		"goto end",
	"label firesaw",
		"set-var DamageType = melee",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage2.Value",
		"frame 140", "spawn-missile missile-newdoomer-saw 0 0 0 0 damage.totarget",
		"sound deathmatch-saw-attack", 
		"wait 4",
		"frame 140",
		"goto end",
	"label firepistol",
		"set-var DamageType = basic",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage4.Value",
		"frame 20", "wait 3",
		"frame 25", "spawn-missile missile-newdoomer-bullet 0 0 0 0 damage.totarget","sound pistol shot", 
		"set-var AmmoBullets.Value -= 1",
		"wait 3",
		"frame 20",
		"set-var WeaponReloadTime.Value = 16",
		"goto end",
	"label fireshot",
		"set-var DamageType = shell",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage5.Value",
		"frame 50", "wait 3",
		"frame 55", 
		"spawn-missile missile-newdoomer-shotgun 0 0 0 0 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"sound shotgun shot", 
		"set-var AmmoShells.Value -= 1",
		"wait 3",
		"frame 50", "set-var WeaponReloadTime.Value = 30",
		"goto end",
	"label firessg",
		"set-var DamageType = shell",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage5.Value",
		"frame 80", "wait 3",
		"frame 85", 
		"spawn-missile missile-newdoomer-shotgun 0 0 0 0 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"spawn-missile missile-newdoomer-shotgun 0 0 r_-16.16 r_-16.16 damage.totarget.pixel",
		"sound double shotgun fire", 
		"set-var AmmoShells.Value -= 2",
		"wait 3", 
		"frame 80",	"wait 6", "sound shotgun open", 
				"wait 6", "sound shotgun load", 
				"wait 6",  "sound shotgun close", 
				"wait 4", 
		"frame 80",
		"goto end",
	"label firechaingun",
		"set-var DamageType = basic",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage4.Value",
		"frame 110", "wait 2",
		"frame 115", "spawn-missile missile-newdoomer-bullet 0 0 r_-16.16 r_-16.16 damage.totarget.pixel","sound chain attack",
		"set-var AmmoBullets.Value -= 1",
		"wait 2",
		"frame 110",
		"goto end",
	"label firerl",
		"set-var DamageType = extreme",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage7.Value",
		"frame 165", "wait 5", 
		"frame 170", "spawn-missile missile-newdoomer-rocket 0 0 0 0 damage.totarget", "sound rocket launch",
		"set-var AmmoRockets.Value -= 1",
		"wait 3",
		"frame 165", "set-var WeaponReloadTime.Value = 30",
		"goto end",
	"label fireplasma",
		"set-var DamageType = fire",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage8.Value",
		"frame 195", "wait 2",
		"frame 200", "spawn-missile missile-newdoomer-plasmaball 0 0 0 0 damage.totarget","sound plasma shot", 
		"set-var AmmoCells.Value -= 1",
		"wait 2",
		"frame 195",
		"goto end",
	"label firebfg",
		"set-var DamageType = extreme",
		"set-var HeavyArmorDamage.Value 0 v_HeavyArmorDamage9.Value",
		"frame 225", "sound bfg charge", "wait 34", 
		"frame 230", "spawn-missile missile-newdoomer-bfgball 0 0 0 0 damage.totarget","sound bfg shot", 
		"set-var AmmoCells.Value -= 40",
		"wait 2",
		"frame 225", "set-var WeaponReloadTime.Value = 60",
		"goto end",
	"label pwo",
		"lua-callback HandleDoomerMessages v_Slot.Value 3",
		"lua-callback HandleDoomerPWO v_Slot.Value",
	"goto end",
	"label end",
	"if-var v_Weapon.Value != 1 gotonext", 
  "sound deathmatch-saw-up",
  "label gotonext",
  "lua-callback DeathMatchDoomerAttackRange v_Slot.Value v_Weapon.Value",
	"unbreakable end", "wait 1"
	},
  SpellCast = {"unbreakable begin", 
  "if-var s_spell-newdoomer-prev-weapon == 1 prevweapon",
  "if-var s_spell-newdoomer-next-weapon == 1 nextweapon",
  "if-var s_spell-newdoomer-select-fists == 1 selectfists",
  "if-var s_spell-newdoomer-select-chainsaw == 1 selectchainsaw",
  "if-var s_spell-newdoomer-select-pistol == 1 selectpistol",
  "if-var s_spell-newdoomer-select-shotgun == 1 selectshotgun",
  "if-var s_spell-newdoomer-select-ssg == 1 selectssg",
  "if-var s_spell-newdoomer-select-chaingun == 1 selectchaingun",
  "if-var s_spell-newdoomer-select-rl == 1 selectrl",
  "if-var s_spell-newdoomer-select-plasma == 1 selectplasma",
  "if-var s_spell-newdoomer-select-bfg == 1 selectbfg",
  "if-var s_spell-ai-gotoitem == 1 true_end",
  "label selectfists",
	"set-var Weapon.Value = 0", --enough ammo for fist )
  "goto end",
  "label selectchainsaw",
	"set-var Op2.Value = 1",
	"goto checkweapammo",
  "label selectpistol",
	"set-var Op2.Value = 2",
	"goto checkweapammo",
  "label selectshotgun",
	"set-var Op2.Value = 3",
	"goto checkweapammo",
  "label selectssg",
	"set-var Op2.Value = 4",
	"goto checkweapammo",
  "label selectchaingun",
	"set-var Op2.Value = 5",
	"goto checkweapammo",
  "label selectrl",
	"set-var Op2.Value = 6",
	"goto checkweapammo",
  "label selectplasma",
	"set-var Op2.Value = 7",
	"goto checkweapammo",
  "label selectbfg",
	"set-var Op2.Value = 8",
	"goto checkweapammo",
  "label checkweapammo",
	"set-var Op3.Value = v_Weapon.Value",
	"set-var Weapon.Value = v_Op2.Value",
	"set-var Op1.Value = 0",
	"lua-callback HandleDoomerCheckWeaponAmmo v_Slot.Value",
	"if-var v_Op1.Value == 0 end", -- correct selection
	"lua-callback HandleDoomerMessages v_Slot.Value v_Op1.Value",
	"set-var Weapon.Value = v_Op3.Value",
	"goto end",
  -- Previous weapon
	"label prevweapon",
		"if-var v_Weapon.Value == 0 setmaxweapon",
		"set-var Weapon.Value -= 1",
		-- check if we have that weapon and enough ammo for it
		"set-var Op1.Value = 0",
		"lua-callback HandleDoomerCheckWeaponAmmo v_Slot.Value",
		"if-var v_Op1.Value != 0 prevweapon", -- incorrect selection
	"goto end",
	"label setmaxweapon",
	"set-var Weapon.Value = 8", 
		-- check if we have that weapon and enough ammo for it
		"set-var Op1.Value = 0",
		"lua-callback HandleDoomerCheckWeaponAmmo v_Slot.Value",
		"if-var v_Op1.Value != 0 prevweapon", -- incorrect selection
	"goto end",
	-- Next weapon
	"label nextweapon",
		"lua-callback LuaAddMessage v_Weapon.Value",
		"if-var v_Weapon.Value == 8 setminweapon",
		"set-var Weapon.Value += 1",
		-- check if we have that weapon and enough ammo for it
		"set-var Op1.Value = 0",
		"lua-callback HandleDoomerCheckWeaponAmmo v_Slot.Value",
		"if-var v_Op1.Value != 0 nextweapon", -- incorrect selection
	"goto end",
	"label setminweapon",
	"set-var Weapon.Value = 0", --enough ammo for fist )
	"goto end",
  "label quick", "attack",
  "label end",
  "if-var v_Weapon.Value != 1 gotonext", 
  "sound deathmatch-saw-up",
  "label gotonext",
  "lua-callback DeathMatchDoomerAttackRange v_Slot.Value v_Weapon.Value",
  "label true_end",
  "unbreakable end", "wait 1",},
  Death = NewDoomerDeath,
  Death_extreme = NewDoomerDeathExtreme,
  Death_fire = {"unbreakable begin","exact-frame 276","spawn-unit unit-newdoomer-burning 0 0 5 15","wait 100","unbreakable end","wait 1",},
})

DefineButton( { Pos = 1, Level = 0, Icon = "icon-deathmatch-help",
  Action = "button", Value = 0, Popup = "popup-deathmatch-help",
  Hint = "Help", AlwaysShow = true,
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-deathmatch-weapons",
  Action = "button", Value = 0, Popup = "popup-deathmatch-weapons",
  Hint = "Help", AlwaysShow = true,
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-uac-attack-ground",
  Action = "attack-ground", Popup = "popup-deathmatch-attackground",
  Key = "a", Hint = "~!Attack", AlwaysShow = true,
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 4, Level = 0, Icon = "icon-stop-uac",
  Action = "stop",
  Key = "s", Hint = _("~!Stop"), Description = _("Order player to stop current action."), Popup = "popup-uac-commands",
  ForUnit = { "unit-newdoomer"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-deathmatch-weapon-prev",
  Action = "cast-spell", Value = "spell-newdoomer-prev-weapon", Popup = "popup-uac-commands",
  Key = "z", Hint = "Select previous weapon (~!z)", AlwaysShow = true,
  ForUnit = {"unit-newdoomer"} } )
  
DefineButton( { Pos = 8, Level = 0, Icon = "icon-deathmatch-weapon-next",
  Action = "cast-spell", Value = "spell-newdoomer-next-weapon", Popup = "popup-uac-commands",
  Key = "x", Hint = "Select next weapon (~!x)", AlwaysShow = true,
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 10, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-fists",
  Key = "q", Hint = "Select fists (~!q)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 11, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-chainsaw",
  Key = "w", Hint = "Select chainsaw (~!w)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 12, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-pistol",
  Key = "e", Hint = "Select pistol (~!e)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 13, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-shotgun",
  Key = "r", Hint = "Select shotgun (~!r)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 14, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-ssg",
  Key = "t", Hint = "Select SSG (~!t)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 15, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-chaingun",
  Key = "y", Hint = "Select chaingun (~!y)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 16, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-rl",
  Key = "u", Hint = "Select rl (~!u)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 17, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-plasma",
  Key = "i", Hint = "Select plasma (~!i)",
  ForUnit = {"unit-newdoomer"} } )

DefineButton( { Pos = 18, Level = 0, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-newdoomer-select-bfg",
  Key = "o", Hint = "Select BFG (~!o)",
  ForUnit = {"unit-newdoomer"} } )

local function DeathMatchHandleDoomer(slot)
	if (GetUnitVariable(slot, "WeaponReloadTime", "Value") > 0) then
		SetUnitVariable(slot, "WeaponReloadTime", GetUnitVariable(slot, "WeaponReloadTime", "Value") - 1, "Value")
	end
	if (GetUnitVariable(slot, "BerserkTime", "Value") > 0) then
		SetUnitVariable(slot, "HeavyArmorDamage2", 30, "Max")
		SetUnitVariable(slot, "HeavyArmorDamage2", 30, "Value")
	else
		SetUnitVariable(slot, "HeavyArmorDamage2", 3, "Max")
		SetUnitVariable(slot, "HeavyArmorDamage2", 3, "Value")
	end
end

UnitName = "unit-newdoomer"
DefineUnitType(UnitName, { Name = "Player",
  -- Drawing
  Image = {"file", "newdoomer.png", "size", {42, 42}},
 -- Shadow = {"file", "graphics/uac/units/herodestroyer-s.png", "size",{43, 43},"offset", {0, 0}},
  Animations = "animations-newdoomer", Icon = "icon-hero",
  TileSize = {1, 1}, BoxSize = {30, 45},
  DrawLevel = 40,
  Flip = false, NumDirections = 8,
  Type = "land",
  Impact = {"shell", "missile-red-shell-meat", "melee", "missile-red-melee-meat"},
  -- Properties
  HitPoints = {Value = 100, Max = 200, Increase = 0, Enable = true},
  SightRange = 10, ComputerReactionRange = 30, PersonReactionRange = 0,
  MaxAttackRange = 10,
  Priority = 30,
  Points = 1,
  Demand = 0,
  ShieldPermeability = 100,
  Weapon = {Value = 2, Max = 8, Increase = 0, Enable = true},
  AmmoBullets = {Value = 50, Max = 200, Increase = 0, Enable = true},
  Mana = 0,
  PoisonDrain = 1,
  ShieldPoints = {Value = 0, Max = 200, Increase = 0, Enable = true},
  CanCastSpell = {"spell-newdoomer-prev-weapon", "spell-newdoomer-next-weapon", "spell-newdoomer-select-fists",
	"spell-newdoomer-select-chainsaw", "spell-newdoomer-select-pistol", "spell-newdoomer-select-shotgun",
	"spell-newdoomer-select-ssg", "spell-newdoomer-select-chaingun", "spell-newdoomer-select-rl",
	"spell-newdoomer-select-plasma", "spell-newdoomer-select-bfg", "spell-ai-gotoitem"},
  -- Damage and armor part
  BasicDamage = 1, PiercingDamage = 1, Missile = "missile-shotgun-shot3",
  IsHeavyArmor = 1,

  HeavyArmorDamage2 = 3, -- fists
  HeavyArmorDamage3 = 20, -- chainsaw
  HeavyArmorDamage4 = 8,  -- pistol
  HeavyArmorDamage5 = 5, -- sg
  HeavyArmorDamage6 = 80, -- ssg
  HeavyArmorDamage7 = 100, -- rl
  HeavyArmorDamage8 = 10,  -- plasma
  HeavyArmorDamage9 = 500, -- bfg
  ----------------------
  -- Flags
  DeathMatchDoomer = true,
  UAC = true,  
  CanGroundAttack = true,
  CanTargetLand = true,
  CanTargetAir = true,
  LandUnit = true,
  BigUnit = true,
  Hero = true,
  CanAttack = true,
  ShowArmor = true,
  organic = true,
  SelectableByRectangle = true,
  CanTargetFlag = {"Item", "false"},
  -- Others
  RightMouseAction = "move",
  OnEachCycle = DeathMatchHandleDoomer,
  Sounds = {
	"dead", "extreme","vgavnonah",
	"dead", "fire","marine fire death",
    "dead", "uac marine death"} } )