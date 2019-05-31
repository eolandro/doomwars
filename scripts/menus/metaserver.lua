function RunMetaServerMenu()
  local menu = WarMenu()
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2
  local nick

  menu:addLabel("~<Metaserver~>", offx + 640/2 + 12, offy + 192)
  local msgs = ""
  local numplayers_text = MultiLineLabel(msgs)
  numplayers_text:setFont(Fonts["game"])
  numplayers_text:setAlignment(MultiLineLabel.LEFT)
  numplayers_text:setVerticalAlignment(MultiLineLabel.TOP)
  numplayers_text:setLineWidth(270)
  numplayers_text:setWidth(270)
  numplayers_text:setHeight(41)
  numplayers_text:setBackgroundColor(dark)
  menu:add(numplayers_text, 9, 38)
  nick = menu:addTextInputField("", offx + 298, 260 + offy)
  
  menu:addFullButton("~!Send", "s", 208 + offx, 320 + (36 * 1) + offy,
    function()
		MetaClient:Send(tostring(nick:getText()))
		local reply
		local n = MetaClient:Recv()
		print(n)
		if (n ~= -1) then
			reply = MetaClient:GetLastMessage()
			msgs = msgs .. reply.entry
			numplayers_text:setCaption(msgs)
			numplayers_text:adjustSize()
		end
	end)
  local function UpdateMessages()
	
  end

  menu:addFullButton("~!Clear", "m", 208 + offx, 320 + (36 * 2) + offy,
    function() msgs = ""; numplayers_text:setCaption(msgs)  end)
  menu:addFullButton("~!Main Menu", "m", 208 + offx, 320 + (36 * 3) + offy,
    function()  menu:stopAll() end)
--[[
  local listener = LuaActionListener(
	function(s)
		updateStartButton(UpdateMessages())
	end)
	menu:addLogicCallback(listener)]]
  menu:run()
  MetaClient:Close()

end

function RunJoiningMetaServerMenu()
  local menu = WarMenu(nil, panel(4), false)
  menu:setSize(288, 128)
  menu:setPosition((Video.Width - 288) / 2, (Video.Height - 128) / 2)
  menu:setDrawMenusUnder(true)

  menu:addLabel("Enter meta server address:", 144, 11)
  local server = menu:addTextInputField(doom.preferences.MetaServer..":"..tostring(doom.preferences.MetaPort), 40, 38, 212)
  local conn_label = menu:addLabel("Connecting...", 40, 60, Fonts["game"], false)
  conn_label:setVisible(false)

  local ok_button = menu:addHalfButton("~!OK", "o", 24, 80, function(s) end)
  local cancel_button = menu:addHalfButton("~!Cancel", "c", 154, 80, function() menu:stop() end)
  ok_button:setActionCallback(
  function(s)
		print(tostring(string.len(server:getText())))
		if string.len(server:getText()) > 0 then
			conn_label:setVisible(true)
			conn_label:setCaption("Connecting...")
			conn_label:adjustSize()
			local ip = string.find(server:getText(), ":")
			if ip ~= nil then
				doom.preferences.MetaServer = string.sub(server:getText(), 1, ip - 1)
				doom.preferences.MetaPort = tonumber(string.sub(server:getText(), ip + 1))
				if (doom.preferences.MetaPort == 0) then doom.preferences.MetaPort = 7775 end
				print(doom.preferences.MetaServer.." "..tostring(doom.preferences.MetaPort))
			else
				doom.preferences.MetaServer = string.sub(server:getText(), 1)
				doom.preferences.MetaPort = 7775
			end
			ok_button:setEnabled(false)
			cancel_button:setEnabled(false)
			MetaClient:SetMetaServer(doom.preferences.MetaServer, doom.preferences.MetaPort)
			if (MetaClient:Init() == -1) then
				conn_label:setCaption("Unable to connect")
				conn_label:adjustSize()
				ok_button:setEnabled(true)
				cancel_button:setEnabled(true)
			else
				-- connected
				RunMetaServerMenu()
				menu:stop(0)
			end
			
		end	  
    end
	)

  menu:run()
end

