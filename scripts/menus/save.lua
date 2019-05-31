function RunConfirmErase(name,menu)
  local confirm = WarGameMenu(panel(3))

  confirm:resize(300,120)

  confirm:addLabel(name, 300 / 2, 11)
  confirm:addLabel(_("File exists, are you sure ?"), 300 / 2, 31)

  confirm:addHalfButton(_("~!Yes"), "y", 1 * (300 / 3) - 90, 120 - 16 - 27,
    function()
        SaveGame(name)
        UI.StatusLine:Set(_("Saved game to: ") .. name)
        confirm:stop()
        menu:stop()
    end)

  confirm:addHalfButton(_("~!No"), "n", 3 * (300 / 3) - 116, 120 - 16 - 27,
    function() confirm:stop() end)

  confirm:run(false)
end

function RunSaveMenu()
  local menu = WarGameMenu(panel(3))
  menu:resize(384, 256)

  menu:addLabel(_("Save Game"), 384 / 2, 11)
  
  local save = "save"
  local counter = 0

  local t = menu:addTextInputField("",
    (384 - 300 - 18) / 2, 11 + 36, 318)

  local browser = menu:addBrowser("~save", ".sav.gz$",
    (384 - 300 - 18) / 2, 11 + 36 + 22, 318, 126)
  local function cb(s)
    t:setText(browser:getSelectedItem())
  end
  browser:setActionCallback(cb)
  
  while (1) do
	if (browser:exists(save .. ".sav.gz")) then
		counter = counter + 1
		save = string.sub(save, 1, 4) .. tostring(counter)
	else
		break
	end
  end
  
  save = save .. ".sav"

  t:setText(save)

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
      -- append .sav
      if (string.find(name, ".sav$") == nil) then
        name = name .. ".sav"
      end
      -- replace invalid chars with underscore
      local t = {"\\", "/", ":", "*", "?", "\"", "<", ">", "|"}
      table.foreachi(t, function(k,v) name = string.gsub(name, v, "_") end)

      if (browser:exists(name .. ".gz")) then
          RunConfirmErase(name,menu)
      else
        SaveGame(name)
        UI.StatusLine:Set(_("Saved game to: ") .. name)
        menu:stop()
      end
    end)

  menu:addHalfButton(_("~!Cancel"), "c", 3 * (384 / 3) - 106 - 10, 256 - 16 - 27,
    function() menu:stop() end)

  menu:run(false)
end

