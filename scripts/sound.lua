musicpos = 1

uacplaylist = {
  "music/uac/uac01.ogg", "At Doom's Gate",
  "music/uac/uac02.ogg", "Kitchen Ace (And Taking Names)",
  "music/uac/uac03.ogg", "On the Hunt",
  "music/uac/uac04.ogg", "Deep Into The Code",
  "music/uac/uac05.ogg", "Between Levels",
  "music/uac/uac06.ogg", "Shawn's Got The Shotgun",
  "music/uac/uac07.ogg", "The Dave D. Taylor Blues",
  "music/uac/uac08.ogg", "Into Sandy's City",
  "music/uac/uac09.ogg", "Bye Bye American Pie",
  "music/uac/uac10.ogg", "Death's Bells",
}

hellplaylist = {
   "music/hell/hell01.ogg", "Retribution Dawns",
   "music/hell/hell02.ogg", "The Broken Ones",
   "music/hell/hell03.ogg", "Sanity's Edge",
   "music/hell/hell04.ogg", "Steadfast Extermination",
   "music/hell/hell05.ogg", "In The Grip Of Madness",
   "music/hell/hell06.ogg", "Demon Drone",
   "music/hell/hell07.ogg", "Mutation",
   "music/hell/hell08.ogg", "Beyond Fear",
   "music/hell/hell09.ogg", "Corrupted",
   "music/hell/hell10.ogg", "Lamentation",
}

function MusicStopped()
  if (GetPlayerData(GetThisPlayer(), "RaceName") == "uac") or (GetPlayerData(GetThisPlayer(), "RaceName") == nil) then
	if (table.getn(uacplaylist) ~= 0) then
		if IsMusicEnabled() then
			if doom.preferences.MusicRandom then
				musicpos = math.random(table.getn(uacplaylist)/2)*2-1
			end
			PlayMusic(uacplaylist[musicpos])
			musicpos = musicpos + 2
			if musicpos > table.getn(uacplaylist) then musicpos=1 end
		end
	end
  else
	if (table.getn(hellplaylist) ~= 0) then
		if IsMusicEnabled() then
			if doom.preferences.MusicRandom then
				musicpos = math.random(table.getn(hellplaylist)/2)*2-1
			end
			PlayMusic(hellplaylist[musicpos])
			musicpos = musicpos + 2
			if musicpos > table.getn(hellplaylist) then musicpos=1 end
		end
	end
  end
end

SetGlobalSoundRange(24)

chat_message = MakeSound("chat-message", "sounds/ui/message.wav")
stats_sound = MakeSound("stats","sounds/ui/stats.wav")
stats_sound1 = MakeSound("stats1","sounds/ui/stats_sound.wav")

---Missile sounds and etc

-- General
MakeSound("door-open","sounds/misc/inside/dsbdopn.wav")
MakeSound("door-close","sounds/misc/inside/dsbdcls.wav")
MakeSound("switch-activate","sounds/misc/inside/dsswtchn.wav")

MakeSound("pistol shot",{"sounds/missiles/dspisto1.wav","sounds/missiles/dspisto2.wav","sounds/missiles/dspisto3.wav","sounds/missiles/dspisto4.wav"})
MakeSound("lostsoul attack","sounds/missiles/dssklatk.wav")
MakeSound("invilerability","sounds/missiles/dsgetpow.wav")
MakeSound("laser hit","sounds/missiles/dssonhit.wav")
MakeSound("laser attack","sounds/missiles/dslasr2.wav")
MakeSound("revenant-attack","sounds/missiles/dsskeatk.wav")
MakeSound("revenant-whoosh","sounds/missiles/dsskeswg.wav")
MakeSound("revenant-punch","sounds/missiles/dsskepch.wav")
MakeSound("chain attack","sounds/missiles/dspistol.wav")
MakeSound("chaingun attack","sounds/missiles/dsshotgn.wav")

MakeSound("shotgun attack",{"sounds/missiles/dsd3sh1.wav","sounds/missiles/dsd3sh2.wav","sounds/missiles/dsd3sh3.wav"})
MakeSound("shotgun reload","sounds/missiles/dsd3sp1.wav")

MakeSound("rocket reload","sounds/missiles/dsd3rlr.wav")
MakeSound("rocket launch",{"sounds/missiles/dsd3rl1.wav","sounds/missiles/dsd3rl2.wav","sounds/missiles/dsd3rl3.wav"})
MakeSound("plasma shot",{"sounds/missiles/dsd3ps1.wav","sounds/missiles/dsd3ps2.wav","sounds/missiles/dsd3ps3.wav"})
MakeSound("plasma explode1",{"sounds/missiles/dsd3ph1.wav","sounds/missiles/dsd3ph2.wav","sounds/missiles/dsd3ph3.wav"})
MakeSound("bfg charge","sounds/missiles/bfgstart.wav")
MakeSound("bfg shot","sounds/missiles/dsbfff1.wav")
MakeSound("teleport","sounds/missiles/dstelept.wav")

MakeSound("electro",{"sounds/missiles/electro1.wav","sounds/missiles/electro2.wav","sounds/missiles/electro4.wav"})

MakeSound("comet launch","sounds/missiles/cometlnc.wav")
MakeSound("comet explode","sounds/missiles/cometexp.wav")

MakeSound("cannon shot","sounds/missiles/cannon02.wav")
MakeSound("cannon explode","sounds/missiles/expnew06.wav")
MakeSound("chaingun tower shot","sounds/missiles/mgnfire.wav")

MakeSound("ricoshet",{"sounds/missiles/ricoshet/rico1.wav","sounds/missiles/ricoshet/rico2.wav","sounds/missiles/ricoshet/rico3.wav",
"sounds/missiles/ricoshet/rico4.wav","sounds/missiles/ricoshet/rico5.wav","sounds/missiles/ricoshet/rico6.wav","sounds/missiles/ricoshet/rico7.wav"})

MakeSound("vgavnonah","sounds/misc/dsslop.wav")
MakeSound("dummy","sounds/misc/dummy.wav")
MakeSound("place mine","sounds/misc/mine_place.wav")
MakeSound("bomb tick","sounds/missiles/dsadme.wav")

MakeSound("unmaker attack","sounds/missiles/dsunmker.wav")
MakeSound("claw attack","sounds/missiles/dsclaw.wav")
MakeSound("plasma attack","sounds/missiles/dsplasma.wav")
MakeSound("raider attack","sounds/missiles/plasshot.wav")
MakeSound("robot explode","sounds/missiles/explosion3.wav")
MakeSound("cyber launch","sounds/missiles/dsrlaunc.wav")
MakeSound("radar eye effect","sounds/missiles/sndradareye.wav")
MakeSound("hellmaker","sounds/spells/hellmaker.wav")
MakeSound("curse armor","sounds/spells/dsbldmgk.wav")

MakeSound("cyber summon","sounds/missiles/puzslv1.wav")
MakeSound("rocket explode","sounds/missiles/dsbarexp.wav")
MakeSound("missile launch","sounds/missiles/missile2.wav")
MakeSound("fireball launch","sounds/missiles/dsfirsht.wav")
MakeSound("fire explosion","sounds/missiles/dsfirxpl.wav")
MakeSound("bfg explosion","sounds/missiles/dsrxplod.wav")
MakeSound("bfg reload","sounds/missiles/dsbfgrl.wav")
MakeSound("shotgun open","sounds/missiles/dsdbopn.wav")
MakeSound("shotgun load","sounds/missiles/dsdbload.wav")
MakeSound("shotgun close","sounds/missiles/dsdbcls.wav")
MakeSound("double shotgun fire","sounds/missiles/dsdshtgn.wav")
MakeSound("ssg open","sounds/missiles/ssgopen.wav")
MakeSound("ssg load","sounds/missiles/ssgin.wav")
MakeSound("ssg close","sounds/missiles/ssgclose.wav")
MakeSound("ssg fire","sounds/missiles/ssgshot.wav")
MakeSound("spb exp","sounds/missiles/bfg_explode4.wav")
MakeSound("spb fire","sounds/missiles/dssplz.wav")
MakeSound("saw attack","sounds/missiles/saw.wav")
MakeSound("railgun attack","sounds/missiles/railgf1.wav")
MakeSound("zombie dwell","sounds/spells/zombifie.wav")
MakeSound("repair armor","sounds/spells/dsliarm.wav")
MakeSound("defibrillation","sounds/spells/defib.wav")
MakeSound("lich flame","sounds/missiles/lichflam.wav")
MakeSound("orbital charge","sounds/spells/charging.wav")


--[[-------------UAC Sounds---------------]]


MakeSound("uac marine death",
{"sounds/uac/basic_voices/death1.wav",
"sounds/uac/basic_voices/death2.wav"})

MakeSound("marine fire death",
{"sounds/uac/basic_voices/dsfdth1.wav",
"sounds/uac/basic_voices/dsfdth2.wav",
"sounds/uac/basic_voices/dsfdth3.wav",
"sounds/uac/basic_voices/dsfdth4.wav",
"sounds/uac/basic_voices/dsfdth5.wav",
"sounds/uac/basic_voices/dsfdth6.wav",
"sounds/uac/basic_voices/dsfdth7.wav",
"sounds/uac/basic_voices/dsfdth8.wav"})

MakeSound("worker-acknowledge",
	{"sounds/uac/units/worker/move1.wav",
	"sounds/uac/units/worker/move2.wav",
	"sounds/uac/units/worker/move3.wav",
	"sounds/uac/units/worker/move4.wav",
	"sounds/uac/units/worker/move5.wav"})
MakeSound("worker-attack",
	{"sounds/uac/units/worker/attack1.wav",
	"sounds/uac/units/worker/attack2.wav",
	"sounds/uac/units/worker/attack3.wav",
	"sounds/uac/units/worker/attack4.wav",
	"sounds/uac/units/worker/attack5.wav"})
MakeSound("worker-select",
	{"sounds/uac/units/worker/select1.wav",
	"sounds/uac/units/worker/select2.wav",
	"sounds/uac/units/worker/select3.wav",
	"sounds/uac/units/worker/select4.wav",
	"sounds/uac/units/worker/select5.wav"})
MakeSound("worker-annoyed",
	{"sounds/uac/units/worker/annoy1.wav",
	"sounds/uac/units/worker/annoy2.wav",
	"sounds/uac/units/worker/annoy3.wav",
	"sounds/uac/units/worker/annoy4.wav",
	"sounds/uac/units/worker/annoy5.wav",
	"sounds/uac/units/worker/annoy6.wav",
	"sounds/uac/units/worker/annoy7.wav"})
MakeSound("worker-build",
	{"sounds/uac/units/worker/build1.wav",
	"sounds/uac/units/worker/build2.wav",
	"sounds/uac/units/worker/build3.wav"})
MakeSound("worker-harvest",
	{"sounds/uac/units/worker/harvest1.wav",
	"sounds/uac/units/worker/harvest2.wav",
	"sounds/uac/units/worker/harvest3.wav"})
MakeSound("worker-repair",
	{"sounds/uac/units/worker/repair1.wav",
	"sounds/uac/units/worker/repair2.wav",
	"sounds/uac/units/worker/repair3.wav"})
MakeSound("worker-ready","sounds/uac/units/worker/ready.wav")  

MakeSound("shotgunner-acknowledge",
	{"sounds/uac/units/shotgunner/go1.wav",
	"sounds/uac/units/shotgunner/go2.wav",
	"sounds/uac/units/shotgunner/go3.wav",
	"sounds/uac/units/shotgunner/go4.wav"})
MakeSound("shotgunner-select",
	{"sounds/uac/units/shotgunner/select1.wav",
	"sounds/uac/units/shotgunner/select2.wav",
	"sounds/uac/units/shotgunner/select3.wav",
	"sounds/uac/units/shotgunner/select4.wav"})
MakeSound("shotgunner-attack",
	{"sounds/uac/units/shotgunner/attack1.wav",
	"sounds/uac/units/shotgunner/attack2.wav",
	"sounds/uac/units/shotgunner/attack3.wav",
	"sounds/uac/units/shotgunner/attack4.wav"})
MakeSound("shotgunner-ready","sounds/uac/units/shotgunner/ready.wav")
MakeSound("shotgunner-annoyed",
	{"sounds/uac/units/shotgunner/an1.wav",
	"sounds/uac/units/shotgunner/an2.wav",
	"sounds/uac/units/shotgunner/an3.wav",
	"sounds/uac/units/shotgunner/an4.wav",
	"sounds/uac/units/shotgunner/an5.wav",
	"sounds/uac/units/shotgunner/an6.wav"})

MakeSound("technician-acknowledge",
	{"sounds/uac/units/technician/move1.wav",
	"sounds/uac/units/technician/move2.wav",
	"sounds/uac/units/technician/move3.wav",
	"sounds/uac/units/technician/move4.wav",
	"sounds/uac/units/technician/move5.wav"})
MakeSound("technician-attack",
	{"sounds/uac/units/technician/attack1.wav",
	"sounds/uac/units/technician/attack2.wav",
	"sounds/uac/units/technician/attack3.wav",
	"sounds/uac/units/technician/attack4.wav",
	"sounds/uac/units/technician/attack5.wav"})
MakeSound("technician-select",
	{"sounds/uac/units/technician/select1.wav",
	"sounds/uac/units/technician/select2.wav",
	"sounds/uac/units/technician/select3.wav",
	"sounds/uac/units/technician/select4.wav",
	"sounds/uac/units/technician/select5.wav"})
MakeSound("technician-annoyed",
	{"sounds/uac/units/technician/annoy1.wav",
	"sounds/uac/units/technician/annoy2.wav",
	"sounds/uac/units/technician/annoy3.wav",
	"sounds/uac/units/technician/annoy4.wav",
	"sounds/uac/units/technician/annoy5.wav",
	"sounds/uac/units/technician/annoy6.wav"})
MakeSound("technician-ready","sounds/uac/units/technician/ready.wav")
	
MakeSound("ssg-select",
	{"sounds/uac/units/ssg/select1.wav",
	"sounds/uac/units/ssg/select2.wav",
	"sounds/uac/units/ssg/select3.wav",
	"sounds/uac/units/ssg/select4.wav"})
MakeSound("ssg-acknowledge",
	{"sounds/uac/units/ssg/move1.wav",
	"sounds/uac/units/ssg/move2.wav",
	"sounds/uac/units/ssg/move3.wav",
	"sounds/uac/units/ssg/move4.wav"})
MakeSound("ssg-attack",
	{"sounds/uac/units/ssg/attack1.wav",
	"sounds/uac/units/ssg/attack2.wav",
	"sounds/uac/units/ssg/attack3.wav",
	"sounds/uac/units/ssg/attack4.wav",
	"sounds/uac/units/ssg/attack5.wav"})
MakeSound("ssg-annoyed",
	{"sounds/uac/units/ssg/annoy1.wav",
	"sounds/uac/units/ssg/annoy2.wav",
	"sounds/uac/units/ssg/annoy3.wav",
	"sounds/uac/units/ssg/annoy4.wav",
	"sounds/uac/units/ssg/annoy5.wav",
	"sounds/uac/units/ssg/annoy6.wav",
	"sounds/uac/units/ssg/annoy7.wav"})
	
MakeSound("chaingunner-acknowledge",
	{"sounds/uac/units/chaingunner/move1.wav",
	"sounds/uac/units/chaingunner/move2.wav",
	"sounds/uac/units/chaingunner/move3.wav",
	"sounds/uac/units/chaingunner/move4.wav",
	"sounds/uac/units/chaingunner/move5.wav"})
MakeSound("chaingunner-select",
	{"sounds/uac/units/chaingunner/select1.wav",
	"sounds/uac/units/chaingunner/select2.wav",
	"sounds/uac/units/chaingunner/select3.wav",
	"sounds/uac/units/chaingunner/select4.wav",
	"sounds/uac/units/chaingunner/select5.wav"})
MakeSound("chaingunner-attack",
	{"sounds/uac/units/chaingunner/attack1.wav",
	"sounds/uac/units/chaingunner/attack2.wav",
	"sounds/uac/units/chaingunner/attack3.wav",
	"sounds/uac/units/chaingunner/attack4.wav",
	"sounds/uac/units/chaingunner/attack5.wav"})
MakeSound("chaingunner-annoyed",
	{"sounds/uac/units/chaingunner/annoy1.wav",
	"sounds/uac/units/chaingunner/annoy2.wav",
	"sounds/uac/units/chaingunner/annoy3.wav",
	"sounds/uac/units/chaingunner/annoy4.wav",
	"sounds/uac/units/chaingunner/annoy5.wav",
	"sounds/uac/units/chaingunner/annoy6.wav",
	"sounds/uac/units/chaingunner/annoy7.wav"})
MakeSound("chaingunner-ready","sounds/uac/units/chaingunner/ready.wav")
	
MakeSound("sawmarine-acknowledge",
	{"sounds/uac/units/sawmarine/go1.wav",
	"sounds/uac/units/sawmarine/go2.wav",
	"sounds/uac/units/sawmarine/go3.wav",
	"sounds/uac/units/sawmarine/go4.wav"})
MakeSound("sawmarine-select",
	{"sounds/uac/units/sawmarine/select1.wav",
	"sounds/uac/units/sawmarine/select2.wav",
	"sounds/uac/units/sawmarine/select3.wav",
	"sounds/uac/units/sawmarine/select4.wav"})
MakeSound("sawmarine-ready","sounds/uac/units/sawmarine/ready.wav")

MakeSound("rocketmarine-acknowledge",
	{"sounds/uac/units/rocketmarine/rocket_conf1.wav",
	"sounds/uac/units/rocketmarine/rocket_conf2.wav",
	"sounds/uac/units/rocketmarine/rocket_conf3.wav",
	"sounds/uac/units/rocketmarine/rocket_conf4.wav",
	"sounds/uac/units/rocketmarine/rocket_conf5.wav"})
MakeSound("rocketmarine-select",
	{"sounds/uac/units/rocketmarine/rocket_sel1.wav",
	"sounds/uac/units/rocketmarine/rocket_sel2.wav",
	"sounds/uac/units/rocketmarine/rocket_sel3.wav",
	"sounds/uac/units/rocketmarine/rocket_sel4.wav",
	"sounds/uac/units/rocketmarine/rocket_sel5.wav"})
MakeSound("rocketmarine-attack",
	{"sounds/uac/units/rocketmarine/rocket_atk1.wav",
	"sounds/uac/units/rocketmarine/rocket_atk2.wav",
	"sounds/uac/units/rocketmarine/rocket_atk3.wav",
	"sounds/uac/units/rocketmarine/rocket_atk4.wav",
	"sounds/uac/units/rocketmarine/rocket_atk5.wav"})
MakeSound("rocketmarine-annoyed",
	{"sounds/uac/units/rocketmarine/rocket_irr1.wav",
	"sounds/uac/units/rocketmarine/rocket_irr2.wav",
	"sounds/uac/units/rocketmarine/rocket_irr3.wav",
	"sounds/uac/units/rocketmarine/rocket_irr4.wav",
	"sounds/uac/units/rocketmarine/rocket_irr5.wav",
	"sounds/uac/units/rocketmarine/rocket_irr6.wav",
	"sounds/uac/units/rocketmarine/rocket_irr7.wav",
	"sounds/uac/units/rocketmarine/rocket_irr8.wav"})
MakeSound("rocketmarine-ready", "sounds/uac/units/rocketmarine/rocket_ready.wav")

MakeSound("plasmamarine-annoyed",
	{"sounds/uac/units/plasmamarine/annoy1.wav",
	"sounds/uac/units/plasmamarine/annoy2.wav",
	"sounds/uac/units/plasmamarine/annoy3.wav",
	"sounds/uac/units/plasmamarine/annoy4.wav",
	"sounds/uac/units/plasmamarine/annoy5.wav",
	"sounds/uac/units/plasmamarine/annoy6.wav",
	"sounds/uac/units/plasmamarine/annoy7.wav"})
MakeSound("plasmamarine-acknowledge",
	{"sounds/uac/units/plasmamarine/move1.wav",
	"sounds/uac/units/plasmamarine/move2.wav",
	"sounds/uac/units/plasmamarine/move3.wav",
	"sounds/uac/units/plasmamarine/move4.wav",
	"sounds/uac/units/plasmamarine/move5.wav"})
MakeSound("plasmamarine-select",
	{"sounds/uac/units/plasmamarine/select1.wav",
	"sounds/uac/units/plasmamarine/select2.wav",
	"sounds/uac/units/plasmamarine/select3.wav",
	"sounds/uac/units/plasmamarine/select4.wav",
	"sounds/uac/units/plasmamarine/select5.wav"})
MakeSound("plasmamarine-attack",
	{"sounds/uac/units/plasmamarine/attack1.wav",
	"sounds/uac/units/plasmamarine/attack2.wav",
	"sounds/uac/units/plasmamarine/attack3.wav",
	"sounds/uac/units/plasmamarine/attack4.wav",
	"sounds/uac/units/plasmamarine/attack5.wav"})
MakeSound("plasmamarine-ready","sounds/uac/units/plasmamarine/ready.wav")

MakeSound("medic-ready",
"sounds/uac/units/medic/ready.wav")
MakeSound("medic-select",
	{"sounds/uac/units/medic/select1.wav",
	"sounds/uac/units/medic/select2.wav",
	"sounds/uac/units/medic/select3.wav",
	"sounds/uac/units/medic/select4.wav"})
MakeSound("medic-acknowledge",
	{"sounds/uac/units/medic/move1.wav",
	"sounds/uac/units/medic/move2.wav",
	"sounds/uac/units/medic/move3.wav",
	"sounds/uac/units/medic/move4.wav"})
MakeSound("medic-annoyed",
	{"sounds/uac/units/medic/annoy1.wav",
	"sounds/uac/units/medic/annoy2.wav",
	"sounds/uac/units/medic/annoy3.wav",
	"sounds/uac/units/medic/annoy4.wav",
	"sounds/uac/units/medic/annoy5.wav",
	"sounds/uac/units/medic/annoy6.wav",
	"sounds/uac/units/medic/annoy7.wav"})
	
MakeSound("bfgmarine-ready","sounds/uac/units/bfgmarine/ready2.wav")
MakeSound("bfgmarine-select",
	{"sounds/uac/units/bfgmarine/select1.wav",
	"sounds/uac/units/bfgmarine/select2.wav",
	"sounds/uac/units/bfgmarine/select3.wav"})
MakeSound("bfgmarine-acknowledge",
	{"sounds/uac/units/bfgmarine/go1.wav",
	"sounds/uac/units/bfgmarine/go2.wav",
	"sounds/uac/units/bfgmarine/go3.wav",
	"sounds/uac/units/bfgmarine/go4.wav"})
MakeSound("bfgmarine-attack",
	{"sounds/uac/units/bfgmarine/attack1.wav",
	"sounds/uac/units/bfgmarine/attack2.wav",
	"sounds/uac/units/bfgmarine/attack3.wav",
	"sounds/uac/units/bfgmarine/attack4.wav"})
MakeSound("bfgmarine-annoyed",
	{"sounds/uac/units/bfgmarine/an1.wav",
	"sounds/uac/units/bfgmarine/an2.wav",
	"sounds/uac/units/bfgmarine/an3.wav",
	"sounds/uac/units/bfgmarine/an4.wav",
	"sounds/uac/units/bfgmarine/an5.wav",
	"sounds/uac/units/bfgmarine/an6.wav"})
	
MakeSound("hero-acknowledge",
	{"sounds/uac/units/hero/move1.wav",
	"sounds/uac/units/hero/move2.wav",
	"sounds/uac/units/hero/move3.wav",
	"sounds/uac/units/hero/move4.wav",
	"sounds/uac/units/hero/move5.wav"})
MakeSound("hero-attack",
	{"sounds/uac/units/hero/attack1.wav",
	"sounds/uac/units/hero/attack2.wav",
	"sounds/uac/units/hero/attack3.wav",
	"sounds/uac/units/hero/attack4.wav",
	"sounds/uac/units/hero/attack5.wav"})
MakeSound("hero-select",
	{"sounds/uac/units/hero/select1.wav",
	"sounds/uac/units/hero/select2.wav",
	"sounds/uac/units/hero/select3.wav",
	"sounds/uac/units/hero/select4.wav",
	"sounds/uac/units/hero/select5.wav"})
MakeSound("hero-annoyed",
	{"sounds/uac/units/hero/annoy1.wav",
	"sounds/uac/units/hero/annoy2.wav",
	"sounds/uac/units/hero/annoy3.wav",
	"sounds/uac/units/hero/annoy4.wav",
	"sounds/uac/units/hero/annoy5.wav",
	"sounds/uac/units/hero/annoy6.wav",
	"sounds/uac/units/hero/annoy7.wav",
	"sounds/uac/units/hero/annoy8.wav"})
MakeSound("hero-ready","sounds/uac/units/hero/ready.wav")

MakeSound("raider-acknowledge",
	{"sounds/uac/units/raider/move1.wav",
	"sounds/uac/units/raider/move2.wav",
	"sounds/uac/units/raider/move3.wav",
	"sounds/uac/units/raider/move4.wav",
	"sounds/uac/units/raider/move5.wav"})
MakeSound("raider-attack",
	{"sounds/uac/units/raider/attack1.wav",
	"sounds/uac/units/raider/attack2.wav",
	"sounds/uac/units/raider/attack3.wav",
	"sounds/uac/units/raider/attack4.wav",
	"sounds/uac/units/raider/attack5.wav"})
MakeSound("raider-select",
	{"sounds/uac/units/raider/select1.wav",
	"sounds/uac/units/raider/select2.wav",
	"sounds/uac/units/raider/select3.wav",
	"sounds/uac/units/raider/select4.wav",
	"sounds/uac/units/raider/select5.wav"})
MakeSound("raider-annoyed",
	{"sounds/uac/units/raider/annoy1.wav",
	"sounds/uac/units/raider/annoy2.wav",
	"sounds/uac/units/raider/annoy3.wav",
	"sounds/uac/units/raider/annoy4.wav",
	"sounds/uac/units/raider/annoy5.wav",
	"sounds/uac/units/raider/annoy6.wav",
	"sounds/uac/units/raider/annoy7.wav",
	"sounds/uac/units/raider/annoy8.wav"})
MakeSound("raider-ready","sounds/uac/units/raider/ready.wav")

MakeSound("crusher-acknowledge",
	{"sounds/uac/units/crusher/move1.wav",
	"sounds/uac/units/crusher/move2.wav",
	"sounds/uac/units/crusher/move3.wav",
	"sounds/uac/units/crusher/move4.wav",
	"sounds/uac/units/crusher/move5.wav"})
MakeSound("crusher-attack",
	{"sounds/uac/units/crusher/attack1.wav",
	"sounds/uac/units/crusher/attack2.wav",
	"sounds/uac/units/crusher/attack3.wav",
	"sounds/uac/units/crusher/attack4.wav",
	"sounds/uac/units/crusher/attack5.wav"})
MakeSound("crusher-select",
	{"sounds/uac/units/crusher/select1.wav",
	"sounds/uac/units/crusher/select2.wav",
	"sounds/uac/units/crusher/select3.wav",
	"sounds/uac/units/crusher/select4.wav",
	"sounds/uac/units/crusher/select5.wav"})
MakeSound("crusher-annoyed",
	{"sounds/uac/units/crusher/annoy1.wav",
	"sounds/uac/units/crusher/annoy2.wav",
	"sounds/uac/units/crusher/annoy3.wav",
	"sounds/uac/units/crusher/annoy4.wav",
	"sounds/uac/units/crusher/annoy5.wav",
	"sounds/uac/units/crusher/annoy6.wav",
	"sounds/uac/units/crusher/annoy7.wav",
	"sounds/uac/units/crusher/annoy8.wav"})
MakeSound("crusher-ready","sounds/uac/units/crusher/ready.wav")

MakeSound("thor-acknowledge",
	{"sounds/uac/units/thor/move1.wav",
	"sounds/uac/units/thor/move2.wav",
	"sounds/uac/units/thor/move3.wav",
	"sounds/uac/units/thor/move4.wav",
	"sounds/uac/units/thor/move5.wav"})
MakeSound("thor-attack",
	{"sounds/uac/units/thor/attack1.wav",
	"sounds/uac/units/thor/attack2.wav",
	"sounds/uac/units/thor/attack3.wav",
	"sounds/uac/units/thor/attack4.wav",
	"sounds/uac/units/thor/attack5.wav"})
MakeSound("thor-select",
	{"sounds/uac/units/thor/select1.wav",
	"sounds/uac/units/thor/select2.wav",
	"sounds/uac/units/thor/select3.wav",
	"sounds/uac/units/thor/select4.wav",
	"sounds/uac/units/thor/select5.wav"})
MakeSound("thor-annoyed",
	{"sounds/uac/units/thor/annoy1.wav",
	"sounds/uac/units/thor/annoy2.wav",
	"sounds/uac/units/thor/annoy3.wav",
	"sounds/uac/units/thor/annoy4.wav",
	"sounds/uac/units/thor/annoy5.wav",
	"sounds/uac/units/thor/annoy6.wav",
	"sounds/uac/units/thor/annoy7.wav",
	"sounds/uac/units/thor/annoy8.wav"})
MakeSound("thor-ready","sounds/uac/units/thor/ready.wav")

MakeSound("uacfighter-acknowledge",
	{"sounds/uac/units/uacfighter/go1.wav",
	"sounds/uac/units/uacfighter/go2.wav",
	"sounds/uac/units/uacfighter/go3.wav",
	"sounds/uac/units/uacfighter/go4.wav"})
MakeSound("uacfighter-attack",
	{"sounds/uac/units/uacfighter/attack1.wav",
	"sounds/uac/units/uacfighter/attack2.wav",
	"sounds/uac/units/uacfighter/attack3.wav",
	"sounds/uac/units/uacfighter/attack4.wav",
	"sounds/uac/units/uacfighter/attack5.wav"})
MakeSound("uacfighter-select",
	{"sounds/uac/units/uacfighter/select1.wav",
	"sounds/uac/units/uacfighter/select2.wav",
	"sounds/uac/units/uacfighter/select3.wav",
	"sounds/uac/units/uacfighter/select4.wav",
	"sounds/uac/units/uacfighter/select5.wav"})
MakeSound("uacfighter-annoyed",
	{"sounds/uac/units/uacfighter/an1.wav",
	"sounds/uac/units/uacfighter/an2.wav",
	"sounds/uac/units/uacfighter/an3.wav",
	"sounds/uac/units/uacfighter/an4.wav",
	"sounds/uac/units/uacfighter/an5.wav",
	"sounds/uac/units/uacfighter/an6.wav",
	"sounds/uac/units/uacfighter/an7.wav"})
MakeSound("uacfighter-ready","sounds/uac/units/uacfighter/ready.wav")

MakeSound("transport-acknowledge",
	{"sounds/uac/units/transport/move1.wav",
	"sounds/uac/units/transport/move2.wav",
	"sounds/uac/units/transport/move3.wav",
	"sounds/uac/units/transport/move4.wav"})
MakeSound("transport-select",
	{"sounds/uac/units/transport/select1.wav",
	"sounds/uac/units/transport/select2.wav",
	"sounds/uac/units/transport/select3.wav",
	"sounds/uac/units/transport/select4.wav",
	"sounds/uac/units/transport/select5.wav"})
MakeSound("transport-annoyed",
	{"sounds/uac/units/transport/annoy1.wav",
	"sounds/uac/units/transport/annoy2.wav",
	"sounds/uac/units/transport/annoy3.wav",
	"sounds/uac/units/transport/annoy4.wav",
	"sounds/uac/units/transport/annoy5.wav",
	"sounds/uac/units/transport/annoy6.wav",
	"sounds/uac/units/transport/annoy7.wav",
	"sounds/uac/units/transport/annoy8.wav"})
MakeSound("transport-ready","sounds/uac/units/transport/ready.wav")

MakeSoundGroup("worker-selected",
	"worker-select", "worker-annoyed")
	
MakeSoundGroup("shotgunner-selected",
	"shotgunner-select", "shotgunner-annoyed")

MakeSoundGroup("technician-selected",
	"technician-select", "technician-annoyed")

MakeSoundGroup("ssg-selected",
	"ssg-select", "ssg-annoyed")
	
MakeSoundGroup("chaingunner-selected",
	"chaingunner-select", "chaingunner-annoyed")

MakeSoundGroup("rocketmarine-selected",
	"rocketmarine-select", "rocketmarine-annoyed")

MakeSoundGroup("plasmamarine-selected",
	"plasmamarine-select", "plasmamarine-annoyed")
	
MakeSoundGroup("bfgmarine-selected",
	"bfgmarine-select", "bfgmarine-annoyed")

MakeSoundGroup("raider-selected",
	"raider-select", "raider-annoyed")

MakeSoundGroup("crusher-selected",
	"crusher-select", "crusher-annoyed")
	
MakeSoundGroup("medic-selected",
	"medic-select", "medic-annoyed")
	
MakeSoundGroup("hero-selected",
	"hero-select", "hero-annoyed")

MakeSoundGroup("thor-selected",
	"thor-select", "thor-annoyed")

MakeSoundGroup("uacfighter-selected",
	"uacfighter-select", "uacfighter-annoyed")

MakeSoundGroup("transport-selected",
	"transport-select", "transport-annoyed")

--[[-------------hell sounds---------------]]

MakeSound("zombie move","sounds/hell/units/zombieman/dsposact.wav")
MakeSound("demons-move","sounds/hell/units/dsdmact.wav")

MakeSound("zombie sight",
{"sounds/hell/units/zombieman/dsposit1.wav",
"sounds/hell/units/zombieman/dsposit2.wav",
"sounds/hell/units/zombieman/dsposit3.wav"})

MakeSound("zombie death",
{"sounds/hell/units/zombieman/dspodth1.wav",
"sounds/hell/units/zombieman/dspodth2.wav",
"sounds/hell/units/zombieman/dspodth3.wav"})

MakeSound("imp sight",{"sounds/hell/units/imp/dsbgsit1.wav","sounds/hell/units/imp/dsbgsit2.wav"})
MakeSound("imp active","sounds/hell/units/imp/dsbgact.wav")
MakeSound("imp death",{"sounds/hell/units/imp/dsbgdth1.wav","sounds/hell/units/imp/dsbgdth2.wav"})

MakeSound("demon sight","sounds/hell/units/demon/dssgtsit.wav")
MakeSound("demon attack","sounds/hell/units/demon/dssgtatk.wav")
MakeSound("demon death","sounds/hell/units/demon/dssgtdth.wav")

MakeSound("cacodemon-select","sounds/hell/units/cacodemon/dscacsit.wav")
MakeSound("cacodemon-death","sounds/hell/units/cacodemon/dscacdth.wav")

MakeSound("hell knight sight","sounds/hell/units/hellknight/dskntsit.wav")
MakeSound("hell knight death","sounds/hell/units/hellknight/dskntdth.wav")

MakeSound("baron sight","sounds/hell/units/baron/dsbrssit.wav")
MakeSound("baron death","sounds/hell/units/baron/dsbrsdth.wav")

MakeSound("arachnotron sight","sounds/hell/units/arachnotron/dsbspsit.wav")
MakeSound("arachnotron hoof","sounds/hell/units/arachnotron/dsbspwlk.wav")
MakeSound("arachnotron move","sounds/hell/units/arachnotron/dsbspact.wav")
MakeSound("arachnotron death","sounds/hell/units/arachnotron/dsbspdth.wav")

MakeSound("pain elemental sight","sounds/hell/units/painelemental/dspesit.wav")
MakeSound("pain elemental death","sounds/hell/units/painelemental/dspedth.wav")

MakeSound("revenant-select","sounds/hell/units/revenant/dsskesit.wav")
MakeSound("revenant-move","sounds/hell/units/revenant/dsskeact.wav")
MakeSound("revenant-death","sounds/hell/units/revenant/dsskedth.wav")

MakeSound("mancubus sight","sounds/hell/units/mancubus/dsmansit.wav")
MakeSound("mancubus attack","sounds/hell/units/mancubus/dsmanatk.wav")
MakeSound("mancubus death","sounds/hell/units/mancubus/dsmandth.wav")

MakeSound("archvile sight","sounds/hell/units/archvile/dsvilsit.wav")
MakeSound("archvile active","sounds/hell/units/archvile/dsvilact.wav")
MakeSound("archvile attack","sounds/hell/units/archvile/dsvilatk.wav")
MakeSound("archvile fire","sounds/hell/units/archvile/dsflame.wav")
MakeSound("archvile death","sounds/hell/units/archvile/dsvildth.wav")

MakeSound("spiderdemon sight","sounds/hell/units/spiderdemon/dsspisit.wav")
MakeSound("spiderdemon death","sounds/hell/units/spiderdemon/dsspidth.wav")
MakeSound("spiderdemon hoof","sounds/hell/units/spiderdemon/dsmetal.wav")

MakeSound("cyberdemon sight","sounds/hell/units/cyberdemon/dscybsit.wav")
MakeSound("cyberdemon hoof","sounds/hell/units/cyberdemon/cyberhoof.wav")
MakeSound("cyberdemon death","sounds/hell/units/cyberdemon/dscybdth.wav")

MakeSound("belial death","sounds/hell/units/cybruiser/dsbrudth.wav")
MakeSound("belial-acknowledge",
	{"sounds/hell/units/belial/move1.wav",
	"sounds/hell/units/belial/move2.wav",
	"sounds/hell/units/belial/move3.wav",
	"sounds/hell/units/belial/move4.wav"})
MakeSound("belial-attack",
	{"sounds/hell/units/belial/attack1.wav",
	"sounds/hell/units/belial/attack2.wav",
	"sounds/hell/units/belial/attack3.wav",
	"sounds/hell/units/belial/attack4.wav",
	"sounds/hell/units/belial/attack5.wav"})
MakeSound("belial-select",
	{"sounds/hell/units/belial/select1.wav",
	"sounds/hell/units/belial/select2.wav",
	"sounds/hell/units/belial/select3.wav",
	"sounds/hell/units/belial/select4.wav",
	"sounds/hell/units/belial/select5.wav"})
MakeSound("belial-annoyed",
	{"sounds/hell/units/belial/annoy1.wav",
	"sounds/hell/units/belial/annoy2.wav",
	"sounds/hell/units/belial/annoy3.wav",
	"sounds/hell/units/belial/annoy4.wav",
	"sounds/hell/units/belial/annoy5.wav",
	"sounds/hell/units/belial/annoy6.wav",
	"sounds/hell/units/belial/annoy7.wav",
	"sounds/hell/units/belial/annoy8.wav"})
MakeSound("belial-ready","sounds/hell/units/belial/ready.wav")

MakeSoundGroup("belial-selected",
	"belial-select", "belial-annoyed")


MakeSound("cacolich sight","sounds/hell/units/cacolich/inssit.wav")
MakeSound("cacolich active","sounds/hell/units/cacolich/dstrtact.wav")
MakeSound("cacolich death","sounds/hell/units/cacolich/dsdmdeth.wav")

-- Announcers 

MakeSound("uac unit under attack", "sounds/uac/basic_voices/unit_under_attack.wav")
MakeSound("uac worker under attack", "sounds/uac/basic_voices/workers_under_attack.wav")
MakeSound("uac base under attack", "sounds/uac/basic_voices/base_under_attack.wav")
MakeSound("uac select target", "sounds/uac/basic_voices/select_target.wav")
MakeSound("uac new-rally-point", "sounds/uac/basic_voices/new_rally_point.wav")
MakeSound("uac unit promoted", "sounds/uac/basic_voices/unit_promoted.wav")
MakeSound("uac defeat", "sounds/uac/basic_voices/defeat.wav")
MakeSound("uac player defeated", "sounds/uac/basic_voices/player_defeated.wav")
MakeSound("uac victory", "sounds/uac/basic_voices/victory.wav")
MakeSound("uac orbital cannon", "sounds/uac/basic_voices/orbital_cannon.wav")

MakeSound("hell worker under attack", 
	"sounds/hell/basic_voices/worker under attack.wav")
MakeSound("hell unit under attack", 
	{"sounds/hell/basic_voices/unit under attack 1.wav","sounds/hell/basic_voices/unit under attack 2.wav"})
MakeSound("hell base under attack", 
	{"sounds/hell/basic_voices/base under attack 1.wav","sounds/hell/basic_voices/base under attack 2.wav"})
MakeSound("hell select target", "sounds/hell/basic_voices/select target.wav")
MakeSound("hell new-rally-point", "sounds/hell/basic_voices/new rally point.wav")
MakeSound("hell unit promoted", "sounds/hell/basic_voices/unit promoted.wav")
MakeSound("hell defeat", "sounds/hell/basic_voices/defeat.wav")
MakeSound("hell player defeated", "sounds/hell/basic_voices/player defeated.wav")
MakeSound("hell victory", "sounds/hell/basic_voices/victory.wav")
MakeSound("hell cyberdemon ready", "sounds/hell/basic_voices/cyberdemon ready.wav")
MakeSound("hell mastermind ready", "sounds/hell/basic_voices/mastermind ready.wav")
MakeSound("hell hellmaker ready", "sounds/hell/basic_voices/hellmaker ready.wav")

SetSoundRange("uac victory",255)	
SetSoundRange("uac select target",255)	
SetSoundRange("uac new-rally-point",255)	
SetSoundRange("uac unit promoted",255)
SetSoundRange("uac defeat",255)	
SetSoundRange("uac player defeated",255)	
SetSoundRange("uac victory",255)	
SetSoundRange("uac orbital cannon",255)	

SetSoundRange("hell select target",255)	
SetSoundRange("hell new-rally-point",255)	
SetSoundRange("hell defeat",255)	
SetSoundRange("hell victory",255)
SetSoundRange("hell unit promoted",255)
SetSoundRange("hell player defeated",255)	
SetSoundRange("hell cyberdemon ready",255)	
SetSoundRange("hell mastermind ready",255)	
SetSoundRange("hell hellmaker ready",255)

MakeSound("weaponfactory-select", "sounds/uac/buildings/weapon-factory.wav")
MakeSound("vehiclefactory-selected", "sounds/uac/buildings/vfactory.wav")
MakeSound("supply-depot", "sounds/uac/buildings/supply-depot.wav")
MakeSound("horror-tower", "sounds/hell/buildings/horror-tower.wav")
MakeSound("temple-of-fire", "sounds/hell/buildings/templeoffire.wav")
MakeSound("death-pentagram", "sounds/hell/buildings/deathpentagram.wav")
MakeSound("monster-spawner", "sounds/hell/buildings/monsterspawner.wav")
MakeSound("healing units", "sounds/spells/dsheallg.wav")
MakeSound("monster-plant", "sounds/hell/buildings/monsterplant.wav")
MakeSound("ore-store", "sounds/hell/buildings/ore-store.wav")
MakeSound("thermo-plant","sounds/uac/buildings/thermo-plant.wav")
MakeSound("fire-tower", "sounds/hell/buildings/fire_tower.wav")
MakeSound("hell-keep", "sounds/hell/buildings/hell-keep.wav")
MakeSound("chaingun-tower", "sounds/uac/buildings/chaingun-tower.wav")
MakeSound("blood-pool", "sounds/hell/buildings/pool.wav")
MakeSound("rocket-tower", "sounds/uac/buildings/rocket_turret.wav")
MakeSound("orbital-cannon", "sounds/uac/buildings/orbital_cannon.wav")
MakeSound("hellgate", "sounds/hell/buildings/hellgate.wav")
MakeSound("well-of-souls", "sounds/hell/buildings/well-of-souls.wav")
MakeSound("radar-selected", "sounds/uac/buildings/radar.wav")
MakeSound("barracks", "sounds/uac/buildings/barraksuac.wav")
MakeSound("resourse-center", "sounds/uac/buildings/resourse_senter.wav")
MakeSound("command-center", "sounds/uac/buildings/command_center.wav")
MakeSound("powerplant-selected", "sounds/uac/buildings/powerplant.wav")
MakeSound("tech-center", "sounds/uac/buildings/tech-center.wav")
MakeSound("capture (human)", "sounds/uac/uac_im_find2.wav")
MakeSound("capture (orc)", "sounds/hell/hell_im_find2.wav")
MakeSound("rescue (human)", "sounds/uac/uac_im_find2.wav")
MakeSound("rescue (orc)", "sounds/hell/hell_im_find2.wav")

MakeSound("building destroyed",
	{"sounds/misc/building_explosion/051-explosion04.wav","sounds/misc/building_explosion/building_explode.wav","sounds/misc/building_explosion/048-explosion01.wav"})


--	Define sounds used by game
DefineGameSounds(

  "placement-error", {"uac",MakeSound("uac placement error", "sounds/uac/basic_voices/cannot_build_here.wav")},
  "placement-error", {"hell",MakeSound("hell placement error", "sounds/hell/basic_voices/cannot build here.wav")},
  --"placement-success", {"uac",MakeSound("uac placement success", "sounds/uac/uac-place.wav")},
  "placement-success", {"hell",MakeSound("hell placement success", "sounds/hell/hell_place.wav")},
  
  "building-construction", {"uac",MakeSound("uac building construction", "sounds/uac/uac-building.wav")},
  "building-construction", {"hell",MakeSound("hell building construction", "sounds/hell/hell-building.wav")},

  "work-complete", {"uac", MakeSound("basic uac voices work complete", "sounds/uac/basic_voices/construction_complete.wav")},
  "work-complete", {"hell", MakeSound("basic hell voices work complete", {"sounds/hell/basic_voices/construction complete 1.wav","sounds/hell/basic_voices/construction complete 2.wav"})},
  "research-complete", {"uac", MakeSound("basic uac voices research complete", "sounds/uac/basic_voices/upgrade_complete.wav")},
  "research-complete", {"hell", MakeSound("basic hell voices research complete", "sounds/hell/basic_voices/research complete.wav")},
  "not-enough-res", {"energy","hell",MakeSound("basic hell voices not enough energy", "sounds/hell/basic_voices/not enough energy.wav")},
  "not-enough-res", {"minerals","hell",MakeSound("basic hell voices not enough minerals", "sounds/hell/basic_voices/not enough minerals.wav")},
  "not-enough-food", {"hell", MakeSound("basic hell voices not enough food", "sounds/hell/basic_voices/population limit reached.wav")},
  "not-enough-food", {"uac", MakeSound("basic uac voices not enough food", "sounds/uac/basic_voices/not_enough_supply.wav")},
  "not-enough-res", {"energy","uac",MakeSound("basic uac voices not enough energy", "sounds/uac/basic_voices/not_enough_energy.wav")},
  "not-enough-res", {"minerals","uac",MakeSound("basic uac voices not enough minerals", "sounds/uac/basic_voices/not_enough_minerals.wav")},
  
  "rescue", {"uac", MakeSound("human rescue", "sounds/uac/uac_im_find2.wav")},
  "rescue", {"hell", MakeSound("orc rescue", "sounds/hell/hell_im_find2.wav")},
  "chat-message",  chat_message)
