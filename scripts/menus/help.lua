function RunHelpMenu()
  local menu = WarGameMenu(panel(1))

  menu:addLabel(_("Help Menu"), 128, 11)
  menu:addFullButton(_("Keystroke ~!Help"), "h", 16, 40 + 36*0,
    function() RunKeystrokeHelpMenu() end)
  menu:addFullButton(_("~!Tips"), "t", 16, 40 + 36*1,
    function() RunTipsMenu(false) end)
  menu:addFullButton(_("Previous (~<Esc~>)"), "escape", 128 - (224 / 2), 248,
    function() menu:stop() end)

  menu:run(false)
end

local keystrokes = {
  {"Alt-F", "- toggle full screen"},
  {"Alt-G", "- toggle grab mouse"},
  {"Ctrl-S", "- mute sound"},
  {"Ctrl-M", "- mute music"},
  {"+", "- increase game speed"},
  {"-", "- decrease game speed"},
  {"Ctrl-P", "- pause game"},
  {"PAUSE", "- pause game"},
  {"PRINT", "- make screen shot"},
  {"Alt-H", "- help menu"},
  {"Alt-R", "- restart scenario"},
  {"Alt-Q", "- quit to main menu"},
  {"Alt-X", "- quit game"},
  {"Alt-B", "- toggle expand map"},
  {"Alt-M", "- game menu"},
  {"ENTER", "- write a message"},
  {"SPACE", "- goto last event"},
  {"TAB", "- hide/unhide terrain"},
  {"Ctrl-T", "- track unit"},
  {"Alt-I", "- find idle peon"},
  {"Alt-C", "- center on selected unit"},
  {"Alt-V", "- next view port"},
  {"Ctrl-V", "- previous view port"},
  {"~", "- select nothing"},
  {"#", "- select group"},
  {"##", "- center on group"},
  {"Ctrl-#", "- define group"},
  {"Shift-#", "- add to group"},
  {"Alt-#", "- add to alternate group"},
  {"F2-F4", "- recall map position"},
  {"Shift F2-F4", "- save map postition"},
  {"F5", "- game options"},
  {"F7", "- sound options"},
  {"F8", "- speed options"},
  {"F9", "- game preferences"},
  {"F10", "- game menu"},
  {"BACKSPACE", "- game menu"},
  {"F11", "- save game"},
  {"F12", "- load game"},
}

function RunKeystrokeHelpMenu()
  local menu = WarGameMenu(panel(5))
  menu:resize(352, 352)

  local c = Container()
  c:setOpaque(false)

  for i=1,table.getn(keystrokes) do
    local l = Label(keystrokes[i][1])
    l:setFont(Fonts["game"])
    l:adjustSize()
    c:add(l, 0, 20 * (i - 1))
    local l = Label(keystrokes[i][2])
    l:setFont(Fonts["game"])
    l:adjustSize()
    c:add(l, 80, 20 * (i - 1))
  end

  local s = ScrollArea()
  c:setSize(320 - s:getScrollbarWidth(), 20 * table.getn(keystrokes))
  s:setBaseColor(dark)
  s:setBackgroundColor(dark)
  s:setForegroundColor(clear)
  s:setSize(320, 216)
  s:setContent(c)
  menu:add(s, 16, 60)

  menu:addLabel(_("Keystroke Help Menu"), 352 / 2, 11)
  menu:addFullButton(_("Previous (~<Esc~>)"), "escape",
    (352 / 2) - (224 / 2), 352 - 40, function() menu:stop() end)

  menu:run(false)
end

local tips = {
  " ~<Useful information~>:\nDon't turn off these tips. They can offer you a lot of undocumented information about hot keys, strategies and tactics.",
  " ~<Tactics~>:\nThe more workers you have collecting minerals, the faster your economy will grow. Same rule applies for energy.",
  " ~<Tactics~>:\nTry to defend your power plants and generators. If enemy will destroy them, your energy resources will be decreased.",
  " ~<Tactics~>:\nBuilding more than one barracks or factories will let you train more units faster.",
  " ~<Unit control~>: \nUse your workers to repair damaged buildings.",
  " ~<Unit control~>: \nYou can order a worker to automatically repair damaged buildings by holding down the CTRL key and pressing on repair button.",
  " ~<Unit control~>: \nYou can select all of your currently visible units of the same type by holding down the CTRL key and selecting a unit or by \"double clicking\" on a unit.",
  " ~<Unit control~>:\nYou can track over unit, if you click on him and press CTRL-T or ALT-T.",
  
  " ~<Unit control~>:\nYou can track over unit, if you click on him and press CTRL-T or ALT-T.",
  
  " ~<Tactics and strategy~>:\nExplore your surroundings early in the game.",
  " ~<Tactics and strategy~>:\nAlways keep the balance between minerals and energy income. Both resources are needed in mid-game and endgame.",
  " ~<Tactics and strategy~>:\nTry to use medics if you are playing for UAC. That's much better than if you will train new units and spend more resources.",
  
  " ~<Tactics and strategy~>: \nKeep all workers working. Use ALT-I or quick button on panel to find idle workers.",
  " ~<Unit control~>:\nYou can make units automatically cast spells by selecting a unit, holding down CTRL and clicking on the spell icon. CTRL click again to turn off. Autocast spell will draw a blue rectangle around it's button on panel",
  

  -- Shift/Control/Alt tips
  " ~<Waypoints~>:\nYou can give an unit an order which is executed after it finishes the current work, if you hold the SHIFT key.",
  " ~<Waypoints~>:\nYou can give way points, if you press the SHIFT key, while you click right for the move command.",
  " ~<Waypoints~>:\nYou can order a worker to build several buildings in row(useful for walls), if you hold the SHIFT key, while you place the building.",
  " ~<Waypoints~>:\nYou can build many of the same building, if you hold the ALT and SHIFT keys while you place the buildings.",
  " ~<Waypoints~>:\nYou can order unit to defend another one, if you hold the ALT key while you right-click on unit.",

  " ~<Interface~>:\nUse CTRL-V or ALT-V to cycle through the viewport configuration, you can then monitor your base and lead an attack.",
  -- Unit specific
  " ~<Units~>:\nThe BFG marines are vegy good against swarms or monsters, but don't let the BFG blasts to harm your own units",
  " ~<Units~>: ",
  

  "Know a useful tip?  Then add it here!",
}

function RunTipsMenu(trigger)
  local menu = WarGameMenu(panel(2))
  menu:resize(288, 256)

  menu:addLabel("Tips", 144, 11)

  local l = MultiLineLabel()
  l:setFont(Fonts["game"])
  l:setSize(260, 128)
  l:setLineWidth(260)
  menu:add(l, 14, 35)

  function l:prevTip()
    doom.preferences.TipNumber = doom.preferences.TipNumber - 1
    if (doom.preferences.TipNumber < 1) then
      doom.preferences.TipNumber = table.getn(tips)
    end
    SavePreferences()
  end
  function l:nextTip()
    doom.preferences.TipNumber = doom.preferences.TipNumber + 1
    if (doom.preferences.TipNumber > table.getn(tips)) then
      doom.preferences.TipNumber = 1
    end
    SavePreferences()
  end
  function l:updateCaption()
    self:setCaption(tips[doom.preferences.TipNumber])
  end

  if (doom.preferences.TipNumber == 0) then
    l:nextTip()
  end
  l:updateCaption()

  local showtips = {}
  showtips = menu:addImageCheckBox(_("Show tips at startup"), 14, 256 - 75, g_checkbox_off, g_checkbox_on,
    function()
      doom.preferences.ShowTips = showtips:isMarked()
      SavePreferences()
    end)
  showtips:setMarked(doom.preferences.ShowTips)

  menu:addHalfButton(_("~!Next Tip"), "n", 14, 256 - 40,
    function() l:nextTip(); l:updateCaption() end)
  menu:addHalfButton(_("~!Close"), "c", 168, 256 - 40,
    function() l:nextTip(); if trigger then SetGamePaused(false) end; menu:stop() end)

  menu:run(false)
end

