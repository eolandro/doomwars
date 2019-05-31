Load("scripts/uac/buttons.lua")
Load("scripts/hell/buttons.lua")

DefineButton( { Pos = 9, Level = 9, Icon = "icon-cancel",
  Action = "cancel", Popup = "popup-commands",
  Key = "ESC", Hint = _("~<ESC~> Cancel"),
  ForUnit = {"*"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-cancel",
  Action = "cancel-upgrade", Description = _("Aborts current upgrade and gives it's cost back to the player."),
  Key = "ESC", Hint = _("~<ESC~> Cancel upgrade"), Popup = "popup-commands",
  ForUnit = {"cancel-upgrade"} } )
  
DefineButton( { Pos = 9, Level = 1, Icon = "icon-cancel",
  Action = "cancel-upgrade", Description = _("Aborts current upgrade and gives it's cost back to the player."),
  Key = "ESC", Hint = _("~<ESC~> Cancel upgrade"), Popup = "popup-commands",
  ForUnit = {"cancel-upgrade"} } )
  
DefineButton( { Pos = 9, Level = 2, Icon = "icon-cancel",
  Action = "cancel-upgrade", Description = _("Aborts current upgrade and gives it's cost back to the player."),
  Key = "ESC", Hint = _("~<ESC~> Cancel upgrade"), Popup = "popup-commands",
  ForUnit = {"cancel-upgrade"} } )
  
DefineButton( { Pos = 9, Level = 3, Icon = "icon-cancel",
  Action = "cancel-upgrade", Description = _("Aborts current upgrade and gives it's cost back to the player."),
  Key = "ESC", Hint = _("~<ESC~> Cancel upgrade"), Popup = "popup-commands",
  ForUnit = {"cancel-upgrade"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-cancel",
  Action = "cancel-train-unit", Description = _("Aborts current unit training and gives it's cost back to the player."),
  Key = "ESC", Hint = _("~<ESC~> Cancel unit training"), Popup = "popup-commands",
  ForUnit = {"*"} } )

DefineButton( { Pos = 9, Level = 0, Icon = "icon-cancel",
  Action = "cancel-build", Description = _("Aborts current building construction and gives it's 75 percents cost back to the player."),
  Key = "ESC", Hint = _("~<ESC~> Cancel construction"), Popup = "popup-commands",
  ForUnit = {"cancel-build"} } )