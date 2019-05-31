function AddSoundOptions(menu, offx, offy, centerx, bottom)
  local b
  local lbox
   local bgg

  b = menu:addLabel(_("Sound Options"), 176, 11)

  b = Label(_("Effects Volume"))
  b:setFont(CFont:Get("game"))
  b:adjustSize();
  menu:add(b, offx + 16, offy + 36 * 1)

  local soundslider = ImageSlider(0, 255)
  soundslider:setValue(GetEffectsVolume())
  soundslider:setActionCallback(function() SetEffectsVolume(soundslider:getValue()) end)
  soundslider:setWidth(170)
  soundslider:setHeight(18)
  soundslider:setBaseColor(dark)
  soundslider:setForegroundColor(clear)
  soundslider:setBackgroundColor(clear)
  soundslider:setMarkerImage(g_marker)
  soundslider:setBackgroundImage(g_slider)
  menu:add(soundslider, offx + 32, offy + 36 * 1.5)

  b = Label("min")
  b:setFont(CFont:Get("game"))
  b:adjustSize();
  menu:addCentered(b, offx + 44, offy + 36 * 2 + 6)

  b = Label("max")
  b:setFont(CFont:Get("game"))
  b:adjustSize();
  menu:addCentered(b, offx + 190, offy + 36 * 2 + 6)

  local effectscheckbox = {}
  effectscheckbox = menu:addImageCheckBox(_("Enabled"), offx + 240, offy + 36 * 1.5, g_checkbox_off, g_checkbox_on,
    function() SetEffectsEnabled(effectscheckbox:isMarked()) end)
  effectscheckbox:setMarked(IsEffectsEnabled())
  effectscheckbox:adjustSize()

  b = Label(_("Music Volume"))
  b:setFont(CFont:Get("game"))
  b:adjustSize();
  menu:add(b, offx + 16, offy + 36 * 3)

  local musicslider = ImageSlider(0, 255)
  musicslider:setValue(GetMusicVolume())
  musicslider:setActionCallback(function() SetMusicVolume(musicslider:getValue()) end)
  musicslider:setWidth(170)
  musicslider:setHeight(18)
  musicslider:setBaseColor(dark)
  musicslider:setForegroundColor(clear)
  musicslider:setBackgroundColor(clear)
  musicslider:setMarkerImage(g_marker)
  musicslider:setBackgroundImage(g_slider)
  menu:add(musicslider, offx + 32, offy + 36 * 3.5)

  b = Label(_("min"))
  b:setFont(CFont:Get("game"))
  b:adjustSize();
  menu:addCentered(b, offx + 44, offy + 36 * 4 + 6)

  b = Label(_("max"))
  b:setFont(CFont:Get("game"))
  b:adjustSize();
  menu:addCentered(b, offx + 190, offy + 36 * 4 + 6)

  local musiccheckbox = {}
  musiccheckbox = menu:addImageCheckBox(_("Enabled"), offx + 240, offy + 36 * 3.5, g_checkbox_off, g_checkbox_on,
    function() SetMusicEnabled(musiccheckbox:isMarked()); MusicStopped() end)
  musiccheckbox:setMarked(IsMusicEnabled())
  musiccheckbox:adjustSize();
  
  local plist = {}
	if GetPlayerData(GetThisPlayer(),"RaceName")=="uac" then
		for i=1,table.getn(uacplaylist)/2 do
			plist[i]=uacplaylist[i*2]
		end	
	else
		for i=1,table.getn(uacplaylist)/2 do
			plist[i]=hellplaylist[i*2]
		end	
	end
		
  b = Label(_("Soundtracks: "))
  b:setFont(CFont:Get("game"))
  b:adjustSize();
  menu:add(b, offx + 16, offy + 36 * 5)
  lbox = menu:addListBox(offx + 12, offy + 36 * 5.5, 218, 100,plist)
  lbox:setForegroundColor(dark)
  lbox:setBackgroundColor(dark)
  lbox:setBaseColor(dark)
  
  b = menu:addHalfButton(_("~!Play"), "p", 240, offy + 36 * 5.5,
    function()
		if (doom.preferences.MusicRandom) then
			musicpos = math.random(table.getn(plist))*2+1
		else
			musicpos = lbox:getSelected()*2+1
		end
		if musicpos > table.getn(uacplaylist) or musicpos==-1 then musicpos=1 end
		if musicpos > table.getn(hellplaylist) or musicpos==-1 then musicpos=1 end
		MusicStopped()
    end)

  bgg = CGraphic:New("graphics/ui/background.png")
    bgg:Load()
	
  local randomcheckbox = {}
  randomcheckbox = menu:addImageCheckBox(_("Random"), offx + 240, offy + 36 * 6.5, g_checkbox_off, g_checkbox_on,
    function() doom.preferences.MusicRandom = randomcheckbox:isMarked() end)
  randomcheckbox:setMarked(doom.preferences.MusicRandom)
  randomcheckbox:adjustSize();

  b = menu:addFullButton("~!OK", "o", centerx, bottom - 11 - 27,
    function()
      doom.preferences.EffectsVolume = GetEffectsVolume()
      doom.preferences.EffectsEnabled = IsEffectsEnabled()
      doom.preferences.MusicVolume = GetMusicVolume()
      doom.preferences.MusicEnabled = IsMusicEnabled()
	  doom.preferences.MusicRandom = randomcheckbox:isMarked()
      SavePreferences()
      menu:stop()
    end)
end

function RunGameSoundOptionsMenu(main)
  local menu = WarGameMenu(panel(5))
  menu:resize(352, 352)

  AddSoundOptions(menu, 0, 0, 352/2 - 224/2, 352)

  if main ==true then
	return menu:run()
  else
	menu:run(false)
  end
end

function RunPreferencesMenu(main)
  local menu = WarGameMenu(panel(3))
  menu:resize(384, 256)

  menu:addLabel(_("Preferences"), 192, 11)
  
  local showlines = {}
  showlines = menu:addImageCheckBox(_("Show targeting lines"), 10, 40 + 36 * 0, g_checkbox_off, g_checkbox_on,
    function() if showlines:isMarked() == true 
	then doom.preferences.ShowOrders = true 
	else doom.preferences.ShowOrders = false end end)
	showlines:setMarked(doom.preferences.ShowOrders)
  
  local showdamage = {}
  showdamage = menu:addImageCheckBox(_("Show damage"), 10, 40 + 36 * 1, g_checkbox_off, g_checkbox_on,
    function() if showdamage:isMarked() == true 
	then SetDamageMissile("missile-hit") doom.preferences.ShowDamage = true 
	else SetDamageMissile(nil) doom.preferences.ShowDamage = false end end)
  showdamage:setMarked(doom.preferences.ShowDamage)
  
  local showradius = {}
  showradius = menu:addImageCheckBox(_("Show unit radii"), 10, 40 + 36 * 1.5, g_checkbox_off, g_checkbox_on,
    function() 
	if showradius:isMarked() == true 
	then Preference.ShowSightRange = true
	   Preference.ShowAttackRange = true
	   Preference.ShowReactionRange = true
	   doom.preferences.ShowRadius = true 
	else Preference.ShowSightRange = false
	   Preference.ShowAttackRange = false
	   Preference.ShowReactionRange = false
	   doom.preferences.ShowRadius = false 
	   end 
	end)
  showradius:setMarked(doom.preferences.ShowRadius)


   local ckey = {}
  ckey = menu:addImageCheckBox(_("Show command hotkey"), 10, 40 + 36 * 0.5, g_checkbox_off, g_checkbox_on,
    function() UI.ButtonPanel.ShowCommandKey = ckey:isMarked() end)
  ckey:setMarked(UI.ButtonPanel.ShowCommandKey)
  
  local showmessages = {}
  showmessages = menu:addImageCheckBox(_("Show messages"), 10, 40 + 36 * 2, g_checkbox_off, g_checkbox_on,
    function() if showmessages:isMarked() == true then 
		Preference.ShowMessages = true 
		doom.preferences.ShowMessages = true 
	else Preference.ShowMessages = false 
		doom.preferences.ShowMessages = false 
	end 
	end)
  showmessages:setMarked(doom.preferences.ShowMessages)
  
  local bigmap = {}
  bigmap = menu:addImageCheckBox(_("Big map mode"), 10, 40 + 36 * 2.5, g_checkbox_off, g_checkbox_on,
    function() if bigmap:isMarked() == true then 
		Preference.BigScreen = true 
		doom.preferences.BigScreen = true
		UI.PieMenu.MouseButton = MiddleButton 
		UI.PieMenu:SetRadius(70)
	else Preference.BigScreen = false 
		doom.preferences.BigScreen = false 
		UI.PieMenu.MouseButton = NoButton 
		UI.PieMenu:SetRadius(0)
	end 
	end)
  bigmap:setMarked(doom.preferences.BigScreen)


  menu:addLabel(_("Game Speed:"), 278, 40 + 36 * 0, Fonts["game"], false)

  local gamespeed = {}
  gamespeed = menu:addImageSlider(15, 75, 170, 18, 190, 40 + 36 * 0.5, g_marker, g_slider,
    function() SetGameSpeed(gamespeed:getValue()) end)
  gamespeed:setValue(GetGameSpeed())

  menu:addLabel(_("slow"), 192, 40 + (36 * 1) + 6, Fonts["small"], false)
  local l = Label(_("fast"))
  l:setFont(Fonts["small"])
  l:adjustSize()
  menu:add(l, 354 - l:getWidth(), 40 + (36 * 1) + 6)
  
  menu:addLabel(_("Mouse Speed:"), 278, 40 + 36 * 1.5, Fonts["game"], false)
  
  local mousespeed = {}
  mousespeed = menu:addImageSlider(1, 10, 170, 18, 190, 40 + 36 * 2, g_marker, g_slider,
    function() 
		SetMouseScrollSpeed(mousespeed:getValue())
		SetMouseScrollSpeedDefault(mousespeed:getValue())
		SetMouseScrollSpeedControl(mousespeed:getValue()*4) 
	end)
  mousespeed:setValue(doom.preferences.MouseSpeed)

  menu:addLabel(_("slow"), 192, 40 + (36 * 2.5) + 6, Fonts["small"], false)
  local l = Label(_("fast"))
  l:setFont(Fonts["small"])
  l:adjustSize()
  menu:add(l, 354 - l:getWidth(), 40 + (36 * 2.5) + 6)

  menu:addHalfButton("~!OK", "o", 266, 200,
    function()

      doom.preferences.ShowCommandKey = UI.ButtonPanel.ShowCommandKey
      doom.preferences.GameSpeed = GetGameSpeed()
	  doom.preferences.ShowDamage = showdamage:isMarked()
	  doom.preferences.ShowOrders = showlines:isMarked() 
	  doom.preferences.ShowRadius = showradius:isMarked()
	  doom.preferences.MouseSpeed = mousespeed:getValue()
	  doom.preferences.ShowMessages = showmessages:isMarked()
	  doom.preferences.BigScreen = bigmap:isMarked()
	  if doom.preferences.ShowOrders == true then
		Preference.ShowOrders = 1 
	  else 
		Preference.ShowOrders = 0
	  end
      SavePreferences()
      menu:stop()
    end)

  if main ==true then
	return menu:run()
  else
	menu:run(false)
  end
end

function SetVideoSize(width, height)
  if (Video:ResizeScreen(width, height) == false) then
	  local menu = WarMenu(nil, panel(4), false)
	  menu:setSize(288, 128)
	  menu:setPosition((Video.Width - 288) / 2, (Video.Height - 128) / 2)
	  menu:setDrawMenusUnder(true)

	  local l = MultiLineLabel(_("Unsupported video mode"))
	  l:setFont(Fonts["large"])
	  l:setAlignment(MultiLineLabel.CENTER)
	  l:setVerticalAlignment(MultiLineLabel.CENTER)
	  l:setLineWidth(270)
	  l:setWidth(270)
	  l:setHeight(41)
	  l:setBackgroundColor(dark)
	  menu:add(l, 9, 28)

	  menu:addHalfButton("~!OK", "o", 92, 80, function() menu:stop() end)

	  return menu:run()
  end
  bckground:Resize(Video.Width, Video.Height)
  backgroundWidget = ImageWidget(bckground)
  Load("scripts/ui.lua")
  doom.preferences.VideoWidth = Video.Width
  doom.preferences.VideoHeight = Video.Height
  SavePreferences()
end

function RunVideoMenu()
  local menu = WarMenu()
  local offx = (Video.Width - 352) / 2
  local offy = (Video.Height - 352) / 2
  local checkTexture
  local b
  local videoList 
  local videoModes = {
  640, 480,
  800, 600,
  1024, 768,
  1280, 800,
  1280, 960,
  1280, 1024,
  1366, 768,
  1440, 900,
  1920, 1080}
  
  local vlist = {}
	for i=1,table.getn(videoModes)/2 do
		vlist[i]=""..tostring(videoModes[i*2-1]).." x "..tostring(videoModes[i*2])..""
	end	

  menu:addLabel(_("Video Options"), offx + 176, offy + 1)
  menu:addLabel(_("Video Resolution:"), offx + 16, offy + 34, Fonts["game"], false)
  
  videoList = menu:addListBox(offx + 16, offy + 50, 200, 8*(table.getn(videoModes)/2+1), vlist)
  
  local function cb(s)
	SetVideoSize(videoModes[videoList:getSelected()*2+1], videoModes[videoList:getSelected()*2+2])
	menu:stopAll(1)
  end
  videoList:setActionCallback(cb)

  b = menu:addImageCheckBox(_("Full Screen"), offx + 17, offy + 55 + 26*9 + 14, g_checkbox_off, g_checkbox_on,
    function()
      ToggleFullScreen()
      doom.preferences.VideoFullScreen = Video.FullScreen
      SavePreferences()
      menu:stopAll(1)
    end)
  b:setMarked(Video.FullScreen)

  checkTexture = menu:addImageCheckBox(_("Set Maximum OpenGL Texture to 256"), offx + 17, offy + 55 + 26*10 + 14, g_checkbox_off, g_checkbox_on,
    function()
      if (checkTexture:isMarked()) then
        doom.preferences.MaxOpenGLTexture = 256
      else
        doom.preferences.MaxOpenGLTexture = 0
      end
      SetMaxOpenGLTexture(doom.preferences.MaxOpenGLTexture)
    end)
  if (doom.preferences.MaxOpenGLTexture == 256) then checkTexture:setMarked(true) end

  menu:addLabel(_("Render Mode: (need to restart)"), offx + 16, offy + 80 + 8*(table.getn(videoModes)/2+1), Fonts["game"], false)
  checkOpenGL = menu:addDropDown({_("Software"),_("OpenGL")}, offx + 17, offy + 100 + 8*(table.getn(videoModes)/2+1),
    function(dd) 
		if checkOpenGL:getSelected() == 0 then
			doom.preferences.UseOpenGL = false
		else
			doom.preferences.UseOpenGL = true
		end
	end)
  checkOpenGL:setSize(152, 20)
	if doom.preferences.UseOpenGL == true then
		checkOpenGL:setSelected(1)
	else
		checkOpenGL:setSelected(0)
	end
  
  

  menu:addHalfButton("~!OK", "o", offx + 123, offy + 55 + 26*12 + 14, function() 
	SavePreferences()
	menu:stop() 
	end)

  return menu:run()
end

function RunConfirmRestart(menu)
  local confirm = WarGameMenu(panel(4))
  confirm:resize(288, 128)

  local mes = MultiLineLabel(_("You need to restart game to apply changes, exit now?"))
  mes:setFont(Fonts["game"])
  mes:setAlignment(MultiLineLabel.CENTER)
  mes:setVerticalAlignment(MultiLineLabel.TOP)
  mes:setLineWidth(150)
  mes:setWidth(288)
  mes:setHeight(48)
  mes:setBackgroundColor(dark)
  confirm:add(mes, 0, 25)

  confirm:addHalfButton(_("~!Yes"), "y", 1 * (300 / 3) - 90, 120 - 16 - 27,
    function()
        confirm:stop()
        menu:stop()
		Exit(0)
    end)

  confirm:addHalfButton(_("~!No"), "n", 3 * (300 / 3) - 130, 120 - 16 - 27,
    function() confirm:stop() end)

  return confirm:run()
end

function RunLanguageMenu()
  local menu = WarMenu()
  local offx = (Video.Width - 352) / 2
  local offy = (Video.Height - 352) / 2
  local b
  local languageList
  
  local langlist = {}
  if (LanguageTable ~= nil) then
	for i=1,table.getn(LanguageTable)/3 do
		langlist[i]=tostring(LanguageTable[(i-1)*3+1])
	end
  end

  menu:addLabel(_("Language Options"), offx + 176, offy + 1)
  
  menu:addLabel(_("Available languages:"), offx + 16, offy + 34, Fonts["game"], false)
  languageList = menu:addListBox(offx + 16, offy + 50, 200, math.max(200, 8*(table.getn(LanguageTable)/3+1)), langlist)

  menu:addHalfButton("~!OK", "o", offx + 320/2 - 150, offy + 55 + 26*12 + 14, function()
    if (languageList:getSelected() >= 0) then
		doom.preferences.StratagusTranslation = "scripts/translate/" .. LanguageTable[languageList:getSelected()*3 + 2]
		doom.preferences.GameTranslation = "scripts/translate/" .. LanguageTable[languageList:getSelected()*3 + 3]
		SetTranslationsFiles(doom.preferences.StratagusTranslation, doom.preferences.GameTranslation)
		SavePreferences()
		RunConfirmRestart(menu)
	end
	menu:stop() 
	end)

  menu:addHalfButton(_("~!Cancel"), "c", offx + 320/2 + 100, offy + 55 + 26*12 + 14, function() 
	menu:stop() 
	end)

  return menu:run()
end


function RunGameOptionsMenu()
  local menu = WarGameMenu(panel(1))
 
  menu:addLabel(_("Game Options"), 128, 11)
  menu:addFullButton(_("Sound (~<F7~>)"), "f7", 16, 40 + 36*0,
    function() RunGameSoundOptionsMenu(false) end)
  menu:addFullButton(_("Preferences (~<F8~>)"), "f8", 16, 40 + 36*1,
    function() RunPreferencesMenu(false) end)
  menu:addFullButton(_("Diplomacy (~<F9~>)"), "f9", 16, 40 + 36*2,
    function() RunDiplomacyMenu() end)

  menu:addFullButton(_("Previous (~<Esc~>)"), "escape", 128 - (224 / 2), 288 - 40,
    function() menu:stop() end)

  menu:run(false)
end

function RunOptionsMenu()
  local continue = 1
  while (continue == 1) do
    continue = BuildOptionsMenu()
  end
end

function BuildOptionsMenu()
  local menu = WarMenu()
  
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2

  menu:addLabel(_("Game Options"), offx + 320, offy + 104 - 36)
  menu:addFullButton(_("Sound (~<F7~>)"), "f7", offx + 208, offy + 104 + 36*0,
    function() RunGameSoundOptionsMenu(true) end)
  menu:addFullButton(_("Game Preferences (~<F8~>)"), "f8", offx + 208, offy + 104 + 36*1,
    function() RunPreferencesMenu(true) end)
  menu:addFullButton(_("Video (~<F9~>)"), "f9", offx + 208, offy + 104 + 36*2,
    function() RunVideoMenu(); menu:stop(0) end)
  menu:addFullButton(_("Language (~<F11~>)"), "f11", offx + 208, offy + 104 + 36*3,
    function() RunLanguageMenu() end)
  menu:addFullButton(_("Previous (~<Esc~>)"), "escape", offx + 208, offy + 104 + 36*5,
    function() menu:stop() end)

	bckground:Resize(Video.Width, Video.Height)
   return menu:run()
end
