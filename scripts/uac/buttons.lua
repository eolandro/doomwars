-----------------------------------------
---General buttons-----------------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 0, Icon = "icon-move-uac",
  Action = "move",
  Key = "m", Hint = _("~!Move"), Description = _("Order unit to move to specified location."), Popup = "popup-uac-commands",
  ForUnit = {"unit-medic","unit-hero", "unit-doomer", "unit-technician",
  "unit-chaingunner", "unit-raider", "unit-crusher", "unit-thor", "unit-crusher-upgraded",
  "unit-uac-fighter", "unit-rocketmarine", "unit-sawer",
  "unit-shotgunner",  "unit-ssg", "unit-uac-transport",
  "unit-robotworker", "unit-bfgmarine","unit-plasmamarine",
     "uac-group"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-stop-uac",
  Action = "stop",
  Key = "s", Hint = _("~!Stop"), Description = _("Order unit to stop current action."), Popup = "popup-uac-commands",
  ForUnit = { "unit-medic", "unit-hero", "unit-doomer","unit-technician", "unit-uac-transport",
  "unit-chaingunner", "unit-raider", "unit-crusher", "unit-thor", "unit-crusher-upgraded",
  "unit-rocketmarine", "unit-sawer", "unit-shotgunner",
    "unit-ssg", "unit-robotworker","unit-uac-fighter", "unit-bfgmarine","unit-plasmamarine",
    "unit-chaingun-tower", "unit-missile-tower",
    "uac-group"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-uac-attack",
  Action = "attack",
  Key = "a", Hint = _("~!Attack"), Description = _("Order unit to attack other units or to move and kill any enemy on the way."), Popup = "popup-uac-commands",
  ForUnit = {"unit-medic", "unit-hero", "unit-doomer","unit-technician", "unit-shotgunner", "unit-ssg", "unit-rocketmarine",
  "unit-chaingunner", "unit-sawer", "unit-raider", "unit-crusher", "unit-crusher-upgraded",
	"unit-uac-fighter", "unit-thor", 
	"unit-robotworker", "unit-bfgmarine","unit-plasmamarine",  
    "unit-chaingun-tower", "unit-missile-tower",  "uac-group"} } )

DefineButton( { Pos = 4, Level = 0, Icon = "icon-uac-patrol-land",
  Action = "patrol",
  Key = "p", Hint = _("~!Patrol"), Description = _("Order unit to defend territory between 2 points."), Popup = "popup-uac-commands", 
  ForUnit = {"unit-medic", "unit-hero", "unit-doomer","unit-technician", 
  "unit-chaingunner", "unit-raider", "unit-crusher", "unit-thor", "unit-crusher-upgraded",
	"unit-rocketmarine", "unit-bfgmarine","unit-plasmamarine", "unit-uac-transport",
	"unit-sawer", "unit-shotgunner", "unit-uac-fighter",
    "unit-ssg","uac-group"} } )

DefineButton( { Pos = 5, Level = 0, Icon = "icon-uac-stand-ground",
  Action = "stand-ground",
  Key = "t", Hint = _("S~!tand ground"), Description = _("Order unit not to move and attack enemies in attack range."), Popup = "popup-uac-commands",
  ForUnit = { "unit-medic", "unit-hero", "unit-doomer","unit-bfgmarine10k", "unit-technician",
  "unit-chaingunner", "unit-uac-fighter", "unit-raider", "unit-crusher", "unit-crusher-upgraded",
  "unit-rocketmarine",  "unit-bfgmarine","unit-plasmamarine",
  "unit-sawer", "unit-shotgunner", "unit-thor", "unit-uac-transport",
  "unit-ssg", "uac-group"} } )

DefineButton( { Pos = 6, Level = 0, Icon = "icon-uac-attack-ground",
  Action = "attack-ground",
  Key = "g", Hint = _("Attack ~!ground"), Description = _("Order unit to attack specified location."), Popup = "popup-uac-commands",
  ForUnit = {"unit-bfgmarine", "unit-hero", "unit-rocketmarine", "uac-group"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-units-inside",
  Action = "button", Value = 1, Description = _("Show units inside transporter."), Popup = "popup-uac-commands",
  Key = "u", Hint = _("Show ~!units"), AlwaysShow = true,
  ForUnit = {"unit-uac-transport"} } )

DefineButton( { Pos = 8, Level = 1, Icon = "icon-uac-unload",
  Action = "unload",
  Key = "u", Hint = _("~!Unload"), Description = _("Order unit to unload his passengers on specified location."), Popup = "popup-uac-commands",
  ForUnit = {"unit-uac-transport"} } )

DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-uac-transport"} } )
  
-----------------------------------------
---Worker buttons------------------------
----------------------------------------- 

DefineButton( { Pos = 4, Level = 0, Icon = "icon-repair",
  Action = "repair",
  Key = "r", Hint = _("~!Repair"), Description = _("Order worker to repair damaged structures. The repair cost is 2 minerals and 1 energy per 2 hit points."), Popup = "popup-uac-commands",
  ForUnit = {"unit-robotworker"} } )

DefineButton( { Pos = 5, Level = 0, Icon = "icon-harvest",
  Action = "harvest",
  Key = "c", Hint = _("~!Collect minerals"), Description = _("Order worker to collect minerals from specified mineral patch."), Popup = "popup-uac-commands",
  ForUnit = {"unit-robotworker"} } )

DefineButton( { Pos = 6, Level = 0, Icon = "icon-return-goods-robot",
  Action = "return-goods",
  Key = "g", Hint = _("Return with ~!goods"), Description = _("Order worker to return his cargo into nearest depot."), Popup = "popup-uac-commands",
  ForUnit = {"unit-robotworker"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-build-basic",
  Action = "button", Value = 1, AlwaysShow = true,
  Key = "b", Hint = _("~!Build basic structure"), Description = _("The list of available main buildings."), Popup = "popup-uac-commands",
  ForUnit = {"unit-robotworker"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-build-war",
  Action = "button", Value = 2, AlwaysShow = true,
  Key = "w", Hint = _("Build ~!war structure"), Description = _("The list of available military buildings."), Popup = "popup-uac-commands",
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 9, Level = 0, Icon = "icon-build-defence",
  Action = "button", Value = 3, AlwaysShow = true,
  Key = "d", Hint = _("Build ~!defence structure"), Description = _("The list of available base defence buildings."), Popup = "popup-uac-commands",
  ForUnit = {"unit-robotworker"} } )  
  
-----------------------------------------
---Abilities-----------------------------
----------------------------------------- 
DefineButton( { Pos = 6, Level = 0, Icon = "icon-collect-artifacts",
  Action = "cast-spell", Value = "spell-medic-collect", AlwaysShow = true,
  Key = "c", Hint = _("~!Collect samples"), Description = _("Search a hellish corpse for hellspawn knowledge."), Popup = "popup-uac-ability",
  ForUnit = {"unit-medic"}} )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-heal",
  Action = "cast-spell", Value = "spell-medic-heal", AlwaysShow = true,
  Key = "h", Hint = _("~!Heal"), Description = _("Heal wounded marines (10 HP per cast)."), Popup = "popup-uac-commands",
  ForUnit = {"unit-medic"}} )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-defibrillation",
  Action = "cast-spell", Value = "spell-defibrillation", AlwaysShow = true,
  Allowed = "check-upgrade", AllowArg = {"upgrade-defibrillation"},
  Key = "d", Hint = _("~!Defibrillation"), Description = _("Take an attempt to revive dead marine. The chance of successful revival depends on marine's death time."),
  Popup = "popup-uac-spell",
  ForUnit = {"unit-medic"}} ) 

DefineButton( { Pos = 9, Level = 0, Icon = "icon-injection",
  Action = "cast-spell", Value = "spell-medic-berserk", Description = _("Make a berserk injection into marine. This will double move and attack speeds for 10 seconds."), Popup = "popup-uac-spell",
  Allowed = "check-upgrade", AllowArg = {"upgrade-demon-strength-anomaly"}, AlwaysShow = true,
  Key = "i", Hint = _("Make a berserk ~!injection"), Popup = "popup-uac-spell",
  ForUnit = {"unit-medic"} } )

DefineButton( { Pos = 6, Level = 0, Icon = "icon-repair-armor", AlwaysShow = true,
  Action = "cast-spell", Value = "spell-technician-armor-repair", Popup = "popup-uac-commands",
  Key = "r", Hint = _("Repair a~!rmor"), Description = _("Repair the damaged armor. The repair takes 40 minerals for full armor restoration."),
  ForUnit = {"unit-technician"}} )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-place-mine",
  Action = "cast-spell", Value = "spell-place-mine", Popup = "popup-uac-ability",
  Allowed = "check-unit-variable", AllowArg = {"Mines", "Value", ">", "0"}, AlwaysShow = true,
  Key = "i", Hint = _("Place m~!ine"), Description = _("Place an explosive charge on the ground. Nobody could see the charge except for special detector units. The technician can carry up to 3 mines."),
  ForUnit = {"unit-technician"}} )   

DefineButton( { Pos = 8, Level = 0, Icon = "icon-place-bomb",
  Action = "cast-spell", Value = "spell-place-charge", Popup = "popup-uac-ability",
  Allowed = "check-unit-variable", AllowArg = {"Bombs", "Value", ">", "0"}, AlwaysShow = true,
  Key = "b", Hint = _("Place ~!bomb"), Description = _("Place a big explosive charge near the building, which will blow up in 10 seconds. The charge could be destroyed by enemy without explosion. Could be used only once."),
  ForUnit = {"unit-technician"}} )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-fighter-invisibility",
  Action = "cast-spell", Value = "spell-fighter-invisibility", Popup = "popup-uac-ability",
  Allowed = "check-upgrade", AllowArg = {"upgrade-invisibility-anomaly"}, AlwaysShow = true,
  Key = "d", Hint = _("Use cloaking ~!device"), Description = _("Uses cloaking device on Fighter to make it invisible for all units for 25 seconds. Fighters reveal themselves when opening fire."),
  ForUnit = {"unit-uac-fighter"}} )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-technician-repair", AlwaysShow = true,
  Action = "cast-spell", Value = "spell-technician-repair", Popup = "popup-uac-ability", AlwaysShow = true,
  Key = "r", Hint = _("~!Repair vehicle"), Description = _("Repair the damaged vehicles."),
  ForUnit = {"unit-technician"}} )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-vehicle-repair", AlwaysShow = true,
  Action = "cast-spell", Value = "spell-vehicle-repair", Popup = "popup-uac-spell",
  Key = "p", Hint = _("Re~!pair vehicle"), Description = _("Repair the damaged vehicles."),
  ForUnit = {"unit-vehicle-factory"}} )
  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-radar-eye",
  Action = "cast-spell", Value = "spell-radar-eye", Description = _("Shows up a small piece of map for 10 seconds."), Popup = "popup-uac-superweapon",
  Allowed = "check-upgrade", AllowArg = {"upgrade-radar-eye"}, AlwaysShow = true,
  Key = "e", Hint = _("Radar ~!eye"), CommentSound = "uac select target",
  ForUnit = {"unit-radar"}} )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-radar-research",
  Action = "cast-spell", Value = "spell-radar-research", Description = _("Research Hell building to gain artifact points. The same building cannot be researched twice."),
  Popup = "popup-uac-superweapon",
  Allowed = "check-upgrade", AllowArg = {"upgrade-radar-research"}, AlwaysShow = true,
  Key = "r", Hint = _("Perform Hell building ~!research"), CommentSound = "uac select target",
  ForUnit = {"unit-radar"}} )

DefineButton( { Pos = 1, Level = 0, Icon = "icon-superball",
  Action = "cast-spell", Value = "spell-superball", Description = _("Orders the orbiting satellite to shot with on-board plasma cannon to specified location. The shot causes a big explosion which destroys almost everything."),
  CommentSound = "uac select target",
  Key = "s", Hint = _("~!Orbital attack"), Popup = "popup-uac-superweapon", AlwaysShow = true,
  ForUnit = {"unit-orbital-control"} } )

DefineButton( { Pos = 1, Level = 1, Icon = "icon-superball",
  Action = "cast-spell", Value = "spell-superball-for-ai", Description = _("Orders the orbiting satellite to shot with on-board plasma cannon to specified location. The shot causes a big explosion which destroys almost everything."),
  CommentSound = "uac select target",
  Key = "s", Hint = _("~!Orbital attack"), Popup = "popup-uac-superweapon", AlwaysShow = true,
  ForUnit = {"unit-orbital-control"} } )

DefineButton( { Pos = 1, Level = 3, Icon = "icon-anomaly-life-sphere",
  Action = "cast-spell", Value = "spell-anomaly-life-sphere", AlwaysShow = true,
  Key = "l", Hint = _("~!Life sphere"), Description = _("Increases the maximum HP of marine on 50."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 2, Level = 3, Icon = "icon-anomaly-regen-sphere",
  Action = "cast-spell", Value = "spell-anomaly-regeneration-sphere", AlwaysShow = true,
  Key = "r", Hint = _("~!Regeneration sphere"), Description = _("This sphere regenerates marine's health at a rate 1 HP per second."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 3, Level = 3, Icon = "icon-anomaly-acid-sphere",
  Action = "cast-spell", Value = "spell-anomaly-acid-sphere", AlwaysShow = true,
  Key = "d", Hint = _("Aci~!d Sphere"), Description = _("Every unit who attacked this marine(except buildings) will get 20 acid damage. A maximum damage of 600 points could be dealt, after that sphere destroys itself."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 4, Level = 3, Icon = "icon-anomaly-skull-sphere",
  Action = "cast-spell", Value = "spell-anomaly-skull-sphere", AlwaysShow = true,
  Allowed = "check-units-or", AllowArg = {"unit-advanced-command-center"},
  Key = "k", Hint = _("S~!kull sphere"), Description = _("With skull sphere marine cannot be possessed by Belial or zombified by Pain Elementals, and its corpse cannot be used by Hell to raise zombies."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 5, Level = 3, Icon = "icon-anomaly-corruption-sphere",
  Action = "cast-spell", Value = "spell-anomaly-corruption-sphere", AlwaysShow = true,
  Allowed = "check-units-or", AllowArg = {"unit-advanced-command-center"},
  Key = "c", Hint = _("Sphere of ~!Corruption"), Description = _("All monsters around unit will get 15 damage per second. A maximum damage of 600 points could be dealt, after that sphere destroys itself."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 6, Level = 3, Icon = "icon-anomaly-vampirism-sphere",
  Action = "cast-spell", Value = "spell-anomaly-vampirism-sphere", AlwaysShow = true,
  Allowed = "check-units-or", AllowArg = {"unit-advanced-command-center"},
  Key = "v", Hint = _("~!Vampirism Sphere"), Description = _("Marine heals itself if attack enemy. Maximum 200 HP could be healed, after that sphere destroys itself."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 7, Level = 3, Icon = "icon-anomaly-absolute-sphere",
  Action = "cast-spell", Value = "spell-anomaly-absolute-defence-sphere", AlwaysShow = true,
  Allowed = "check-units-or", AllowArg = {"unit-advanced-command-center"},
  Key = "a", Hint = _("Sphere of ~!Absolute Defence"), Description = _("When you marine gets attacked, he will become invulnerable for 10 seconds."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 8, Level = 3, Icon = "icon-anomaly-shield-sphere",
  Action = "cast-spell", Value = "spell-anomaly-shield-sphere", AlwaysShow = true,
  Allowed = "check-units-or", AllowArg = {"unit-advanced-command-center"},
  Key = "s", Hint = _("~!Shield sphere"), Description = _("Your marine gets a powerful shield sphere, which gives to him a demonic armor with 120 shield points."), Popup = "popup-uac-spell",
  ForUnit = {"unit-tech-center"}} )

DefineButton( { Pos = 9, Level = 3, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-tech-center"} } )


---Doomer abilites-----------------------
-----------------------------------------  

DefineButton( { Pos = 7, Level = 0, Icon = "icon-doomer-weapons",
  Action = "button", Value = 1, Description = _("Weapons list."), Popup = "popup-uac-commands",
  Key = "w", Hint = _("Show ~!weapons"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 1, Level = 1, Icon = "icon-hero-melee",
  Action = "cast-spell", Value = "spell-hero-melee", Description = _("Doomer uses mighty punch against his enemies."), Popup = "popup-uac-commands",
  Key = "m", Hint = _("Use ~!melee attack"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 2, Level = 1, Icon = "icon-hero-rl",
  Action = "cast-spell", Value = "spell-hero-select-rl", Description = _("Select the rocket launcher. Good against buildings and air monsters."),
  Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"Weapon", "Value", "!=", "1"},
  Key = "r", Hint = _("Select ~!rocket launcher"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )
  
DefineButton( { Pos = 3, Level = 1, Icon = "icon-hero-quad",
  Action = "cast-spell", Value = "spell-hero-select-quad", Description = _("Select the quad-barrelled shotgun. Good against any moving flesh."),
  Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"Weapon", "Value", "!=", "0"},
  Key = "q", Hint = _("Select ~!quad shotgun"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 4, Level = 1, Icon = "icon-doomer-unmaker",
  Action = "cast-spell", Value = "spell-hero-select-unmaker", Description = _("Select the Unmaker - the ultimate weapon against Hellspawn ever made."), 
  Popup = "popup-uac-ability",
  Allowed = "check-unit-variable", AllowArg = {"Weapon", "Value", "!=", "2"},
  Key = "u", Hint = _("Select ~!Unmaker"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 5, Level = 1, Icon = "icon-hero-bfg",
  Action = "cast-spell", Value = "spell-hero-bfg", Description = _("Fire a single BFG shot to specified location."),
  Key = "b", Hint = _("Fire from ~!BFG"), Popup = "popup-uac-spell", AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-artifacts",
  Action = "button", Value = 2, Popup = "popup-uac-commands", Description = _("List of available artefacts Doomer could use."),
  Key = "r", Hint = _("~!A~!rtifacts"),
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 1, Level = 2, Icon = "icon-hero-soulsphere",
  Action = "cast-spell", Value = "spell-hero-soulsphere", Description = _("Doomer uses soulsphere. This rejuvenates all health."), Popup = "popup-uac-commands",
  Key = "s", Hint = _("Use ~!Soulsphere"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 2, Level = 2, Icon = "icon-hero-invisibility",
  Action = "cast-spell", Value = "spell-hero-invisibility", Description = _("Doomer uses Invisibility sphere, becoming invisible for 30 seconds. The sphere achieves extra 10 seconds with each Doomer's level."), Popup = "popup-uac-commands",
  Key = "i", Hint = _("Use ~!Invisibility sphere"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 3, Level = 2, Icon = "icon-hero-doomsphere",
  Action = "cast-spell", Value = "spell-hero-doomsphere", Description = _("Doomer uses Doom sphere. This doubles all damage done to targets for 10 seconds. The sphere achieves extra 5 seconds with each Doomer's level."), Popup = "popup-uac-commands",
  Key = "d", Hint = _("Use ~!Doom Sphere"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 4, Level = 2, Icon = "icon-hero-invulnerability",
  Action = "cast-spell", Value = "spell-hero-invulnerability", Description = _("Doomer uses Invulnerability sphere, becoming invulnerable for 10 seconds. The sphere achieves extra 5 seconds with each Doomer's level."), Popup = "popup-uac-commands",
  Key = "i", Hint = _("Use ~!Invulnerability sphere"), AlwaysShow = true,
  ForUnit = {"unit-hero"} } )

DefineButton( { Pos = 9, Level = 2, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-hero"} } )

-----------------------------------------
---Basic structures----------------------
-----------------------------------------  

DefineButton( { Pos = 1, Level = 1, Icon = "icon-command-center", AlwaysShow = true,
  Action = "build", Value = "unit-command-center",  Description = _("UAC main building. You can build workers and train Doomer marine here."),
  Key = "c", Hint = _("Build UAC command ~!center"), Popup = "popup-uac-building",
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 2, Level = 1, Icon = "icon-power-plant",
  Action = "build", Value = "unit-power-plant", AlwaysShow = true,
  Key = "p", Hint = _("Build ~!power plant"), Description = _("Produces energy. The more power plants you build, the quicker energy will be produced."), Popup = "popup-uac-building",
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 3, Level = 1, Icon = "icon-supply-depot",
  Action = "build", Value = "unit-supply-depot", AlwaysShow = true,
  Key = "s", Hint = _("Build ~!supply depot"), Description = _("Increases the limit of units which could be created."), Popup = "popup-uac-building",
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 4, Level = 1, Icon = "icon-radar",
  Action = "build", Value = "unit-radar", AlwaysShow = true,
  Key = "r", Hint = _("Build ~!radar"), Description = _("Shows a big map area around it, also it can show up a random map location for some time after upgrade in Tech Center."), Popup = "popup-uac-building",
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 5, Level = 1, Icon = "icon-tech-center",
  Action = "build", Value = "unit-tech-center", AlwaysShow = true,
  Key = "t", Hint = _("Build ~!tech center"), Description = _("Provides access for hi-tech units and new technologies."), Popup = "popup-uac-building",
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 6, Level = 1, Icon = "icon-thermo-plant",
  Action = "build", Value = "unit-thermo-power-plant", AlwaysShow = true,
  Key = "n", Hint = _("Build ~!nuclear power plant"), Description = _("Produces a lot of energy, but this type of plants could explode if destroyed."), Popup = "popup-uac-building",
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-robotworker"} } )
  
-----------------------------------------
---War structures------------------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 2, Icon = "icon-barracks",
  Action = "build", Value = "unit-barracks", Description = _("The place where UAC marines are getting ready for battle."),
  Key = "b", Hint = _("Build UAC ~!barracks"), Popup = "popup-uac-building", AlwaysShow = true,
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 2, Level = 2, Icon = "icon-weapon-factory",
  Action = "build", Value = "unit-weapon-factory", Description = _("Allows you to upgrade abilities of units."),
  Key = "f", Hint = _("Build weapon ~!factory"), Popup = "popup-uac-building", AlwaysShow = true,
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 3, Level = 2, Icon = "icon-vehicle-factory",
  Action = "build", Value = "unit-vehicle-factory", Description = _("Here you can build UAC vehicles and repair them."),
  Key = "v", Hint = _("Build ~!vehicle factory"), Popup = "popup-uac-building", AlwaysShow = true,
  ForUnit = {"unit-robotworker"} } )

DefineButton( { Pos = 4, Level = 2, Icon = "icon-orbital-control",
  Action = "build", Value = "unit-orbital-control", Description = _("Provides access to orbiting satellite armed with big plasma cannon."),
  Key = "o", Hint = _("Build ~!orbital control"), Popup = "popup-uac-building", AlwaysShow = true,
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 9, Level = 2, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", Description = _("Back to previous menu."),
  Key = "ESC", Hint = _("~<ESC~> Cancel"),
  ForUnit = {"unit-robotworker"} } )
  
-----------------------------------------
---Defence structures--------------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 3, Icon = "icon-uac-wall",
  Action = "build", Value = "unit-uac-wall", Description = _("Passive defence, this can stop the enemy invasion to your base. Walls have an ability to block the most of missiles passing over them."),
  Key = "w", Hint = _("Build ~!wall"), Popup = "popup-uac-building", AlwaysShow = true,
  ForUnit = {"unit-robotworker"} } )  
  
DefineButton( { Pos = 2, Level = 3, Icon = "icon-chaingun-tower",
  Action = "build", Value = "unit-chaingun-tower", Description = _("Defence turret with minigun. Good against small enemy troops and air units."),
  Key = "c", Hint = _("Build ~!chaingun turret"), Popup = "popup-uac-attack-building", AlwaysShow = true,
  ForUnit = {"unit-robotworker"} } )
  
DefineButton( { Pos = 3, Level = 3, Icon = "icon-rocket-tower",
  Action = "build", Value = "unit-missile-tower", Description = _("Defence turret with missile launcher. Good against enemy's strong units."),
  Key = "m", Hint = _("Build ~!missile turret"), Popup = "popup-uac-attack-building", AlwaysShow = true,
  ForUnit = {"unit-robotworker"} } )

DefineButton( { Pos = 9, Level = 3, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", Description = _("Back to previous menu."),
  Key = "ESC", Hint = _("~<ESC~> Cancel"),
  ForUnit = {"unit-robotworker"} } )

-----------------------------------------
---Command Center------------------------
-----------------------------------------   

DefineButton( { Pos = 1, Level = 0, Icon = "icon-robotworker",
  Action = "train-unit", Value = "unit-robotworker", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "w", Hint = _("Build ~!worker robot"), Description = _("UAC's Main worker. Can build buildings, repair damaged ones, collect minerals, armed with small plasma cutter."),
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-hero",
  Action = "train-unit", Value = "unit-hero", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "d", Hint = _("Train ~!Doomer"), Description = _("The hero marine, which survived in first Hell invasion and successfully droved out Hell from Earth."),
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

-- DefineButton( { Pos = 4, Level = 0, Icon = "icon-uac-building-upgrades",
  -- Action = "button", Value = 1, Popup = "popup-uac-commands", AlwaysShow = true,
  -- Key = "b", Hint = _("~!Building upgrades"), Description = _("List of available upgrades for buildings."),
  -- Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  -- ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-uac-building-armor1",
  Action = "research", Value = "upgrade-uac-building-armor1", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Description = _("Increases the hit points of buildings by 150, also increases the hit points of turrets and walls by 45."),
  Key = "b", Hint = _("Upgrade ~!building armor"),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )
  
DefineButton( { Pos = 3, Level = 0, Icon = "icon-uac-building-armor2",
  Action = "research", Value = "upgrade-uac-building-armor2", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Description = _("Increases the hit points of buildings by 200, also increases the hit points of turrets and walls by 55."),
  Key = "b", Hint = _("Upgrade ~!building armor"),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 5, Level = 0, Icon = "icon-uac-trading",
  Action = "cast-spell", Value = "spell-enable-trade", Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "t", Hint = _("~!Toggle ~!trading mode"), Description = _("Toggles trading mode for command center."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-command-center-advanced",
  Action = "upgrade-to", Value = "unit-advanced-command-center", Popup = "popup-uac-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Key = "u", Hint = _("~!Upgrade to advanced Command Center"), Description = _("Upgrade Command Center to Advanced Command Center. This upgrade provide access to the newest technologies of UAC research and adds 20 percents to mineral producing."),
  ForUnit = {"unit-command-center"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-harvest",
  Action = "harvest", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Key = "c", Hint = _("Set ~!collect minerals"), Description = _("Sets the point where workers can collect minerals, so the new workers will automatically go there and collect minerals."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )


---Trading menu--------------------------
-----------------------------------------  

DefineButton( { Pos = 1, Level = 0, Icon = "icon-uac-prev-player",
  Action = "cast-spell", Value = "spell-trading-prev-player", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "p", Hint = _("~!Previous player"), Description = _("Select previous player in list."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-uac-next-player",
  Action = "cast-spell", Value = "spell-trading-next-player", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "n", Hint = _("~!Next player"), Description = _("Select next player in list."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-uac-decrease-min",
  Action = "cast-spell", Value = "spell-trading-dec-min", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "d", Hint = _("~!Decrease minerals"), Description = _("Decrease minerals to transfer by 250."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-uac-increase-min",
  Action = "cast-spell", Value = "spell-trading-inc-min", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "i", Hint = _("~!Increase minerals"), Description = _("Increase minerals to transfer by 250."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-uac-decrease-eng",
  Action = "cast-spell", Value = "spell-trading-dec-eng", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "e", Hint = _("D~!ecrease energy"), Description = _("Decrease energy to transfer by 250."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-uac-increase-eng",
  Action = "cast-spell", Value = "spell-trading-inc-eng", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "r", Hint = _("Inc~!rease energy"), Description = _("Increase energy to transfer by 250."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

DefineButton( { Pos = 4, Level = 0, Icon = "icon-uac-commit",
  Action = "cast-spell", Value = "spell-trading-commit", Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "c", Hint = _("~!Commit operation"), Description = _("Transfer resources to another player."),
  ForUnit = {"unit-command-center", "unit-advanced-command-center"} } )

-----------------------------------------
---UAC Barracks--------------------------
-----------------------------------------  
  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-shotgunner",
  Action = "train-unit", Value = "unit-shotgunner", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "g", Hint = _("Train shot~!gunner"), Description = _("The main forces of UAC, shotgunners are best against any monsters. They could be upgraded to supershotgunners."),
  ForUnit = {"unit-barracks"} } )
  
DefineButton( { Pos = 2, Level = 0, Icon = "icon-technician",
  Action = "train-unit", Value = "unit-technician", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "t", Hint = _("Train ~!technician"), Description = _("Technicians are armed with grenade launcher and are able to repair damaged armor and vehicles. They could be upgraded to place mines and explosive charges."),
  ForUnit = {"unit-barracks"} } )
  
DefineButton( { Pos = 2, Level = 8, Icon = "icon-shotgunner",
  Action = "train-unit", Value = "unit-ssg", 
  Key = "g", Hint = "SUPER SHOT~!GUNNER",
  ForUnit = {"unit-barracks"} } )
  
DefineButton( { Pos = 3, Level = 0, Icon = "icon-sawmarine",
  Action = "train-unit", Value = "unit-sawer", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "w", Hint = _("Train berserker"), Description = _("Berserkers are extremely fast kamikaze marines. They are best against slow enemy units."),
  ForUnit = {"unit-barracks"} } )

DefineButton( { Pos = 4, Level = 0, Icon = "icon-chaingunner",
  Action = "train-unit", Value = "unit-chaingunner", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "c", Hint = _("Train ~!chaingun trooper"), Description = _("The chaingun troopers are extremely powerful against light armored forces and air units, but they are weak against heavy armored enemies."),
  ForUnit = {"unit-barracks"} } )

DefineButton( { Pos = 5, Level = 0, Icon = "icon-medic",
  Action = "train-unit", Value = "unit-medic", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "m", Hint = _("Train combat ~!medic"), Description = _("Combat medics can heal wounded marines on the battlefield. They could be upgraded to revive dead marines on battlefield and to haste marines using berserk injections."),
  ForUnit = {"unit-barracks"} } )

DefineButton( { Pos = 6, Level = 0, Icon = "icon-rockeyguy",
  Action = "train-unit", Value = "unit-rocketmarine", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "r", Hint = _("Train ~!rocket launcher trooper"), Description = _("Rocket launcher troopers are good against armored units, air units and buildings, though it's a bad idea to use them without coverage."),
  ForUnit = {"unit-barracks"} } )
  
DefineButton( { Pos = 7, Level = 0, Icon = "icon-plasmamarine",
  Action = "train-unit", Value = "unit-plasmamarine", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "h", Hint = _("Train ~!heavy trooper"), Description = _("Heavy troopers are well trained marines armed with plasma guns and they are deadly against any enemies, except for air units."),
  ForUnit = {"unit-barracks"} } )
 
DefineButton( { Pos = 8, Level = 0, Icon = "icon-bfgmarine",
  Action = "train-unit", Value = "unit-bfgmarine", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "b", Hint = _("Train ~!commando"), Description = _("The commandos are the best solution against hordes of enemies, they could clean them out in couple of shots."),
  ForUnit = {"unit-barracks"} } )
  
-----------------------------------------
---Vehicle factory-----------------------
-----------------------------------------  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-raider",
  Action = "train-unit", Value = "unit-raider", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "r", Hint = _("Build ~!raider"), Description = _("The Raiders are useful to cover infantry from enemy fire, they are armed with 2 laser cannons, which are useful against any enemies."),
  ForUnit = {"unit-vehicle-factory"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-crusher",
  Action = "train-unit", Value = "unit-crusher", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "c", Hint = _("Build ~!crusher"), Description = _("The Crushers are the best for their armor so they could be used to take over enemy fire. They could be upgraded to install a missile launcher on them."),
  ForUnit = {"unit-vehicle-factory"} } )
  
DefineButton( { Pos = 2, Level = 7, Icon = "icon-crusher",
  Action = "train-unit", Value = "unit-crusher-upgraded", Popup = "popup-uac-unit",
  Key = "c", Hint = _("Build ~!crusher"),
  ForUnit = {"unit-vehicle-factory"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-thor",
  Action = "train-unit", Value = "unit-thor", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "t", Hint = _("Build ~!Thor"), Description = _("Thor is a extremely powerful tank armed with railgun, which can damage several enemies in single shot."),
  ForUnit = {"unit-vehicle-factory"} } ) 

DefineButton( { Pos = 4, Level = 0, Icon = "icon-uac-plane",
  Action = "train-unit", Value = "unit-uac-fighter", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "f", Hint = _("Build ~!fighter"), Description = _("The Fighters are good for map exploration and destroying enemy's air units."),
  ForUnit = {"unit-vehicle-factory"} } ) 
  
DefineButton( { Pos = 5, Level = 0, Icon = "icon-uac-transport",
  Action = "train-unit", Value = "unit-uac-transport", Popup = "popup-uac-unit", AlwaysShow = true,
  Key = "n", Hint = _("Build tra~!nsport"), Description = _("The transports could take 6 infantry units or 6 raiders or 3 crushers or 2 Thors on board and transport them to other place."),
  ForUnit = {"unit-vehicle-factory"} } )

-----------------------------------------
---Upgrades------------------------------
-----------------------------------------    

DefineButton( { Pos = 1, Level = 0, Icon = "icon-infantry-upgrades",
  Action = "button", Value = 1, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "w", Hint = _("~!Weapon upgrades"), Description = _("List of available upgrades for weapons."),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 2, Level = 0, Icon = "icon-unit-specific",
  Action = "button", Value = 2, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "u", Hint = _("~!Unit-specific upgrades"), Description = _("List of available specific upgrades for units."),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 3, Level = 0, Icon = "icon-tech-defence-upgrades", AlwaysShow = true,
  Action = "button", Value = 3, Popup = "popup-uac-commands", Description = _("List of available upgrades for armor and sight range."),
  Key = "t", Hint = _("~!Tech and defence upgrades"),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 9, Level = 2, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 9, Level = 3, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-weapon-factory"} } )
  
---Infantry weapon ungrades---------------------
-----------------------------------------   
DefineButton( { Pos = 1, Level = 1, Icon = "icon-shotgun",
  Action = "research", Value = "upgrade-shotguns", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the shotgun's damage by 20 percents."),
  Key = "s", Hint = _("Upgrade ~!shotguns"),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 2, Level = 1, Icon = "icon-upgrade-bullet",
  Action = "research", Value = "upgrade-bullet-weapons", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done using bullet weapons by 15 percents."),
  Key = "b", Hint = _("Upgrade ~!bullet weapons"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 3, Level = 1, Icon = "icon-chainsaw",
  Action = "research", Value = "upgrade-chainsaw", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done using chainsaws by 20 percents."),
  Key = "c", Hint = _("Upgrade ~!chainsaws"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 4, Level = 1, Icon = "icon-upgrade-explosive",
  Action = "research", Value = "upgrade-explosive-weapons", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done using explosive weapons by 20 percents."),
  Key = "e", Hint = _("Upgrade ~!explosive weapons"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 5, Level = 1, Icon = "icon-upgrade-infantry-energy",
  Action = "research", Value = "upgrade-infantry-energy", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done using infantry energy weapons by 20 percents."),
  Key = "i", Hint = _("Upgrade ~!infantry energy weapons"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 6, Level = 1, Icon = "icon-upgrade-vehicle-energy",
  Action = "research", Value = "upgrade-vehicle-energy", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done using vehicle energy weapons by 20 percents."),
  Key = "v", Hint = _("Upgrade ~!vehicle energy weapons"),
  ForUnit = {"unit-weapon-factory"} } )

---Unit specific upgrades----------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 2, Icon = "icon-grenade-launcher-range",
  Action = "research", Value = "upgrade-grenade-launcher-range", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the grenade launcher's attack range by 3."),
  Key = "r", Hint = _("Upgrade grenade launcher ~!range"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 2, Level = 2, Icon = "icon-technician-tools",
  Action = "research", Value = "upgrade-technician-tools", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Allows technician to place mines and explosive charges."),
  Key = "t", Hint = _("Research ~!technician mining tools"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 3, Level = 2, Icon = "icon-chaingun-accuracy",
  Action = "research", Value = "upgrade-chaingun-accuracy", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the chaingun's attack range by 1, precision by 20 percents, damage against air targets by 33 percents."),
  Key = "c", Hint = _("Upgrade ~!chaingun accuracy"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 4, Level = 2, Icon = "icon-long-ranged-missile",
  Action = "research", Value = "upgrade-long-ranged-missile", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the rocket launcher's attack range by 2."),
  Key = "l", Hint = _("Research ~!long-ranged missiles"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 5, Level = 2, Icon = "icon-research-defibrillation",
  Action = "research", Value = "upgrade-defibrillation", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Allows medic to revive dead marines back to life."),
  Key = "d", Hint = _("Research ~!defibrillation"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 6, Level = 2, Icon = "icon-fighter-shield",
  Action = "research", Value = "upgrade-fighter-shield", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Adds 60 shield points for Fighters."),
  Key = "f", Hint = _("Research ~!fighter shield"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 7, Level = 2, Icon = "icon-upgrade-crusher",
  Action = "research", Value = "upgrade-crusher", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Allows to install a missile launcher on crushers, this will increase unit's overall damage and will allow it to attack air targets."),
  Key = "m", Hint = _("Research crusher's ~!missile launcher"),
  ForUnit = {"unit-weapon-factory"} } )

---Tech and defence upgrades-------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 3, Icon = "icon-armor1",
  Action = "research", Value = "upgrade-armor1", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increase infantry armor points by 15 and it's damage protection ability on 5 percents."),
  Key = "a", Hint = _("Upgrade marines ~!armor"),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 1, Level = 3, Icon = "icon-armor2",
  Action = "research", Value = "upgrade-armor2", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increase infantry armor points by 15 and it's damage protection ability on 5 percents."),
  Key = "a", Hint = _("Research Mega~!armor"),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 1, Level = 3, Icon = "icon-armor3", 
  Action = "research", Value = "upgrade-armor3", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increase infantry armor points by 20 and it's damage protection ability on 5 percents."),
  Key = "a", Hint = _("Research marine ultra protection ~!armor"),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 2, Level = 3, Icon = "icon-visors",
  Action = "research", Value = "upgrade-visors", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases sight range of units by 2."),
  Key = "v", Hint = _("Research light amplification ~!visors"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 3, Level = 3, Icon = "icon-uac-mech-armor1",
  Action = "research", Value = "upgrade-uac-mech-armor1", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the vehicle's hit points by 20."),
  Key = "a", Hint = _("Upgrade vehicle ~!armor"),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 3, Level = 3, Icon = "icon-uac-mech-armor2",
  Action = "research", Value = "upgrade-uac-mech-armor2", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the vehicle's hit points by 25."),
  Key = "a", Hint = _("Upgrade vehicle ~!armor"),
  ForUnit = {"unit-weapon-factory"} } )
  
DefineButton( { Pos = 3, Level = 3, Icon = "icon-uac-mech-armor3",
  Action = "research", Value = "upgrade-uac-mech-armor3", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the vehicle's hit points by 30."),
  Key = "a", Hint = _("Upgrade vehicle ~!armor"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 4, Level = 3, Icon = "icon-vehicle-attack-range",
  Action = "research", Value = "upgrade-vehicle-attack-range", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the vehicle's attack range by 1."),
  Key = "n", Hint = _("Upgrade vehicle attack ra~!nge"),
  ForUnit = {"unit-weapon-factory"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-supershotgun",
  Action = "upgrade-to", Value = "unit-ssg", Popup = "popup-uac-unit", AlwaysShow = true,
  Description = _("Upgrade the Shotgunner to Super Shotgunner. Super Shotgunners are specially trained to have a deal with any kind of monsters: their attack can confuse enemy, seriously decreasing targeting precision."),
  Key = "u", Hint = _("~!Upgrade to super shotgunner"),
  ForUnit = {"unit-shotgunner"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-crusher-upgraded",
  Action = "upgrade-to", Value = "unit-crusher-upgraded", Popup = "popup-uac-unit", AlwaysShow = true,
  Description = _("Installs a missile launcher on Crusher."),
  Key = "i", Hint = _("~!Install a missile launcher"),
  ForUnit = {"unit-crusher"} } )

---Tech center---------------------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 0, Icon = "icon-building-research",
  Action = "button", Value = 1, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "b", Hint = _("~!Building upgrades"), Description = _("List of available upgrades for buildings."),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-anomaly-research",
  Action = "button", Value = 2, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "d", Hint = _("~!Demonic technology research"), Description = _("List of demonic technologies available for researching."),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-spheres-research",
  Action = "button", Value = 3, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "e", Hint = _("~!Demonic ~!essences research"), Description = _("List of available pure essence spheres, which could be used to increase abilities of your infantry."),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 9, Level = 2, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-uac-commands", AlwaysShow = true,
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 1, Level = 1, Icon = "icon-radar-eye",
  Action = "research", Value = "upgrade-radar-eye", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Allows the radar to show random location on map every 2 minutes."),
  Key = "e", Hint = _("Research radar ~!eye"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 2, Level = 1, Icon = "icon-upgrade-radar-research",
  Action = "research", Value = "upgrade-radar-research", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Allows player to research hellish buildings using radars to achieve artifact points."),
  Key = "h", Hint = _("~!Hell anomalies radar research"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 3, Level = 1, Icon = "icon-building-shield",
  Action = "research", Value = "upgrade-building-shield", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Installs a shield generator into all buildings."),
  Key = "b", Hint = _("Research ~!building shield"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 4, Level = 1, Icon = "icon-tower-shield",
  Action = "research", Value = "upgrade-tower-shield", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Installs a shield generator into all towers."),
  Key = "t", Hint = _("Research ~!turret shield"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 1, Level = 2, Icon = "icon-flesh-weakness",
  Action = "research", Value = "upgrade-flesh-weakness", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done to demons covered with light flesh by 15 percents."),
  Key = "f", Hint = _("Research ~!flesh weakness"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 2, Level = 2, Icon = "icon-heavy-flesh-weakness",
  Action = "research", Value = "upgrade-heavy-flesh-weakness", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done to demons covered with heavy flesh by 15 percents."),
  Key = "h", Hint = _("Research ~!heavy flesh weakness"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 3, Level = 2, Icon = "icon-levitation-anomaly",
  Action = "research", Value = "upgrade-levitation-anomaly", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the damage done to floating demons by 15 percents."),
  Key = "l", Hint = _("Research ~!levitation anomaly"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 4, Level = 2, Icon = "icon-inferno-anomaly",
  Action = "research", Value = "upgrade-inferno-anomaly", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Increases the output power of energy generators."),
  Key = "i", Hint = _("Research ~!inferno anomaly"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 5, Level = 2, Icon = "icon-torture-anomaly",
  Action = "research", Value = "upgrade-torture-anomaly", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Allows Doomer to use ultimate Unmaker weapon against demons."),
  Key = "t", Hint = _("Research ~!torture anomaly"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 6, Level = 2, Icon = "icon-demon-strength-anomaly",
  Action = "research", Value = "upgrade-demon-strength-anomaly", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Allows medic to make berserk injections into marines, increasing their speed."),
  Key = "d", Hint = _("Research ~!demon strength anomaly"),
  ForUnit = {"unit-tech-center"} } )

DefineButton( { Pos = 7, Level = 2, Icon = "icon-invisibility-anomaly",
  Action = "research", Value = "upgrade-invisibility-anomaly", Popup = "popup-uac-upgrade", AlwaysShow = true,
  Allowed = "check-single-research", Description = _("Installs a cloaking device on fighters, allowing them to become invisible for 25 seconds. No one can see them, even the detector units, but Fighters reveal themselves when opening fire."),
  Key = "v", Hint = _("Research in~!visibility anomaly"),
  ForUnit = {"unit-tech-center"} } )