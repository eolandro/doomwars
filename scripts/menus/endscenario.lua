function RunEndScenarioMenu()
  local menu = WarGameMenu(panel(1))

  menu:addLabel(_("End Scenario"), 128, 11)
  local b = menu:addFullButton(_("~!Restart Scenario"), "r", 16, 40 + (36 * 0),
    function() RunRestartConfirmMenu() end)
  if (IsNetworkGame()) then
    b:setEnabled(false)
  end
  menu:addFullButton(_("~!Surrender"), "s", 16, 40 + (36 * 1),
    function() RunSurrenderConfirmMenu() end)
  menu:addFullButton(_("~!Quit to Menu"), "q", 16, 40 + (36 * 2),
    function() RunQuitToMenuConfirmMenu() end)
  menu:addFullButton(_("E~!xit Doom Wars"), "x", 16, 40 + (36 * 3),
    function() RunExitConfirmMenu() end)
  menu:addFullButton(_("Previous (~<Esc~>)"), "escape", 16, 248,
    function() menu:stop() end)

  menu:run(false)
end

function RunRestartConfirmMenu()
  local menu = WarGameMenu(panel(1))

  local l = MultiLineLabel(_("Are you sure you want to restart the scenario?"))
  l:setFont(Fonts["large"])
	  l:setAlignment(MultiLineLabel.CENTER)
	  l:setVerticalAlignment(MultiLineLabel.CENTER)
	  l:setLineWidth(256)
	  l:setWidth(256)
	  l:setHeight(41)
	  l:setBackgroundColor(dark)
	  menu:add(l, 0, 30)
  menu:addFullButton(_("~!Restart Scenario"), "r", 16, 11 + (24 * 3) + 29,
    function() StopGame(GameRestart); menu:stopAll() end)
  menu:addFullButton(_("Cancel (~<Esc~>)"), "escape", 16, 248,
    function() menu:stop() end)

  menu:run(false)
end

function RunSurrenderConfirmMenu()
  local menu = WarGameMenu(panel(1))

  local l = MultiLineLabel(_("Are you sure you want to surrender to your enemies?"))
  l:setFont(Fonts["large"])
	  l:setAlignment(MultiLineLabel.CENTER)
	  l:setVerticalAlignment(MultiLineLabel.CENTER)
	  l:setLineWidth(256)
	  l:setWidth(256)
	  l:setHeight(41)
	  l:setBackgroundColor(dark)
	  menu:add(l, 0, 30)
  menu:addFullButton(_("~!Surrender"), "s", 16, 11 + (24 * 3) + 29,
    function() StopGame(GameDefeat); menu:stopAll() end)
  menu:addFullButton(_("Cancel (~<Esc~>)"), "escape", 16, 248,
    function() menu:stop() end)

  menu:run(false)
end

function RunQuitToMenuConfirmMenu()
  local menu = WarGameMenu(panel(1))

  local l = MultiLineLabel(_("Are you sure you want to quit to the main menu?"))
  l:setFont(Fonts["large"])
	  l:setAlignment(MultiLineLabel.CENTER)
	  l:setVerticalAlignment(MultiLineLabel.CENTER)
	  l:setLineWidth(256)
	  l:setWidth(256)
	  l:setHeight(41)
	  l:setBackgroundColor(dark)
	  menu:add(l, 0, 30)
  menu:addFullButton(_("~!Quit to Menu"), "q", 16, 11 + (24 * 3) + 29,
    function() StopGame(GameQuitToMenu); Editor.Running = EditorNotRunning; menu:stopAll() end)
  menu:addFullButton("Cancel (~<Esc~>)", "escape", 16, 248,
    function() menu:stop() end)

  menu:run(false)
end

function RunExitConfirmMenu()
  local menu = WarGameMenu(panel(1))

  local l = MultiLineLabel(_("Are you sure you want to exit Doom Wars?"))
  l:setFont(Fonts["large"])
	  l:setAlignment(MultiLineLabel.CENTER)
	  l:setVerticalAlignment(MultiLineLabel.CENTER)
	  l:setLineWidth(256)
	  l:setWidth(256)
	  l:setHeight(41)
	  l:setBackgroundColor(dark)
	  menu:add(l, 0, 30)
  menu:addFullButton(_("E~!xit Doom Wars"), "x", 16, 11 + (24 * 3) + 29,
    function() Exit(0) end)
  menu:addFullButton(_("Cancel (~<Esc~>)"), "escape", 16, 248,
    function() menu:stop() end)

  menu:run(false)
end

