--[[UI.ButtonPanel.Buttons:clear()
function AddButtonPanelButton(x, y)
	b = CUIButton:new_local()
	b.X = x
	b.Y = y
	b.Style = FindButtonStyle("icon")
	UI.ButtonPanel.Buttons:push_back(b)
end

UI.ButtonPanel.X = Video.Width - 176
UI.ButtonPanel.Y = 197
UI.ButtonPanel.AutoCastBorderColorRGB = CColor(0, 0, 252)

for j=0,2 do
for i=0,2 do
AddButtonPanelButton(UI.ButtonPanel.X+12+1+56*i, UI.ButtonPanel.Y+48*j)
end
end

for j=0,2 do
for i=0,3 do
AddButtonPanelButton(-100, -100)
end
end]]

-- load sounds
Load("sounds.lua")

-- new variables 
DefineBoolFlags("DeathMatchDoomer", "Item")

DefineVariables("HeavyArmorDamage5",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage6",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage7",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage8",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage9",{Value = 0, Increase = 0, Max = 1000, Enable = true})
DefineVariables("HeavyArmorDamage10",{Value = 0, Increase = 0, Max = 1000, Enable = true})

DefineVariables("AmmoBullets",{Value = 0, Increase = 0, Max = 200, Enable = true})
DefineVariables("AmmoShells",{Value = 0, Increase = 0, Max = 50, Enable = true})
DefineVariables("AmmoRockets",{Value = 0, Increase = 0, Max = 50, Enable = true})
DefineVariables("AmmoCells",{Value = 0, Increase = 0, Max = 300, Enable = true})

DefineVariables("HasChainsaw",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("HasShotgun",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("HasSSG",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("HasChaingun",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("HasRL",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("HasPlasma",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("HasBFG",{Value = 0, Increase = 0, Max = 1, Enable = true})

DefineVariables("HasBackpack",{Value = 0, Increase = 0, Max = 1, Enable = true})
DefineVariables("HasComputerMap",{Value = 0, Increase = 0, Max = 1, Enable = true})

DefineVariables("RespawnTime",{Value = 0, Increase = 0, Max = 10000, Enable = true})
DefineVariables("BerserkTime",{Value = 0, Increase = -30, Max = 100000, Enable = true})
DefineVariables("InvisTime",{Value = 0, Increase = 0, Max = 100000, Enable = true})
DefineVariables("WeaponReloadTime",{Value = 0, Increase = 0, Max = 100000, Enable = true})
DefineVariables("WeaponKilled",{Value = 9, Increase = 0, Max = 9, Enable = true})
DefineVariables("PlayerKiller",{Value = 0, Increase = 0, Max = 7, Enable = true})
DefineVariables("BotID",{Value = 0, Increase = 0, Max = 100, Enable = true})

--load icons
local iconlist = ListFilesInDirectory("maps/deathmatch/icons/")

for i = 1,table.getn(iconlist) do
    local name = string.sub(iconlist[i], 1, string.len(iconlist[i]) - 4)
    icon = CIcon:New(name)
    icon.G = CGraphic:New("maps/deathmatch/icons/" .. iconlist[i], 46, 38)
    icon.Frame = 0
end

-- new UI
local info_panel_x = Video.Width-176
local info_panel_y = 32
DefinePanelContents(
  {
  Ident = "panel-deathmatch-contents",
  Pos = {info_panel_x, info_panel_y}, DefaultFont = "game",
  Condition = {DeathMatchDoomer = "only"},
  Contents = {
	{ Pos = {61, 47}, Condition = {ShowOpponent = true, HideNeutral = true, ShieldPoints = "only"},
		 More = {"CompleteBar", {Variable = "ShieldPoints", Height = 11, Width = 100, Border = true, Color = "blue"}}
	 },
	  { Pos = {112, 50}, Condition = {ShowOpponent = false, HideNeutral = true, ShieldPoints = "only"},
		More = {"FormattedText2", {
			 Font = "small", Variable = "ShieldPoints", Format = "%d/%d",
			 Component1 = "Value", Component2 = "Max", Centered = true}}
	 },
	{ Pos = {12, 72}, Condition = {ShowOpponent = false},
		More = {"Text", "Bullets: "}
	},
	{ Pos = {67, 69}, Condition = {ShowOpponent = false},
		More = {"CompleteBar", {Variable = "AmmoBullets", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {118, 72}, Condition = {ShowOpponent = false},
		More = {"FormattedText2", {
			Font = "small", Variable = "AmmoBullets", Format = "%d/%d",
			Component1 = "Value", Component2 = "Max", Centered = true}}
	},
	{ Pos = {12, 82}, Condition = {ShowOpponent = false},
		More = {"Text", "Shells: "}
	},
	{ Pos = {67, 79}, Condition = {ShowOpponent = false},
		More = {"CompleteBar", {Variable = "AmmoShells", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {118, 82}, Condition = {ShowOpponent = false},
		More = {"FormattedText2", {
			Font = "small", Variable = "AmmoShells", Format = "%d/%d",
			Component1 = "Value", Component2 = "Max", Centered = true}}
	},
	{ Pos = {12, 92}, Condition = {ShowOpponent = false},
		More = {"Text", "Rockets: "}
	},
	{ Pos = {67, 89}, Condition = {ShowOpponent = false},
		More = {"CompleteBar", {Variable = "AmmoRockets", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {118, 92}, Condition = {ShowOpponent = false},
		More = {"FormattedText2", {
			Font = "small", Variable = "AmmoRockets", Format = "%d/%d",
			Component1 = "Value", Component2 = "Max", Centered = true}}
	},
	{ Pos = {12, 102}, Condition = {ShowOpponent = false},
		More = {"Text", "Cells: "}
	},
	{ Pos = {67, 99}, Condition = {ShowOpponent = false},
		More = {"CompleteBar", {Variable = "AmmoCells", Border = true, Height = 11, Width = 100, Color = "red"}}
	},
	{ Pos = {118, 102}, Condition = {ShowOpponent = false},
		More = {"FormattedText2", {
			Font = "small", Variable = "AmmoCells", Format = "%d/%d",
			Component1 = "Value", Component2 = "Max", Centered = true}}
	},
	{ Pos = {12, 112}, Condition = {ShowOpponent = false},
		More = {"Text", {Text = Concat("Weapons : ", 
			If(Equal(ActiveUnitVar("HasChainsaw","Value","Unit"), 1), "1 ", " "),
			"2 ", 
			If(Equal(ActiveUnitVar("HasShotgun","Value","Unit"), 1), "3 ", " "),
			If(Equal(ActiveUnitVar("HasSSG","Value","Unit"), 1), "4 ", " "),
			If(Equal(ActiveUnitVar("HasChaingun","Value","Unit"), 1), "5 ", " "),
			If(Equal(ActiveUnitVar("HasRL","Value","Unit"), 1), "6 ", " "),
			If(Equal(ActiveUnitVar("HasPlasma","Value","Unit"), 1), "7 ", " "),
			If(Equal(ActiveUnitVar("HasBFG","Value","Unit"), 1), "8 ", " "))}}
	},
	
  } })

DefinePopup({
	Ident = "popup-deathmatch-help",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			-- Description
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~<Welcome to Doom Wars DeathMatch!~>"), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("That help buttons are intended to introduce you the aspects of this mod. Hover your cursor over "
				.."buttons to get more detailed info about game specifics."), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("This mod brings up original Doom's deathmatch mode into realms of Doom Wars. So, as you can see, everything is in top-down perspective, instead of Doom's 3D. Though, almost all aspects of gameplay were moved without changes."),	MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("To win in this game, player should obtain 40 frags. A frag is counted when player kills another player. But if player kills himself, a frag won't be taken, because suicides are really rare there, in comparison with vanilla Doom."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("To take an item, just move on it, and player will take it. Like in original Doom, if player currently doesn't need that item(e.g. he stays on medikit with full health), it won't be taken."), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("Doom Wars Deathmatch use altdeath deathmatch settings(weapons and items respawn on their positions after specified period of time)."), MaxWidth = Video.Width / 5}}
			}
	}	
})

DefinePopup({
	Ident = "popup-deathmatch-weapons",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			-- Description
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("To obtain a weapon, just move on it and player will take it."), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("To select next or previous weapon, use [ and ] buttons on your keyboard. If you are running out of ammo, the next best weapon will be selected."), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("You can quickly switch to specified weapon using keys, like in original Doom:"),	MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!Q - fists."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!W - chainsaw."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!E - pistol."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!R - shotgun."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!T - super shotgun."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!Y - chaingun."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!U - rocket launcher."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!I - plasma rifle."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!O - BFG9000."),MaxWidth = Video.Width / 5}},
			}
	}	
})

DefinePopup({
	Ident = "popup-deathmatch-attack",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			-- Description
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("To obtain a weapon, just move on it and player will take it."), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("To select next or previous weapon, use Z and X buttons on your keyboard. If you are running out of ammo, the next best weapon will be selected."), MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1},
				More = {"Line", {Width = 0, Height = 1, Color = GetRGBA(192,192,255, 160)}}
			}, 
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("You can quickly switch to specified weapon using keys, like in original Doom:"),	MaxWidth = Video.Width / 5}}
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!Q - fists."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!W - chainsaw."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!E - pistol."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!R - shotgun."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!T - super shotgun."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!Y - chaingun."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!U - rocket launcher."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!I - plasma rifle."),MaxWidth = Video.Width / 5}},
			},
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("~!Y - BFG9000."),MaxWidth = Video.Width / 5}},
			}
	}	
})

DefinePopup({
	Ident = "popup-deathmatch-attackground",
	BackgroundColor = GetRGBA(0,64,160, 160),
	BorderColor = GetRGBA(192,192,255, 160),
	Contents = {
			-- Description
			{ 	Margin = {1, 1}, HighlightColor = "full-red",
				More = {"Text", {Text = _("To fire, use this button and select a location to shoot, or use ~<CTRL+ALT~> keys with right mouse click."), MaxWidth = Video.Width / 5}}
			},
	}	
})

local weap_strings = {"chainsaw", "pistol", "shotgun", "super shotgun", "chaingun", "rocket launcher", "plasma rifle", "BFG9000"}
function HandleDoomerMessages(slot, mesType, pickup)
	local player = GetUnitVariable(slot, "Player")
	local weapon = GetUnitVariable(slot, "Weapon", "Value")
	
	if (player == GetThisPlayer()) then
		if (mesType == 1) then -- no such weapon
			AddMessage("You haven't obtained " .. weap_strings[weapon] .. " yet!")
		elseif (mesType == 2) then -- not enough ammo for weapon
			AddMessage("You have no ammo for " .. weap_strings[weapon] .. "!")
		elseif (mesType == 3) then -- run out of ammo
			AddMessage("You have depleted " .. weap_strings[weapon] .. "'s ammo!")
		elseif (mesType == 4) then -- picked up an item
			local pickName = GetUnitVariable(pickup, "Name")
			AddMessage(pickName)
		end
	end
end

-- load units
Load("units.lua")

-- load items
Load("items.lua")

-- load new doomer code
Load("newdoomer.lua")

-- triggers

function DeathMatchTriggers()
	local welcome = 1
	local welcomeMessages = {
		"Welcome to Doom Wars Deathmatch Area!", 30,
		"Your goal is to gain 40 frags, killing other players", 45,
		"Prepare to battle!", 30,
		"3", 15,
		"2", 15,
		"1", 15,
		"Fight!", 0}
	local welcomeWait = 0
	
	local battleStarted = false
	local playerIDs = {0, 0, 0, 0, 0, 0, 0, 0}
	local playerRespawn = {0, 0, 0, 0, 0, 0, 0, 0}
	local playerIsAlive = {false, false, false, false, false, false, false, false}
	local startLocations = {{63, 7}, {12, 11}, {10, 72}, {87, 83}, {59, 39}, {47, 9}, {48, 87},
		{13, 47}, {78, 54}, {16, 26}, {14, 63}, {31, 33}}
	local itemLocations = {
		"unit-deathmatch-cell-pack",            {31,  8},
		"unit-deathmatch-cell-pack",            {56, 56},
		"unit-deathmatch-plasma-rifle",         {32,  8},
		"unit-deathmatch-plasma-rifle",         {55, 56},
		"unit-deathmatch-chaingun",             { 7, 26},
		"unit-deathmatch-chaingun",             {85, 54},
		"unit-deathmatch-bullet-box",           { 7, 25},
		"unit-deathmatch-bullet-box",           { 7, 27},
		"unit-deathmatch-bullet-box",           {76, 30},
		"unit-deathmatch-bullet-box",           {76, 31},	
		"unit-deathmatch-soulsphere",           {16, 82},
		"unit-deathmatch-bfg9000",              {50, 54},
		"unit-deathmatch-blue-armor",           {52, 67},
		"unit-deathmatch-armor-bonus",          {88, 70},
		"unit-deathmatch-armor-bonus",          {88, 69},
		"unit-deathmatch-armor-bonus",          {88, 68},
		"unit-deathmatch-armor-bonus",          {88, 67},
		"unit-deathmatch-armor-bonus",          {88, 66},
		"unit-deathmatch-armor-bonus",          {88, 65},
		"unit-deathmatch-armor-bonus",          {88, 64},
		"unit-deathmatch-armor-bonus",          {88, 63},
		"unit-deathmatch-armor-bonus",          {88, 62},
		"unit-deathmatch-armor-bonus",          {88, 61},
		"unit-deathmatch-armor-bonus",          {88, 60},
		"unit-deathmatch-armor-bonus",          {88, 59},
		"unit-deathmatch-armor-bonus",          {55, 30},
		"unit-deathmatch-armor-bonus",          {55, 31},
		"unit-deathmatch-armor-bonus",          {55, 32},
		"unit-deathmatch-armor-bonus",          {55, 33},
		"unit-deathmatch-armor-bonus",          {55, 34},
		"unit-deathmatch-armor-bonus",          {55, 35},
		"unit-deathmatch-armor-bonus",          {55, 36},
		"unit-deathmatch-armor-bonus",          {55, 47},
		"unit-deathmatch-armor-bonus",          {55, 42},
		"unit-deathmatch-armor-bonus",          {55, 43},
		"unit-deathmatch-armor-bonus",          {55, 44},
		"unit-deathmatch-armor-bonus",          {55, 45},
		"unit-deathmatch-armor-bonus",          {55, 46},
		"unit-deathmatch-health-bonus",         {88, 55},
		"unit-deathmatch-health-bonus",         {88, 54},
		"unit-deathmatch-health-bonus",         {88, 53},
		"unit-deathmatch-health-bonus",         {88, 52},
		"unit-deathmatch-health-bonus",         {88, 51},
		"unit-deathmatch-health-bonus",         {88, 50},
		"unit-deathmatch-health-bonus",         {88, 49},
		"unit-deathmatch-health-bonus",         {88, 48},
		"unit-deathmatch-health-bonus",         {88, 47},
		"unit-deathmatch-health-bonus",         {88, 46},
		"unit-deathmatch-health-bonus",         {88, 45},
		"unit-deathmatch-health-bonus",         {48, 64},
		"unit-deathmatch-health-bonus",         {49, 64},
		"unit-deathmatch-health-bonus",         {50, 64},
		"unit-deathmatch-health-bonus",         {51, 64},
		"unit-deathmatch-health-bonus",         {52, 64},
		"unit-deathmatch-health-bonus",         {53, 64},
		"unit-deathmatch-health-bonus",         {54, 64},
		"unit-deathmatch-health-bonus",         {55, 64},
		"unit-deathmatch-health-bonus",         {56, 64},
		"unit-deathmatch-health-bonus",         {57, 64},
		"unit-deathmatch-health-bonus",         {58, 64},
		"unit-deathmatch-health-bonus",         {59, 64},
		"unit-deathmatch-health-bonus",         {60, 64},
		"unit-deathmatch-health-bonus",         {49, 60},
		"unit-deathmatch-health-bonus",         {50, 60},
		"unit-deathmatch-health-bonus",         {51, 60},
		"unit-deathmatch-health-bonus",         {52, 60},
		"unit-deathmatch-health-bonus",         {53, 60},
		"unit-deathmatch-health-bonus",         {54, 60},
		"unit-deathmatch-health-bonus",         {55, 60},
		"unit-deathmatch-health-bonus",         {56, 60},
		"unit-deathmatch-health-bonus",         {57, 60},
		"unit-deathmatch-health-bonus",         {58, 60},
		"unit-deathmatch-health-bonus",         {59, 60},
		"unit-deathmatch-health-bonus",         {60, 60},
		"unit-deathmatch-health-bonus",         {61, 60},
		"unit-deathmatch-health-bonus",         {62, 60},
		"unit-deathmatch-health-bonus",         {63, 60},
		"unit-deathmatch-health-bonus",         {64, 60},
		"unit-deathmatch-health-bonus",         {65, 60},
		"unit-deathmatch-health-bonus",         {66, 60},
		"unit-deathmatch-health-bonus",         {57, 53},
		"unit-deathmatch-health-bonus",         {58, 53},
		"unit-deathmatch-health-bonus",         {59, 53},
		"unit-deathmatch-health-bonus",         {60, 53},
		"unit-deathmatch-health-bonus",         {61, 53},
		"unit-deathmatch-health-bonus",         {62, 53},
		"unit-deathmatch-health-bonus",         {63, 53},
		"unit-deathmatch-health-bonus",         {64, 53},
		"unit-deathmatch-health-bonus",         {65, 53},
		"unit-deathmatch-health-bonus",         {66, 53},
		"unit-deathmatch-rl",                   {78, 43},
		"unit-deathmatch-rl",                   {73, 88},
		"unit-deathmatch-rocket",               {71, 88},
		"unit-deathmatch-rocket",               {72, 88},
		"unit-deathmatch-rocket",               {74, 88},
		"unit-deathmatch-rocket",               {75, 88},
		"unit-deathmatch-rocket",               {75, 87},
		"unit-deathmatch-rocket",               {71, 87},
		"unit-deathmatch-rocket",               {77, 44},
		"unit-deathmatch-rocket",               {77, 45},
		"unit-deathmatch-rocket",               {77, 46},
		"unit-deathmatch-rocket",               {77, 47},
		"unit-deathmatch-rocket",               {77, 48},
		"unit-deathmatch-rocket",               {80, 44},
		"unit-deathmatch-rocket",               {80, 45},
		"unit-deathmatch-rocket",               {80, 46},
		"unit-deathmatch-rocket",               {80, 47},
		"unit-deathmatch-rocket",               {80, 48},
		"unit-deathmatch-ssg",                  {75, 54},
		"unit-deathmatch-energy-cell",          {77, 60},
		"unit-deathmatch-energy-cell",          {77, 61},
		"unit-deathmatch-energy-cell",          {77, 62},
		"unit-deathmatch-energy-cell",          {80, 60},
		"unit-deathmatch-energy-cell",          {80, 61},
		"unit-deathmatch-energy-cell",          {80, 62},
		"unit-deathmatch-megasphere",           {72, 19},
		"unit-deathmatch-stimpack",             {11, 23},
		"unit-deathmatch-stimpack",             {11, 30},
		"unit-deathmatch-stimpack",             {44, 22},
		"unit-deathmatch-stimpack",             {51, 22},
		"unit-deathmatch-stimpack",             {68, 36},
		"unit-deathmatch-stimpack",             {68, 30},
		"unit-deathmatch-stimpack",             {36, 41},
		"unit-deathmatch-medikit",              {48, 25},
		"unit-deathmatch-medikit",              {29, 27},
		"unit-deathmatch-medikit",              {25, 38},
		"unit-deathmatch-medikit",              {40, 79},
		"unit-deathmatch-medikit",              {29, 69},
		"unit-deathmatch-medikit",              {73, 83},
		"unit-deathmatch-chainsaw",             {60, 39},
		"unit-deathmatch-green-armor",          {52, 39},
		"unit-deathmatch-green-armor",          {37, 88},
		"unit-deathmatch-shotgun",              {59, 79},
		"unit-deathmatch-shotgun",              {17, 42},
		"unit-deathmatch-shotgun",              {82,  9},
		"unit-deathmatch-shotgun",              {36, 58},
		"unit-deathmatch-shotgun",              {81, 84},
		"unit-deathmatch-shotgun",              {63, 31},
		"unit-deathmatch-shells",               {59, 78},
		"unit-deathmatch-shells",               {59, 80},
		"unit-deathmatch-shells",               {36, 56},
		"unit-deathmatch-shells",               {36, 57},
		"unit-deathmatch-shells",               {36, 59},
		"unit-deathmatch-shells",               {82, 10},
		"unit-deathmatch-shells",               {83,  9},
		"unit-deathmatch-shells",               {82,  8},
		"unit-deathmatch-shells",               {82,  9},
		"unit-deathmatch-shells",               {31, 13},
		"unit-deathmatch-shells",               {32, 13},
		"unit-deathmatch-shells",               {81, 83},
		"unit-deathmatch-shells",               {81, 85},
		"unit-deathmatch-shells",               {63, 30},
		"unit-deathmatch-shells",               {63, 32},
		"unit-deathmatch-shell-box",            {55, 36},
		"unit-deathmatch-shell-box",            {49, 79},
		"unit-deathmatch-shell-box",            {79, 30},
		"unit-deathmatch-rocket-box",           {44, 88},
		"unit-deathmatch-rocket-box",           {45, 88},
		"unit-deathmatch-rocket-box",           { 7, 63},
		"unit-deathmatch-rocket-box",           { 9, 65},
		"unit-deathmatch-berserk",              {78, 66},
		"unit-deathmatch-berserk",              { 7, 42},
		"unit-deathmatch-backpack",             { 7, 57},
		"unit-deathmatch-backpack",             {77, 29},
	}
	
	local obstacleLocations = {
		"unit-red-big-firestick",             {17, 19},
		"unit-red-big-firestick",             {25, 19},
		"unit-green-big-firestick",           {39, 16},
		"unit-green-big-firestick",           {56, 16},
		"unit-dead-on-stick",                 {25, 68},
		"unit-dead-on-stick",                 {25, 68},
	}
	
	local botNames = {"John Stalvern", "Demon Killer", "Bad Ass", "Exterminator", "Marine", "Abobo", "Daemon", "Invader",
		"MBF Bulldog", "Cybie", "Scientist", "Kane", "Mista Victim", "Speezdec", "Mr. Jack"}

	AddTrigger(
    function() 
		Cycles = GameCycle
		return false end,
    function() return true end)
	
	AddTrigger(function() return true end,
	function()
		local plrs = 0
		for plrs=0,5 do
			SetDiplomacy(plrs, "allied" , 6)
			SetDiplomacy(6, "enemy" , plrs)
		end

		for plrs=0,5 do
			for plrs2=0,5 do
				if mapinfo.playertypes[plrs+1]=="nobody" or mapinfo.playertypes[plrs2+1]=="nobody" or
				mapinfo.playertypes[plrs+1]==nil or mapinfo.playertypes[plrs2+1]==nil or
				GameSettings.Presets[plrs].Type ==-1 then
				else
					if plrs==plrs2 then
					else
						SetDiplomacy(plrs, "enemy" , plrs2)
						SetSharedVision(plrs, false, plrs2)				
					end
				end
			end
		end 
	end
	)
	AddTrigger(
	function() 
		if (welcomeWait > 0) then
			welcomeWait = welcomeWait - 1
		end
		return welcomeWait == 0 
	end,
	function()
		AddMessage(welcomeMessages[welcome])
		welcomeWait = welcomeMessages[welcome + 1]
		if (welcomeWait == 0) then
			-- initialization
			for i = 0, 5 do
				if (GameSettings.Presets[i].Type ~= PlayerPerson and GameSettings.Presets[i].Type ~= PlayerComputer) then
					playerRespawn[i + 1] = -1
				end
				if (GetPlayerData(i, "AiEnabled") == true) then
					--print(botNames[SyncRand(table.getn(botNames)) + 1])
					SetPlayerData(i, "Name", botNames[SyncRand(table.getn(botNames)) + 1])
				end
			end
			for i = 1, table.getn(itemLocations)/2 do
				local location = itemLocations[i * 2]
				CreateUnit(itemLocations[i * 2 - 1], 6, location)
			end
			for i = 1, table.getn(obstacleLocations)/2 do
				local location = obstacleLocations[i * 2]
				CreateUnit(obstacleLocations[i * 2 - 1], 15, location)
			end
			battleStarted = true
			return false
		else
			welcome = welcome + 2
		end
		return true
	end
	)
	
	AddTrigger(
	function() 
		return battleStarted == true
	end,
	function()
		-- check if our player was killed
		for i = 0, 5 do
			if (GetPlayerData(i, "Score") >= 40) then
				if (GetThisPlayer() == i) then
					ActionVictory()
				else
					ActionDefeat()
				end
			end
			if (playerRespawn[i + 1] ~= -1) then
				-- countdown respawn
				if (playerRespawn[i + 1] > 0) then
					playerRespawn[i + 1] = playerRespawn[i + 1] - 1
				end
				if (GetPlayerData(i, "TotalNumUnits") == 0 and playerIsAlive[i + 1] == true) then
					if (i == GetThisPlayer()) then
						AddMessage("You have been killed! You will recover in 5 seconds...")
					end
					playerIsAlive[i + 1] = false
					playerRespawn[i + 1] = 150
				end
				-- respawn
				local location, pixelLocation
				if (playerIsAlive[i + 1] == false and playerRespawn[i + 1] == 0) then
					local goodLocation = false
					-- let's spawn on the farthest spot
					local maxDistance = 0
					local isPlayersOnMap = false
					local minDistances = {}
					local maxDistancePos = 0
					local newPlayer
					for j = 1, table.getn(startLocations) do
						location = startLocations[j]
						minDistances[j] = 9999
						for k = 0, 5 do
							if (playerIsAlive[k + 1] == true) then
								isPlayersOnMap = true
								local distance = math.sqrt(math.abs(GetUnitVariable(playerIDs[k + 1], "PosX") - location[1])^2 + math.abs(GetUnitVariable(playerIDs[k + 1], "PosY") - location[2])^2)
								if (distance < minDistances[j]) then
									minDistances[j] = distance
								end
							end
						end
					end
					if (isPlayersOnMap == true) then
						for j = 1, table.getn(startLocations) do
							if (minDistances[j] > maxDistance) then
								maxDistancePos = j
								maxDistance = minDistances[j]
							end
						end
						location = startLocations[maxDistancePos]
					else
						location = startLocations[SyncRand(table.getn(startLocations))+1]
					end
					pixelLocation = {location[1] * 32, location[2] * 32}
					newPlayer = CreateUnit("unit-newdoomer", i, location)
					CreateMissile("missile-teleport-fog", pixelLocation, pixelLocation, -1, -1, false)
					playerIDs[i + 1] = newPlayer
					playerIsAlive[i + 1] = true
					if (i == GetThisPlayer()) then
						CenterMap(location[1], location[2])
					end					
				end
			end
		end
		return true
	end
	)
end

DeathMatchTriggers()

-- At last, load map itself
Load("(8)deathmatch.sms")