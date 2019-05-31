function bool2int(boolvalue)
  if boolvalue == true then
    return 1
  else
    return 0
  end
end

function int2bool(int)
  if int == 0 then
    return false
  else
    return true
  end
end

function ErrorMenu(errmsg)
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

joincounter = 0

function RunJoiningMapMenu(s)
  local listener
  local numplayers = 3
  local state
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  local timer
  local ltimer
  local seconds
  local mapl
  local descriptionl
  local reveal_list = {_("Default"),_("Explored"),_("Revealed")}
  local rescount = nil
  local difficulty = nil
  local game_type = nil
  local max_score = nil
  local reveal_type = nil
  local race = nil
  local updatePlayers
  local playernames = {nil,nil,nil,nil,nil,nil,nil,nil}
  local ptype = {nil,nil,nil,nil,nil,nil,nil,nil}
  local pside = {nil,nil,nil,nil,nil,nil,nil,nil}
  local ready = {nil,nil,nil,nil,nil,nil,nil,nil}
  local nameslist = {_("1:Red"), _("2:Blue"), _("3:Green"), _("4:Violet"), _("5:Orange"), _("6:Black"), _("7:White"), _("8:Yellow")}
  local sidelist = {_("Map default"), "UAC", _("Hell")}
  local playerlist = {_("Player"), _("Computer"), _("Closed")}
  local reveal_list = {_("Default"), _("Explored"), _("Revealed")}
  
  menu:addLabel(_("~!Map info"), offx + 16, offy + 360 - 24, Fonts["game"], false)
  menu:addLabel(_("Scenario:"), offx + 16, offy + 360, Fonts["game"], false)
  mapl = menu:addLabel(_("File:  ") .. NetworkMapName, offx + 16, offy + 360 + 24, Fonts["game"], false)
  descriptionl = menu:addLabel(description, offx + 16 + 70, offy + 360, Fonts["game"], false)
  menu:addLabel(_("Players"), offx + 16, offy + 360 + 48, Fonts["game"], false)
  players = menu:addLabel(description, offx + 16 + 70, offy + 360+48, Fonts["game"], false)

  menu:addLabel(_("~<Joining game: Map~>"), offx + 640/2 + 12, offy + 10)
  menu:addHalfButton(_("~!Main Menu"), "m",  offx + 224 * 2 + 64, offy + 432, function() NetworkDetachFromServer(); menu:stop() end)
  
  ltimer=menu:addLabel(_("~<Time:~>"), offx + 300, offy + 320, Fonts["game"], false)
  seconds=menu:addLabel(_("seconds"), offx + 365, offy + 340, Fonts["game"], false)
  timer = menu:addTextInputField("900",offx + 300, offy + 340 , 60)
  timer:setSize(60, 20)
  timer:setVisible(false) 
  ltimer:setVisible(false) 
  seconds:setVisible(false) 
  timer:setEnabled(false)
  
  function TimerRedraw()
	if GameSettings.GameType == 103 then
		timer:setVisible(true) 
		ltimer:setVisible(true) 
		seconds:setVisible(true) 
	else
		timer:setVisible(false) 
		ltimer:setVisible(false) 
		seconds:setVisible(false) 
	end
  end
  
  menu:addLabel(_("~<Reveal Map:~>"), offx + 400, offy + 70, Fonts["game"], false)
  reveal_type = menu:addDropDown(reveal_list, offx + 400, offy + 90,
    function(dd) end)
  reveal_type:setSize(152, 20)
  reveal_type:setEnabled(false)
  
  ServerSetupState.FogOfWar = 1
  GameSettings.NetGameType =  2
 
  menu:addLabel(_("~<Game Type:~>"), offx + 400, offy + 120, Fonts["game"], false)
  game_type = menu:addDropDown({_("Team Battle"), _("Free for all"), _("UAC vs. Hell"), _("Time Attack"), _("Use map settings")}, offx + 400, offy + 140,
   function(dd) end)
  game_type:setSize(152, 20)
  game_type:setEnabled(false)

  menu:addLabel(_("~<Resources:~>"), offx + 400, offy + 170, Fonts["game"], false)
  rescount = menu:addDropDown({_("High"), _("Medium"), _("Low"),_("Quick Start")}, offx + 400, offy + 190,
    function(dd) end)
  rescount:setSize(152, 20)
  rescount:setEnabled(false)
  
  menu:addLabel(_("~<AI Difficulty:~>"), offx + 400, offy + 220, Fonts["game"], false)
  difficulty = menu:addDropDown({_("I'm too young to die"), _("Hey, not too rough"), _("Hurt me plenty"),_("Ultra-Violence"),_("Nightmare!")}, offx + 400, offy + 240,
    function(dd) 
	end)
  difficulty:setSize(152, 20)
  difficulty:setEnabled(false)  

  local OldPresentMap = PresentMap
  PresentMap = function(desc, nplayers, w, h, id)
    numplayers = nplayers
    players:setCaption(""..nplayers)
    players:adjustSize()
    descriptionl:setCaption(desc)
    descriptionl:adjustSize()
    OldPresentMap(desc, nplayers, w, h, id)
  end


  -- Security: The map name is checked by the stratagus engine.
  Load(NetworkMapName)
  
  menu:addLabel(_("~<Name:~>"), offx + 10, offy + 10 + 60, Fonts["game"], false)
  menu:addLabel(_("~<Type:~>"), offx + 135, offy + 10 + 60, Fonts["game"], false)
  menu:addLabel(_("~<Side:~>"), offx + 230, offy + 10 + 60, Fonts["game"], false)
  menu:addLabel(_("~<Ready:~>"), offx + 300, offy + 10 + 60, Fonts["game"], false)
  numplayers_text = menu:writeText(_("Open slots : ") .. numplayers - 1, offx + 10, offy + 10 + 80 + 200)
  for i = 1,numplayers do
		playernames[i] = menu:addLabel("1", offx + 10 , offy + 80 + (i-1)*25 + 15,Fonts["game"], false)
		ptype[i] = menu:addDropDown(playerlist, offx + 115, offy + 10 + 80 + (i-1)*25, function(dd)	end)
		ptype[i]:setSize(80, 20)
		pside[i] = menu:addDropDown(sidelist, offx + 200, offy + 10 + 80 + (i-1)*25, function(dd) end)
		pside[i]:setSize(100, 20)
		ready[i] = menu:addImageCheckBox("", offx + 310, offy + 10 + 80 + (i-1)*25, g_checkbox_off, g_checkbox_on, function(dd) end)
		if (i - 1 ~= NetLocalHostsSlot) then
			pside[i]:setEnabled(false)
			ready[i]:setEnabled(false)
		end
		ptype[i]:setEnabled(false)
  end
  
  function PlayersRedraw()
		local closedslots = 0
		connectedplayers = 0
		readyplayers = 0
		for i = 2,numplayers do
		  if (ptype[i]:getSelected() ~= 0) then
			closedslots = closedslots + 1
		  end
		  if Hosts[i-1].PlyName == "" then
			playernames[i]:setCaption("")
		  else
		    connectedplayers = connectedplayers + 1
			playernames[i]:setCaption(Hosts[i-1].PlyName)
			playernames[i]:adjustSize()
			if ServerSetupState.Ready[i-1] == 1 then
				readyplayers = readyplayers + 1
			end
		 end
		end
		numplayers_text:setCaption(_("Open slots : ") .. numplayers - 1 - connectedplayers - closedslots)
		numplayers_text:adjustSize()
		return (connectedplayers > 0 and readyplayers == connectedplayers)
  end
  
  pside[NetLocalHostsSlot + 1]:setActionCallback(
  function()
	GameSettings.Presets[NetLocalHostsSlot].Race = pside[NetLocalHostsSlot + 1]:getSelected()
	LocalSetupState.Race[NetLocalHostsSlot] = pside[NetLocalHostsSlot + 1]:getSelected()
  end)
  ready[NetLocalHostsSlot + 1]:setActionCallback(
  function()
	LocalSetupState.Ready[NetLocalHostsSlot] = bool2int(ready[NetLocalHostsSlot + 1]:isMarked())
  end)

  joincounter = 0
  local function listen()
    NetworkProcessClientRequest()
	GameSettings.GameType = ServerSetupState.GameTypeOption
	game_type:setSelected(GameSettings.GameType-100)
	GameSettings.Resources = ServerSetupState.ResourcesOption
	rescount:setSelected(GameSettings.Resources-1)
	GameSettings.Difficulty = ServerSetupState.Difficulty
	difficulty:setSelected(GameSettings.Difficulty-1)
	GameSettings.RevealMap = ServerSetupState.RevealMap
	reveal_type:setSelected(GameSettings.RevealMap)
	GameSettings.Opponents = ServerSetupState.Opponents
	GameSettings.Inside = int2bool(ServerSetupState.Inside)
	--ready[1]:setMarked(true)
	for i = 1,numplayers do
		GameSettings.Presets[i - 1].Race = ServerSetupState.Race[i - 1]
		pside[i]:setSelected(ServerSetupState.Race[i - 1])
		if ServerSetupState.CompOpt[i - 1] == 0 then
			GameSettings.Presets[i - 1].Type = PlayerPerson
		elseif ServerSetupState.CompOpt[i - 1] == 1 then
			GameSettings.Presets[i - 1].Type = PlayerComputer
		else
			GameSettings.Presets[i - 1].Type = PlayerNobody
		end
		ptype[i]:setSelected(ServerSetupState.CompOpt[i - 1])
	end
	if (GameSettings.RevealMap == 2) then
		GameSettings.NoFogOfWar = true
	end
	
	TimerRedraw()
	GameSettings.MapRichness = ServerSetupState.MapRichness
	
	timer:setText(tostring(GameSettings.MapRichness))
	
    PlayersRedraw()
    state = GetNetworkState()
    -- FIXME: don't use numbers
    if (state == 15) then -- ccs_started, server started the game
      SetThisPlayer(1)
      joincounter = joincounter + 1
      if (joincounter == 30) then
		NetworkGamePrepareGameSettings()
        RunMap(NetworkMapName)
        PresentMap = OldPresentMap
        menu:stop()
      end
    elseif (state == 10) then -- ccs_unreachable
      ErrorMenu(_("Cannot reach server"))
      menu:stop()
    end
  end
  listener = LuaActionListener(listen)
  menu:addLogicCallback(listener)

  menu:run()
end

function RunJoiningGameMenu(s)
  local menu = WarMenu(nil, panel(4), false)
  menu:setSize(288, 128)
  menu:setPosition((Video.Width - 288) / 2, (Video.Height - 128) / 2)
  menu:setDrawMenusUnder(true)

  menu:addLabel(_("Connecting to server"), 144, 11)

  local percent = 0

  local sb = StatBoxWidget(258, 30)
  sb:setCaption(_("Connecting..."))
  sb:setPercent(percent)
  menu:add(sb, 15, 38)
  sb:setBackgroundColor(dark)

  local function checkconnection()
    NetworkProcessClientRequest()
    percent = percent + 100 / (24 * GetGameSpeed()) -- 24 seconds * fps
    sb:setPercent(percent)
    local state = GetNetworkState()
    -- FIXME: do not use numbers
    if (state == 3) then -- ccs_mapinfo
      -- got ICMMap => load map
      RunJoiningMapMenu()
      menu:stop(0)
    elseif (state == 4) then -- ccs_badmap
      ErrorMenu(_("Map not available"))
      menu:stop(1)
    elseif (state == 10) then -- ccs_unreachable
      ErrorMenu(_("Cannot reach server"))
      menu:stop(1)
    elseif (state == 12) then -- ccs_nofreeslots
      ErrorMenu(_("Server is full"))
      menu:stop(1)
    elseif (state == 13) then -- ccs_serverquits
      ErrorMenu(_("Server gone"))
      menu:stop(1)
    elseif (state == 16) then -- ccs_incompatibleengine
      ErrorMenu(_("Incompatible engine version"))
      menu:stop(1)
    elseif (state == 17) then -- ccs_incompatiblenetwork
      ErrorMenu(_("Incompatible network version"))
      menu:stop(1)
    end
  end
  local listener = LuaActionListener(checkconnection)
  menu:addLogicCallback(listener)

  menu:addHalfButton(_("Cancel (~<Esc~>)"), "escape", 92, 80,
    function() menu:stop(1) end)

  return menu:run()
end

function RunAddServerMenu()
  local menu = WarMenu(nil, panel(2), false)
  menu:setSize(288, 256)
  menu:setPosition((Video.Width - 288) / 2, (Video.Height - 256) / 2)
  menu:setDrawMenusUnder(true)

  menu:addLabel(_("Add server"), 144, 11)
  menu:addLabel(_("Server IP: "), 20, 31, Fonts["game"], false)
  local serverIp = menu:addTextInputField("localhost", 30, 51, 212)
  menu:addLabel(_("Description: "), 20, 81, Fonts["game"], false)
  local serverDescr = menu:addTextInputField("", 30, 101, 212)
  
  --[[menu:addHalfButton("~!OK", "o", 24, 80,
    function(s)
      -- FIXME: allow port ("localhost:1234")
      if (NetworkSetupServerAddress(server:getText()) ~= 0) then
        ErrorMenu("Invalid server name")
        return
      end
      NetworkInitClientConnect()
      if (RunJoiningGameMenu() ~= 0) then
        -- connect failed, don't leave this menu
        return
      end
      menu:stop()
    end
  )]]
  menu:addHalfButton("~!OK", "o", 15, 210, function(s) 
	if (NetworkSetupServerAddress(serverIp:getText()) ~= 0) then
        ErrorMenu(_("Invalid server name"))
        return
    end
	table.insert(doom.preferences.ServerList, serverIp:getText())
	table.insert(doom.preferences.ServerList, serverDescr:getText())
	SavePreferences()
	menu:stop()
    end)
  menu:addHalfButton(_("~!Cancel"), "c", 164, 210, function() menu:stop() end)

  menu:run()
end

function RunEditServerMenu(number)
  local menu = WarMenu(nil, panel(2), false)
  menu:setSize(288, 256)
  menu:setPosition((Video.Width - 288) / 2, (Video.Height - 256) / 2)
  menu:setDrawMenusUnder(true)

  menu:addLabel(_("Edit server"), 144, 11)
  menu:addLabel(_("Server IP: "), 20, 31, Fonts["game"], false)
  local serverIp = menu:addTextInputField("localhost", 30, 51, 212)
  serverIp:setText(doom.preferences.ServerList[number*2+1])
  menu:addLabel(_("Description: "), 20, 81, Fonts["game"], false)
  local serverDescr = menu:addTextInputField("", 30, 101, 212)
  serverDescr:setText(doom.preferences.ServerList[number*2+2])
  
  menu:addHalfButton("~!OK", "o", 15, 210, function(s) 
	if (NetworkSetupServerAddress(serverIp:getText()) ~= 0) then
        ErrorMenu(_("Invalid server name"))
        return
    end
	doom.preferences.ServerList[number*2+1] = serverIp:getText()
	doom.preferences.ServerList[number*2+2] = serverDescr:getText()
	SavePreferences()
	menu:stop()
    end)
  menu:addHalfButton(_("~!Cancel"), "c", 164, 210, function() menu:stop() end)

  menu:run()
end

function RunJoinIpMenu()
  local menu = WarMenu(nil, panel(5), false)
  local serverlist
  menu:setSize(352, 352)
  menu:setPosition((Video.Width - 352) / 2, (Video.Height - 352) / 2)
  menu:setDrawMenusUnder(true)

  menu:addLabel(_("Servers: "), 176, 20)
  local servers = {}
  
  local function ServerListUpdate()
	serverlist = nil
	servers = {}
	if (doom.preferences.ServerList ~= nil) then
		for i=1,table.getn(doom.preferences.ServerList)/2 do
			servers[i]=tostring(doom.preferences.ServerList[(i-1)*2+1].." | "..tostring(doom.preferences.ServerList[(i-1)*2+2]))
		end
	end
	serverlist =  menu:addListBox(20, 50, 300, 120, servers)
  end

  ServerListUpdate()
  
  menu:addFullButton(_("Co~!nnect"), "n", 60, 180, function()
	NetworkSetupServerAddress(doom.preferences.ServerList[serverlist:getSelected()*2+1])
	NetworkInitClientConnect()
	if (RunJoiningGameMenu() ~= 0) then
        -- connect failed, don't leave this menu
        return
    end
  end)
  menu:addFullButton(_("~!Add server"), "a", 60, 210, function() RunAddServerMenu(); ServerListUpdate() end)
  menu:addFullButton(_("~!Edit server"), "a", 60, 240, function() 
	if serverlist:getSelected() ~= nil then
		RunEditServerMenu(serverlist:getSelected()); ServerListUpdate()
	end
  end)
  menu:addFullButton(_("~!Delete server"), "d", 60, 270, function() 
	if serverlist:getSelected() ~= nil then
		table.remove(doom.preferences.ServerList, serverlist:getSelected()*2+1)
		table.remove(doom.preferences.ServerList, serverlist:getSelected()*2+1)
		SavePreferences()
		ServerListUpdate()
	end
  end)
   menu:addFullButton(_("~!Cancel"), "c", 60, 300, function() menu:stop() end)
  --menu:addHalfButton("~!Add server", "a", 20, 80, function() RunAddServerMenu() end)
  
  --[[menu:addHalfButton("~!OK", "o", 24, 80,
    function(s)
      -- FIXME: allow port ("localhost:1234")
      if (NetworkSetupServerAddress(server:getText()) ~= 0) then
        ErrorMenu("Invalid server name")
        return
      end
      NetworkInitClientConnect()
      if (RunJoiningGameMenu() ~= 0) then
        -- connect failed, don't leave this menu
        return
      end
      menu:stop()
    end
  )]]
  

  menu:run()
end

function RunServerMultiGameMenu(mapfile, description, numplayers)
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  local timer
  local ltimer
  local seconds
  local mapl
  local descriptionl
  local race
  local playernames = {nil,nil,nil,nil,nil,nil,nil,nil}
  local ptype = {nil,nil,nil,nil,nil,nil,nil,nil}
  local pside = {nil,nil,nil,nil,nil,nil,nil,nil}
  local ready = {nil,nil,nil,nil,nil,nil,nil,nil}
  local nameslist = {_("1:Red"), _("2:Blue"), _("3:Green"), _("4:Violet"), _("5:Orange"), _("6:Black"), _("7:White"), _("8:Yellow")}
  local sidelist = {_("Map default"), "UAC", _("Hell")}
  local playerlist = {_("Player"), _("Computer"), _("Closed")}
  local reveal_list = {_("Default"), _("Explored"), _("Revealed")}
  local rescount = nil
  local difficulty = nil
  local game_type = nil
  local max_score = nil
  local reveal_type = nil
  local players = nil
  local updatePlayers
  local connectedplayers
  local readyplayers
  local numplayers_text

  menu:addLabel(_("~!Map info"), offx + 16, offy + 360 - 24, Fonts["game"], false)
  menu:addLabel(_("Scenario:"), offx + 16, offy + 360, Fonts["game"], false)
  mapl = menu:addLabel(_("File:  ") .. string.sub(mapfile, 6), offx + 16, offy + 360 + 24, Fonts["game"], false)
  descriptionl = menu:addLabel(description, offx + 16 + 70, offy + 360, Fonts["game"], false)
  menu:addLabel(_("Players"), offx + 16, offy + 360 + 48, Fonts["game"], false)
  players = menu:addLabel(tostring(numplayers), offx + 16 + 70, offy + 360+48, Fonts["game"], false)

  menu:addLabel(_("~<Create MultiPlayer game~>"), offx + 640/2 + 12, offy + 10)
	
  menu:addHalfButton(_("~!Main Menu"), "m",  offx + 224 * 2 + 64, offy + 432, function() InitGameSettings(); menu:stop() end)

  ltimer=menu:addLabel(_("~<Time:~>"), offx + 300, offy + 320, Fonts["game"], false)
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
  
  menu:addLabel(_("~<Reveal Map:~>"), offx + 400, offy + 70, Fonts["game"], false)
  reveal_type = menu:addDropDown(reveal_list, offx + 400, offy + 90,
    function(dd)
	GameSettings.RevealMap = reveal_type:getSelected()
	ServerSetupState.RevealMap = GameSettings.RevealMap
	if reveal_type:getSelected() == 2 then
		GameSettings.NoFogOfWar = true
	else
		GameSettings.NoFogOfWar = false
	end
	 NetworkServerResyncClients()
	end)
  reveal_type:setSize(152, 20)

  menu:addLabel(_("~<Game Type:~>"), offx + 400, offy + 120, Fonts["game"], false)
  game_type = menu:addDropDown({_("Team Battle"), _("Free for all"), _("UAC vs. Hell"), _("Time Attack"), _("Use map settings")}, offx + 400, offy + 140,
   function(dd)
	GameSettings.GameType = game_type:getSelected()+100
	ServerSetupState.GameTypeOption = GameSettings.GameType
	 TimerRedraw()
	GameSettings.MapRichness = tonumber(timer:getText())
	ServerSetupState.MapRichness = GameSettings.MapRichness
	NetworkServerResyncClients()
	
	end)
  game_type:setSize(152, 20)

  menu:addLabel(_("~<Resources:~>"), offx + 400, offy + 170, Fonts["game"], false)
  rescount = menu:addDropDown({_("High"), _("Medium"), _("Low"),_("Quick Start")}, offx + 400, offy + 190,
    function(dd)
	GameSettings.Resources = rescount:getSelected()+1
	ServerSetupState.ResourcesOption = GameSettings.Resources
	 NetworkServerResyncClients()
	end)
  rescount:setSize(152, 20)
  
  menu:addLabel(_("~<AI Difficulty:~>"), offx + 400, offy + 220, Fonts["game"], false)
  difficulty = menu:addDropDown({_("I'm too young to die"), _("Hey, not too rough"), _("Hurt me plenty"),_("Ultra-Violence"),_("Nightmare!")}, offx + 400, offy + 240,
    function(dd) 
	GameSettings.Difficulty = difficulty:getSelected() + 1
	ServerSetupState.Difficulty = GameSettings.Difficulty
	 NetworkServerResyncClients()
	end)
  difficulty:setSize(152, 20)
  difficulty:setSelected(2)
  
  NetworkMapName = mapfile
  NetworkInitServerConnect(numplayers)
	-- Initial settings
	for i = 1,numplayers do
		ServerSetupState.CompOpt[i - 1] = 0
		ServerSetupState.Ready[i - 1] = 0
		ServerSetupState.Race[i - 1] = 0
		GameSettings.Presets[i - 1].Race = 0
		GameSettings.Presets[i-1].Type = PlayerNobody
	end
	ServerSetupState.GameTypeOption = 100
	GameSettings.GameType = ServerSetupState.GameTypeOption
	ServerSetupState.ResourcesOption = 1
	GameSettings.Resources = ServerSetupState.ResourcesOption
	ServerSetupState.Difficulty = 3
	GameSettings.Difficulty = ServerSetupState.Difficulty
	ServerSetupState.RevealMap = 0
	GameSettings.RevealMap = ServerSetupState.RevealMap
	ServerSetupState.MapRichness = 0
	GameSettings.MapRichness = ServerSetupState.MapRichness
	ServerSetupState.Opponents = 0
	GameSettings.Opponents = ServerSetupState.Opponents
	ServerSetupState.Inside = 0
	GameSettings.Inside = false
	GameSettings.NoFogOfWar = false
	ServerSetupState.FogOfWar = 1
	GameSettings.NetGameType =  2
	
	-- Player list
  menu:addLabel(_("~<Name:~>"), offx + 10, offy + 10 + 60, Fonts["game"], false)
  menu:addLabel(_("~<Type:~>"), offx + 135, offy + 10 + 60, Fonts["game"], false)
  menu:addLabel(_("~<Side:~>"), offx + 230, offy + 10 + 60, Fonts["game"], false)
  menu:addLabel(_("~<Ready:~>"), offx + 300, offy + 10 + 60, Fonts["game"], false)
  numplayers_text = menu:writeText(_("Open slots : ") .. numplayers - 1, offx + 10, offy + 10 + 80 + 200)
  for i = 1,numplayers do
		playernames[i] = menu:addLabel("1", offx + 10 , offy + 80 + (i-1)*25 + 15,Fonts["game"], false)
		ptype[i] = menu:addDropDown(playerlist, offx + 115, offy + 10 + 80 + (i-1)*25, 
		function(dd)
			if (ptype[i]:getSelected() == 0) then
				GameSettings.Presets[i-1].Type = PlayerPerson
			elseif (ptype[i]:getSelected() == 1) then
				GameSettings.Presets[i-1].Type = PlayerComputer
			else
				GameSettings.Presets[i-1].Type = PlayerNobody
			end
			ServerSetupState.CompOpt[i-1] = ptype[i]:getSelected()
			NetworkServerResyncClients()
		end)
		ptype[i]:setSize(80, 20)
		pside[i] = menu:addDropDown(sidelist, offx + 200, offy + 10 + 80 + (i-1)*25,
		function(dd)
			GameSettings.Presets[i-1].Race = pside[i]:getSelected()
			ServerSetupState.Race[i-1] = pside[i]:getSelected()
			NetworkServerResyncClients()
		end)
		pside[i]:setSize(100, 20)
		ready[i] = menu:addImageCheckBox("", offx + 310, offy + 10 + 80 + (i-1)*25, g_checkbox_off, g_checkbox_on, function(dd) end)
		ready[i]:setEnabled(false)
  end
  -- Server name
  playernames[1]:setCaption(Hosts[0].PlyName)
  ptype[1]:setEnabled(false)
  playernames[1]:adjustSize()
  ready[1]:setMarked(true)
  
  -- Update players
  function PlayersRedraw()
		local closedslots = 0
		connectedplayers = 0
		readyplayers = 0
		for i = 2,numplayers do
		  ptype[i]:setSelected(ServerSetupState.CompOpt[i-1])
		  if (ptype[i]:getSelected() ~= 0) then
			closedslots = closedslots + 1
		  end
		  if Hosts[i-1].PlyName == "" then
			playernames[i]:setCaption("")
			ptype[i]:setEnabled(true)
			pside[i]:setEnabled(true)
		  else
		    connectedplayers = connectedplayers + 1
			playernames[i]:setCaption(Hosts[i-1].PlyName)
			playernames[i]:adjustSize()
			ptype[i]:setEnabled(false)
			pside[i]:setEnabled(false)
			pside[i]:setSelected(ServerSetupState.Race[i-1])
			if (ServerSetupState.Ready[i-1]) == 1 then
				ready[i]:setMarked(true)
				readyplayers = readyplayers + 1
			else
				ready[i]:setMarked(false)
			end
		 end
		end
		numplayers_text:setCaption(_("Open slots : ") .. numplayers - 1 - connectedplayers - closedslots)
		numplayers_text:adjustSize()
		return (connectedplayers > 0 and readyplayers == connectedplayers)
  end

	startgame = menu:addFullButton(_("~!Start Game"), "s", offx + 224 * 0 + 16, offy + 432,
		function()
		  if mapinfo.ums.enabled == 1 and game_type:getSelected() ~= 4 then
			  ErrorMenu("Play this map in \"User Map Settings\" game mode")
		  else
			NetworkServerStartGame()
			NetworkGamePrepareGameSettings()
			RunMap(mapfile)
			menu:stop()
		  end
		end
	)
	startgame:setVisible(false)
	local waitingtext = menu:writeText("", offx + 400, offy + 70)
	  local function updateStartButton(ready)
		startgame:setVisible(ready)
		waitingtext:setVisible(not ready)
	  end 
	local listener = LuaActionListener(
	function(s)
		updateStartButton(PlayersRedraw())
	end)
	menu:addLogicCallback(listener)
 
  menu:run()
end

function RunCreateMultiGameMenu(s)  
  local numplayers = 2
  local mapfile = "maps/(2)eternal_confrontation.smp.gz"
  local description = ""
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
    24, 40, 300, 140, mapfile)

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
    mapfile = browser.path .. browser:getSelectedItem()
	local oldDefinePlayerTypes = DefinePlayerTypes
	  DefinePlayerTypes = function(p1, p2, p3, p4, p5, p6, p7, p8)
		local ps = {p1, p2, p3, p4, p5, p6, p7, p8}
		numplayers = 0

		for _, s in pairs(ps) do
		  if s == "person" then
			numplayers = numplayers + 1
		  end
		end
		playercap:setCaption(_("Players: ") .. numplayers)
		playercap:adjustSize()
		oldDefinePlayerTypes(p1, p2, p3, p4, p5, p6, p7, p8)
	  end
	local OldPresentMap = PresentMap
	  PresentMap = function(desc, nplayers, w, h, id)
		description = desc
		mapcap:setCaption(_("Filename: ") .. browser:getSelectedItem())
		mapcap:adjustSize()
		descrcap:setCaption(_("Description: ") .. desc)
		descrcap:adjustSize()
		sizecap:setCaption(_("Size: ") .. w .. " x " .. h)
		sizecap:adjustSize()
		OldPresentMap(desc, nplayers, w, h, id)
	  end
	Load(mapfile)
	PresentMap = OldPresentMap
   
   local name = mapfile
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
		previewgraphic = null_image
		previewwidget = ImageWidget(previewgraphic)
		previewwidget:setVisible(false)
		menu:add(previewwidget, 198, 185)
	end
  end
  browser:setActionCallback(cb)

  menu:addHalfButton("~!OK", "o", 10, 318,
    function()
      if (browser:getSelected() < 0) then
        return
      end
	  RunServerMultiGameMenu(mapfile, description, numplayers)
      menu:stop()
    end)
  menu:addHalfButton(_("~!Cancel"), "c", 242, 318,
    function()
	menu:stop() 
	end)

  cb()
  menu:run()
end

function RunMultiPlayerGameMenu(s)
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  local nick

  InitGameSettings()
  InitNetwork1()

  menu:addLabel(_("~<Multiplayer Network Game~>"), offx + 640/2 + 12, offy + 192)

  menu:writeText(_("Nickname :"), 208 + offx, 264 + offy)
  nick = menu:addTextInputField(GetLocalPlayerName(), offx + 298, 260 + offy)

  menu:addFullButton(_("~!Join Game"), "j", 208 + offx, 320 + (36 * 0) + offy,
    function()
      if nick:getText() ~= GetLocalPlayerName() then
        SetLocalPlayerName(nick:getText())
        doom.preferences.PlayerName = nick:getText()
        SavePreferences()
      end
      RunJoinIpMenu()
    end)
  menu:addFullButton(_("~!Create Game"), "c", 208 + offx, 320 + (36 * 1) + offy,
    function()
      if nick:getText() ~= GetLocalPlayerName() then
        SetLocalPlayerName(nick:getText())
        doom.preferences.PlayerName = nick:getText()
        SavePreferences()
      end
      RunCreateMultiGameMenu()
    end)
  menu:addFullButton(_("Meta~!server"), "s", 208 + offx, 320 + (36 * 2) + offy,
    function()
      if nick:getText() ~= GetLocalPlayerName() then
        SetLocalPlayerName(nick:getText())
        doom.preferences.PlayerName = nick:getText()
        SavePreferences()
      end
      RunJoiningMetaServerMenu()
    end)

  menu:addFullButton(_("~!Main Menu"), "m", 208 + offx, 320 + (36 * 3) + offy,
    function() menu:stopAll() end)

  menu:run()

  ExitNetwork1()
end

