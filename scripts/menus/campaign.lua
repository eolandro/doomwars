function Briefing(title, objs, bg, text, voices)
  SetPlayerData(GetThisPlayer(), "RaceName", currentRace)

  local menu = WarMenu(nil, bg)

  Objectives = objs

  if (title ~= nil) then
    menu:addLabel(title, (70 + 340) / 2 * Video.Width / 640, 28 * Video.Height / 480, Fonts["large"], true)
  end

  local t = LoadBuffer(text)
  t = "\n\n\n\n\n\n" .. t .. "\n\n\n\n\n\n\n\n\n\n\n\n\n"
  local sw = ScrollingWidget(320, 170 * Video.Height / 480)
  sw:setBackgroundColor(Color(0,0,0,0))
  sw:setSpeed(0.28)
  local l = MultiLineLabel(t)
  l:setFont(Fonts["large"])
  l:setAlignment(MultiLineLabel.LEFT)
  l:setLineWidth(320)
  l:adjustSize()
  sw:add(l, 0, 0)
  menu:add(sw, 70 * Video.Width / 640, 80 * Video.Height / 480)

  if (objs ~= nil) then
    menu:addLabel("Objectives:", 372 * Video.Width / 640, 306 * Video.Height / 480, Fonts["large"], false)

    local objectives = ""
    table.foreachi(objs, function(k,v) objectives = objectives .. v .. "\n" end)

    local l = MultiLineLabel(objectives)
    l:setFont(Fonts["large"])
    l:setAlignment(MultiLineLabel.LEFT)
    l:setLineWidth(250 * Video.Width / 640)
    l:adjustSize()
    menu:add(l, 372 * Video.Width / 640, (306 * Video.Height / 480) + 30)
  end

  local voice = 0
  local channel = -1

  menu:addHalfButton("~!Continue", "c", 455 * Video.Width / 640, 440 * Video.Height / 480,
    function()
      if (channel ~= -1) then
        voice = table.getn(voices)
        StopChannel(channel)
      end
      menu:stop()
    end)


  function PlayNextVoice()
    voice = voice + 1
    if (voice <= table.getn(voices)) then
      channel = PlaySoundFile(voices[voice], PlayNextVoice);
    else
      channel = -1
    end
  end
  PlayNextVoice()

  local speed = GetGameSpeed()
  SetGameSpeed(30)

  menu:run()

  SetGameSpeed(speed)
end

function FinaleReadmeScreen(text, bg)
	local menu = WarMenu(nil, bg)
	local offx = (Video.Width - 640) / 2
    local offy = (Video.Height - 480) / 2
	local text1 = ""
	local textLabel = MultiLineLabel(text1)
	local ticker = 0
	
	textLabel:setFont(Fonts["large"])
	textLabel:setAlignment(MultiLineLabel.LEFT)
	textLabel:setVerticalAlignment(MultiLineLabel.TOP)
	textLabel:setLineWidth(620)
	textLabel:setWidth(620)
	textLabel:setHeight(380)
	textLabel:setBackgroundColor(dark)
	menu:add(textLabel, 10, 10)

	local function ReadmeScreenLoop()
		if (ticker >= 30) then -- start writing
			local count = (ticker - 30) / 3
			if count < string.len(text) then
				text1 = string.sub(text, 1, count)
			end
			
			textLabel:setCaption(text1)
		end
		ticker = ticker + 1
	end
	local screenUpdate = LuaActionListener(ReadmeScreenLoop)
	menu:addLogicCallback(screenUpdate)
	menu:addFullButton(_("~!Continue"), "c", offx + 176, offy + 440,
    function() 
		menu:stop()
	end)
	local speed = GetGameSpeed()
	SetGameSpeed(30)
	PlayMusic("music/readme.ogg")

	menu:run()

	SetGameSpeed(speed)
end

function RunCampaign(campaign, difficulty)
  Load(campaign)

  if (campaign ~= currentCampaign or position == nil) then
    position = 1
  end

  currentCampaign = campaign
  currentDifficulty = difficulty

  while (position <= table.getn(campaign_steps)) do
	local result = campaign_steps[position]()
	if result == nil then
		break
	end
    
    if (GameResult == GameVictory) then
      position = position + 1
    elseif (GameResult == GameDefeat) then
    elseif (GameResult == GameDraw) then
    elseif (GameResult == GameNoResult) then
      currentCampaign = nil
      return
    else
      break -- quit to menu
    end
  end

  currentCampaign = nil
end

function RunCampaignGameMenu()
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  
  menu:addLabel("~<AI Difficulty:~>", offx + 235, offy + 164, Fonts["game"], false)
  local difficulty = menu:addDropDown({_("I'm too young to die"), _("Hey, not too rough"), _("Hurt me plenty"),_("Ultra-Violence"),_("Nightmare!")},
  offx + 235, offy + 212 + (36 * -1),
    function(dd) end)
  difficulty:setSize(170, 20)
  difficulty:setSelected(2)

  local hellcmp = menu:addFullButton(_("~!Hell campaign"), "h", offx + 208, offy + 212 + (36 * 1),
    function()
	end)
  local uaccmp = menu:addFullButton(_("~!UAC campaign"), "u", offx + 208, offy + 212 + (36 * 2),
    function()
		RunCampaign("scripts/uac/campaign.lua", difficulty:getSelected())
		menu:stop()
	end)
  local missions = menu:addFullButton(_("~!Missions"), "m", offx + 208, offy + 212 + (36 * 3),
    function()  end)
  local tutorial = menu:addFullButton(_("~!Tutorial"), "t", offx + 208, offy + 212 + (36 * 4),
    function()  
		GameSettings.GameType = 104
		RunMap("campaigns/tutorial1.smp", _("Follow the lieutenant's orders."), nil, nil)
		menu:stop()
	end)
  -- until next version :\
  hellcmp:setEnabled(false)
  uaccmp:setEnabled(false)
  missions:setEnabled(false)
  

  menu:addFullButton("~!Previous Menu", "p", offx + 208, offy + 212 + (36 * 5),
    function() menu:stop() end)

  menu:run()
end