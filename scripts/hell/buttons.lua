-----------------------------------------
---General buttons-----------------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 0, Icon = "icon-move-hell",
  Action = "move",
  Key = "m", Hint = _("~!Move"), Popup = "popup-hell-commands", Description = _("Order unit to move to specified location."),
  ForUnit = {"unit-zombieman", "unit-demon", "unit-spectre", "unit-archvile", "unit-phantom", "unit-new-phantom", "unit-heavy-dude", "unit-sergeant","unit-imp", 
    "unit-cyberdemon","unit-cacodemon", "unit-belial", "unit-advanced-lostsoul", "unit-blood-demon", "unit-zombie-technician",
	"unit-devil", "unit-zombie-bfg", "unit-zombie-plasma", "unit-zombie-rocket", "unit-zombie-saw", "unit-zombie-ssg", "unit-cacolich",
	"unit-baron", "unit-hellknight", "unit-revenant","unit-arachnotron", "unit-mancubus", "unit-lostsoul", "unit-painelemental",
    "unit-archvile",  "unit-spiderdemon","hell-group"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-hell-stop",
  Action = "stop",
  Key = "s", Hint = _("~!Stop"), Description = _("Order unit to stop current action."), Popup = "popup-hell-commands",
  ForUnit = {"unit-zombieman", "unit-demon", "unit-spectre", "unit-archvile", "unit-phantom", "unit-new-phantom", "unit-heavy-dude", "unit-sergeant","unit-imp", "unit-zombie-technician",
    "unit-cyberdemon","unit-cacodemon",   "unit-belial",   "unit-fire-tower", "unit-upgraded-fire-tower", "unit-horror-tower",  "unit-cacolich",
	"unit-baron", "unit-hellknight", "unit-revenant","unit-arachnotron", "unit-mancubus", "unit-lostsoul", "unit-painelemental",
	"unit-devil", "unit-zombie-bfg", "unit-zombie-plasma", "unit-zombie-rocket", "unit-zombie-saw", "unit-zombie-ssg", "unit-blood-demon",
    "unit-archvile", "unit-spiderdemon","unit-advanced-lostsoul", "hell-group"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-hell-attack",
  Action = "attack",
  Key = "a", Hint = _("~!Attack"), Description = _("Order unit to attack other units or to move and kill any enemy on the way."), Popup = "popup-hell-commands",
  ForUnit = {"unit-zombieman", "unit-demon", "unit-spectre", "unit-archvile", "unit-sergeant","unit-imp", "unit-cyberdemon","unit-cacodemon", "unit-zombie-technician",
	"unit-baron", "unit-hellknight",  "unit-revenant","unit-arachnotron", "unit-mancubus", "unit-heavy-dude", "unit-blood-demon",  "unit-cacolich",
    "unit-lostsoul", "unit-painelemental", "unit-phantom", "unit-belial",  "unit-fire-tower", "unit-upgraded-fire-tower", "unit-horror-tower",
	"unit-devil", "unit-zombie-bfg", "unit-zombie-plasma", "unit-zombie-rocket", "unit-zombie-saw", "unit-zombie-ssg", "unit-new-phantom",
    "unit-spiderdemon",  "unit-advanced-lostsoul", "hell-group"} } )

DefineButton( { Pos = 4, Level = 0, Icon = "icon-hell-patrol-land",
  Action = "patrol",
  Key = "p", Hint = _("~!Patrol"), Description = _("Order unit to defend the territory between 2 points."), Popup = "popup-hell-commands",
  ForUnit = {"unit-zombieman", "unit-demon", "unit-spectre", "unit-archvile",  "unit-heavy-dude", "unit-sergeant","unit-imp", "unit-cyberdemon",
	"unit-cacodemon", "unit-hellknight",  "unit-baron", "unit-revenant","unit-arachnotron", "unit-mancubus", "unit-blood-demon",  "unit-cacolich",
	"unit-devil", "unit-zombie-bfg", "unit-zombie-plasma", "unit-zombie-rocket", "unit-zombie-saw", "unit-zombie-ssg", "unit-zombie-technician", "unit-new-phantom",
    "unit-belial", "unit-phantom", "unit-spiderdemon", "hell-group"} } )

DefineButton( { Pos = 5, Level = 0, Icon = "icon-hell-stand-ground",
  Action = "stand-ground",
  Key = "t", Hint = _("S~!tand ground"), Description = _("Order unit not to move and attack enemies in attack range."), Popup = "popup-hell-commands",
  ForUnit = {"unit-zombieman", "unit-demon", "unit-spectre", "unit-archvile",  "unit-heavy-dude", "unit-sergeant","unit-imp", "unit-cyberdemon", "unit-new-phantom",
	"unit-cacodemon", "unit-hellknight", "unit-baron", "unit-revenant","unit-arachnotron", "unit-mancubus", "unit-zombie-ssg", "unit-zombie-technician",
    "unit-belial", "unit-zombie-bfg", "unit-zombie-plasma", "unit-zombie-rocket", "unit-zombie-saw", "unit-devil", "unit-blood-demon",  "unit-cacolich",
    "unit-phantom",  "unit-spiderdemon",
    "hell-group"} } )

DefineButton( { Pos = 6, Level = 0, Icon = "icon-hell-attack-ground",
  Action = "attack-ground", Popup = "popup-hell-commands",
  Key = "g", Hint = _("Attack ~!ground"), Description = _("Order unit to attack specified location."),
  ForUnit = {"unit-mancubus", "unit-cyberdemon", "unit-zombie-bfg", "unit-zombie-rocket", "hell-group"} } )
  
DefineButton( { Pos = 9, Level = 0, Icon = "icon-hell-unload",
  Action = "unload", Popup = "popup-hell-commands",
  Key = "u", Hint = _("~!Unload"), Description = _("Order Pain Elemental to unload it's souls on specified location."),
  ForUnit = {"unit-painelemental"} } )
 
-----------------------------------------
---Worker buttons------------------------
-----------------------------------------  
  
DefineButton( { Pos = 4, Level = 0, Icon = "icon-repair",
  Action = "repair", Popup = "popup-hell-commands",
  Key = "r", Hint = _("~!Repair"), Description = _("Order lost soul to repair damaged structures. The repair cost is 2 minerals and 1 energy per 2 hit points."),
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 5, Level = 0, Icon = "icon-harvest-hell",
  Action = "harvest", Description = _("Order lost soul to collect minerals from specified mineral patch."),
  Key = "c", Hint = _("~!Collect minerals"), Popup = "popup-hell-commands",
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 6, Level = 0, Icon = "icon-return-goods-soul",
  Action = "return-goods", Description = _("Order lost soul to return his gained energy into nearest depot."),
  Key = "g", Hint = _("Return with ~!goods"), Popup = "popup-hell-commands",
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-build-basic-hell",
  Action = "button", Value = 1, Popup = "popup-hell-commands", AlwaysShow = true,
  Key = "b", Hint = _("~!Build basic structure"), Description = _("The list of available main buildings."),
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-build-war-hell",
  Action = "button", Value = 2, Description = _("The list of available hellspawn buildings."),
  Key = "w", Hint = _("Build ~!war structure"), Popup = "popup-hell-commands", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
DefineButton( { Pos = 9, Level = 0, Icon = "icon-build-defence-hell",
  Action = "button", Value = 3, Description = _("The list of available base defence buildings."),
  Key = "d", Hint = _("Build ~!defence structure"), Popup = "popup-hell-commands", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

-----------------------------------------
---Abilities-----------------------------
-----------------------------------------   

DefineButton( { Pos = 6, Level = 0, Icon = "icon-archvile-ressurect",
  Action = "cast-spell", Value = "spell-ressurect", Description = _("Resurrect the dead demons back to life. The spell uses 20 mana per cast."),
  Key = "r", Hint = _("~!Resurrect"), Popup = "popup-hell-ability", AlwaysShow = true,
  ForUnit = {"unit-archvile"} } )
  
DefineButton( { Pos = 7, Level = 0, Icon = "icon-destroy-armor",
  Action = "cast-spell", Value = "spell-destroy-armor", Popup = "popup-hell-spell",
  Description = _("Curse the target's armor and destroys all infantry armor within 3x3 area. The cursed unit will take 2x damage."),
  AlwaysShow = true,
  Key = "c", Hint = _("~!Curse armor"),
  ForUnit = {"unit-archvile"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-invulnerability",
  Action = "cast-spell", Value = "spell-invulnerability", Popup = "popup-hell-spell", Description = _("Make target to be invulnerable to damage for 15 seconds."),
  AlwaysShow = true,
  Key = "i", Hint = _("~!Invulnerability"),
  ForUnit = {"unit-archvile"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-inferno",
  Action = "cast-spell", Value = "spell-inferno", Popup = "popup-hell-spell",
  Allowed = "check-unit-variable", AllowArg = {"Veterancy", "Value", "==", "4"},
  Key = "f", Hint = _("In~!ferno"), Description = _("Burn the selected area. Very effectively against buildings."),
  ForUnit = {"unit-archvile"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-cacolich-burn",
  Action = "cast-spell", Value = "spell-lichflame", Description = "Cacolich burns specified unit. Very effective against buildings.",
  Allowed = "check-unit-variable", AllowArg = {"Veterancy", "Value", "==", "4"},
  Key = "b", Hint = "~!Burn", Popup = "popup-hell-spell",
  ForUnit = {"unit-cacolich"} } )

DefineButton( { Pos = 1, Level = 0, Icon = "icon-make-zombie",
  Action = "cast-spell", Value = "spell-make-zombie", Popup = "popup-hell-spell", Description = _("Raise zombie from dead marine."),
  Allowed = "check-upgrade", AllowArg = {"upgrade-make-zombie"}, AlwaysShow = true,
  Key = "r", Hint = _("~!Raise zombie"),
  ForUnit = {"unit-horror-tower"} } )

DefineButton( { Pos = 1, Level = 0, Icon = "icon-pentagram-summon",
  Action = "cast-spell", Value = "spell-spider-summon", CommentSound = "hell select target", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Weapon", "Value", "==", "1"},
  Key = "a", Hint = _("~!Activate pentagram"), Popup = "popup-hell-superweapon", Description = _("Use Pentagram' of Death energy to summon Spider Mastermind for some time on random map spot."),
  ForUnit = {"unit-death-pentagram"} } )

DefineButton( { Pos = 1, Level = 0, Icon = "icon-pentagram-summon",
  Action = "cast-spell", Value = "spell-cyber-summon", CommentSound = "hell select target", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Weapon", "Value", "==", "0"},
  Key = "a", Hint = _("~!Activate pentagram"), Popup = "popup-hell-superweapon", Description = _("Use Pentagram' of Death energy to summon Cyberdemon for some time on random map spot."),
  ForUnit = {"unit-death-pentagram"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-cyberdemon",
  Action = "cast-spell", Value = "spell-pentagram-select-cyberdemon", Description = _("Let Pentagram of Death to summon Cyberdemon. Cyberdemon is an ultimate demon lord, which power is enough to crush an entire army."), Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"Weapon", "Value", "!=", "0"},
  Key = "c", Hint = _("Select ~!Cyberdemon"), AlwaysShow = true,
  ForUnit = {"unit-death-pentagram"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-spiderdemon",
  Action = "cast-spell", Value = "spell-pentagram-select-spiderdemon", Description = _("Let Pentagram of Death to summon Spider Mastermind. Spider Mastermind is a lord of hellspawn, and every demon near to it will start to move and attack faster."), Popup = "popup-uac-commands",
  Allowed = "check-unit-variable", AllowArg = {"Weapon", "Value", "!=", "1"},
  Key = "c", Hint = _("Select ~!Spider Mastermind"), AlwaysShow = true,
  ForUnit = {"unit-death-pentagram"} } )

DefineButton( { Pos = 2, Level = 1, Icon = "icon-cyberdemon",
  Action = "cast-spell", Value = "spell-cyber-summon-for-ai", CommentSound = "hell select target",
  Key = "c", Hint = _("Summon ~!Cyberdemon"), Popup = "popup-hell-superweapon",
  ForUnit = {"unit-death-pentagram"} } )
  
DefineButton( { Pos = 7, Level = 0, Icon = "icon-hellmaker",
  Action = "cast-spell", Value = "spell-zombifie",
  Key = "z", Hint = _("~!Zombifie"), Popup = "popup-hell-ability", Description = _("Dwell into UAC marine's corpse to control him."),
  ForUnit = {"unit-phantom", "unit-new-phantom"} } )
  
DefineButton( { Pos = 8, Level = 0, Icon = "icon-phantom", AlwaysShow = true,
  Action = "cast-spell", Value = "spell-summon-soul", Popup = "popup-hell-spell",
  Key = "h", Hint = _("Summon P~!hantom"), Description = _("Summons a Phantom for 1 minute on map."),
  ForUnit = {"unit-painelemental"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-phantom", AlwaysShow = true,
  Action = "cast-spell", Value = "spell-summon-soul-new", Popup = "popup-hell-spell",
  Allowed = "check-upgrade", AllowArg = {"upgrade-souls"},
  Key = "h", Hint = _("Summon P~!hantom"), Description = _("Summons a Phantom for 1 minute on map."),
  ForUnit = {"unit-painelemental"} } )
  
DefineButton( { Pos = 7, Level = 0, Icon = "icon-melee-attack",
  Action = "cast-spell", Value = "spell-melee-attack", Popup = "popup-hell-commands", AlwaysShow = true,
  Key = "e", Hint = _("M~!elee attack"), Description = _("Move closer to enemy and attack it with claws. Useless against mechs and buildings."),
  ForUnit = {"unit-imp", "unit-hellknight", "unit-baron", "unit-devil"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-burn",
  Action = "cast-spell", Value = "spell-burn", Description = _("Throw fireball on specified spot and burn it."),
  Allowed = "check-upgrade", AllowArg = {"upgrade-imp-fireball"}, AlwaysShow = true,
  Key = "b", Hint = _("~!Burn"), Popup = "popup-hell-spell", AlwaysShow = true,
  ForUnit = {"unit-imp"} } )
  
DefineButton( { Pos = 7, Level = 0, Icon = "icon-melee-attack",
  Action = "cast-spell", Value = "spell-punch", Popup = "popup-hell-commands", AlwaysShow = true,
  Key = "e", Hint = _("M~!elee attack"), Description = _("Move closer to enemy and punch it. Useless against mechs and buildings."),
  ForUnit = {"unit-revenant"} } )
  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-well-heal",
  Action = "cast-spell", Value = "spell-well-heal", Popup = "popup-hell-spell", AlwaysShow = true,
  Key = "h", Hint = _("~!Heal"), Description = _("Heal monster. It uses 5 well energy for 4 hit points."),
  ForUnit = {"unit-well"} } )
  
DefineButton( { Pos = 2, Level = 0, Icon = "icon-well-charge",
  Action = "cast-spell", Value = "spell-well-charge", Popup = "popup-hell-spell", AlwaysShow = true,
  Key = "c", Hint = _("~!Charge"), Description = _("Charge up monster's energy. It uses 5 well energy for 3 energy points."),
  ForUnit = {"unit-well"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-belial-vampirism",
  Action = "cast-spell", Value = "spell-belial-vampirism", Popup = "popup-hell-ability", AlwaysShow = true,
  Key = "v", Hint = _("~!Vampirism"), Description = _("Attack enemy with claws. The attack will give Belial 10 HP and 3 mana points plus an extra 3 HP and 1 mana point with each veterancy level."),
  ForUnit = {"unit-belial"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-belial-abilities",
  Action = "button", Value = 1, Description = _("The list of Belial spells and abilities."),
  Key = "b", Hint = _("~!Belial abilities"), Popup = "popup-hell-commands", AlwaysShow = true,
  ForUnit = {"unit-belial"} } )

DefineButton( { Pos = 1, Level = 1, Icon = "icon-rage",
  Action = "cast-spell", Value = "spell-rage", Popup = "popup-hell-spell", AlwaysShow = true,
  Key = "r", Hint = _("~!Rage"), Description = _("Speed-ups the target for 20 seconds."),
  ForUnit = {"unit-belial"} } )
  
DefineButton( { Pos = 2, Level = 1, Icon = "icon-possess",
  Action = "cast-spell", Value = "spell-possess", Popup = "popup-hell-spell", AlwaysShow = true,
  Key = "o", Hint = _("C~!orrupt"), Description = _("Turns marine into zombie."),
  ForUnit = {"unit-belial"} } )

DefineButton( { Pos = 3, Level = 1, Icon = "icon-belial-teleport",
  Action = "cast-spell", Value = "spell-belial-teleport", Popup = "popup-hell-spell",
  AlwaysShow = true,
  Key = "e", Hint = _("T~!eleport"), Description = _("Teleport Belial to random spot on the map."),
  ForUnit = {"unit-belial"} } )

DefineButton( { Pos = 4, Level = 1, Icon = "icon-acid-storm",
  Action = "cast-spell", Value = "spell-demonic-storm", Popup = "popup-hell-spell", AlwaysShow = true,
  Key = "d", Hint = _("Launch Aci~!d Storm"), Description = _("Creates an evil stone which starts to burst with acid fireballs."),
  ForUnit = {"unit-belial"} } )

DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-hell-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-belial"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-eat-corpse",
  Action = "cast-spell", Value = "spell-eat-corpse", Popup = "popup-hell-ability",
  Allowed = "check-upgrade", AllowArg = {"upgrade-demon-teeth"}, AlwaysShow = true,
  Key = "e", Hint = _("~!Eat corpse"), Description = _("Demon eats the nearby corpse and fully restores its hit points."),
  ForUnit = {"unit-demon", "unit-blood-demon", "unit-spectre"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-blink",
  Action = "cast-spell", Value = "spell-teleport", Popup = "popup-hell-ability",
  Allowed = "check-upgrade", AllowArg = {"upgrade-blink"}, 
  AlwaysShow = true,
  Key = "b", Hint = _("~!Blink"), Description = _("Teleport blood demon to another position."),
  ForUnit = {"unit-blood-demon"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-create-portal",
  Action = "cast-spell", Value = "spell-gate-exit", Popup = "popup-hell-superweapon",
  Allowed = "check-upgrade", AllowArg = {"upgrade-portals"},
  AlwaysShow = true,
  Key = "l", Hint = _("Create portal ~!link"), Description = _("Creates a portal to random map location, so you will be able to transport units through Hell Gate to that location."),
  ForUnit = {"unit-hellgate"} } )

-----------------------------------------
---Basic structures----------------------
----------------------------------------- 
  
DefineButton( { Pos = 1, Level = 1, Icon = "icon-hellkeep",
  Action = "build", Value = "unit-hellkeep", Description = _("Hell's main building. It can summon lost souls and Belial, also it serves as a resource depot."),
  Key = "k", Hint = _("Build Hell ~!keep"), Popup = "popup-hell-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 2, Level = 1, Icon = "icon-generator-hell",
  Action = "build", Value = "unit-generator-hell", Popup = "popup-hell-building", AlwaysShow = true,
  Key = "g", Hint = _("Build ~!generator of Hell Power"), Description = _("Produces energy and unit supply. The more generators you build, the quicker energy will be produced."),
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 3, Level = 1, Icon = "icon-well-of-souls",
  Action = "build", Value = "unit-well", Description = _("The well can heal wounded monsters and charge up their energy."),
  Key = "w", Hint = _("Build ~!well of souls"), Popup = "popup-hell-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 4, Level = 1, Icon = "icon-temple-of-fire",
  Action = "build", Value = "unit-temple-of-fire", Description = _("Provides access for even more deadly weapons of Hell's invasion."),
  Key = "t", Hint = _("Build ~!Temple of fire"), Popup = "popup-hell-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-hell-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
-----------------------------------------
---War structures------------------------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 2, Icon = "icon-monster-spawner",
  Action = "build", Value = "unit-monster-spawner", Description = _("You can summon the small monsters of Hell there."),
  Key = "s", Hint = _("Build monster ~!spawner"), Popup = "popup-hell-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
DefineButton( { Pos = 2, Level = 2, Icon = "icon-blood-pool",
  Action = "build", Value = "unit-blood-pool", Popup = "popup-hell-building", AlwaysShow = true,
  Key = "p", Hint = _("Build blood ~!pool"),  Description = _("Allows you to upgrade abilities of your units."),
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
DefineButton( { Pos = 3, Level = 2, Icon = "icon-hellgate",
  Action = "build", Value = "unit-hellgate", Description = _("The big demons are moving to battlefield through this Gates. You could upgrade Hell Gate to create teleportation portals."),
  Key = "g", Hint = _("Build Hell ~!gate"), Popup = "popup-hell-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 4, Level = 2, Icon = "icon-death-pentagram",
  Action = "build", Value = "unit-death-pentagram", Description = _("The place there the superior demons of hell could be spawned."),
  Key = "p", Hint = _("Build ~!pentagram of death"), Popup = "popup-hell-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

DefineButton( { Pos = 9, Level = 2, Icon = "icon-cancel",
  Action = "button", Value = 0, Description = _("Back to previous menu."),
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Popup = "popup-hell-commands",
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
-----------------------------------------
---Defence structures--------------------
----------------------------------------- 
  
DefineButton( { Pos = 1, Level = 3, Icon = "icon-hell-wall",
  Action = "build", Value = "unit-hell-wall", Description = _("Passive defence, this can stop the enemy invasion to your base. Walls have an ability to block the most of missiles passing over them."),
  Key = "w", Hint = _("Build ~!wall"), Popup = "popup-hell-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
DefineButton( { Pos = 2, Level = 3, Icon = "icon-fire-tower",
  Action = "build", Value = "unit-fire-tower", Description = _("This tower can fire fireballs to enemies. Good against enemy's infantry."),
  Key = "f", Hint = _("Build ~!fire tower"), Popup = "popup-hell-attack-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
DefineButton( { Pos = 3, Level = 3, Icon = "icon-horror-tower",
  Action = "build", Value = "unit-horror-tower", Description = _("The most powerful defence tower of Hell, fires an explosive fireballs which could seek towards the enemy. Could be upgraded to raise zombies from dead marines."),
  Key = "h", Hint = _("Build tower of ~!horror"), Popup = "popup-hell-attack-building", AlwaysShow = true,
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )
  
DefineButton( { Pos = 9, Level = 3, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-hell-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-lostsoul", "unit-advanced-lostsoul"} } )

-----------------------------------------
---Hell Keep-----------------------------
-----------------------------------------  

DefineButton( { Pos = 1, Level = 0, Icon = "icon-lostsoul",
  Action = "train-unit", Value = "unit-lostsoul", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Key = "l", Hint = _("Summon ~!Lost Soul"), Description = _("Hell's main worker. Can build buildings, repair damaged ones and collect minerals."),
  ForUnit = {"unit-hellkeep"} } )
  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-lostsoul",
  Action = "train-unit", Value = "unit-advanced-lostsoul", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Key = "l", Hint = _("Summon Superior ~!Lost Soul"), Description = _("Hell's main worker. Can build buildings, repair damaged ones and collect minerals."),
  ForUnit = {"unit-hellkeep"} } )
  
DefineButton( { Pos = 2, Level = 0, Icon = "icon-belial", AlwaysShow = true,
  Action = "train-unit", Value = "unit-belial", Popup = "popup-hell-unit",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Key = "b", Hint = _("Summon ~!Belial"), Description = _("Belial is the ultimate demon lord, right hand of Icon of Sin."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-hell-building-armor1",
  Action = "research", Value = "upgrade-hell-building-armor1", Description = _("Increases the hit points of buildings by 150, also increases the hit points of towers and walls by 45."),
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"}, Popup = "popup-hell-upgrade",
  Key = "b", Hint = _("Upgrade ~!building armor"), AlwaysShow = true,
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-hell-building-armor2",
  Action = "research", Value = "upgrade-hell-building-armor2", Description = _("Increases the hit points of buildings by 200, also increases the hit points of towers and walls by 55."),
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"}, Popup = "popup-hell-upgrade",
  Key = "b", Hint = _("Upgrade ~!building armor"), AlwaysShow = true,
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 5, Level = 0, Icon = "icon-hell-trading",
  Action = "cast-spell", Value = "spell-enable-trade", Popup = "popup-hell-commands", AlwaysShow = true,
  Key = "t", Hint = _("~!Toggle ~!trading mode"), Description = _("Toggles trading mode for Hell Keep."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-harvest-hell",
  Action = "harvest", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "0"},
  Key = "m", Hint = _("Set collect ~!minerals"), Description = _("Sets the point where lost souls can collect minerals, so the new lost souls will automatically go there and collect minerals."),
  ForUnit = {"unit-hellkeep"} } )

---Trading menu--------------------------
-----------------------------------------  

DefineButton( { Pos = 1, Level = 0, Icon = "icon-hell-prev-player",
  Action = "cast-spell", Value = "spell-trading-prev-player", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "p", Hint = _("~!Previous player"), Description = _("Select previous player in list."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-hell-next-player",
  Action = "cast-spell", Value = "spell-trading-next-player", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "n", Hint = _("~!Next player"), Description = _("Select next player in list."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-hell-decrease-min",
  Action = "cast-spell", Value = "spell-trading-dec-min", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "d", Hint = _("~!Decrease minerals"), Description = _("Decrease minerals to transfer by 250."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-hell-increase-min",
  Action = "cast-spell", Value = "spell-trading-inc-min", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "i", Hint = _("~!Increase minerals"), Description = _("Increase minerals to transfer by 250."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-hell-decrease-eng",
  Action = "cast-spell", Value = "spell-trading-dec-eng", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "e", Hint = _("D~!ecrease energy"), Description = _("Decrease energy to transfer by 250."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-hell-increase-eng",
  Action = "cast-spell", Value = "spell-trading-inc-eng", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "r", Hint = _("Inc~!rease energy"), Description = _("Increase energy to transfer by 250."),
  ForUnit = {"unit-hellkeep"} } )

DefineButton( { Pos = 4, Level = 0, Icon = "icon-hell-commit",
  Action = "cast-spell", Value = "spell-trading-commit", Popup = "popup-hell-commands",
  Allowed = "check-unit-variable", AllowArg = {"TradeMode", "Value", "==", "1"},
  Key = "c", Hint = _("~!Commit operation"), Description = _("Transfer resources to another player."),
  ForUnit = {"unit-hellkeep"} } )

-----------------------------------------
---Monster Spawner-----------------------
-----------------------------------------  

DefineButton( { Pos = 1, Level = 0, Icon = "icon-phantom",
  Action = "train-unit", Value = "unit-phantom", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "p", Hint = _("Summon ~!phantom"), Description = _("Floating monsters. Phantoms have an ability to make zombies from marine's corpses."),
  ForUnit = {"unit-monster-spawner"} } )

DefineButton( { Pos = 1, Level = 0, Icon = "icon-phantom",
  Action = "train-unit", Value = "unit-new-phantom", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-upgrade", AllowArg = {"upgrade-souls"},
  Key = "p", Hint = _("Summon ~!phantom"), Description = _("Floating monsters. Phantoms have an ability to make zombies from marine's corpses."),
  ForUnit = {"unit-monster-spawner"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-imp",
  Action = "train-unit", Value = "unit-imp", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "i", Hint = _("Summon ~!imp"), Description = _("The base units of Hell's invasion. They can throw fireballs and slash enemies with their claws. Could be upgraded to devil."),
  ForUnit = {"unit-monster-spawner"} } )

DefineButton( { Pos = 2, Level = 7, Icon = "icon-imp",
  Action = "train-unit", Value = "unit-devil", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "i", Hint = "Summon ~!imp", Description = "The base units of Hell's invasion. They can throw fireballs and slash enemies with their claws.",
  ForUnit = {"unit-monster-spawner"} } )

DefineButton( { Pos = 3, Level = 0, Icon = "icon-demon",
  Action = "train-unit", Value = "unit-demon", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "d", Hint = _("Summon ~!demon"), Description = _("Strong monster which runs towards the enemy and bites their infantry. Could be upgraded to blood demon or spectre."),
  ForUnit = {"unit-monster-spawner"} } ) 

DefineButton( { Pos = 4, Level = 7, Icon = "icon-demon",
  Action = "train-unit", Value = "unit-blood-demon", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "d", Hint = "Summon ~!demon", Description = "Strong monster which runs towards the enemy and bite their infantry. Could be upgraded to spectre.",
  ForUnit = {"unit-monster-spawner"} } ) 

DefineButton( { Pos = 5, Level = 7, Icon = "icon-demon",
  Action = "train-unit", Value = "unit-spectre", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "d", Hint = "Summon ~!demon", Description = "Strong monster which runs towards the enemy and bite their infantry. Could be upgraded to spectre.",
  ForUnit = {"unit-monster-spawner"} } ) 
  
DefineButton( { Pos = 4, Level = 0, Icon = "icon-revenant",
  Action = "train-unit", Value = "unit-revenant", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "r", Hint = _("Summon ~!revenant"), Description = _("Quite fast monster armed with 2 missile launchers. Powerful against enemy's air units and buildings."),
  ForUnit = {"unit-monster-spawner"} } )

-----------------------------------------
---Hell Gate-----------------------------
-----------------------------------------
  
  DefineButton( { Pos = 1, Level = 8, Icon = "icon-baron",
  Action = "train-unit", Value = "unit-baron", Popup = "popup-hell-unit",
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "h", Hint = "BARON",
  ForUnit = {"unit-hellgate"} } )
  
  DefineButton( { Pos = 2, Level = 8, Icon = "icon-baron",
  Action = "train-unit", Value = "unit-cacolich", Popup = "popup-hell-unit",
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "h", Hint = "cacolich",
  ForUnit = {"unit-hellgate"} } )
  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-hellknight",
  Action = "train-unit", Value = "unit-hellknight", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "h", Hint = _("Summon ~!Hell knight"), Description = _("Very strong monster which shoots green fireballs and can slash enemies in close combat. Could be upgraded to Baron of Hell."),
  ForUnit = {"unit-hellgate"} } )
  
DefineButton( { Pos = 2, Level = 0, Icon = "icon-cacodemon",
  Action = "train-unit", Value = "unit-cacodemon", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "c", Hint = _("Summon ~!cacodemon"), Description = _("Floating monster, good against enemy's air forces."),
  ForUnit = {"unit-hellgate"} } )
  
DefineButton( { Pos = 3, Level = 0, Icon = "icon-arachnotron",
  Action = "train-unit", Value = "unit-arachnotron", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "a", Hint = _("Summon ~!arachnotron"), Description = _("This spider-like monster armed with plasma gun. Good against everything except for air units."),
  ForUnit = {"unit-hellgate"} } )
  
DefineButton( { Pos = 4, Level = 0, Icon = "icon-painelemental",
  Action = "train-unit", Value = "unit-painelemental", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "p", Hint = _("Summon ~!pain elemenatal"), Description = _("Good solution against enemy's infantry. Their souls have an ability to decrease attacking damage of enemy's weapons. Pain Elementals can summon and transport Lost Souls and Phantoms."),
  ForUnit = {"unit-hellgate"} } )
  
DefineButton( { Pos = 5, Level = 0, Icon = "icon-mancubus",
  Action = "train-unit", Value = "unit-mancubus", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "m", Hint = _("Summon ~!mancubus"), Description = _("Heavy monster armed with 2 flamethrowers, deadly against infantry and buildings."),
  ForUnit = {"unit-hellgate"} } )
  
DefineButton( { Pos = 6, Level = 0, Icon = "icon-archvile",
  Action = "train-unit", Value = "unit-archvile", Popup = "popup-hell-unit", AlwaysShow = true,
  Allowed = "check-unit-variable", AllowArg = {"Op2", "Value", "==", "0"},
  Key = "v", Hint = _("Summon arch-~!vile"), Description = _("Fast monster which is able to cast spells and resurrect dead monsters."),
  ForUnit = {"unit-hellgate"} } )
  
-----------------------------------------
---Upgrades------------------------------
-----------------------------------------  

DefineButton( { Pos = 1, Level = 0, Icon = "icon-fire-tower",
  Action = "upgrade-to", Value = "unit-upgraded-fire-tower", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "u", Hint = _("~!Upgrade to advanced fire tower"), Description = _("Upgrade Fire Tower to make it shoot with homing missiles."),
  ForUnit = {"unit-fire-tower"} } )
  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-adv-generator-hell",
  Action = "upgrade-to", Value = "unit-advanced-generator-hell", Popup = "popup-hell-unit", AlwaysShow = true,
  Key = "u", Hint = _("~!Upgrade to adv.generator of Hell Power"), Description = _("Upgrade generator of Hell Power to produce more energy and unit supply."),
  ForUnit = {"unit-generator-hell"} } )

DefineButton( { Pos = 1, Level = 0, Icon = "icon-runestone",
  Action = "button", Value = 1, Popup = "popup-hell-commands", AlwaysShow = true,
  Key = "n", Hint = _("~!Non-fireball weapon upgrades"), Description = _("List of available weapon upgrades for monsters not armed with fireballs."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 2, Level = 0, Icon = "icon-oil-patch",
  Action = "button", Value = 2, Popup = "popup-hell-commands", AlwaysShow = true,
  Key = "f", Hint = _("~!Fireball upgrades"), Description = _("List of available weapon upgrades for fireball armed monsters."),
  ForUnit = {"unit-blood-pool"} } )
  
DefineButton( { Pos = 3, Level = 0, Icon = "icon-circle-of-power",
  Action = "button", Value = 3, Popup = "popup-hell-commands", AlwaysShow = true,
  Key = "t", Hint = _("~!Tech and defence upgrades"), Description = _("List of available upgrades for armor, sight etc."),
  ForUnit = {"unit-blood-pool"} } )
  
DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-hell-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-blood-pool", "unit-hellkeep"} } )
  
DefineButton( { Pos = 9, Level = 2, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-hell-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-blood-pool"} } )
  
DefineButton( { Pos = 9, Level = 3, Icon = "icon-cancel",
  Action = "button", Value = 0, Popup = "popup-hell-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"), Description = _("Back to previous menu."),
  ForUnit = {"unit-blood-pool"} } )
  
---Non-fireball weapon upgrades----------
----------------------------------------- 

DefineButton( { Pos = 1, Level = 1, Icon = "icon-demon-teeth",
  Action = "research", Value = "upgrade-demon-teeth", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "d", Hint = _("Upgrade ~!demon teeth"), Description = _("Increase the demon's damage by 20 percents and adds ability to restore health from corpses."),
  ForUnit = {"unit-blood-pool"} } )    
  
DefineButton( { Pos = 2, Level = 1, Icon = "icon-claws",
  Action = "research", Value = "upgrade-claws", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "c", Hint = _("Upgrade ~!claws"), Description = _("Increase the melee combat damage by 20 percents."),
  ForUnit = {"unit-blood-pool"} } ) 
  
DefineButton( { Pos = 3, Level = 1, Icon = "icon-souls",
  Action = "research", Value = "upgrade-souls", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "s", Hint = _("Research ~!souls power"), Description = _("Increase the damage done by Phantoms and Pain Elementals by 20 percents and increase Pain Elemental's mana pool by 80."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 4, Level = 1, Icon = "icon-archvile-strength",
  Action = "research", Value = "upgrade-archvile-power", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "a", Hint = _("Upgrade ~!arch-vile power"), Description = _("Increase the damage done by Archvile's fire by 20 percents, its attack range by 1 and Archvile's mana pool by 50."),
  ForUnit = {"unit-blood-pool"} } )  

---Fireball upgrades---------------------
-----------------------------------------   
 
DefineButton( { Pos = 1, Level = 2, Icon = "icon-imp-fireball",
  Action = "research", Value = "upgrade-imp-fireball", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "i", Hint = _("Upgrade  f~!ireballs"), Description = _("Upgrade the fireballs used by Imps, Devils and Fire Towers, increasing their damage by 20 percents, attack range by 1 and allowing Imps to burn ground with their fireballs."),
  ForUnit = {"unit-blood-pool"} } )  
  
DefineButton( { Pos = 2, Level = 2, Icon = "icon-upgrade-cacoballs",
  Action = "research", Value = "upgrade-cacoball", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "c", Hint = _("Upgrade ~!cacoballs"), Description = _("Upgrade the fireballs used by Cacodemons and Cacoliches, increasing their damage by 20 percents and attack range by 1. Cacodemons can fire their fireballs more precisely."),
  ForUnit = {"unit-blood-pool"} } ) 

DefineButton( { Pos = 3, Level = 2, Icon = "icon-upgrade-acidballs",
  Action = "research", Value = "upgrade-acidballs", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "d", Hint = _("Research aci~!d fireballs"), Description = _("Upgrades green fireballs used by Hell Knights, Barons of Hell, Belial and Horror Towers, increasing their damage by 20 percents, attack range by 1 and enhancing them with acid damage."),
  ForUnit = {"unit-blood-pool"} } )    
  
DefineButton( { Pos = 4, Level = 2, Icon = "icon-arachnotron-plasma",
  Action = "research", Value = "upgrade-arachnotron-plasma", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "a", Hint = _("Upgrade ~!arachnotron plasma"), Description = _("Increase the Arachnotron's plasma damage by 20 percents and attack range by 1."),
  ForUnit = {"unit-blood-pool"} } )    

DefineButton( { Pos = 5, Level = 2, Icon = "icon-revenant-missile",
  Action = "research", Value = "upgrade-revenant-missile", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "r", Hint = _("Upgrade ~!revenant missiles"), Description = _("Upgrade missiles used by Revenants and Upgraded Fire Tower, increasing their damage by 20 percents, attack range by 1 and enhancing them with homing ability."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 6, Level = 2, Icon = "icon-mancubus-fireball",
  Action = "research", Value = "upgrade-mancubus-fireball", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "m", Hint = _("Upgrade ~!mancubus fireballs"), Description = _("Increase the Mancubi's fireball damage by 20 percents and attack range by 1."),
  ForUnit = {"unit-blood-pool"} } )
  
---Tech and defence upgrades-------------
----------------------------------------- 
  
DefineButton( { Pos = 1, Level = 3, Icon = "icon-light-monster-flesh1",
  Action = "research", Value = "upgrade-light-monster-flesh1", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "l", Hint = _("Upgrade light monsters f~!lesh"), Description = _("Increases the light armored monster's hit points by 15."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 1, Level = 3, Icon = "icon-light-monster-flesh2",
  Action = "research", Value = "upgrade-light-monster-flesh2", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "l", Hint = _("Upgrade light monsters f~!lesh"), Description = _("Increases the light armored monster's hit points by 20."),
  ForUnit = {"unit-blood-pool"} } )
  
DefineButton( { Pos = 1, Level = 3, Icon = "icon-light-monster-flesh3",
  Action = "research", Value = "upgrade-light-monster-flesh3", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "l", Hint = _("Upgrade light monsters f~!lesh"), Description = _("Increases the light armored monster's hit points by 25."),
  ForUnit = {"unit-blood-pool"} } )
  
DefineButton( { Pos = 2, Level = 3, Icon = "icon-heavy-monster-flesh1",
  Action = "research", Value = "upgrade-heavy-monster-flesh1", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "h", Hint = _("Upgrade ~!heavy monsters flesh"), Description = _("Increases the heavy armored and air monster's hit points by 25."),
  ForUnit = {"unit-blood-pool"} } )
  
DefineButton( { Pos = 2, Level = 3, Icon = "icon-heavy-monster-flesh2",
  Action = "research", Value = "upgrade-heavy-monster-flesh2", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "h", Hint = _("Upgrade ~!heavy monsters flesh"), Description = _("Increases the heavy armored and air monster's hit points by 35."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 2, Level = 3, Icon = "icon-heavy-monster-flesh3",
  Action = "research", Value = "upgrade-heavy-monster-flesh3", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "h", Hint = _("Upgrade ~!heavy monsters flesh"), Description = _("Increases the heavy armored and air monster's hit points by 45."),
  ForUnit = {"unit-blood-pool"} } )
  
DefineButton( { Pos = 3, Level = 3, Icon = "icon-monsters-sight",
  Action = "research", Value = "upgrade-monsters-sight", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "s", Hint = _("Upgrade monsters ~!sight"), Description = _("Increases units sight range by 2."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 4, Level = 3, Icon = "icon-upgrade-spectre",
  Action = "research", Value = "upgrade-spectre", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "p", Hint = _("S~!pectre research"), Description = _("Allows to upgrade Demon to Spectre."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 5, Level = 3, Icon = "icon-upgrade-blood-demon",
  Action = "research", Value = "upgrade-blood-demon", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "o", Hint = _("Bl~!ood demon research"), Description = _("Allows to upgrade Demon to Blood Demon."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 5, Level = 3, Icon = "icon-blink",
  Action = "research", Value = "upgrade-blink", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "t", Hint = _("Blink ~!teleporting ability"), Description = _("Allow Blood Demons to teleport instantly in short range."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 6, Level = 3, Icon = "icon-upgrade-cacodemon-speed",
  Action = "research", Value = "upgrade-cacodemon-speed", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "c", Hint = _("Upgrade ~!cacodemon speed"), Description = _("Increase moving speed of Cacodemons and Cacoliches."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 7, Level = 3, Icon = "icon-zombification",
  Action = "research", Value = "upgrade-zombification", AlwaysShow = true,
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "z", Hint = _("Research ~!zombification"), Description = _("Pain Elementals will get ability to zombifie marines with their attack. A zombified marine will have a chance to turn into zombie after death."),
  ForUnit = {"unit-blood-pool"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-baron",
  Action = "upgrade-to", Value = "unit-baron", AlwaysShow = true,
  Popup = "popup-hell-unit", Description = _("Upgrade Hell Knight to Baron of Hell. Barons of Hell are the strongest and toughest monsters in Hell."),
  Key = "u", Hint = _("~!Upgrade Hell Knight to Baron of Hell"),
  ForUnit = {"unit-hellknight"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-devil",
  Action = "upgrade-to", Value = "unit-devil", AlwaysShow = true,
  Popup = "popup-hell-unit", Description = _("Upgrade Imp to Devil. Devils are great against enemy's air units and buildings."),
  Key = "u", Hint = _("~!Upgrade Imp to Devil"),
  ForUnit = {"unit-imp"} } )

DefineButton( { Pos = 8, Level = 0, Icon = "icon-blood-demon",
  Action = "upgrade-to", Value = "unit-blood-demon", AlwaysShow = true,
  Popup = "popup-hell-unit", Description = _("Upgrade Demon to Blood Demon.  Blood demons are much tougher than Demons and they could beat enemy's mechs and buildings."),
  Key = "b", Hint = _("Upgrade Demon to ~!Blood Demon"),
  ForUnit = {"unit-demon"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-spectre",
  Action = "upgrade-to", Value = "unit-spectre", AlwaysShow = true,
  Popup = "popup-hell-unit", Description = _("Upgrade Demon to Spectre. Spectres are less tough and strong as Demons, but nobody could see them except for special detector units."),
  Key = "r", Hint = _("Upgrade Demon to Spect~!re"),
  ForUnit = {"unit-demon"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-cacolich",
  Action = "upgrade-to", Value = "unit-cacolich", AlwaysShow = true,
  Popup = "popup-hell-unit", Description = _("Upgrade Cacodemon to Cacolich. Cacoliches are very effective against enemy's mechs and buildings."),
  Key = "c", Hint = _("Upgrade Cacodemon to ~!Cacolich"),
  ForUnit = {"unit-cacodemon"} } )
  
---Temple of Fire------------------------
----------------------------------------- 
  
DefineButton( { Pos = 1, Level = 0, Icon = "icon-monster-regeneration",
  Action = "research", Value = "upgrade-monster-regeneration", Description = _("Allows monsters to regenerate their health."),
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "r", Hint = _("Research monsters ~!regeneration"), AlwaysShow = true,
  ForUnit = {"unit-temple-of-fire"} } )  

DefineButton( { Pos = 2, Level = 0, Icon = "icon-upgrade-soul",
  Action = "research", Value = "upgrade-soul", Description = _("Increases Lost Soul's hit points by 20, damage by 20 percents, minerals capacity to 120, also allows them to fly over other units and obstacles."),
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "l", Hint = _("Upgrade ~!Lost Soul workers"), AlwaysShow = true,
  ForUnit = {"unit-temple-of-fire"} } )    

DefineButton( { Pos = 3, Level = 0, Icon = "icon-upgrade-make-zombie",
  Action = "research", Value = "upgrade-make-zombie", Description = _("Gives an ability to Horror Tower to raise dead marines as zombies."),
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "r", Hint = _("~!Raise zombie research"), AlwaysShow = true,
  ForUnit = {"unit-temple-of-fire"} } )

DefineButton( { Pos = 4, Level = 0, Icon = "icon-portals",
  Action = "research", Value = "upgrade-portals", Description = _("Allow Hell Gates to create portals, which are able to teleport units to random map spots."),
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "p", Hint = _("~!Portals research"), AlwaysShow = true,
  ForUnit = {"unit-temple-of-fire"} } )

DefineButton( { Pos = 7, Level = 0, Icon = "icon-upgrade-temple-of-fire",
  Action = "research", Value = "upgrade-temple-of-fire", Description = _("Upgrade Temple of Fire, providing access to the most deadful and destructive weapons of Hell."),
  Allowed = "check-single-research", Popup = "popup-hell-upgrade",
  Key = "t", Hint = _("Upgrade ~!Temple of Fire"), AlwaysShow = true,
  ForUnit = {"unit-temple-of-fire"} } )