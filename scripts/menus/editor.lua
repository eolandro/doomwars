local RequestedExit = false
local loadmapname = mapname
--Save confirmation menu
function RunEditorConfirmErase(name,browser,menu)
  local confirm = WarGameMenu(panel(3))

  confirm:resize(300,120)

  confirm:addLabel(name, 300 / 2, 11)
  confirm:addLabel(_("File exists, are you sure ?"), 300 / 2, 31)

  confirm:addHalfButton(_("~!Yes"), "y", 1 * (300 / 3) - 90, 120 - 16 - 27,
    function()
        EditorSaveMap(browser.path .. name)
		RequestedExit = false
		UI.StatusLine:Set(_("Saved map to: ") .. browser.path .. name)
        confirm:stop()
        menu:stop()
    end)

  confirm:addHalfButton(_("~!No"), "n", 3 * (300 / 3) - 116, 120 - 16 - 27,
    function() confirm:stop() end)

  confirm:run(false)
end

local request

--Save request menu
function RunEditorRequestSave(menu)
  request = WarGameMenu(panel(3))

  request:resize(300,120)

  request:addLabel(name, 300 / 2, 11)
  request:addLabel(_("Do you want to save your map?"), 300 / 2, 31, Fonts["game"], true)

  request:addHalfButton(_("~!Yes"), "y", 1 * (300 / 3) - 90, 120 - 16 - 27,
    function()
		request:stop()
		if mapname~=nil then
			EditorSaveMap(mapname)
			Editor.Running = EditorNotRunning
			menu:stopAll()
		else
			RunEditorSaveMenu()
		end		
    end)

  request:addHalfButton(_("~!No"), "n", 2 * (300 / 3) - 103, 120 - 16 - 27,
    function() 
		if (mapname == nil) then
			mapname = loadmapname
		end
		request:stop()
		Editor.Running = EditorNotRunning
		menu:stopAll()	
	end)
  request:addHalfButton(_("~!Cancel"), "n", 3 * (300 / 3) - 116, 120 - 16 - 27,
    function() 
		request:stop()
	end)

  request:run(false)
end

--  Menu for new map to edit
local function RunEditorNewMapMenu()
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  local tilesets = {"mars","hell-fortress","uac-base","earth","hell"}
  local mapSizes = {"64", "96", "128", "160", "192", "224", "256"}

  menu:addLabel(_("Map description :"), offx + 208, offy + 104 + 32 * 0, Fonts["game"], false)
  local mapDescription = menu:addTextInputField("", offx + 208, offy + 104 + 32 * 1, 200)
  menu:addLabel(_("TileSet : "), offx + 208, offy + 104 + 32 * 2, Fonts["game"], false)
  local dropDownTileset = menu:addDropDown({"Mars", "Hell Fortress", "UAC Base", "Earth", "Hell"}, offx + 208 + 60, offy + 104 + 32 * 2, function() end)

  menu:addLabel(_("Size :"), offx + 208, offy + 104 + 32 * 3, Fonts["game"], false)
  local mapSizex = menu:addDropDown(mapSizes, offx + 208 + 50, offy + 104 + 32 * 3, function() end)
  mapSizex:setWidth(50)
  menu:addLabel("x", offx + 208 + 110, offy + 104 + 32 * 3, Fonts["game"], false)
  local mapSizey = menu:addDropDown(mapSizes, offx + 208 + 125, offy + 104 + 32 * 3, function() end)
  mapSizey:setWidth(50)

  menu:addFullButton(_("~!New map"), "n", offx + 208, offy + 104 + 36 * 5,
    function()
      -- TODO : check value
	  
      Map.Info.Description = mapDescription:getText()
      Map.Info.MapWidth = mapSizes[1 + mapSizex:getSelected()]
      Map.Info.MapHeight = mapSizes[1 + mapSizey:getSelected()]
      Load("scripts/tilesets/" .. tilesets[1 + dropDownTileset:getSelected()] .. ".lua") 
	  LoadTileModels("scripts/tilesets/" .. tilesets[1 + dropDownTileset:getSelected()] .. ".lua")
      menu:stop()
	  Load("scripts/uac/ui.lua")
	  Load("scripts/hell/ui.lua")
	  mapname = nil
      StartEditor(nil)  
      RunEditorMenu()
    end)
  menu:addFullButton(_("~!Cancel"), "c", offx + 208, offy + 104 + 36 * 6, function() menu:stop(1); RunEditorMenu() end)
  return menu:run()
end

-- Menu for loading map to edit
local function RunEditorLoadMapMenu()
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  local labelMapName
  local labelDescription
  local labelNbPlayer
  local labelMapSize

  -- update label content
  local function MapChanged()
    labelMapName:setCaption(_("File      : ") .. string.sub(mapname, 6))
    labelMapName:adjustSize()

    labelNbPlayer:setCaption(_("Players  : ") .. mapinfo.nplayers)
    labelNbPlayer:adjustSize()

    labelDescription:setCaption(_("Scenario : ") .. mapinfo.description)
    labelDescription:adjustSize()

    labelMapSize:setCaption(_("Size      : ") .. mapinfo.w .. " x " .. mapinfo.h)
    labelMapSize:adjustSize()
  end

  labelMapName = menu:addLabel("", offx + 208, offy + 104 + 36 * 0, Fonts["game"], false)
  labelDescription = menu:addLabel("", offx + 208, offy + 104 + 32 * 1, Fonts["game"], false)
  labelNbPlayer = menu:addLabel("", offx + 208, offy + 104 + 32 * 2, Fonts["game"], false)
  labelMapSize = menu:addLabel("", offx + 208, offy + 104 + 32 * 3, Fonts["game"], false)

  menu:addFullButton(_("~!Select map"), "s", offx + 208, offy + 104 + 36 * 4,
    function()
      local oldmapname = mapname
      RunSelectScenarioMenu()
      if (mapname ~= oldmapname) then
        GetMapInfo(mapname)
        MapChanged()
      end
    end)

  menu:addFullButton(_("~!Edit map"), "e", offx + 208, offy + 104 + 36 * 5, function() menu:stop(); Load(mapname); StartEditor(mapname); RunEditorMenu() end)
  menu:addFullButton(_("~!Cancel"), "c", offx + 208, offy + 104 + 36 * 6, function() menu:stop(1); RunEditorMenu() end)

  GetMapInfo(mapname)
  MapChanged()
  return menu:run()
end

-- root of the editor menu
function RunEditorMenu()
  SetPlayerData(GetThisPlayer(), "RaceName", "hell")

  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2

  menu:addLabel(_("~<Map Editor~>"), offx + 320, offy + 212 - 25)
  local buttonNewMap =
  menu:addFullButton(_("~!New map"), "n", offx + 208, offy + 104 + 36*3, function() RunEditorNewMapMenu(); menu:stop() end)
  menu:addFullButton(_("~!Load map"), "l", offx + 208, offy + 104 + 36*4, function() RunEditorLoadMapMenu(); menu:stop() end)
  if Editor.Running == EditorCommandLine then
	menu:addFullButton(_("~!Exit"), "e", offx + 208, offy + 104 + 36*5, function() menu:stopAll() end)
  else
	menu:addFullButton(_("~!Cancel"), "c", offx + 208, offy + 104 + 36*5, function() menu:stopAll() end)
  end
  
  return menu:run()
end

--
--  Save map from the editor
--
function RunEditorSaveMenu()
  local menu = WarGameMenu(panel(3))

  menu:resize(384, 256)

  menu:addLabel(_("Save Map"), 384 / 2, 11)
  local map = "newmap"
  local counter = 0
  
  local t = menu:addTextInputField("",
    (384 - 300 - 18) / 2, 11 + 36, 318)
  
  local browser = menu:addBrowser("maps", "^.*%.smp%.?g?z?$",
    (384 - 300 - 18) / 2, 11 + 36 + 22, 318, 126)
  local function cb(s)
    t:setText(browser:getSelectedItem())
  end
  browser:setActionCallback(cb)
  
  if mapname == nil then
	  while (1) do
		if (browser:exists(map .. ".smp.gz")) then
			counter = counter + 1
			map = string.sub(map, 1, 6) .. tostring(counter)
		else
			break
		end
	  end
	  
	  map = map .. ".smp"
	else
		map = string.sub(mapname, 6)
	end

  t:setText(map)
  
  
  menu:addHalfButton(_("~!Save"), "s", 1 * (384 / 3) - 106 - 10, 256 - 16 - 27,
    function()
      local name = t:getText()
      -- check for an empty string
      if (string.len(name) == 0) then
        return
      end
      -- strip .gz
      if (string.find(name, ".gz$") ~= nil) then
        name = string.sub(name, 1, string.len(name) - 3)
      end
      -- append .smp
      if (string.find(name, ".smp$") == nil) then
        name = name .. ".smp"
      end
	  -- append .gz
      name = name .. ".gz"
      -- replace invalid chars with underscore
      local t = {"\\", "/", ":", "*", "?", "\"", "<", ">", "|"}
      table.foreachi(t, function(k,v) name = string.gsub(name, v, "_") end)
	  if (browser:exists(name)) then
		RunEditorConfirmErase(name,browser,menu)
	  elseif (browser:exists(string.sub(name, 1, string.len(name) - 7))) then
		RunEditorConfirmErase(name,browser,menu)
	  else
		EditorSaveMap(browser.path .. name)
		mapname = browser.path .. name
		UI.StatusLine:Set("Saved map to: " .. browser.path .. name)
		
		if RequestedExit then
			Editor.Running = EditorNotRunning
			RequestedExit = false
			menu:stopAll()
		else
			RequestedExit = false
			menu:stop()
		end
		
	  end
    end)

  menu:addHalfButton(_("~!Cancel"), "c", 3 * (384 / 3) - 106 - 10, 256 - 16 - 27,
    function() menu:stop() end)

  menu:run(false)
end

--
--  Change player properties from the editor
--
function RunEditorPlayerProperties()
  local menu = WarGameMenu(panel(3))
  local sizeX = 384
  local sizeY = 256

  menu:resize(sizeX, sizeY)
  menu:addLabel(_("Players properties"), sizeX / 2, 6)

  local offxPlayer = 15
  local offxType = 70
  local offxRace = 135
  local offxAI = 192
  local offxMinerals = 290
  local offxEnergy = 355

  local types = {"neutral", "nobody", "computer", "person", "rescue-passive", "rescue-active"}
  local racenames = {"uac", "hell"}
  local ais = {"complex-attack","wc2-passive"}

  menu:addLabel("#", 15, 26, Fonts["game"])
  menu:addLabel(_("Type"), offxType, 26, Fonts["game"])
  menu:addLabel(_("Race"), offxRace, 26, Fonts["game"])
  menu:addLabel(_("AI"), offxAI, 26, Fonts["game"])
  menu:addLabel(_("Minerals"), offxMinerals, 26, Fonts["game"])
  menu:addLabel(_("Energy"), offxEnergy, 26, Fonts["game"])

  local playersProp = {nil, nil, nil, nil, nil,
                       nil, nil, nil}
  for i = 0, 7 do
    local playerLine = {
      type = nil,
      race = nil,
      ai = nil,
      minerals = nil,
      energy = nil,
    }
    local offy_i = 26 + 20 * (i + 1)
    local index = i -- use for local function

    local function updateProp(ind)
      local b = (playersProp[1 + ind].type:getSelected() ~= 1) -- != nobody
      playersProp[1 + ind].race:setVisible(b)
      playersProp[1 + ind].ai:setVisible(b)
      playersProp[1 + ind].minerals:setVisible(b)
      playersProp[1 + ind].energy:setVisible(b)
    end

    playersProp[1 + i] = playerLine

    menu:addLabel("p" .. (i + 1), offxPlayer, offy_i,Fonts["game"])

    playersProp[1 + i].type = menu:addDropDown(types, offxType - 40, offy_i, function() updateProp(index) end)
    playersProp[1 + i].type:setSelected(Map.Info.PlayerType[i] - 2)
    playersProp[1 + i].type:setWidth(80)

    playersProp[1 + i].race = menu:addDropDown(racenames, offxRace - 20, offy_i, function() end)
    playersProp[1 + i].race:setSelected(Players[i].Race)
    playersProp[1 + i].race:setWidth(35)

    playersProp[1 + i].ai = menu:addDropDown(ais, offxAI - 30, offy_i, function() end)
    for j = 0,3 do
      if (ais[1 + j] == Players[i].AiName) then playersProp[1 + i].ai:setSelected(j) end
    end
    playersProp[1 + i].ai:setWidth(100)

    playersProp[1 + i].minerals = menu:addTextInputField(Players[i].Resources[1], offxMinerals - 20, offy_i, 40)
    playersProp[1 + i].energy = menu:addTextInputField(Players[i].Resources[3], offxEnergy - 20, offy_i, 40)
    updateProp(i)
  end

  menu:addHalfButton("~!Ok", "o", 50, sizeY - 16 - 27,
    function()
      for i = 0, 7 do
        Map.Info.PlayerType[i] = playersProp[1 + i].type:getSelected() + 2
		Players[i].Type = playersProp[1 + i].type:getSelected() + 2
        Players[i].Race = playersProp[1 + i].race:getSelected()
        Players[i].AiName = ais[1 + playersProp[1 + i].ai:getSelected()]
        Players[i].Resources[1] = playersProp[1 + i].minerals:getText()
        Players[i].Resources[3] = playersProp[1 + i].energy:getText()
      end
      menu:stop()
    end)

  menu:addHalfButton(_("~!Cancel"), "c", 3 * (sizeX / 4) - 106 - 10, sizeY - 16 - 27,
    function() menu:stop() end)

  menu:run(false)
end

--
--  Change player properties from the editor
--
function RunEditorMapProperties()
-- TODO : manage edition of all properties.
  local menu = WarGameMenu(panel(3))

  local sizeX = 384
  local sizeY = 256

  menu:resize(sizeX, sizeY)
  menu:addLabel(_("Map properties"), sizeX / 2, 11)

  menu:addLabel(_("Map description: "), 45, 11 + 24, Fonts["game"], false)
  local desc = menu:addTextInputField(Map.Info.Description, 15, 24 * 2, 350)
  menu:addLabel(_("Map setup file: "), 45, 11 + 24 * 3, Fonts["game"], false)
  local setup = menu:addTextInputField(Map.Info.Filename, 15, 24 * 4, 350)

  menu:addLabel(_("Size    : ") .. Map.Info.MapWidth .. " x " .. Map.Info.MapHeight, 45, 24 * 5, Fonts["game"], false)

  menu:addLabel(_("TileSet : "), 45, 24 * 6, Fonts["game"], false)

  local list = {"mars","hell-fortress","uac-base"}
  local dropDownTileset = menu:addDropDown(list, 130, 24 * 7, function() end)
  for i = 0,3 do
    if (list[1 + i] == Map.Tileset.Name) then dropDownTileset:setSelected(i)
    end
  end
  dropDownTileset:setEnabled(false)

  menu:addHalfButton("~!Ok", "o", 1 * (sizeX / 3) - 106 - 10, sizeY - 16 - 27,
    function()
      Map.Info.Description = desc:getText()
	  Map.Info.Filename = setup:getText()
      menu:stop()
    end
    )

  menu:addHalfButton(_("~!Cancel"), "c", 3 * (sizeX / 3) - 106 - 10, sizeY - 16 - 27,
    function() menu:stop() end)

  menu:run(false)
end

function RunEditorQuitToMenuConfirmMenu()
	RequestedExit = true
	RunEditorRequestSave(menu)
end

--
--  Main menu in editor.
--
function RunInEditorMenu()
  local menu = WarGameMenu(panel(1))

  menu:addLabel(_("Editor Menu"), 128, 11)

  menu:addFullButton(_("Save (~<F11~>)"), "f11", 16, 40, RunEditorSaveMenu)
  menu:addFullButton(_("Map Properties (~<F5~>)"), "f5", 16, 40 + 36 * 1, RunEditorMapProperties)
  menu:addFullButton(_("Player Properties (~<F6~>)"), "f6", 16, 40 + 36 * 2, RunEditorPlayerProperties)

  menu:addFullButton(_("E~!xit to Menu"), "x", 16, 40 + 36 * 4,
    function() 
	RequestedExit = true
	RunEditorRequestSave(menu)
	end)
  menu:addFullButton(_("Return to Editor (~<Esc~>)"), "escape", 16, 288 - 40,
    function() menu:stop() end)
  RequestedExit = false
  menu:run(false)
end

--
--  Function to edit unit properties in Editor
--
function EditUnitProperties()

  if (GetUnitUnderCursor() == nil) then
    return;
  end
  local menu = WarGameMenu(panel(1))
  local sizeX = 256
  local sizeY = 200 -- 288

  menu:resize(sizeX, sizeY)
  menu:addLabel(_("Unit properties"), sizeX / 2, 11)

  if (GetUnitUnderCursor().Type.GivesResource == 0) then
	if (GetUnitBoolFlag(UnitNumber(GetUnitUnderCursor()), "Teleporter")) then
		menu:addLabel(_("Teleport properties"), sizeX / 2, 11 + 36)
		menu:addLabel(_("Dest. unit: "), 24, 11 + 72, nil, false)
		local destUnit = menu:addTextInputField("", sizeX / 2 - 15, 11 + 36 * 2, 60)
		if (GetUnitUnderCursor().Goal ~= nil) then
			destUnit:setText(UnitNumber(GetUnitUnderCursor().Goal))
		end

		menu:addHalfButton("~!Ok", "o", 24, sizeY - 40,
		  function() 
			SetTeleportDestination(UnitNumber(GetUnitUnderCursor()), tonumber(destUnit:getText()))
			menu:stop()
		end)
		  
	else
		menu:addLabel(_("Artificial Intelligence"), sizeX / 2, 11 + 36)
		local activeCheckBox = menu:addImageCheckBox("Active", 15, 11 + 72, g_checkbox_off, g_checkbox_on)
		activeCheckBox:setMarked(GetUnitUnderCursor().Active)

		menu:addHalfButton("~!Ok", "o", 24, sizeY - 40,
		  function() GetUnitUnderCursor().Active = activeCheckBox:isMarked();  menu:stop() end)
	end
  else
    local resourceName = {"minerals", "energy"}
    local resource = GetUnitUnderCursor().Type.GivesResource - 1
    menu:addLabel(_("Amount of " .. resourceName[1 + resource] .. " :"), 24, 11 + 36, nil, false)
	local resourceValue = menu:addTextInputField(GetUnitUnderCursor().ResourcesHeld, sizeX / 2 - 30, 11 + 36 * 2, 60)

    menu:addHalfButton("~!Ok", "o", 24, sizeY - 40,
      function() GetUnitUnderCursor().ResourcesHeld = resourceValue:getText();  menu:stop() end)
  end
  menu:addHalfButton(_("~!Cancel"), "c", 134, sizeY - 40,
    function() menu:stop() end)
  menu:run(false)
end
