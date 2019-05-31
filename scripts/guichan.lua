SetPlayerData(GetThisPlayer(), "RaceName", "hell")

-- Load delayed graphics now
for i = 1, table.getn(GraphicsDelayArray) do
	GraphicsDelayArray[i]:Load()
end

-- Global useful objects for menus  ----------
dark = Color(38, 38, 78)
clear = Color(200, 200, 120)
black = Color(0, 0, 0)

null_image = CGraphic:New("graphics/missiles/null.png")
null_image:Load()

bckground = CGraphic:New("graphics/ui/background.png")
bckground:Load()
bckground:Resize(Video.Width, Video.Height)
backgroundWidget = ImageWidget(bckground)

g_hbln = CGraphic:New("graphics/ui/uac/widgets/button-large-normal.png")
g_hbln:Load()
g_hblp = CGraphic:New("graphics/ui/uac/widgets/button-large-pressed.png")
g_hblp:Load()
g_hblg = CGraphic:New("graphics/ui/uac/widgets/button-large-grayed.png")
g_hblg:Load()

g_hbsn = CGraphic:New("graphics/ui/uac/widgets/button-small-normal.png")
g_hbsn:Load()
g_hbsp = CGraphic:New("graphics/ui/uac/widgets/button-small-pressed.png")
g_hbsp:Load()
g_hbsg = CGraphic:New("graphics/ui/uac/widgets/button-small-grayed.png")
g_hbsg:Load()

g_obln = CGraphic:New("graphics/ui/hell/widgets/button-large-normal.png")
g_obln:Load()
g_oblp = CGraphic:New("graphics/ui/hell/widgets/button-large-pressed.png")
g_oblp:Load()
g_oblg = CGraphic:New("graphics/ui/hell/widgets/button-large-grayed.png")
g_oblg:Load()

g_obsn = CGraphic:New("graphics/ui/hell/widgets/button-small-normal.png")
g_obsn:Load()
g_obsp = CGraphic:New("graphics/ui/hell/widgets/button-small-pressed.png")
g_obsp:Load()
g_obsg = CGraphic:New("graphics/ui/hell/widgets/button-small-grayed.png")
g_obsg:Load()

g_slider = CGraphic:New("graphics/ui/slider.png")
g_slider:Load()
g_marker = CGraphic:New("graphics/ui/marker.png")
g_marker:Load()
g_checkbox_off = CGraphic:New("graphics/ui/checkbox_off.png")
g_checkbox_off:Load()
g_checkbox_on = CGraphic:New("graphics/ui/checkbox_on.png")
g_checkbox_on:Load()



local hpanels = {
  "graphics/ui/uac/panel_1.png",
  "graphics/ui/uac/panel_2.png",
  "graphics/ui/uac/panel_3.png",
  "graphics/ui/uac/panel_4.png",
  "graphics/ui/uac/panel_5.png"
}

local opanels = {
  "graphics/ui/hell/panel_1.png",
  "graphics/ui/hell/panel_2.png",
  "graphics/ui/hell/panel_3.png",
  "graphics/ui/hell/panel_4.png",
  "graphics/ui/hell/panel_5.png"
}

function panel(n)
  if (GetPlayerData(GetThisPlayer(), "RaceName") == "uac") then
    return hpanels[n]
  else
    return opanels[n]
  end
end



function AddMenuHelpers(menu)
  function menu:addCentered(widget, x, y)
    self:add(widget, x - widget:getWidth() / 2, y)
  end

  function menu:addLabel(text, x, y, font, center)
    local label = Label(text)
    if (font == nil) then font = Fonts["large"] end
    label:setFont(font)
    label:adjustSize()
    if (center == nil or center == true) then -- center text by default
      x = x - label:getWidth() / 2
    end
    self:add(label, x, y)

    return label
  end

  function menu:writeText(text, x, y)
    return self:addLabel(text, x, y, Fonts["game"], false)
  end

  function menu:writeLargeText(text, x, y)
    return self:addLabel(text, x, y, Fonts["large"], false)
  end

  function menu:addButton(caption, hotkey, x, y, callback, size)
    local b = ButtonWidget(caption)
    b:setHotKey(hotkey)
    b:setActionCallback(callback)
    if (size == nil) then size = {200, 24} end
    b:setSize(size[1], size[2])
    b:setBackgroundColor(dark)
    b:setBaseColor(dark)
    self:add(b, x, y)
    return b
  end

  function menu:addImageButton(caption, hotkey, x, y, callback)
    local b = ImageButton(caption)
    b:setHotKey(hotkey)
    b:setActionCallback(callback)
    self:add(b, x, y)
    return b
  end

  function menu:addFullButton(caption, hotkey, x, y, callback)
    local b = self:addImageButton(caption, hotkey, x, y, callback)
    if (GetPlayerData(GetThisPlayer(), "RaceName") == "uac") then
      b:setNormalImage(g_hbln)
      b:setPressedImage(g_hblp)
      b:setDisabledImage(g_hblg)
    else
      b:setNormalImage(g_obln)
      b:setPressedImage(g_oblp)
      b:setDisabledImage(g_oblg)
    end
    b:setSize(224, 28)
    return b
  end

  function menu:addHalfButton(caption, hotkey, x, y, callback)
    local b = self:addImageButton(caption, hotkey, x, y, callback)
    if (GetPlayerData(GetThisPlayer(), "RaceName") == "uac") then
      b:setNormalImage(g_hbsn)
      b:setPressedImage(g_hbsp)
      b:setDisabledImage(g_hbsg)
    else
      b:setNormalImage(g_obsn)
      b:setPressedImage(g_obsp)
      b:setDisabledImage(g_obsg)
    end
    b:setSize(106, 28)
    return b
  end

  function menu:addSlider(min, max, w, h, x, y, callback)
    local b = Slider(min, max)
    b:setBaseColor(dark)
    b:setForegroundColor(clear)
    b:setBackgroundColor(clear)
    b:setSize(w, h)
    b:setActionCallback(function(s) callback(b, s) end)
    self:add(b, x, y)
    return b
  end
  
  function menu:addImageSlider(min, max, w, h, x, y, mi, bi, callback)
    local b = ImageSlider(min, max)
    b:setBaseColor(dark)
    b:setForegroundColor(clear)
    b:setBackgroundColor(clear)
    b:setSize(w, h)
	b:setMarkerImage(mi)
	b:setBackgroundImage(bi)
    b:setActionCallback(function(s) callback(b, s) end)
    self:add(b, x, y)
    return b
  end

  function menu:addListBox(x, y, w, h, list)
    local bq = ListBoxWidget(w, h)
    bq:setList(list)
    bq:setBaseColor(black)
    bq:setForegroundColor(clear)
    bq:setBackgroundColor(dark)
    bq:setFont(Fonts["game"])
    self:add(bq, x, y)
    bq.itemslist = list
    return bq
  end

  function menu:addBrowser(path, filter, x, y, w, h, default)
    -- Create a list of all dirs and files in a directory
    local function listfiles(path)
      local dirlist = {}
      local i
      local f
      local u = 1

      local dirs = ListDirsInDirectory(path)
      for i,f in ipairs(dirs) do
        dirlist[u] = f .. "/"
        u = u + 1
      end

      local fileslist = ListFilesInDirectory(path)
      for i,f in ipairs(fileslist) do
        if (string.find(f, filter)) then
          dirlist[u] = f
          u = u + 1
        end
      end

      return dirlist
    end

    local bq = self:addListBox(x, y, w, h, {})

    if (string.sub(path, string.len(path)) ~= "/") then
      path = path .. "/"
    end
    bq.origpath = path
    bq.actioncb = nil

    -- The directory changed, update the list
    local function updatelist()
      bq.itemslist = listfiles(bq.path)
      if (bq.path ~= bq.origpath) then
        table.insert(bq.itemslist, 1, "../")
      end
      bq:setList(bq.itemslist)
    end

    -- Change to the default directory and select the default file
    if (default == nil) then
      bq.path = path
      updatelist()
    else
      local i
      for i=string.len(default)-1,1,-1 do
        if (string.sub(default, i, i) == "/") then
          bq.path = string.sub(default, 1, i)
          updatelist()

          local f = string.sub(default, i + 1)
          for i=1,table.getn(bq.itemslist) do
            if (bq.itemslist[i] == f) then
              bq:setSelected(i - 1)
            end
          end
          break
        end
      end
    end

    function bq:exists(name)
     for i,v in ipairs(self.itemslist) do
       if(v == name) then
         return true
       end
     end
     return false
    end


    function bq:getSelectedItem()
      if (self:getSelected() < 0) then
        return self.itemslist[1]
      end
      return self.itemslist[self:getSelected() + 1]
    end

    -- If a directory was clicked change dirs
    -- Otherwise call the user's callback
    local function cb(s)
      local f = bq:getSelectedItem()
      if (f == "../") then
        local i
        for i=string.len(bq.path)-1,1,-1 do
          if (string.sub(bq.path, i, i) == "/") then
            bq.path = string.sub(bq.path, 1, i)
            updatelist()
            break
          end
        end
      elseif (string.sub(f, string.len(f)) == '/') then
        bq.path = bq.path .. f
        updatelist()
      else
        if (bq.actioncb ~= nil) then
          bq:actioncb(s)
        end
      end
    end
    bq:setActionCallback(cb)

    bq.oldSetActionCallback = bq.setActionCallback
    function bq:setActionCallback(cb)
      bq.actioncb = cb
    end

    return bq
  end

  function menu:addCheckBox(caption, x, y, callback)
    local b = CheckBox(caption)
    b:setBaseColor(clear)
    b:setForegroundColor(clear)
    b:setBackgroundColor(dark)
	if (callback ~= nil) then b:setActionCallback(function(s) callback(b, s) end) end
    b:setFont(Fonts["game"])
    self:add(b, x, y)
    return b
  end
  
  function menu:addImageCheckBox(caption, x, y, offi, oni, callback)
    local b = ImageCheckBox(caption)
    b:setBaseColor(clear)
    b:setForegroundColor(clear)
    b:setBackgroundColor(dark)
	b:setUncheckedNormalImage(offi)
	b:setUncheckedPressedImage(offi)
	b:setCheckedNormalImage(oni)
	b:setCheckedPressedImage(oni)
	if (callback ~= nil) then b:setActionCallback(function(s) callback(b, s) end) end
    b:setFont(Fonts["game"])
    self:add(b, x, y)
    return b
  end

  function menu:addRadioButton(caption, group, x, y, callback)
    local b = RadioButton(caption, group)
    b:setBaseColor(dark)
    b:setForegroundColor(clear)
    b:setBackgroundColor(dark)
    b:setActionCallback(callback)
    self:add(b, x, y)
    return b
  end

  function menu:addDropDown(list, x, y, callback)
    local dd = DropDownWidget()
    dd:setFont(Fonts["game"])
    dd:setList(list)
    dd:setActionCallback(function(s) callback(dd, s) end)
    dd:setBaseColor(dark)
    dd:setForegroundColor(clear)
    dd:setBackgroundColor(dark)
    self:add(dd, x, y)
    return dd
  end

  function menu:addTextInputField(text, x, y, w)
    local b = TextField(text)
    b:setActionCallback(function() end) --FIXME: remove this?
    b:setFont(Fonts["game"])
    b:setBaseColor(clear)
    b:setForegroundColor(clear)
    b:setBackgroundColor(dark)
    if (w == nil) then w = 100 end
    b:setSize(w, 18)
    self:add(b, x, y)
    return b
  end
end

function WarMenu(title, background, resize)
  local menu
  local exitButton
  local bg
  local bgg

  menu = MenuScreen()

  if background == nil then
    bg = backgroundWidget
  else
    bgg = CGraphic:New(background)
    bgg:Load()
    if (resize == nil or resize == true) then
      bgg:Resize(Video.Width, Video.Height)
    end
    bg = ImageWidget(bgg)
  end
  menu:add(bg, 0, 0)

  AddMenuHelpers(menu)

  if title then
    menu:addLabel(title, Video.Width / 2, Video.Height / 20, Fonts["large"])
  end

  return menu
end

-- Default configurations -------
Widget:setGlobalFont(Fonts["large"])


DefaultObjectives = {_("-Destroy the enemy")}
Objectives = DefaultObjectives

function RunMap(map, objective, fow, revealmap)
  if objective == nil then
    Objectives = DefaultObjectives
  else
    Objectives = objective
  end
  loop = true
  while (loop) do
    InitGameVariables()
    if GameSettings.RevealMap == 2 then
      SetFogOfWar(false)
	  RevealMap()
    end
    if GameSettings.RevealMap == 1 then
       RevealMap()
    end

    StartMap(map)
    if GameResult ~= GameRestart then
      loop = false
	else
		timerset=false
		maxscore=0
		draw=false
    end
  end
  RunResultsMenu(s)
  InitGameSettings()
  SetPlayerData(GetThisPlayer(), "RaceName", "hell")
end

function GetMapInfo(mapname)
  local OldDefinePlayerTypes = DefinePlayerTypes
  local OldPresentMap = PresentMap
  local plnum = 0

  function DefinePlayerTypes(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15)
    mapinfo.playertypes[1] = p1
    mapinfo.playertypes[2] = p2
    mapinfo.playertypes[3] = p3
    mapinfo.playertypes[4] = p4
    mapinfo.playertypes[5] = p5
    mapinfo.playertypes[6] = p6
    mapinfo.playertypes[7] = p7
    mapinfo.playertypes[8] = p8
	mapinfo.playertypes[9] = p9
    mapinfo.playertypes[10] = p10
    mapinfo.playertypes[11] = p11
    mapinfo.playertypes[12] = p12
    mapinfo.playertypes[13] = p13
    mapinfo.playertypes[14] = p14
    mapinfo.playertypes[15] = p15
  end

  function PresentMap(description, nplayers, w, h, id)
    mapinfo.description = description
    -- nplayers includes rescue-passive and rescue-active
    -- calculate the real nplayers in DefinePlayerTypes
    --mapinfo.nplayers = nplayers
	plnum = nplayers
    mapinfo.w = w
    mapinfo.h = h
    mapinfo.id = id
  end

  UMSSettingsReset()
  Load(mapname)

  DefinePlayerTypes = OldDefinePlayerTypes
  PresentMap = OldPresentMap
  return plnum
end

function RunSelectScenarioMenu()
  local menu = WarMenu(nil, panel(5), false)
  menu:setSize(352, 352)
  menu:setPosition((Video.Width - 352) / 2, (Video.Height - 352) / 2)
  menu:setDrawMenusUnder(true)
  local newpreviewgraphic = nil
  local previewgraphic = null_image
  local previewwidget = ImageWidget(previewgraphic)
  previewwidget:setVisible(false)
  menu:add(previewwidget, 198, 185)

  menu:addLabel(_("~<Select scenario~>"), 176, 16)

  local browser = menu:addBrowser("maps/", "^.*%.smp%.?g?z?$",
    24, 40, 300, 140, mapname)

  local mapcap = menu:addLabel(browser:getSelectedItem(), 24, 190, Fonts["game"], false)
  local playercap = menu:addLabel("", 24, 202, Fonts["game"], false)
  local sizecap = menu:addLabel("", 24, 214, Fonts["game"], false)
  local descrcap = MultiLineLabel("")
  descrcap:setFont(Fonts["game"])
  descrcap:setAlignment(MultiLineLabel.LEFT)
  descrcap:setVerticalAlignment(MultiLineLabel.TOP)
  descrcap:setLineWidth(100)
  descrcap:setWidth(100)
  descrcap:setHeight(48)
  descrcap:setBackgroundColor(dark)
  menu:add(descrcap, 24, 226)
  

  local function cb(s)
    local name = browser.path .. browser:getSelectedItem()
	local plnum = GetMapInfo(name)
    mapcap:setCaption(_("Filename: ") .. browser:getSelectedItem())
    mapcap:adjustSize()
	playercap:setCaption(_("Players: ") .. tostring(plnum))
	playercap:adjustSize()
	descrcap:setCaption(_("Description: ") .. mapinfo.description)
	descrcap:adjustSize()
	sizecap:setCaption(_("Size: ") .. mapinfo.w .. " x " .. mapinfo.h)
	sizecap:adjustSize()
	if (string.find(name, ".gz$") ~= nil) then
        name = string.sub(name, 1, string.len(name) - 3)
    end
	if (string.find(name, ".smp$") ~= nil) then
        name = string.sub(name, 1, string.len(name) - 4)
    end
	name = name .. ".png"

	if CanAccessFile(name) then
		previewwidget:setVisible(false)
		previewgraphic = CGraphic:New(name)
		previewgraphic:Load()
		previewwidget = ImageWidget(previewgraphic)
		previewwidget:setVisible(true)
		menu:add(previewwidget, 198, 185)
	else
		previewwidget:setVisible(false)
	end
  end
  browser:setActionCallback(cb)

  menu:addHalfButton("~!OK", "o", 10, 318,
    function()
      local cap = browser:getSelectedItem()

      if (browser:getSelected() < 0) then
        return
      end
      mapname = browser.path .. cap
      menu:stop()
    end)
  menu:addHalfButton(_("~!Cancel"), "c", 242, 318,
    function() menu:stop() end)

  cb()
  menu:run()
end

function RunSinglePlayerGameMenu()
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  local timer
  local ltimer
  local seconds
  local mapl
  local descriptionl
  local nameslist = {_("1:Red"),_("2:Blue"),_("3:Green"),_("4:Violet"),_("5:Orange"),_("6:Black"),_("7:White"),_("8:Yellow")}
  local sidelist = {_("Random"),"UAC",_("Hell")}
  local teamlist ={"-","1","2","3","4"}
  local playerlist ={_("Player"),_("Computer"),_("None")}
  local reveal_list = {_("Default"),_("Explored"),_("Revealed")}
  local nms = {nil,nil,nil,nil,nil,nil,nil,nil}
  local ptype = {nil,nil,nil,nil,nil,nil,nil,nil}
  local pside = {nil,nil,nil,nil,nil,nil,nil,nil}
  local teams = {nil,nil,nil,nil,nil,nil,nil,nil}
  local rescount = nil
  local game_type = nil
  local difficulty = nil
  local max_score = nil
  local reveal_type = nil
  
  function ErrorMessage(errmsg)
	  local menu = WarMenu(nil, panel(4), false)
	  menu:setSize(288, 128)
	  menu:setPosition((Video.Width - 288) / 2, (Video.Height - 128) / 2)
	  menu:setDrawMenusUnder(true)

	  menu:addLabel(_("Error:"), 144, 11)

	  local l = MultiLineLabel(errmsg)
	  l:setFont(Fonts["large"])
	  l:setAlignment(MultiLineLabel.CENTER)
	  l:setVerticalAlignment(MultiLineLabel.CENTER)
	  l:setLineWidth(270)
	  l:setWidth(270)
	  l:setHeight(41)
	  l:setBackgroundColor(dark)
	  menu:add(l, 9, 38)

	  menu:addHalfButton("~!OK", "o", 92, 80, function() menu:stop() end)

	  menu:run()
  end 
  
  function CheckCorrect()
	local firstTeam=0
	local firstTeam2=0
	--Team Check
	for i=0,7 do
		if teams[i+1]~=nil then
			if teams[i+1]:isVisible() and teams[i+1]:getSelected()~=0 then
				firstTeam = teams[i+1]:getSelected()
				break
			elseif teams[i+1]:getSelected()==0 then
				firstTeam = -1
				firstTeam2 = i
				break
			end
		end
	end
	if firstTeam > -1 then
		for j=firstTeam2+1,7 do
			if teams[j+1]~=nil then
				if teams[j+1]:isVisible() and teams[j+1]:getSelected()~=firstTeam then
					break
				elseif j==7 then
					return 1 -- only 1 team
				end
			end
		end
	end
	--PlayerCheck
	local personcount = 0
	local compcount = 0
	for i=0,7 do
		if ptype[i+1]~=nil then
			if ptype[i+1]:isVisible() and ptype[i+1]:getSelected()==0 then
				personcount = personcount + 1
			elseif ptype[i+1]:isVisible() and ptype[i+1]:getSelected()==1 then
				compcount = compcount + 1
			end
		end
	end
	if compcount == 0 and personcount == 0 then
		return 2 -- no players or computers
	elseif compcount>0 and personcount == 0 then
		return 3 -- only computers and no player
	elseif compcount+personcount < 2 then
		return 4 -- only one player
	end
	--UAC vs. Hell check
	if game_type:getSelected() == 2 then
		local uaccount = 0
		local hellcount = 0
		for i=0,7 do
			if pside[i+1]~=nil then
				if pside[i+1]:isVisible() and pside[i+1]:getSelected()==1 then
					uaccount = uaccount + 1
				elseif pside[i+1]:isVisible() and pside[i+1]:getSelected()==2 then
					hellcount = hellcount + 1
				end
			end
		end
		if uaccount == 0 then
			return 6 -- only UAC players
		elseif hellcount == 0 then
			return 7 -- only Hell players
		end
	end
	--Time Attack Check
	if game_type:getSelected() == 3 then
		if timer~=nil then
			if tonumber(timer:getText()) <= 0 or tonumber(timer:getText()) == nil then
				return 8 --no time set
			end
		end
	end
	-- UMS check
	print(tostring(mapinfo.ums.enabled))
	if mapinfo.ums.enabled == 1 and game_type:getSelected() ~= 4 then
		return 9 --need to set UMS mode
	end
	--Success 
	return 0
  end
  
  if mapname == nil then
	mapname = "maps/(2)eternal_confrontation.smp.gz"
  end

  menu:addLabel(_("~!Map info"), offx + 16, offy + 360 - 24, Fonts["game"], false)
  menu:addLabel(_("Scenario:"), offx + 16, offy + 360, Fonts["game"], false)
  mapl = menu:addLabel(_("File:  ") .. string.sub(mapname, 6), offx + 16, offy + 360 + 24, Fonts["game"], false)
  descriptionl = menu:addLabel("descriptionl", offx + 16 + 70, offy + 360, Fonts["game"], false)

  menu:addLabel(_("~<Skirmish Setup~>"), offx + 640/2 + 12, offy + 10)
  menu:addFullButton(_("S~!elect Scenario"), "e", offx + 224 * 1 + 40, offy + 432,
    function()
      local oldmapname = mapname
      RunSelectScenarioMenu()
      if (mapname ~= oldmapname) then
        GetMapInfo(mapname)
        MapChanged()
      end
    end)
  menu:addFullButton(_("~!Start Game"), "s",  offx + 224 * 0 + 16, offy + 432,
    function()
		local errorlevel = CheckCorrect()
		if errorlevel==1 then
			ErrorMessage("Need more than 1 team")
		elseif errorlevel==2 then
			ErrorMessage("No players selected")
		elseif errorlevel==3 then
			ErrorMessage("Need at least 1 person player")
		elseif errorlevel==4 then
			ErrorMessage("Need at least 2 players")
		elseif errorlevel==5 then
			ErrorMessage("Random side placement not possible in UAC vs. Hell mode")
		elseif errorlevel==6 then
			ErrorMessage("Need at least 1 UAC player")
		elseif errorlevel==7 then
			ErrorMessage("Need at least 1 Hell player")
		elseif errorlevel==8 then
			ErrorMessage("Need to set time")
		elseif errorlevel==9 then
			ErrorMessage("Play this map in \"User Map Settings\" game mode")
		else
			InitGameSettings()
			for i=0,7 do
				local foundperson = false
				if pside[i+1]==nil then
					GameSettings.Presets[i].Race = 0
				elseif (pside[i+1]:getSelected() == 0) then
					GameSettings.Presets[i].Race = math.random(0, 1)
				else
					GameSettings.Presets[i].Race = pside[i+1]:getSelected() - 1
				end
				if teams[i+1]==nil then
					GameSettings.Presets[i].Team = -1
				else
					GameSettings.Presets[i].Team = teams[i+1]:getSelected()
				end
				if ptype[i+1]==nil then
					GameSettings.Presets[i].Type = -1
				elseif ptype[i+1]:getSelected()==0 then
					if foundperson==false then
						foundperson=true
						GameSettings.Presets[i].Type = PlayerPerson
					else
						GameSettings.Presets[i].Type = PlayerComputer
					end
				elseif ptype[i+1]:getSelected()==1 then
					GameSettings.Presets[i].Type = PlayerComputer
				elseif ptype[i+1]:getSelected()==2 then
					GameSettings.Presets[i].Type = -1
				end
			end
			GameSettings.Difficulty = difficulty:getSelected() + 1
			GameSettings.GameType = game_type:getSelected()+100
			GameSettings.Resources = rescount:getSelected()+1
			GameSettings.RevealMap = reveal_type:getSelected()
			GameSettings.MapRichness = tonumber(timer:getText())
			GameSettings.NetGameType = 1
			Load(mapname)
			RunMap(mapname)
			menu:stop()
		end
    end)
  menu:addHalfButton(_("~!Main Menu"), "m",  offx + 224 * 2 + 64, offy + 432, function() menu:stop() end)
  
  function PlayersRedraw()
	local offset=0
	  for i=0,7 do
		if nms[i+1]~=nil then
			nms[i+1]:setVisible(false)
		end
		if ptype[i+1]~=nil then
			ptype[i+1]:setVisible(false)
		end
		if pside[i+1]~=nil then
			pside[i+1]:setVisible(false)
		end
		if teams[i+1]~=nil then
			teams[i+1]:setVisible(false)
		end
	  end
	  for i=0,7 do
	    if mapinfo.playertypes[i+1] ~= "nobody" then
		  nms[i+1] = menu:addLabel(nameslist[i+1], offx + 2 , offy + 80+offset+15,Fonts["game"], false)
		  offset=offset+25
	    end
	  end
	  offset=0
	  menu:addLabel(_("~<Type:~>"), offx+75, offy +10+60,Fonts["game"], false)
	  for i=0,7 do
		if mapinfo.playertypes[i+1] ~= "nobody" then
			ptype[i+1] = menu:addDropDown(playerlist, offx + 60, offy + 10 + 80+ offset, function(dd) end)
			ptype[i+1]:setSize(80, 20)
			ptype[i+1]:setActionCallback(
			function()
				sk_ptype[i+1] = ptype[i+1]:getSelected()
			end)
			if sk_ptype[i+1]~=-1 then
				ptype[i+1]:setSelected(sk_ptype[i+1])
			end
			offset=offset+25
		end
	  end
	  offset=0
	  menu:addLabel(_("~<Side:~>"), offx+145, offy +10+60,Fonts["game"], false)
	  for i=0,7 do
		if mapinfo.playertypes[i+1] ~= "nobody" then
		pside[i+1] = menu:addDropDown(sidelist, offx + 145, offy + 10 + 80+ offset, function(dd) end)
		pside[i+1]:setSize(70, 20)
		pside[i+1]:setActionCallback(
		function()
			sk_pside[i+1] = pside[i+1]:getSelected()
		end)
		if sk_pside[i+1]~=-1 then
			pside[i+1]:setSelected(sk_pside[i+1])
		end
		offset=offset+25
		end
	  end
	  offset=0
	  menu:addLabel(_("~<Teams:~>"), offx+220, offy +10+60,Fonts["game"], false)
	  for i=0,7 do
		if mapinfo.playertypes[i+1] ~= "nobody" then
		teams[i+1] = menu:addDropDown(teamlist, offx + 220, offy + 10 + 80 +offset, function(dd) end)
		teams[i+1]:setSize(40, 20)
		teams[i+1]:setActionCallback(
		function()
			sk_teams[i+1] = teams[i+1]:getSelected()
		end)
		if sk_teams[i+1]~=-1 then
			teams[i+1]:setSelected(sk_teams[i+1])
		end
		offset=offset+25
		end
	  end
	  for i=0,7 do
		if mapinfo.playertypes[i+1] == "nobody" or mapinfo.playertypes[i+1] == nil then
			if nms[i+1] ~= nil then
				nms[i+1]:setVisible(false) 
			end
			if ptype[i+1] ~= nil then
				ptype[i+1]:setVisible(false) 
				ptype[i+1]:setSelected(2)
			end
			if pside[i+1] ~= nil then
				pside[i+1]:setVisible(false) 
			end
			if teams[i+1] ~= nil then
				teams[i+1]:setVisible(false) 
			end
		end
	  end
  end
  ltimer=menu:addLabel("~<Time:~>", offx + 300, offy + 320, Fonts["game"], false)
  seconds=menu:addLabel(_("seconds"), offx + 365, offy + 340, Fonts["game"], false)
  timer = menu:addTextInputField("900",offx + 300, offy + 340 , 60)
  timer:setSize(60, 20)
  timer:setVisible(false) 
  ltimer:setVisible(false) 
  seconds:setVisible(false) 
  
  function TimerRedraw()
	if game_type:getSelected()==3 then
		timer:setVisible(true) 
		ltimer:setVisible(true) 
		seconds:setVisible(true) 
	else
		timer:setVisible(false) 
		ltimer:setVisible(false) 
		seconds:setVisible(false) 
	end
  end
  
  menu:addLabel(_("~<Reveal Map:~>"), offx + 300, offy + 70, Fonts["game"], false)
  reveal_type = menu:addDropDown(reveal_list, offx + 300, offy + 90,
    function(dd) end)
  reveal_type:setSize(170, 20)
  reveal_type:setActionCallback(
	function()
		sk_reveal_type = reveal_type:getSelected()
	end)
	if sk_reveal_type~=-1 then
		reveal_type:setSelected(sk_reveal_type)
	end

  menu:addLabel(_("~<Game Type:~>"), offx + 300, offy + 120, Fonts["game"], false)
  game_type = menu:addDropDown({_("Team Battle"), _("Free for all"), _("UAC vs. Hell"), _("Time Attack"), _("Use map settings")}, offx + 300, offy + 140,
   function(dd) TimerRedraw() end)
  game_type:setSize(170, 20)
  game_type:setActionCallback(
	function()
		sk_game_type = game_type:getSelected()
	end)
	if sk_game_type~=-1 then
		game_type:setSelected(sk_game_type)
	end

  menu:addLabel(_("~<Resources:~>"), offx + 300, offy + 170, Fonts["game"], false)
  rescount = menu:addDropDown({_("High"), _("Medium"), _("Low"),_("Quick Start")}, offx + 300, offy + 190,
    function(dd) end)
  rescount:setSize(170, 20)
  rescount:setActionCallback(
	function()
		sk_rescount = rescount:getSelected()
	end)
	if sk_rescount~=-1 then
		rescount:setSelected(sk_rescount)
	end

  menu:addLabel(_("~<AI Difficulty:~>"), offx + 300, offy + 220, Fonts["game"], false)
  difficulty = menu:addDropDown({_("I'm too young to die"), _("Hey, not too rough"), _("Hurt me plenty"),_("Ultra-Violence"),_("Nightmare!")}, offx + 300, offy + 240,
    function(dd) end)
  difficulty:setSize(170, 20)
  difficulty:setSelected(2)
  difficulty:setActionCallback(
	function()
		sk_difficulty = difficulty:getSelected()
	end)
	if sk_difficulty~=-1 then
		difficulty:setSelected(sk_difficulty)
	end

  function MapChanged()
    mapl:setCaption(_("File:  ") .. string.sub(mapname, 6))
    mapl:adjustSize()

    descriptionl:setCaption(mapinfo.description ..
      " (" .. mapinfo.w .. " x " .. mapinfo.h .. ")")
    descriptionl:adjustSize()
	PlayersRedraw()
  end

  GetMapInfo(mapname)
  MapChanged()

  menu:run()
end

function BuildProgramStartMenu()
  SetPlayerData(GetThisPlayer(), "RaceName", "hell")

  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2

  menu:addFullButton(_("~!Skirmish"), "s", offx + 16 , offy + 224 + 42*0,
    function() RunSinglePlayerGameMenu(); menu:stop(1) end)
  menu:addFullButton(_("~!Multiplayer"), "m", offx + 16, offy + 224 + 42*1,
    function() RunMultiPlayerGameMenu(); menu:stop(1) end)
  menu:addFullButton(_("~!Campaign"), "c", offx + 16, offy + 224 + 42*2,
    function() RunCampaignGameMenu(); menu:stop(1) end)
  menu:addFullButton(_("~!Editor"), "e", offx + 16, offy + 224 + 42*3,
    function() RunEditorMenu(); menu:stop(1) end)

  menu:addFullButton(_("~!Load Game"), "l", offx + 400, offy + 224 + 42*0,
    function() RunLoadGameMenu(); menu:stop(1) end)
  menu:addFullButton(_("~!Replay Game"), "r", offx + 400, offy + 224 + 42*1,
    function() RunReplayGameMenu(); menu:stop(1) end)
  menu:addFullButton(_("~!Options"), "o", offx + 400, offy + 224 + 42*2,
    function() RunOptionsMenu(); menu:stop(1) end)
  menu:addFullButton(_("Cre~!dits"), "d", offx + 400, offy + 224 + 42*3, RunShowCreditsMenu)

  menu:addFullButton(_("E~!xit"), "x", offx + 200, offy + 400,
	function() menu:stop() end)

  menu:addLabel(doom.Name .. " V" .. doom.Version, offx + 16, offy + 440, Fonts["game"], false)
  menu:addLabel(_("Powered by Stratagus Engine V") .. GetStratagusVersion(), offx + 16, offy + 460, Fonts["game"], false)
    

  return menu:run()
end

LoadGameFile = nil

function RunProgramStartMenu()
  local continue = 1

  while continue == 1 do
    if (LoadGameFile ~= nil) then
      LoadGame(LoadGameFile)
    else
      continue = BuildProgramStartMenu(menu)
    end
  end
end

Load("scripts/menus/campaign.lua")
Load("scripts/menus/load.lua")
Load("scripts/menus/save.lua")
Load("scripts/menus/replay.lua")
Load("scripts/menus/options.lua")
Load("scripts/menus/editor.lua")
Load("scripts/menus/credits.lua")
Load("scripts/menus/game.lua")
Load("scripts/menus/help.lua")
Load("scripts/menus/objectives.lua")
Load("scripts/menus/endscenario.lua")
Load("scripts/menus/diplomacy.lua")
Load("scripts/menus/results.lua")
Load("scripts/menus/network.lua")
Load("scripts/menus/metaserver.lua")

if (Editor.Running == EditorCommandLine) then
  RunEditorMenu()
else
  RunProgramStartMenu()
end