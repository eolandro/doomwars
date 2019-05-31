Load("scripts/widgets.lua")

DefineSprites({Name = "sprite-mana", File = "graphics/ui/mana2.png",
				Offset = {0, -1}, Size = {31, 4}})
DefineSprites({Name = "sprite-health", File = "graphics/ui/health2.png",
				Offset = {0, -4}, Size = {31, 4}})
DefineSprites({Name = "sprite-spell", File = "graphics/ui/effects.png",
				Offset = {1, 1}, Size = {16, 16}})
DefineSprites({Name = "sprite-rank-uac", File = "graphics/ui/ranks-uac.png",
				Offset = {1, 1}, Size = {32, 8}})
DefineSprites({Name = "sprite-rank-hell", File = "graphics/ui/ranks-hell.png",
				Offset = {1, 1}, Size = {32, 8}})
				
DefineDecorations({Index = "HitPoints", HideNeutral = true, CenterX = true, ShowOpponent=true,
		OffsetPercent = {50, 100}, Method = {"sprite", {"sprite-health"}}})
DefineDecorations({Index = "Mana",  HideNeutral = true, CenterX = true, ShowWhenNull = true, OffsetPercent = {50, 100},Method = {"sprite", {"sprite-mana"}}})
DefineDecorations({Index = "ShieldPoints", HideNeutral = true, CenterX = true,OffsetPercent = {50, 100},Method = {"sprite", {"sprite-mana"}}})
DefineDecorations({Index = "Transport", HideNeutral = true, CenterX = true,OffsetPercent = {50, 100},Method = {"sprite", {"sprite-mana"}}})
DefineDecorations({Index = "Research", HideNeutral = true, CenterX = true,OffsetPercent = {50, 100},Method = {"sprite", {"sprite-mana"}}})
DefineDecorations({Index = "Training", HideNeutral = true, CenterX = true,OffsetPercent = {50, 100},Method = {"sprite", {"sprite-mana"}}})
DefineDecorations({Index = "UpgradeTo", HideNeutral = true, CenterX = true,OffsetPercent = {50, 100},Method = {"sprite", {"sprite-mana"}}})
DefineDecorations({Index = "CarryResource", HideNeutral = false, CenterX = true,OffsetPercent = {50, 100},Method = {"sprite", {"sprite-mana"}}})
DefineDecorations({Index = "VeterancyUAC", ShowOpponent=true, HideNeutral = true, ShowWhenMax = true, OffsetPercent = {50, 100},Method = {"sprite", {"sprite-rank-uac"}}})
DefineDecorations({Index = "VeterancyHell", ShowOpponent=true, HideNeutral = true, ShowWhenMax = true, OffsetPercent = {50, 100},Method = {"sprite", {"sprite-rank-hell"}}})

DefineDecorations({Index = "ZombificationTime", ShowOpponent = true, ShowWhenMax = true,
  Offset = {0, 0}, Method = {"static-sprite", {"sprite-spell", 5}}})
DefineDecorations({Index = "Slow", ShowOpponent = true, ShowWhenMax = true,
  Offset = {16, 0}, Method = {"static-sprite", {"sprite-spell", 2, 90}}})
DefineDecorations({Index = "Invisible", ShowOpponent = true, ShowWhenMax = true,
  Offset = {32, 0}, Method = {"static-sprite", {"sprite-spell", 3, 60}}})
DefineDecorations({Index = "UnholyArmor", ShowOpponent = true, ShowWhenMax = true,
  Offset = {48, 0}, Method = {"static-sprite", {"sprite-spell", 4, 60}}})
DefineDecorations({Index = "Poison", ShowOpponent = true, ShowWhenMax = true,
  Offset = {48, 0}, Method = {"static-sprite", {"sprite-spell", 6, 90}}})
DefineDecorations({Index = "Confusion", ShowOpponent = true, ShowWhenMax = true,
  Offset = {0, 0}, Method = {"static-sprite", {"sprite-spell", 7, 45}}})

local info_panel_x = Video.Width-176
local info_panel_y = 32

DefinePanelContents(
-- Default presentation. ------------------------
  {
  Ident = "panel-general-contents",
  Pos = {info_panel_x, info_panel_y}, DefaultFont = "game",
  Contents = {
	{ Pos = {61, 37}, Condition = {ShowOpponent = true, HideNeutral = true},
		More = {"CompleteBar", {Variable = "HitPoints", Border = true, Height = 11, Width = 100, Color = "dark-green"}}
	},
	 { Pos = {61, 47}, Condition = {ShowOpponent = true, HideNeutral = true, ShieldPoints = "only"},
		 More = {"CompleteBar", {Variable = "ShieldPoints", Height = 11, Width = 100, Border = true, Color = "blue"}}
	 },
	--[[  { Pos = {61, 47}, Condition = {ShowOpponent = true, HideNeutral = true, ShieldPoints = "only", ArmorShield = "only"},
		 More = {"CompleteBar", {Variable = "ShieldPoints", Height = 11, Width = 100, Border = true, Color = "light-blue"}}
	 },]]
	{ Pos = {112, 40}, Condition = {ShowOpponent = false, HideNeutral = true},
		More = {"FormattedText2", {
			Font = "small", Variable = "HitPoints", Format = "%d/%d",
			Component1 = "Value", Component2 = "Max", Centered = true}}
	},
	 { Pos = {112, 50}, Condition = {ShowOpponent = false, HideNeutral = true, ShieldPoints = "only"},
		More = {"FormattedText2", {
			 Font = "small", Variable = "ShieldPoints", Format = "%d/%d",
			 Component1 = "Value", Component2 = "Max", Centered = true}}
	 },
	{ Pos = {114, 11}, More = {"Text", {Text = Line(1, UnitName("Active"), 110, "game"), Centered = true}} },
	{ Pos = {114, 25}, More = {"Text", {Text = Line(2, UnitName("Active"), 110, "game"), Centered = true}} },

-- Ressource Left
	{ Pos = {88, 86}, Condition = {ShowOpponent = false, GiveResource = "only"},
		More = {"FormattedText2", {Format = "%s left:%d", Variable = "GiveResource",
					Component1 = "Name", Component2 = "Value", Centered = true}}
	},

-- Construction
	{ Pos = {61, 57}, Condition = {ShowOpponent = false, HideNeutral = true, Build = "only"},
		More = {"CompleteBar", {Variable = "Build", Border = true, Height = 11, Width = 100, Color = "red"}}
	},	

	{ Pos = {111, 60}, Condition = {ShowOpponent = false, HideNeutral = true, Build = "only"},
		More = {"FormattedText", {Font = "small", Format = "%d/100", Variable = "Build",
				Component = "Percent",  Centered = true}}},
	-- Transporter
	{ Pos = {61, 57}, Condition = {ShowOpponent = false, HideNeutral = true, Transporter = "only"},
		More = {"CompleteBar", {Variable = "Transport", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {111, 60}, Condition = {ShowOpponent = false, HideNeutral = true, Transporter = "only"},
		More = {"FormattedText", {Font = "small", Format = "%d/100", Variable = "Transport",
				Component = "Percent",  Centered = true}}},
	{ Pos = {61, 57}, Condition = {ShowOpponent = false, HideNeutral = true, HellSuperweaponTTL = "only"},
		More = {"CompleteBar", {Variable = "HellSuperweaponTTL", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {111, 60}, Condition = {ShowOpponent = false, HideNeutral = true, HellSuperweaponTTL = "only"},
		More = {"FormattedText", {Font = "small", Format = "%d/100", Variable = "HellSuperweaponTTL",
				Component = "Percent",  Centered = true}}},


  } },
-- Supply Building constructed.----------------
  {
  Ident = "panel-building-contents",
  Pos = {info_panel_x, info_panel_y}, DefaultFont = "game",
  Condition = {ShowOpponent = false, Build = "false", Training = "false", UpgradeTo = "false", Research = "false"},
  Contents = {
-- Food building
	{ Pos = {9, 72}, Condition = {UAC = "only", Supply = "only", TradeMode = "false"}, More = {"Text", _("Supply usage: ")} },
	{ Pos = {9, 72}, Condition = {Hell = "only", Supply = "only", TradeMode = "false"}, More = {"Text", _("Hell Power usage: ")} },
	{ Pos = {32, 84}, Condition = {Supply = "only", TradeMode = "false"}, More = {"Text", {Text = _("Output  : "), Variable = "Supply", Component = "Max"}} },
	{ Pos = {32, 96}, Condition = {Supply = "only", TradeMode = "false"}, More = { "Text", {Text = Concat(_("In use  : "),
									If(GreaterThan(ActiveUnitVar("Demand", "Max"), ActiveUnitVar("Supply", "Max")),
										InverseVideo(String(ActiveUnitVar("Demand", "Max"))),
										String(ActiveUnitVar("Demand", "Max")) ))}}
    },
	{ Pos = {9, 108}, Condition = {Center = "only", TradeMode = "false"}, More = {"Text", _("Resource stats: ")} },
	{ Pos = {32, 120}, Condition = {Center = "only", TradeMode = "false"}, More = {"Text", {Text = Concat(_("Minerals : "),
									If(GreaterThanOrEq(ActiveUnitVar("MinProduct", "Value"), ActiveUnitVar("OldMinProduct", "Value")),
										Concat("+", String(Sub(ActiveUnitVar("MinProduct", "Value"), ActiveUnitVar("OldMinProduct", "Value")))),
										Concat("-", String(Sub(ActiveUnitVar("OldMinProduct", "Value"), ActiveUnitVar("MinProduct", "Value"))))))}}},
	{ Pos = {32, 132}, Condition = {Center = "only", TradeMode = "false"}, More = {"Text", {Text = Concat(_("Energy : "),
									If(GreaterThanOrEq(ActiveUnitVar("EngProduct", "Value"), ActiveUnitVar("OldEngProduct", "Value")),
										Concat("+", String(Sub(ActiveUnitVar("EngProduct", "Value"), ActiveUnitVar("OldEngProduct", "Value")))),
										Concat("-", String(Sub(ActiveUnitVar("OldEngProduct", "Value"), ActiveUnitVar("EngProduct", "Value"))))))}} },
	
	{ Pos = {9, 72}, Condition = {UAC = "only", PlantValue = "only"}, More = {"Text", _("Energy production: ")} },
	{ Pos = {32, 84}, Condition = {UAC = "only", PlantValue = "only"},More = {"FormattedText", {Format = _("Usage: %d/100"),  Variable = "TotalPowerHandicap", Component = "Value"}} },
	{ Pos = {9, 108}, Condition = {Hell = "only", PlantValue = "only"}, More = {"Text", _("Energy production: ")} },
	{ Pos = {32, 120}, Condition = {Hell = "only", PlantValue = "only"},More = {"FormattedText", {Format = _("Usage: %d/100"),  Variable = "TotalPowerHandicap", Component = "Value"}} },

-- Trading
	{ Pos = {9, 72}, Condition = {Supply = "only", TradeMode = "only"}, More = {"Text", _("Trading mode: ")} },
	{ Pos = {32, 84}, Condition = {Supply = "only", TradeMode = "only"}, More = {"Text", {Text = Concat(_("Player: "), PlayerName(ActiveUnitVar("TradePlayer", "Value")))}} },
	{ Pos = {32, 96}, Condition = {Supply = "only", TradeMode = "only"}, More = {"FormattedText", {Format = _("Minerals: %d"), Variable = "TradeMin", Component = "Value"}} },
	{ Pos = {32, 108}, Condition = {Supply = "only", TradeMode = "only"}, More = {"FormattedText", {Format = _("Energy: %d"), Variable = "TradeEng", Component = "Value"}} },
  } },
-- All own unit -----------------
  {
  Ident = "panel-all-unit-contents",
  Pos = {info_panel_x, info_panel_y},
  DefaultFont = "game",
  Condition = {ShowOpponent = true, HideNeutral = true, Build = "false"},
  Contents = {
	{ Pos = {15, 118}, Condition = {BasicDamage = "only", Superweapon = "false", PlantValue = "false", UpgradeTo = "false"},
		More = {"Text", {Text = Concat(_("Base Damage: "), If(GreaterThan(ActiveUnitVar("BaseDamage","Value", "Unit"), 0), 
															String(ActiveUnitVar("BaseDamage","Value", "Unit")),
															""),
														If(GreaterThan(ActiveUnitVar("BaseDamage2","Value", "Unit"), 0), 
															Concat("/", String(ActiveUnitVar("BaseDamage2","Value", "Unit"))),
															""),
														If(GreaterThan(ActiveUnitVar("BaseDamage3","Value", "Unit"), 0), 
															Concat("/", String(ActiveUnitVar("BaseDamage3","Value", "Unit"))),
															""))}}

	},
	
	--[[{ Pos = {15, 129}, Condition = {UpgradeTo = "false"},
		More = {"Text", {
					Text = Concat("Attack Type: ", 	If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 1), "bullet",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 2), "shell",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 3), "explosion",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 4), "plasma",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 5), "anti-flesh",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 6), "laser",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 7), "fire",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 8), "demonic",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 9), "melee",
													If(Equal(ActiveUnitVar("DamageNum", "Value", "Unit"), 10), "mental","")))))))))))}}
	},]]

	{ Pos = {15, 129}, Condition = {AttackRange = "only", UpgradeTo = "false"},
		More = {"Text", {
					Text = _("Attack Range: "), Variable = "AttackRange", Component = "Max"}}
	},
-- Research
	{ Pos = {61, 57}, Condition = {Research = "only"},
		More = {"CompleteBar", {Variable = "Research", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {16, 86}, Condition = {Research = "only"}, More = {"Text", _("Researching:")}},
	{ Pos = {111, 60}, Condition = {Research = "only"}, More = {"FormattedText", {
			Font = "small", Variable = "Research", Format = "%d/100",
			Component = "Percent", Centered = true}}
	},
-- Training
	{ Pos = {61, 57}, Condition = {Training = "only"},
		More = {"CompleteBar", {Variable = "Training", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {111, 60}, Condition = {Training = "only"}, More = {"FormattedText", {
			Font = "small", Variable = "Training", Format = "%d/100",
			Component = "Percent", Centered = true}}
	},
-- Upgrading To
	{ Pos = {61, 57}, Condition = {UpgradeTo = "only"},
		More = {"CompleteBar", {Variable = "UpgradeTo", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {9,  86}, More = {"Text", _("Upgrading:")}, Condition = {UpgradeTo = "only"} },
	{ Pos = {111, 60}, Condition = {UpgradeTo = "only"}, More = {"FormattedText", {
			Font = "small", Variable = "UpgradeTo", Format = "%d/100",
			Component = "Percent", Centered = true}}
	},
-- Mana
	{ Pos = {61, 57}, Condition = {Mana = "only", Superweapon = "false", UpgradeTo = "false"},
		More = {"CompleteBar", {Variable = "Mana", Height = 11, Width = 100, Border = true}}
	},
	{ Pos = {111, 60}, Condition = {Mana = "only", Superweapon = "false"},
		More = {"FormattedText2", {
			Font = "small", Variable = "Mana", Format = "%d/%d",
			Component1 = "Value", Component2 = "Max", Centered = true}}
	},
  -- Radar research preparing
  { Pos = {15, 123}, Condition = {RadarCharge = "only", ShowOpponent = false, UpgradeTo = "false"},
		More = {"Text", {Text = Concat(_("Research preparing: "), String(Div(Sub(ActiveUnitVar("RadarCharge","Max", "Unit"),ActiveUnitVar("RadarCharge","Value", "Unit")),60)), ":",
		If(GreaterThanOrEq(Sub(Sub(ActiveUnitVar("RadarCharge","Max", "Unit"),ActiveUnitVar("RadarCharge","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("RadarCharge","Max", "Unit"),ActiveUnitVar("RadarCharge","Value", "Unit")),60))),10),
		String(Sub(Sub(ActiveUnitVar("RadarCharge","Max", "Unit"),ActiveUnitVar("RadarCharge","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("RadarCharge","Max", "Unit"),ActiveUnitVar("RadarCharge","Value", "Unit")),60)))),
		Concat("0",String(Sub(Sub(ActiveUnitVar("RadarCharge","Max", "Unit"),ActiveUnitVar("RadarCharge","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("RadarCharge","Max", "Unit"),ActiveUnitVar("RadarCharge","Value", "Unit")),60))))))
		)}}
	},
  -- Radar researching
  { Pos = {15, 123}, Condition = {RadarResearch = "only", UAC = "only", ShowOpponent = false, UpgradeTo = "false"},
		More = {"Text", {Text = Concat(_("Researching in: "), String(Div(Sub(ActiveUnitVar("RadarResearch","Max", "Unit"),ActiveUnitVar("RadarResearch","Value", "Unit")),60)), ":",
		If(GreaterThanOrEq(Sub(Sub(ActiveUnitVar("RadarResearch","Max", "Unit"),ActiveUnitVar("RadarResearch","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("RadarResearch","Max", "Unit"),ActiveUnitVar("RadarResearch","Value", "Unit")),60))),10),
		String(Sub(Sub(ActiveUnitVar("RadarResearch","Max", "Unit"),ActiveUnitVar("RadarResearch","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("RadarResearch","Max", "Unit"),ActiveUnitVar("RadarResearch","Value", "Unit")),60)))),
		Concat("0",String(Sub(Sub(ActiveUnitVar("RadarResearch","Max", "Unit"),ActiveUnitVar("RadarResearch","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("RadarResearch","Max", "Unit"),ActiveUnitVar("RadarResearch","Value", "Unit")),60))))))
		)}}
	},
--Superweapon Time
    { Pos = {15, 123+8}, Condition = {Charge = "only", Superweapon = "only", ShowOpponent = true, UpgradeTo = "false"},
		More = {"Text", {Text = Concat(_("Estimated time: "), String(Div(Sub(ActiveUnitVar("Charge","Max", "Unit"),ActiveUnitVar("Charge","Value", "Unit")),60)), ":",
		If(GreaterThanOrEq(Sub(Sub(ActiveUnitVar("Charge","Max", "Unit"),ActiveUnitVar("Charge","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("Charge","Max", "Unit"),ActiveUnitVar("Charge","Value", "Unit")),60))),10),
		String(Sub(Sub(ActiveUnitVar("Charge","Max", "Unit"),ActiveUnitVar("Charge","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("Charge","Max", "Unit"),ActiveUnitVar("Charge","Value", "Unit")),60)))),
		Concat("0",String(Sub(Sub(ActiveUnitVar("Charge","Max", "Unit"),ActiveUnitVar("Charge","Value", "Unit")),Mul(60,Div(Sub(ActiveUnitVar("Charge","Max", "Unit"),ActiveUnitVar("Charge","Value", "Unit")),60))))))
		)}}
	},
-- Resource Carry
	{ Pos = {61, 57}, Condition = {CarryResource = "only", ShowOpponent = false, UpgradeTo = "false"},
		More = {"CompleteBar", {Variable = "CarryResource", Height = 11, Width = 100, Border = true}}
	},
	{ Pos = {111, 60}, Condition = {CarryResource = "only", ShowOpponent = false, UpgradeTo = "false"},
		More = {"FormattedText2", {
			Font = "small", Variable = "CarryResource", Format = "%d/%d",
			Component1 = "Value", Component2 = "Max", Centered = true}}
	},

  } },
-- Attack Unit -----------------------------
  {
  Ident = "panel-attack-unit-contents",
  Pos = {info_panel_x, info_panel_y},
  DefaultFont = "game",
  Condition = {ShowOpponent = true, HideNeutral = true, Building = "false", Build = "false", UpgradeTo = "false"},
  Contents = {
-- Unit caracteristics
	{ Pos = {15, 85}, Condition = {ShowOpponent = false},
		More = {"FormattedText2", {
			Variable1 = "Xp", Variable2 = "Kill", Format = _("XP:~<%d~> Kills:~<%d~>")}}
	},
	{ Pos = {15, 74}, Condition = {UAC = "only", Dead = "false", ShowOpponent = true},
		More = {"Text", {Text = Concat(_("Rank: "), If(GreaterThanOrEq(ActiveUnitVar("Veterancy"),4),_("elite"),
												 If(GreaterThanOrEq(ActiveUnitVar("Veterancy"),3),_("captain"),
												 If(GreaterThanOrEq(ActiveUnitVar("Veterancy"),2),_("sergeant"),_("marine")))))}}

	},
	{ Pos = {15, 74}, Condition = {Hell = "only", Dead = "false", ShowOpponent = true},
		More = {"Text", {Text = Concat(_("Rank: "), If(GreaterThanOrEq(ActiveUnitVar("Veterancy"),4),_("chosen one"),
												 If(GreaterThanOrEq(ActiveUnitVar("Veterancy"),3),_("soulsucker"),
												 If(GreaterThanOrEq(ActiveUnitVar("Veterancy"),2),_("adept"),_("hound")))))}}

	},
	{ Pos = {15, 96}, Condition = {ShowArmor = "only", ShowOpponent = false},
		More = {"Text", {
					Text = Concat(_("Armor: "),If(Equal(ActiveUnitVar("IsLightArmor","Value","Unit"),1),_("light"),""),
											If(Equal(ActiveUnitVar("IsCombatArmor","Value","Unit"),1),_("heavy"),""),
											If(Equal(ActiveUnitVar("IsHeavyArmor","Value","Unit"),1),_("shield"),""),
											If(Equal(ActiveUnitVar("IsMechanicalArmor","Value","Unit"),1),_("mech"),""),
											If(Equal(ActiveUnitVar("IsAirMechanicalArmor","Value","Unit"),1),_("mech"),""),
											If(Equal(ActiveUnitVar("IsFleshArmor","Value","Unit"),1),_("light flesh"),""),
											If(Equal(ActiveUnitVar("IsHeavyFleshArmor","Value","Unit"),1),_("heavy flesh"),""),
											If(Equal(ActiveUnitVar("IsAirFleshArmor","Value","Unit"),1),_("heavy flesh"),""),
											If(Equal(ActiveUnitVar("IsBuildingArmor","Value","Unit"),1),_("building"),""),
											If(Equal(ActiveUnitVar("IsHeavyBuildingArmor","Value","Unit"),1),_("concrete"),""),
											If(Equal(ActiveUnitVar("IsCursedArmor","Value","Unit"),1),_("cursed"),""))}}
	},
	{ Pos = {15, 107}, Condition = {SightRange = "only", ShowOpponent = false},
		More = {"Text", {Text = _("Sight Range: "), Variable = "SightRange", Component = "Max"}}
	},
	{ Pos = {15, 140}, Condition = {Mines = "only", ShowOpponent = false},
		More = {"Text", {Text = _("Mines left: "), Variable = "Mines", Component = "Value"}}
	}} })

Load("scripts/uac/ui.lua")
Load("scripts/hell/ui.lua")

UI.MessageFont = Fonts["game"]
UI.MessageScrollSpeed = 5

DefineCursor({
  Name = "cursor-glass",
  Race = "any",
  File = "graphics/ui/cursors/magnifying_glass.png",
  Rate = 50,
  HotSpot = {11, 11},
  Size = {23, 23}})
DefineCursor({
  Name = "cursor-cross",
  Race = "any",
  File = "graphics/ui/cursors/small_green_cross.png",
  HotSpot = { 8,  8},
  Size = {18, 18}})
DefineCursor({
  Name = "cursor-scroll",
  Race = "any",
  File = "graphics/ui/cursors/cross.png",
  HotSpot = {15, 15},
  Size = {32, 32}})
DefineCursor({
  Name = "cursor-arrow-e",
  Race = "any",
  File = "graphics/ui/cursors/arrow_e.png",
  HotSpot = {22, 10},
  Size = {32, 24}})
DefineCursor({
  Name = "cursor-arrow-ne",
  Race = "any",
  File = "graphics/ui/cursors/arrow_ne.png",
  HotSpot = {20,  2},
  Size = {32, 24}})
DefineCursor({
  Name = "cursor-arrow-n",
  Race = "any",
  File = "graphics/ui/cursors/arrow_n.png",
  HotSpot = {12,  2},
  Size = {32, 24}})
DefineCursor({
  Name = "cursor-arrow-nw",
  Race = "any",
  File = "graphics/ui/cursors/arrow_nw.png",
  HotSpot = { 2,  2},
  Size = {32, 24}})
DefineCursor({
  Name = "cursor-arrow-w",
  Race = "any",
  File = "graphics/ui/cursors/arrow_w.png",
  HotSpot = { 4, 10},
  Size = {32, 24}})
DefineCursor({
  Name = "cursor-arrow-s",
  Race = "any",
  File = "graphics/ui/cursors/arrow_s.png",
  HotSpot = {12, 22},
  Size = {32, 24}})
DefineCursor({
  Name = "cursor-arrow-sw",
  Race = "any",
  File = "graphics/ui/cursors/arrow_sw.png",
  HotSpot = { 2, 18},
  Size = {32, 24}})
DefineCursor({
  Name = "cursor-arrow-se",
  Race = "any",
  File = "graphics/ui/cursors/arrow_se.png",
  HotSpot = {20, 18},
  Size = {32, 24}})

function GetRGBA(r, g, b, a)
if (doom.preferences.UseOpenGL == false) then
	return b + g*256 + r*65536 + a*16777216
else
	return r + g*256 + b*65536 + a*16777216
end
end

DefinePopup({
	Ident = "popup-commands",
	BackgroundColor = GetRGBA(128,128,128, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, 
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1},
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
	}	
})

DefinePopup({
	Ident = "popup-uac-commands",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
			-- Move  hint
			{ 	Margin = {1, 1}, Condition = {ButtonAction = "move"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonAction = "move"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<ALT~>-click to defend unit."), MaxWidth = Video.Width / 5}}
			},
			{ 	Condition = {ButtonAction = "move"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<SHIFT~>-click to make waypoints."), MaxWidth = Video.Width / 5}}
			},
			-- Repair hint
			{ 	Margin = {1, 1}, Condition = {ButtonAction = "repair"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonAction = "repair"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-repair of damaged buildings."), MaxWidth = Video.Width / 5}}
			},
			-- Medic heal hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-medic-heal"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-medic-heal"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables autoheal ability."), MaxWidth = Video.Width / 5}}
			},
			-- Technician repair hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-technician-repair"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-technician-repair"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-repair ability."), MaxWidth = Video.Width / 5}}
			},
			-- Technician repair hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-technician-armor-repair"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-technician-armor-repair"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-repair ability."), MaxWidth = Video.Width / 5}}
			},
	}	
})

DefinePopup({
	Ident = "popup-uac-building",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, HighlightColor = "full-red",
			}, 
			{ 	Condition = {HitPoints = "only"}, HighlightColor = "full-red",
				More = {"Variable", {Text = _("Hit Points: "), Variable = "HitPoints"}}
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			-- wall hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "unit-uac-wall"}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {ButtonValue = "unit-uac-wall"},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("Hint : You can build walls quickly by pressing SHIFT and moving the building cursor."), MaxWidth = Video.Width / 5}}
			},
			
	}	
})

DefinePopup({
	Ident = "popup-uac-attack-building",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, HighlightColor = "full-red",
			}, 
			{ 	Condition = {HitPoints = "only"}, HighlightColor = "full-red",
				More = {"Variable", {Text = _("Hit Points: "), Variable = "HitPoints"}}
			}, 
			{ 	HighlightColor = "full-red",
				More = {"Variable", {Text = _("Attack Range: "), Variable = "AttackRange"}}
			}, 		
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
	}	
})

DefinePopup({
	Ident = "popup-uac-unit",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, HighlightColor = "full-red",
			}, 
			{ 	Condition = {HitPoints = "only"}, HighlightColor = "full-red",
				More = {"Variable", {Text = _("Hit Points: "), Variable = "HitPoints"}}
			},
			{ 	Condition = {BaseDamage = "only"}, HighlightColor = "full-red",
				More = {"Variable", {Text = Concat(_("Base damage: "), If(GreaterThan(TypeVar("BaseDamage","Value"),0),
										Concat("", String(TypeVar("BaseDamage","Value")), ""),""),
										If(GreaterThan(TypeVar("BaseDamage2","Value"),0),
										Concat("/", String(TypeVar("BaseDamage2","Value")), ""),""),
										If(GreaterThan(TypeVar("BaseDamage3","Value"),0),
										Concat("/", String(TypeVar("BaseDamage3","Value")), ""),""))}}
			},
			{ 	Condition = {ShowArmor = "only"}, HighlightColor = "full-red",
				More = {"Variable", {Text = Concat(_("Armor: "), If(Equal(TypeVar("IsLightArmor","Value"),1),_("light"),""),
											If(Equal(TypeVar("IsCombatArmor","Value"),1),_("heavy"),""),
											If(Equal(TypeVar("IsHeavyArmor","Value"),1),_("shield"),""),
											If(Equal(TypeVar("IsMechanicalArmor","Value"),1),_("mech"),""),
											If(Equal(TypeVar("IsAirMechanicalArmor","Value"),1),_("mech"),""),
											If(Equal(TypeVar("IsFleshArmor","Value"),1),_("light flesh"),""),
											If(Equal(TypeVar("IsHeavyFleshArmor","Value"),1),_("heavy flesh"),""),
											If(Equal(TypeVar("IsAirFleshArmor","Value"),1),_("heavy flesh"),""),
											If(Equal(TypeVar("IsBuildingArmor","Value"),1),_("building"),""),
											If(Equal(TypeVar("IsHeavyBuildingArmor","Value"),1),_("concrete"),""),
											If(Equal(TypeVar("IsCursedArmor","Value"),1),_("cursed"),""))}}
			}, 	
			{ 	HighlightColor = "full-red",
				More = {"Variable", {Text = _("Attack Range: "), Variable = "AttackRange"}}
			}, 		
			{ 	HighlightColor = "full-red",
				More = {"Variable", {Text = _("Points: "), Variable = "Points"}}
			},
			{ 	Condition = {SightRange = "only"}, HighlightColor = "full-red",
				More = {"Variable", {Text = _("Sight Range: "), Variable = "SightRange"}}
			}, 	
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
	}	
})

DefinePopup({
	Ident = "popup-uac-upgrade",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			},
			{ 	Margin = {1, 1}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, HighlightColor = "full-red",
			},
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			-- Affecting
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "upgrade-shotguns"}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {ButtonValue = "upgrade-shotguns"},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("Affects: Shotgunner, Super Shotgunner, Doomer"), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "upgrade-bullet-weapons"}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {ButtonValue = "upgrade-bullet-weapons"},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("Affects: Chaingun Trooper, Chaingun Tower, Combat Medic"), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "upgrade-explosive-weapons"}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {ButtonValue = "upgrade-explosive-weapons"},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("Affects: Technician, Rocket Launcher Trooper, Missile Turret, Crusher, Doomer"), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "upgrade-infantry-energy"}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {ButtonValue = "upgrade-infantry-energy"},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("Affects: Heavy Trooper, Commando, Doomer"), MaxWidth = Video.Width / 5}}
			},			
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "upgrade-vehicle-energy"}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {ButtonValue = "upgrade-vehicle-energy"},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("Affects: Raider, Thor, Fighter"), MaxWidth = Video.Width / 5}}
			},	
	}	
})

DefinePopup({
	Ident = "popup-uac-ability",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 
				Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-technician-repair"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-technician-repair"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-medic-collect"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-medic-collect"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability. The samples will be collected only if there are no enemies in attack range."), MaxWidth = Video.Width / 5}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-medic-berserk"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-medic-berserk"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
			
	}	
})

DefinePopup({
	Ident = "popup-uac-spell",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 
				Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 
				Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{
				Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Costs"}
			},
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-technician-repair"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-technician-repair"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-medic-berserk"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-medic-berserk"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-defibrillation"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-defibrillation"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
			-- Technician repair hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-hero-bfg"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-hero-bfg"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "cyan",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-repair ability."), MaxWidth = Video.Width / 5}}
			},
	}	
})

DefinePopup({
	Ident = "popup-uac-superweapon",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 
				Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			},
			{ 
				Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{
				Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Costs"}
			},
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
	}	
})

DefinePopup({
	Ident = "popup-hell-commands",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Move  hint
			{ 	Margin = {1, 1}, Condition = {ButtonAction = "move"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonAction = "move"}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"Text", {Text = _("~<ALT~>-click to defend unit."), MaxWidth = Video.Width / 5}}
			},
			{ 	Condition = {ButtonAction = "move"}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"Text", {Text = _("~<SHIFT~>-click to make waypoints."), MaxWidth = Video.Width / 5}}
			},
			-- Repair hint
			{ 	Margin = {1, 1}, Condition = {ButtonAction = "repair"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonAction = "repair"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-repair of damaged buildings."), MaxWidth = Video.Width / 5}}
			},
	}	
})

DefinePopup({
	Ident = "popup-hell-building",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{	Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, TextColor = "white", HighlightColor = "full-red",
			}, 
			{ 	Condition = {HitPoints = "only"}, TextColor = "white", HighlightColor = "full-red",
				More = {"Variable", {Text = _("Hit Points: "), Variable = "HitPoints"}}
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			
	}	
})

DefinePopup({
	Ident = "popup-hell-attack-building",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, TextColor = "white", HighlightColor = "full-red",
			}, 
			{ 	Condition = {HitPoints = "only"}, TextColor = "white", HighlightColor = "full-red",
				More = {"Variable", {Text = _("Hit Points: "), Variable = "HitPoints"}}
			}, 
			{ 	TextColor = "white", HighlightColor = "full-red",
				More = {"Variable", {Text = _("Attack Range: "), Variable = "AttackRange"}}
			}, 		
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
	}	
})

DefinePopup({
	Ident = "popup-hell-unit",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 	Margin = {1, 1}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, TextColor = "white", HighlightColor = "full-red",
			}, 
			{ 	Condition = {HitPoints = "only"}, TextColor = "white", HighlightColor = "full-red",
				More = {"Variable", {Text = _("Hit Points: "), Variable = "HitPoints"}}
			}, 
			{ 	Condition = {BaseDamage = "only"}, HighlightColor = "full-red",
				More = {"Variable", {Text = Concat(_("Base damage: "), If(GreaterThan(TypeVar("BaseDamage","Value"),0),
										Concat("", String(TypeVar("BaseDamage","Value")), ""),""),
										If(GreaterThan(TypeVar("BaseDamage2","Value"),0),
										Concat("/", String(TypeVar("BaseDamage2","Value")), ""),""),
										If(GreaterThan(TypeVar("BaseDamage3","Value"),0),
										Concat("/", String(TypeVar("BaseDamage3","Value")), ""),""))}}
			},
			{ 	Condition = {ShowArmor = "only"}, TextColor = "white", HighlightColor = "full-red",
				More = {"Variable", {Text = Concat(_("Armor: "), If(Equal(TypeVar("IsLightArmor","Value"),1),"light",""),
											If(Equal(TypeVar("IsCombatArmor","Value"),1),"heavy",""),
											If(Equal(TypeVar("IsHeavyArmor","Value"),1),"shield",""),
											If(Equal(TypeVar("IsMechanicalArmor","Value"),1),"mech",""),
											If(Equal(TypeVar("IsAirMechanicalArmor","Value"),1),"mech",""),
											If(Equal(TypeVar("IsFleshArmor","Value"),1),"light flesh",""),
											If(Equal(TypeVar("IsHeavyFleshArmor","Value"),1),"heavy flesh",""),
											If(Equal(TypeVar("IsAirFleshArmor","Value"),1),"heavy flesh",""),
											If(Equal(TypeVar("IsBuildingArmor","Value"),1),"building",""),
											If(Equal(TypeVar("IsHeavyBuildingArmor","Value"),1),"concrete",""),
											If(Equal(TypeVar("IsCursedArmor","Value"),1),"cursed",""))}}
			}, 	
			{ 	
				More = {"Variable", {Text = _("Attack Range: "), Variable = "AttackRange"}, TextColor = "white", HighlightColor = "full-red"}
			}, 	
			{ 	
				More = {"Variable", {Text = _("Points: "), Variable = "Points"}, TextColor = "white", HighlightColor = "full-red"}
			},
			{ 	Condition = {SightRange = "only"}, 
				More = {"Variable", {Text = _("Sight Range: "), Variable = "SightRange"}, TextColor = "white", HighlightColor = "full-red"}
			}, 	
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, TextColor = "white", HighlightColor = "full-red",
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			-- wall hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "unit-hell-wall"}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {ButtonValue = "unit-hell-wall"},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("Hint : You can build walls quickly by pressing SHIFT and moving the building cursor."), MaxWidth = Video.Width / 5}}
			},
	}	
})

DefinePopup({
	Ident = "popup-hell-upgrade",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 	Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	More = {"Costs"}, TextColor = "white", HighlightColor = "full-red",
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			}, 
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
	}	
})

DefinePopup({
	Ident = "popup-hell-ability",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 
				Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			-- Portal hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-gate-exit"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-gate-exit"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("NOTE: you can't create portal if you are summoning units through Hell Gate"), MaxWidth = Video.Width / 5}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-ressurect"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-ressurect"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
	}	
})

DefinePopup({
	Ident = "popup-hell-spell",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 
				Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 
				Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 
				Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"Costs"}
			},
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-ressurect"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-ressurect"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-destroy-armor"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-destroy-armor"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
			-- Auto-hint
			{ 	Margin = {1, 1}, Condition = {ButtonValue = "spell-invulnerability"},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Condition = {ButtonValue = "spell-invulnerability"}, Margin = {1, 1}, TextColor = "yellow", HighlightColor = "full-red",
				More = {"Text", {Text = _("~<CTRL~>-click on button enables/disables auto-cast for this ability."), MaxWidth = Video.Width / 5}}
			},
	}	
})

DefinePopup({
	Ident = "popup-hell-superweapon",
	BackgroundColor = GetRGBA(128,8,0, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			{ 
				Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Hint"}}
			}, 
			{ 
				Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 
				Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"Costs"}
			},
			-- Description
			{ 	Margin = {1, 1}, Condition = {HasDescription = true},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Condition = {HasDescription = true}, Margin = {1, 1}, TextColor = "white", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Description", MaxWidth = Video.Width / 5}}
			},
			-- Dependencies
			{ 	Margin = {1, 1}, Condition = {HasDependencies = true}, 
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{  Margin = {1, 1}, Condition = {HasDependencies = true},  
				TextColor = "yellow", HighlightColor = "full-red",
				More = {"ButtonInfo", {InfoType = "Dependencies"}}
			},
	}	
})
