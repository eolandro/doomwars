function RunShowCreditsMenu()
  local menu = WarMenu(nil)
  local offx = (Video.Width - 640) / 2
  local offy = (Video.Height - 480) / 2

  local credits = {
	"DOOM WARS",
	"UAC VS. HELL",
	"v. "..doom.Version,
	"",
	"Powered by Stratagus Engine v" .. GetStratagusVersion(),
	"Site: http://stratagus.com",
	"",
	"Based on Doom FPS game",
	"",
	"Main developer and project leader:",
	"  cybermind aka Mistranger",
	"",
	"Music:",
	"  Steve Rot's Doom Tribute - At Doom's Gate, ",
	"    Kitchen Ace (And Taking Names), On the Hunt,",
	"    Between Levels, Shawn's Got The Shotgun,",
	"    The Dave D. Taylor Blues, Into Sandy's City,",
	"    Bye Bye American Pie, Demons On The Prey",
	"  Rinon Ninquenon - Death's Bells, ",
	"    Legion of the Lost(Credits screen)",
	"  Shane Strife - Deep Into The Code",
	"  Aubrey Hodges - all Hell's soundtrack",
	"",
	"Maps",
	"  cybermind aka Mistranger",
	"  Yom Zee",
	"  Mr.Basik",
	"",
	"Unit voices:",
	"  Jake Crusher - Shotgunner, Super Shotgunner",
	"  cybermind aka Mistranger - Chaingun Trooper, Belial, Thor",
	"  Hamsterheart - Berserker",
	"  Swoy45 - Rocker Launcher Trooper, Transport",
	"  Kyran Jackson - Heavy Trooper",
	"  Yom Zee - Commando",
	"  Demonologist - Doomer, Hell announcer",
	"  b-o - Combat Medic",
	"  Diabol - UAC Fighter",
	"  Mr.Basik - Technician",
	"  DinkyDyeAussie - Crusher",
	"",
	"Building models:",
	"  cybermind aka Mistranger",
	"  Textures used in building models:",
	"    GothicDM texture pack",
	"    Mortiser texture pack",
	"    Gray textures v2",
	"    nb_flats.wad",
	"    Xtra Lites Texture Pack",
	"    Community Chest 4 texture pack",
	"",
	"Unit models",
	"  Worker Robot - Nod Siegebot by Lin Kuei Ominae",
	"  Raider - Mech by Lin Kuei Ominae",
	"  Crusher - Spamer tank by Bu7loos",
	"  Thor - Grizzly Bear Tank MK.II by Translator",
	"",
	"Beta testers:",
	"  Snegok aka Doctor Doom",
	"  OxOTHuK",
	"  Mr.Basik",
	"  TGA",
	"Special thanks to:",
	"  Demonologist - a lot of help and contributions after v. 1.2 release",
	"  Jake Crusher - a lot of help and contributions after v. 1.2 release",
	"  Kyran Jackson - project hosting on stratagus.com",
	"  Yom Zee - a lot of help and contributions on project's early stages",
	"  NoMaD - contributions and help on project's early stages",
	"  Snegok aka Doctor Doom - a lot of gameplay ideas",
	"Additional thanks to:",
	"  Doom Hacker - for Doom: The Battle For Mars",
	"  Randy Heit and Graf Zahl - for GZDoom",
	"  CodeImp - for Doom Builder",
	"  The Stratagus Team - for Stratagus Engine",
	"  id Softwware - for DooM!",
	"  and everybody who helped me in the game development!"
  }

  local sw = ScrollingWidget(620, 275)
  menu:add(sw, offx + 20, offy + 80)
  sw:setBackgroundColor(Color(0,0,0,0))
  sw:setActionCallback(function() sw:restart() end)
  sw:setSpeed(0.65)
  for i,f in ipairs(credits) do
    sw:add(Label(f), 0, 24 * (i - 1) + 275)
  end

  menu:addHalfButton(_("~!Continue"), "c", offx + 455, offy + 440,
    function() menu:stop() end)

  local speed = GetGameSpeed()
  SetGameSpeed(30)
  
  PlayMusic("music/credits.ogg")

  menu:run()

  SetGameSpeed(speed)
end