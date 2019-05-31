local uacbackground = "ui/uac/results.png"
local hellbackground =  "ui/hell/results.png"

function RunResultsMenu()
  local background
  local result
  local totaltime
  local hours,mins,secs
  local length = 0
  local uac = (GetPlayerData(GetThisPlayer(), "RaceName") == "uac")

  if (GameResult == GameVictory) then
    result = _("Victory!")
  elseif (GameResult == GameDefeat) then
    result = _("Defeat!")
  elseif (GameResult == GameDraw) then
    result = _("Draw!")
  else
    return -- quit to menu
  end
  
  if (uac) then
      background = uacbackground
	  PlayMusic("music/uac/intermission.ogg")
    else
      background = hellbackground
	  PlayMusic("music/hell/intermission.ogg")
    end
  
  local menu = WarMenu(nil, background)
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2

  local top_offset = 57
  local bottom_offset = 178
  local description_offset = 30

  local counter = 0
  local wait = 30
  local ticker = 0
  local unitsStep = 4
  local buildingsStep = 4
  local mineralsStep = 1823
  local energyStep = 1823
  local killsStep = 3
  local razingsStep = 3
  local scoreStep = 227
  local inProgress = false
  local captionLabels = {}
  local captionOffsets = {}
  local playerLabels = {}
  local playerCounters = {}
  local timeLabel
  local curr_hours = 0
  local curr_mins = 0
  local curr_secs = 0
  -- Precalculations
  local c = 0
  for i=0,7 do
    if (GetPlayerData(i, "TotalUnits") > 0 ) then
      c = c + 1
    end
  end
  local line_spacing = (432 - bottom_offset - description_offset) / c
  
  totaltime = Cycles / 30
  hours = math.floor(totaltime / 3600) 
  totaltime = totaltime - hours*3600
  mins = math.floor(totaltime / 60)
  totaltime = totaltime - mins*60
  secs = math.floor(totaltime) 
  
  captionLabels[1] = menu:addLabel(_("Units:"), offx + 140, offy + bottom_offset, Fonts["game"], true)
  captionOffsets[1] = 0
  length = length + captionLabels[1]:getWidth() + 20
  captionLabels[2] = menu:addLabel(_("Buildings:"), offx + 140 + length, offy + bottom_offset, Fonts["game"], true)
  captionOffsets[2] = length
  length = length + captionLabels[2]:getWidth() + 20
  captionLabels[3] = menu:addLabel(_("Minerals:"), offx + 140 + length, offy + bottom_offset, Fonts["game"], true)
  captionOffsets[3] = length
  length = length + captionLabels[3]:getWidth() + 20
  captionLabels[4] = menu:addLabel(_("Energy:"), offx + 140 + length, offy + bottom_offset, Fonts["game"], true)
  captionOffsets[4] = length
  length = length + captionLabels[4]:getWidth() + 20
  captionLabels[5] = menu:addLabel(_("Kills:"), offx + 140 + length, offy + bottom_offset, Fonts["game"], true)
  captionOffsets[5] = length
  length = length + captionLabels[5]:getWidth() + 20
  captionLabels[6] = menu:addLabel(_("Razings:"), offx + 140 + length, offy + bottom_offset, Fonts["game"], true)
  captionOffsets[6] = length
  length = length + captionLabels[6]:getWidth() + 20
  captionLabels[7] = menu:addLabel(_("Score:"), offx + 140 + length, offy + bottom_offset, Fonts["game"], true)
  captionOffsets[7] = length
  for i=1,table.getn(captionLabels) do
	captionLabels[i]:setVisible(false)
  end
  
  local function ResultsForm(resstate, increase)
	c = 0
	local used = false
	if (inProgress == false) then
		captionLabels[resstate]:setVisible(true)
		for i=0,7 do
			if (GetPlayerData(i, "TotalUnits") > 0) then
				playerCounters[c] = 0
				playerLabels[c] = menu:addLabel(tostring(playerCounters[c]), offx + 140 + captionOffsets[resstate],
					offy + bottom_offset + description_offset + line_spacing * c + 5,
					Fonts["game"], true)
				c = c + 1
			end
		end
		inProgress = true
	end
	c = 0
	if (inProgress) then
		for i = 0,7 do
			if (GetPlayerData(i, "TotalUnits") > 0) then
				playerCounters[c] = playerCounters[c] + increase
				local maxValue
				if (resstate == 1) then
					maxValue = GetPlayerData(i, "TotalUnits")
				elseif (resstate == 2) then
					maxValue = GetPlayerData(i, "TotalBuildings")
				elseif (resstate == 3) then
					maxValue = GetPlayerData(i, "TotalResources", "minerals")
				elseif (resstate == 4) then
					maxValue = GetPlayerData(i, "TotalResources", "energy")
				elseif (resstate == 5) then
					maxValue = GetPlayerData(i, "TotalKills")
				elseif (resstate == 6) then
					maxValue = GetPlayerData(i, "TotalRazings")
				elseif (resstate == 7) then
					maxValue = GetPlayerData(i, "Score")
				end
				if (playerCounters[c] > maxValue) then
					playerCounters[c] = maxValue
				else 
					used = true
					ticker = 0
				end
				playerLabels[c]:setCaption(tostring(playerCounters[c]))
				playerLabels[c]:adjustSize()
				c = c + 1
			end
		end
		if (used) then
			if (ticker % 30 == 0) then
				StopAllChannels()
				PlaySound(stats_sound1, true)
			end
			wait = 1
		end
	end
	if (used == false) then
		StopAllChannels()
		PlaySound("rocket explode", true)
		inProgress = false
		wait = 30
		ticker = 0
		counter = counter + 1
	end
  end

  local function ResultsMainLoop()
	ticker = ticker + 1
	if (wait > 0) then
		wait = wait - 1
		return
	end
	if (counter == 0) then -- Results
		menu:addLabel(_("Result: "), offx + 106, offy + top_offset)
		menu:addLabel(result, offx + 106 + Label(_("Result: ")):getWidth(), offy + top_offset, Fonts["large"])
		StopAllChannels()
		PlaySound("rocket explode", true)
		wait = 30
		ticker = 0
		counter = counter + 1
	elseif (counter == 1) then -- Players
		menu:addLabel(_("Players"), offx + 60, offy + bottom_offset, Fonts["game"], true)
		c = 0
		for i=0,7 do
			if (GetPlayerData(i, "TotalUnits") > 0) then
				local name = GetPlayerData(i, "Name")
				if (ThisPlayer.Index == i) then
					name = name .. "(P)"
				elseif (ThisPlayer:IsAllied(Players[i])) then
					name = name .. "(A)"
				elseif (ThisPlayer:IsEnemy(Players[i])) then
					name = name .. "(E)"
				else
					name = name .. "(N)"
				end
				menu:addLabel(name, offx + 60,
					offy + bottom_offset + description_offset + line_spacing * c + 5,
					Fonts["game"], true)
				c = c + 1
			end
		end
		StopAllChannels()
		PlaySound("rocket explode", true)
		wait = 30
		ticker = 0
		counter = counter + 1
	elseif (counter == 2) then -- Units
		ResultsForm(1, unitsStep)
	elseif (counter == 3) then -- Buildings
		ResultsForm(2, buildingsStep)
	elseif (counter == 4) then -- Minerals
		ResultsForm(3, mineralsStep)
	elseif (counter == 5) then -- Energy
		ResultsForm(4, energyStep)
	elseif (counter == 6) then -- Kills
		ResultsForm(5, killsStep)
	elseif (counter == 7) then -- Razings
		ResultsForm(6, razingsStep)
	elseif (counter == 8) then -- Score
		ResultsForm(7, scoreStep)
	elseif (counter == 9) then -- Total Time
		local used = false
		if (inProgress == false) then
			local time1 = menu:addLabel(_("Total Time:"), offx + 406, offy + top_offset)
			timeLabel = menu:addLabel(""..curr_hours..":"..curr_mins..":"..curr_secs.."", offx + 406 + time1:getWidth(), offy + top_offset, Fonts["large"])
			inProgress = true
		end
		if (inProgress) then
			local l_curr_hours
			local l_curr_mins
			local l_curr_secs
			curr_secs = curr_secs + 11
			if (curr_hours*3600 + curr_mins*60 + curr_secs >=  hours*3600 + mins*60 + secs) then
				curr_secs = secs
				curr_mins = mins
				curr_hours = hours
			else
				used = true
				ticker = 0
				if (curr_secs > 60) then
					curr_mins = curr_mins + 1
					curr_secs = curr_secs - 60
				end
				if (curr_mins > 60) then
					curr_hours = curr_hours + 1
					curr_mins = curr_mins - 60
				end
			end
			if curr_hours < 10 then
				l_curr_hours = "0" .. curr_hours
			else
				l_curr_hours = curr_hours
			end
			if curr_mins < 10 then
				l_curr_mins = "0" .. curr_mins
			else
				l_curr_mins = curr_mins
			end
			if curr_secs < 10 then
				l_curr_secs = "0" .. curr_secs
			else
				l_curr_secs = curr_secs
			end
			timeLabel:setCaption(""..l_curr_hours..":"..l_curr_mins..":"..l_curr_secs.."")
			timeLabel:adjustSize()
			if (used) then
				if (ticker % 30 == 0) then
					StopAllChannels()
					PlaySound(stats_sound1, true)
				end
				wait = 1
			end
		end
		if (used == false) then
			StopAllChannels()
			PlaySound("rocket explode", true)
			inProgress = false
			counter = 10
			ticker = 0
		end
	else
		return
	end
  end
  
  local screenUpdate = LuaActionListener(ResultsMainLoop)

  menu:addLogicCallback(screenUpdate)

  menu:addFullButton(_("~!Save Replay"), "s", offx + 15, offy + 440,
    function() RunSaveReplayMenu() end)

  menu:addFullButton(_("~!Continue"), "c", offx + 400, offy + 440,
    function() 
	
	menu:stop() end)

  menu:run()
end
