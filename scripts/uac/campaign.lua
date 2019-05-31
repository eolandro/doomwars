local uachero = LoadGraphic("graphics/missiles/particles/explosions/explosion5.png", 96, 96)
local uachero2 = LoadGraphic("graphics/missiles/particles/explosions/explosion6.png", 100, 100)

campaign_current_map = nil

function CreateBriefingScreen(actionlist, maplist)
	local menu = WarMenu()
	local offx = (Video.Width - 640) / 2
	local offy = (Video.Height - 480) / 2
	local actionpos = 0
	local actiontimer = 0
	local actionpause = 0
	local prepause = 30
	local finished = false

	local informator_text = MultiLineLabel()
	informator_text:setFont(Fonts["game"])
	informator_text:setSize(260, 128)
	informator_text:setLineWidth(260)
	menu:add(informator_text, 14, 75)
	informator_text:setVisible(false)

	local informator_graphic = null_image
	local informator_widget = ImageWidget(informator_graphic)
	informator_widget:setVisible(false)
	menu:add(informator_widget, 198, 185)

	local updater = StatBoxWidget(258, 30)
	updater:setCaption("Updating...")
	updater:setPercent(actiontimer)
	menu:add(updater, 125, 38)
	updater:setBackgroundColor(dark)
	updater:setVisible(false)

	function UpdateTextures()
	end

	function BriefingFlow()
		-- This is need for screen auto update
		updater:setPercent(actiontimer)

		if prepause > 0 then
			prepause = prepause - 1
			return
		end

		function LoadNewAction()
			if (actionpos < table.getn(actionlist)) then
				actionpos = actionpos + 1
			else
				finished = true
				informator_text:setVisible(true)
				informator_text:setCaption("End of briefing.")
				return
			end
			informator_widget:setVisible(false)
			informator_widget = ImageWidget(actionlist[actionpos][1])
			informator_widget:setVisible(true)
			menu:add(informator_widget, 198, 185)
			informator_text:setVisible(true)
			informator_text:setCaption(actionlist[actionpos][2])
			actiontimer = actionlist[actionpos][3]
			actionpause = actionlist[actionpos][4]
		end

		UpdateTextures()

		if finished == true then
			return
		end
		-- On-going process
		if actiontimer > 0 then
			actiontimer = actiontimer - 1
			if (actiontimer == 0) then
				informator_widget:setVisible(false)
				informator_text:setVisible(false)
			else
				return
			end
		end
		if actiontimer == 0 and actionpause > 0 then
			-- Another cutscene's block has just finished
			-- Wait
			actionpause = actionpause - 1
			if actionpause == 0 then
				-- Load the new action
				LoadNewAction()
			end
			return
		end
		if actiontimer == 0 and actionpause == 0 then
			LoadNewAction()
			return
		end
		DebugPrint("error in campaign code\n")
		Exit(0)
	end
	
	for i = 1, table.getn(maplist) do
		menu:addFullButton(maplist[i][1], tostring(i), offx + 208, offy + 312 + (36 * i), 
		function()
			campaign_current_map = maplist[i][2]
			menu:stop(1)
		end)
	end

	local screenUpdate = LuaActionListener(BriefingFlow)

	menu:addLogicCallback(screenUpdate)

	menu:addFullButton("~!Cancel", "c", offx + 208, offy + 212 + (36 * 1),
    function() menu:stop(2); end)

	return menu:run()
end

function CampaignChapter(actionlist, maplist)
	local result = CreateBriefingScreen(actionlist, maplist)
	if result == 2 then
		return nil
	end
	if campaign_current_map == nil then
		DebugPrint("error in campaign code\n")
		Exit(0)
	end
	return function()
	
    Load(campaign_current_map)
    RunMap(campaign_current_map)
  end
end

campaign_steps = {
	CampaignChapter({
	{uachero, "HelloWorld!", 31, 20},
	{uachero2, "HelloWorld again!", 31, 20}}, {{"First map", "maps/campaigns/uac/uac01.smp"}}),
	--CreateMapStep({{}})
}