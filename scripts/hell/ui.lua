DefineCursor({
  Name = "cursor-point",
  Race = "hell",
  File = "graphics/ui/hell/cursors/hell-cursor.png",
  HotSpot = {1, 1},
  Size = {32, 32}})
DefineCursor({
  Name = "cursor-green-hair",
  Race = "hell",
  File = "graphics/ui/hell/cursors/hell-cursor-place.png",
  HotSpot = {1, 1},
  Size = {32, 32}})
DefineCursor({
  Name = "cursor-yellow-hair",
  Race = "hell",
  File = "graphics/ui/hell/cursors/hell-cursor-place.png",
  HotSpot = {1, 1},
  Size = {32, 32}})
DefineCursor({
  Name = "cursor-red-hair",
  Race = "hell",
  File = "graphics/ui/hell/cursors/hell-cursor-target.png",
  HotSpot = {1, 1},
  Size = {32, 32}})

UI.PieMenu.G = CGraphic:New("graphics/ui/hell/hellpie.png") 

DefineDecorations({Index = "Haste", ShowOpponent = true,
  Offset = {16, 0}, Method = {"static-sprite", {"sprite-spell", 1, 60}}})

UI.NormalFontColor = "yellow"
UI.ReverseFontColor = "white"

UI.Fillers:clear()

function AddFiller(file, x, y)
	if CanAccessFile(file) == true then
		b = CFiller:new_local()
		b.G = CGraphic:New(file)
		b.X = x
		b.Y = y
		UI.Fillers:push_back(b)
	end
end

AddFiller("graphics/ui/hell/" .. Video.Width  .. "x" .. Video.Height .. "/interface.png", 0, 0)

UI.InfoPanel.X = Video.Width-176
UI.InfoPanel.Y = 25

b = CUIButton:new()
b.X = Video.Width-176+9
b.Y = 24 + 40
b.Style = FindButtonStyle("icon")
UI.SingleSelectedButton = b

UI.SelectedButtons:clear()

function AddSelectedButton(x, y)
	b = CUIButton:new_local()
	b.X = x
	b.Y = y
	b.Style = FindButtonStyle("icon")
	UI.SelectedButtons:push_back(b)
end

for j=0,2 do
for i=1,4 do
AddSelectedButton(Video.Width-176+9+54*j,  34*(6-i)-32)
end
end

UI.Timer.X = UI.MapArea.EndY - 30
UI.Timer.Y = UI.MapArea.Y + 15
UI.Timer.Font = Fonts["game"]


UI.MaxSelectedFont = Fonts["game"]
UI.MaxSelectedTextX = Video.Width-176+ 12
UI.MaxSelectedTextY = 186

b = CUIButton:new()
b.X = Video.Width - 176+9
b.Y = 108
b.Style = FindButtonStyle("icon")
UI.SingleTrainingButton = b

UI.TrainingButtons:clear()

function AddTrainingButton(x, y)
	b = CUIButton:new_local()
	b.X = x
	b.Y = y
	b.Style = FindButtonStyle("icon")
	UI.TrainingButtons:push_back(b)
end

for j=0,1 do
for i=0,11 do
AddTrainingButton(Video.Width - 176+9+9*i, 108+40*j)
end
end

b = CUIButton:new()
b.X = Video.Width - 176+9+100
b.Y = 108
b.Style = FindButtonStyle("icon")
UI.UpgradingButton = b

b = CUIButton:new()
b.X = Video.Width - 176+9+100
b.Y = 108
b.Style = FindButtonStyle("icon")
UI.ResearchingButton = b

UI.TransportingButtons:clear()

function AddTransportingButton(x, y)
	b = CUIButton:new_local()
	b.X = x
	b.Y = y
	b.Style = FindButtonStyle("icon")
	UI.TransportingButtons:push_back(b)
end

for j=1,2 do
for i=0,2 do
AddTransportingButton(Video.Width - 176+12+1+56*i, 197+48*j)
end
end

UI.CompletedBarColorRGB = CColor(170, 30, 10)
UI.CompletedBarShadow = true

UI.ButtonPanel.Buttons:clear()

function AddButtonPanelButton(x, y)
	b = CUIButton:new_local()
	b.X = x
	b.Y = y
	b.Style = FindButtonStyle("icon")
	UI.ButtonPanel.Buttons:push_back(b)
end

for j=0,2 do
for i=0,2 do
AddButtonPanelButton(Video.Width - 176+12+1+56*i, 197+48*j)
end
end

UI.ButtonPanel.X = Video.Width - 176
UI.ButtonPanel.Y = 197
UI.ButtonPanel.AutoCastBorderColorRGB = CColor(0, 0, 252)

UI.MapArea.X = 31
UI.MapArea.Y = 16
UI.MapArea.EndX = Video.Width - 176 - 1
UI.MapArea.EndY = Video.Height - 16 - 1

UI.Minimap.X = Video.Width -176 + 27
UI.Minimap.Y = 344 + 2
UI.Minimap.W = 128
UI.Minimap.H = 128

UI.StatusLine.TextX = 32
UI.StatusLine.TextY = Video.Height + 2 - 16
UI.StatusLine.Width = Video.Width - 32 - 2 - 176
UI.StatusLine.Font = Fonts["game"]

UI.Resources[1].G = CGraphic:New("graphics/ui/resources.png", 14, 14)
UI.Resources[1].IconFrame = 0
UI.Resources[1].IconX = Video.Width -176 + 8
UI.Resources[1].IconY = 1
UI.Resources[1].TextX = Video.Width -176 + 24
UI.Resources[1].TextY = 2

UI.Resources[3].G = CGraphic:New("graphics/ui/resources.png", 14, 14)
UI.Resources[3].IconFrame = 1
UI.Resources[3].IconX = Video.Width - 176 + 8
UI.Resources[3].IconY = 17
UI.Resources[3].TextX = Video.Width - 176 + 8 + 16
UI.Resources[3].TextY = 18


-- food
UI.Resources[FoodCost].G = CGraphic:New("graphics/ui/hell-power.png", 14, 14)
UI.Resources[FoodCost].IconFrame = 0
UI.Resources[FoodCost].IconX = Video.Width - 176 + 110
UI.Resources[FoodCost].IconY = 1
UI.Resources[FoodCost].TextX = Video.Width - 176 + 110 + 16
UI.Resources[FoodCost].TextY = 2

-- score
UI.Resources[ScoreCost].G = CGraphic:New("graphics/ui/score.png", 14, 14)
UI.Resources[ScoreCost].IconFrame = 0
UI.Resources[ScoreCost].IconX = Video.Width - 176 + 110
UI.Resources[ScoreCost].IconY = 17
UI.Resources[ScoreCost].TextX = Video.Width - 176 + 110 + 16
UI.Resources[ScoreCost].TextY = 18

-- mana
UI.Resources[ManaResCost].G = CGraphic:New("graphics/ui/resources.png", 14, 14)
UI.Resources[ManaResCost].IconFrame = 3
UI.Resources[ManaResCost].IconX = -100
UI.Resources[ManaResCost].IconY = -100
UI.Resources[ManaResCost].TextX = -100
UI.Resources[ManaResCost].TextY = -100

-- free workers
UI.Resources[FreeWorkersCount].G = CGraphic:New("graphics/ui/workers.png", 14, 14)
UI.Resources[FreeWorkersCount].IconFrame = 1
UI.Resources[FreeWorkersCount].IconX = Video.Width - 176 - 48
UI.Resources[FreeWorkersCount].IconY = 1
UI.Resources[FreeWorkersCount].TextX = Video.Width - 176 - 32
UI.Resources[FreeWorkersCount].TextY = 2

UI.MenuButton.X = 33
UI.MenuButton.Y = 0
UI.MenuButton.Text = _("Menu (~<F10~>)")
UI.MenuButton.Style = FindButtonStyle("main-hell")
UI.MenuButton:SetCallback(
  function()
    if (Editor.Running == EditorNotRunning) then
	  RunGameMenu()
	else
	  RunInEditorMenu()
	end
  end)

UI.NetworkMenuButton.X = 33
UI.NetworkMenuButton.Y = 2
UI.NetworkMenuButton.Text = _("Menu")
UI.NetworkMenuButton.Style = FindButtonStyle("main-hell")
UI.NetworkMenuButton:SetCallback(function() RunGameMenu() end)

UI.NetworkDiplomacyButton.X = 166
UI.NetworkDiplomacyButton.Y = 2
UI.NetworkDiplomacyButton.Text = _("Diplomacy")
UI.NetworkDiplomacyButton.Style = FindButtonStyle("main-hell")
UI.NetworkDiplomacyButton:SetCallback(function() RunDiplomacyMenu() end)

UI.UserButtons:clear()

function AddUserButton(x, y, style, text, callback)
	b = CUIButton:new()
	b.X = x
	b.Y = y
	b.Text = text
	b.Style = style
	b:SetCallback(callback)
	bb = CUIUserButton:new()
	bb.Button = b
	UI.UserButtons:push_back(bb)
end


AddUserButton(3, 18, FindButtonStyle("uac-button-prev-mode"), "", 
	function() 
		CycleViewportMode(-1)
		AddMessage(_("Previous viewport mode"))
	end)

AddUserButton(3, 60, FindButtonStyle("uac-button-next-mode"), "", 
	function() 
		CycleViewportMode(1)
		AddMessage(_("Next viewport mode"))
	end)

AddUserButton(3, 102, FindButtonStyle("uac-button-pause"), "", 
	function()
		if (IsNetworkGame() == false) then
			if (GetGamePaused()) then
				SetGamePaused(false)
				AddMessage(_("Game resumed"))
			else
				SetGamePaused(true)
				AddMessage(_("Game paused"))
			end
		end
	end)

AddUserButton(3, 144, FindButtonStyle("uac-button-center-message"), "", 
	function()
		CenterOnMessage()
	end)

AddUserButton(3, 186, FindButtonStyle("uac-button-toggle-terrain"), "", 
	function()
		UiToggleTerrain()
	end)

AddUserButton(3, 228, FindButtonStyle("hell-button-free-worker"), "", 
	function()
		UiFindIdleWorker()
	end)