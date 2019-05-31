nullgraphics = LoadGraphic("graphics/null.png", 2, 2)
local rail_graphic = LoadGraphic("graphics/missiles/particles/rail-effect.png", 1, 1)
local rail_center_graphic = LoadGraphic("graphics/missiles/particles/rail-effect-center.png", 1, 1)
rocket_smoke = LoadGraphic("graphics/missiles/particles/smoke.png", 9, 12)
local rocket_part = LoadGraphic("graphics/missiles/particles/rocketdebris.png", 6, 6)
particle_building_parts = {}
particle_building_smoke = {}
particle_building_smoke_light = {}

for i = 1, 4 do
  particle_building_parts[i] = LoadGraphic("graphics/missiles/particles/buildingpart"..i..".png", 16, 12)
  particle_building_smoke[i] = LoadGraphic("graphics/missiles/particles/buildingsmoke"..i..".png", 16, 15)
  particle_building_smoke_light[i] = LoadGraphic("graphics/missiles/particles/buildingsmoke"..(i + 4)..".png", 16, 15)
end
particle_building_parts[5] = LoadGraphic("graphics/missiles/particles/rocketdebris.png", 6, 6)

particle_explosion_big = {}
particle_explosion_small = {}
particle_explosion_big[1] = LoadGraphic("graphics/missiles/particles/explosions/explosion5.png", 96, 96)
particle_explosion_big[2] = LoadGraphic("graphics/missiles/particles/explosions/explosion6.png", 100, 100)
particle_explosion_big[3] = LoadGraphic("graphics/missiles/particles/explosions/explosion8.png", 96, 96)

particle_explosion_small[1] = LoadGraphic("graphics/missiles/particles/explosions/explosion5_small.png", 64, 64)
particle_explosion_small[2] = LoadGraphic("graphics/missiles/particles/explosions/explosion6_small.png", 75, 75)
particle_explosion_small[3] = LoadGraphic("graphics/missiles/particles/explosions/explosion8_small.png", 64, 64)

particle_vehicle_explosion = {}
particle_vehicle_explosion[1] = LoadGraphic("graphics/missiles/particles/explosions/explosion1.png", 64, 64)
particle_vehicle_explosion[2] = LoadGraphic("graphics/missiles/particles/explosions/explosion6_small.png", 75, 75)
particle_vehicle_explosion[3] = LoadGraphic("graphics/missiles/particles/explosions/explosion4.png", 60, 60)

particle_vehicle_explosion_small = {}
particle_vehicle_explosion_small[1] = LoadGraphic("graphics/missiles/particles/explosions/explosion2.png", 64, 64)
particle_vehicle_explosion_small[2] = LoadGraphic("graphics/missiles/particles/explosions/explosion3.png", 64, 64)

particle_thermo_explode = LoadGraphic("graphics/missiles/particles/explosions/explosion7.png", 120, 120)

particle_inferno = LoadGraphic("graphics/missiles/inferno.png", 32, 48)

particle_red_meat = {}
particle_red_meat[1] = LoadGraphic("graphics/missiles/particles/meat/meat1.png", 3, 4)
particle_red_meat[2] = LoadGraphic("graphics/missiles/particles/meat/meat2.png", 8, 8)
particle_red_meat[3] = LoadGraphic("graphics/missiles/particles/meat/meat3.png", 7, 6)
particle_red_gibs = {}
particle_red_gibs[1] = LoadGraphic("graphics/missiles/particles/meat/gibs1.png", 7, 7)
particle_red_gibs[2] = LoadGraphic("graphics/missiles/particles/meat/gibs2.png", 8, 8)
particle_blue_meat = {}
particle_blue_meat[1] = LoadGraphic("graphics/missiles/particles/meat/meat1_blue.png", 3, 4)
particle_blue_meat[2] = LoadGraphic("graphics/missiles/particles/meat/meat2_blue.png", 8, 8)
particle_blue_meat[3] = LoadGraphic("graphics/missiles/particles/meat/meat3_blue.png", 7, 6)
particle_blue_gibs = {}
particle_blue_gibs[1] = LoadGraphic("graphics/missiles/particles/meat/gibs1_blue.png", 7, 7)
particle_blue_gibs[2] = LoadGraphic("graphics/missiles/particles/meat/gibs2_blue.png", 8, 8)
particle_green_meat = {}
particle_green_meat[1] = LoadGraphic("graphics/missiles/particles/meat/meat1_green.png", 3, 4)
particle_green_meat[2] = LoadGraphic("graphics/missiles/particles/meat/meat2_green.png", 8, 8)
particle_green_meat[3] = LoadGraphic("graphics/missiles/particles/meat/meat3_green.png", 7, 6)
particle_green_gibs = {}
particle_green_gibs[1] = LoadGraphic("graphics/missiles/particles/meat/gibs1_green.png", 7, 7)
particle_green_gibs[2] = LoadGraphic("graphics/missiles/particles/meat/gibs2_green.png", 8, 8)

particle_puff = LoadGraphic("graphics/missiles/particles/puff.png", 15, 15)
particle_puff_small = LoadGraphic("graphics/missiles/particles/puff_small.png", 8, 8)
particle_puff_shotgun = LoadGraphic("graphics/missiles/particles/puff_shotgun.png", 32, 16)
particle_rocket_smoke = LoadGraphic("graphics/missiles/particles/rocketsmoke.png", 32, 29)
particle_rocket_smoke_small = LoadGraphic("graphics/missiles/particles/rocketsmoke_small.png", 16, 15)
particle_rocket_smoke_tiny = LoadGraphic("graphics/missiles/particles/rocketsmoke_tiny.png", 12, 11)
particle_light_smoke = LoadGraphic("graphics/missiles/particles/smokey.png", 30, 30)

particle_welleffect = LoadGraphic("graphics/missiles/particles/welleffect.png", 6, 6)
particle_bfgeffect = LoadGraphic("graphics/missiles/particles/bfgeffect.png", 6, 6)
particle_bfgeffect2 = LoadGraphic("graphics/missiles/particles/bfgeffect-exp.png", 5, 5)

particle_bfgball_trail = LoadGraphic("graphics/missiles/particles/bfgball-trail.png", 40, 40)
particle_impball_trail = LoadGraphic("graphics/missiles/particles/imp-ball-trail.png", 15, 15)
particle_cacoball_trail = LoadGraphic("graphics/missiles/particles/caco-ball-trail.png", 16, 16)

particle_raider_laser = LoadGraphic("graphics/missiles/particles/raider-laser-exp.png", 1, 1)
particle_fighter_laser = LoadGraphic("graphics/missiles/particles/fighter-laser-exp.png", 1, 1)
particle_fighter_laser_red = LoadGraphic("graphics/missiles/particles/fighter-laser-red.png", 1, 1)
particle_fighter_laser_blue = LoadGraphic("graphics/missiles/particles/fighter-laser-blue.png", 1, 1)
particle_fighter_laser_purple = LoadGraphic("graphics/missiles/particles/fighter-laser-purple.png", 1, 1)

particle_barrel_part = LoadGraphic("graphics/missiles/particles/barrelpart.png", 9, 9)
particle_lava_chunk = LoadGraphic("graphics/missiles/particles/lavachunk.png", 12, 12)
particle_lava_chunk_exp = LoadGraphic("graphics/missiles/particles/lavachunk-exp.png", 24, 24)

particle_generator_effect = LoadGraphic("graphics/missiles/particles/generator-effect.png", 64, 72)
particle_unmaker = LoadGraphic("graphics/missiles/particles/unmaker.png", 16, 16)

particle_superball_impact = LoadGraphic("graphics/missiles/particles/superball.png", 4, 4)
particle_superball_trail = LoadGraphic("graphics/missiles/particles/superball-trail.png", 48, 48)

particle_cacolich_trail = LoadGraphic("graphics/missiles/particles/cacolich-fire-trail.png", 16, 16)

particle_belial_spot = LoadGraphic("graphics/missiles/particles/belial-spot.png", 7, 5)

particle_teleport_fog = LoadGraphic("graphics/missiles/teleport-fog.png", 56, 56)

particle_absolute_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/absolute-sphere-effect.png", 32, 40)
particle_acid_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/acid-sphere-effect.png", 32, 40)
particle_corruption_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/corruption-sphere-effect.png", 32, 40)
particle_life_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/life-sphere-effect.png", 32, 40)
particle_regeneration_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/regeneration-sphere-effect.png", 32, 40)
particle_shield_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/shield-sphere-effect.png", 32, 40)
particle_skull_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/skull-sphere-effect.png", 32, 40)
particle_vampirism_sphere_effect = LoadGraphic("graphics/missiles/particles/spheres/vampirism-sphere-effect.png", 32, 40)

particle_absolute_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/absolute-sphere-trail.png", 4, 4)
particle_acid_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/acid-sphere-trail.png", 4, 4)
particle_corruption_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/corruption-sphere-trail.png", 4, 4)
particle_life_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/life-sphere-trail.png", 4, 4)
particle_regeneration_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/regeneration-sphere-trail.png", 4, 4)
particle_shield_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/shield-sphere-trail.png", 4, 4)
particle_skull_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/skull-sphere-trail.png", 4, 4)
particle_vampirism_sphere_trail = LoadGraphic("graphics/missiles/particles/spheres/vampirism-sphere-trail.png", 4, 4)

function pickRandom(list) 
    return list[math.random(table.getn(list))] 
end

function addStaticParticle(graphic, ticksperframe, x, y, drawlevel)
   local a = GraphicAnimation(graphic, ticksperframe)
   local e = StaticParticle(CPosition(x,y), a, drawlevel)
   ParticleManager:add(e:clone())
end

function addRadialParticles(amount, graphic, ticksperframe, x, y, maxtime, drawlevel)
   local smokeanimation = GraphicAnimation(graphic, ticksperframe)
   for i = 1, amount do
      local chunk = CRadialParticle(CPosition(x, y), smokeanimation, maxtime, drawlevel)
      ParticleManager:add(chunk:clone())
   end
end

function addSmokeParticle(graphic, ticksperframe, x, y, speedx, speedy, drawlevel)
   local smokeanimation = GraphicAnimation(graphic, ticksperframe)
   local smoke = CSmokeParticle(CPosition(x, y), smokeanimation, speedx, speedy, drawlevel)
   ParticleManager:add(smoke:clone())
end

function addChunkParticles(amount, smokegraphic, debrisgraphic, ticksperframe1, ticksperframe2,
	x, y, minvel, maxvel, minangle, maxTTL, destroyparticle, ticksperframe3, dlDeb, dlSmok, dlDest)
	local smokeanimation = GraphicAnimation(smokegraphic, ticksperframe1)
	local debrisanimation = nil
	local destroyanimation = nil
	if (debrisgraphic ~= nil) then
		debrisanimation = GraphicAnimation(debrisgraphic, ticksperframe2)
	else
		debrisanimation = GraphicAnimation(nullgraphics, 1)
	end
	if (destroyparticle ~= nil) then
		destroyanimation = GraphicAnimation(destroyparticle, ticksperframe3)
	else
		destroyanimation = GraphicAnimation(nullgraphics, 1)
	end
	for i = 1, amount do
		local chunk = CChunkParticle(CPosition(x, y), smokeanimation, debrisanimation, destroyanimation, minvel, maxvel, minangle, maxTTL, dlDeb)
		chunk:setSmokeDrawLevel(dlSmok)
		chunk:setDestroyDrawLevel(dlDest)
		ParticleManager:add(chunk:clone())
	end
end

function RailParticles(x, y)
	addRadialParticles(12, rail_center_graphic, 150, x, y, 20, drawLevels.DL_PartGround)
	addRadialParticles(6, rail_graphic, 300, x, y, 15, drawLevels.DL_PartGround)
end

function ImpactRailParticles(x, y)
	addRadialParticles(96, rail_center_graphic, 150, x, y, 25, drawLevels.DL_PartGround)
	addRadialParticles(48, rail_graphic, 350, x, y, 30, drawLevels.DL_PartGround)
	addChunkParticles(48, rail_graphic, nil, 350, 1, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
	addChunkParticles(48, rail_center_graphic,  nil, 350, 1, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
end

function SmallSpark(x, y)
	addChunkParticles(10, rail_graphic, nil, 50, 1, x, y, 150, 150, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
	addChunkParticles(5, rail_graphic, nil, 50, 1, x, y, 100, 100, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
end

function RepairSpark(x, y)
	addRadialParticles(10, rail_center_graphic, 150, x, y, 10, drawLevels.DL_PartGround)
	addChunkParticles(10, rail_graphic, nil, 50, 1, x, y, 150, 300, 84, 60, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
	addChunkParticles(25, rail_graphic, nil, 50, 1, x, y, 250, 100, 86, 300, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
end

function RocketExplosion(x, y)
	for i = 1,6 do
		addChunkParticles(1, rocket_smoke, rocket_part, 150, 100, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
end

function VehicleExplosion(x, y)
	for i = 1,4 do
		addStaticParticle(pickRandom(particle_vehicle_explosion), 80, x + math.random(10) - 5, y + math.random(10) - 5, drawLevels.DL_PartGround)
	end

	for i = 1,8 do
		addChunkParticles(1, rocket_smoke, rocket_part, 150, 100, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
	for i = 1,4 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 300, 84, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
end

function TransportExplosion(x, y)
	for i = 1,5 do
		addStaticParticle(pickRandom(particle_vehicle_explosion), 80, x + math.random(10) - 5, y + math.random(10) - 5, drawLevels.DL_PartGround)
	end

	for i = 1,15 do
		addChunkParticles(1, rocket_smoke, rocket_part, 150, 100, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
	for i = 1,10 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 300, 84, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
end

function SmallVehicleExplosion(x, y)
	addStaticParticle(pickRandom(particle_vehicle_explosion_small), 80, x + math.random(10) - 5, y + math.random(10) - 5, drawLevels.DL_PartGround)

	addChunkParticles(3, rocket_smoke, rocket_part, 150, 100, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 300, 84, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
end

function TinyBuildingExplosion(x, y)
	addStaticParticle(pickRandom(particle_explosion_small), 80, x, y, drawLevels.DL_PartGround)

	addChunkParticles(5, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 300, 84, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
end

function SmallBuildingExplosion(x, y)
	for i = 1,3 do
		addStaticParticle(pickRandom(particle_explosion_small), 80, x + math.random(20) - 10, y + math.random(20) - 10, drawLevels.DL_PartGround)
	end

	for i = 1,15 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 400, 84, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
end

function MediumBuildingExplosion(x, y)
	for i = 1,4 do
		addStaticParticle(pickRandom(particle_explosion_small), 80, x + math.random(32) - 16, y + math.random(32) - 48, drawLevels.DL_PartGround)
	end
	for i = 1,2 do
		addStaticParticle(pickRandom(particle_explosion_big), 80, x + math.random(32) - 16, y + math.random(32) - 16, drawLevels.DL_PartGround)
	end

	for i = 1,7 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 16, y - 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y - 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
	for i = 1,12 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
end

function BigBuildingExplosion(x, y)
	for i = 1,8 do
		addStaticParticle(pickRandom(particle_explosion_small), 80, x + math.random(96) - 48, y + math.random(96) - 48, drawLevels.DL_PartGround)
	end
	for i = 1,4 do
		addStaticParticle(pickRandom(particle_explosion_big), 80, x + math.random(96) - 48, y + math.random(96) - 48, drawLevels.DL_PartGround)
	end

	for i = 1,4 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 48, y - 48, 0, 400, 70, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 48, y - 48, 0, 400, 70, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 48, y + 48, 0, 400, 70, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 48, y + 48, 0, 400, 70, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
	for i = 1,7 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 16, y - 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y - 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
	for i = 1,12 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
end

function ThermoBuildingExplosion(x, y)
	for i = 1,4 do
		addStaticParticle(pickRandom(particle_explosion_small), 80, x + math.random(32) - 16, y + math.random(32) - 48, drawLevels.DL_PartGround)
	end
	addStaticParticle(particle_thermo_explode, 80, x + math.random(16) - 8, y + math.random(16) - 8, drawLevels.DL_PartLow)

	for i = 1,7 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 16, y - 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y - 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x - 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x + 16, y + 16, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
	for i = 1,12 do
		addChunkParticles(1, pickRandom(particle_building_smoke), pickRandom(particle_building_parts), 150, 100, x, y, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
	end
end

function InfernoParticle(x, y)
	if math.random(100) > 70 then
		local nx = x + math.random(8) - 4
		local ny = y + math.random(8) - 4
		addStaticParticle(particle_inferno, 66, nx, ny, drawLevels.DL_PartGround)
		addSmokeParticle(pickRandom(particle_building_smoke), 150, nx, ny - 16, 2 + math.random(8), -15 - math.random(15), drawLevels.DL_PartLow)
	end
end

function ParticleRedShellMeat(x, y)
	if math.random(100) > 60 then
		addChunkParticles(2, nullgraphics, pickRandom(particle_red_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 400, 88, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleRedMeleeMeat(x, y)
	if math.random(100) > 25 then
		addChunkParticles(3, nullgraphics, pickRandom(particle_red_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 400, 88, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleBlueShellMeat(x, y)
	if math.random(100) > 75 then
		addChunkParticles(2, nullgraphics, pickRandom(particle_blue_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 400, 88, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleBlueMeleeMeat(x, y)
	if math.random(100) > 25 then
		addChunkParticles(3, nullgraphics, pickRandom(particle_blue_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 400, 88, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleGreenShellMeat(x, y)
	if math.random(100) > 75 then
		addChunkParticles(2, nullgraphics, pickRandom(particle_green_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 400, 88, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleGreenMeleeMeat(x, y)
	if math.random(100) > 25 then
		addChunkParticles(3, nullgraphics, pickRandom(particle_green_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 400, 88, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function RedExtremeGibsParticle(x, y)
	for i = 1,10 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_red_gibs), 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
	for i = 1,45 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_red_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function RedGibsParticle(x, y)
	for i = 1,10 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_red_gibs), 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 150, 400, 82, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
	for i = 1,15 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_red_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 150, 400, 82, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function GreenExtremeGibsParticle(x, y)
	for i = 1,10 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_green_gibs), 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
	for i = 1,45 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_green_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function GreenGibsParticle(x, y)
	for i = 1,4 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_green_gibs), 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 150, 400, 82, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
	for i = 1,15 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_green_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 150, 400, 82, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function BlueExtremeGibsParticle(x, y)
	for i = 1,10 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_blue_gibs), 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
	for i = 1,45 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_blue_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function BlueGibsParticle(x, y)
	for i = 1,4 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_blue_gibs), 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 150, 400, 82, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
	for i = 1,15 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_blue_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 150, 400, 82, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleRocketPuff(x, y)
	addStaticParticle(particle_rocket_smoke_small, 33, x, y, drawLevels.DL_PartGround)
end

function ParticleCrusherMissilePuff(x, y)
	addStaticParticle(particle_rocket_smoke_tiny, 33, x, y, drawLevels.DL_PartGround)
end

function ParticleChaingunPuff(x, y)
	addStaticParticle(particle_puff, 100, x + math.random(32) - 16, y + math.random(32) - 16, drawLevels.DL_PartLow)
end

function ParticleShotgunPuff(x, y)
	addStaticParticle(particle_puff_shotgun, 100, x + math.random(20) - 5, y + math.random(10) - 5, drawLevels.DL_PartLow)
end

function ParticleSuperShotgunPuff(x, y)
	for i = 1,12 do
		addStaticParticle(particle_puff_small, 100, x + math.random(32) - 16, y + math.random(32) - 16, drawLevels.DL_PartLow)
	end
end

function ParticleQuadShotgunPuff(x, y)
	for i = 1,24 do
		addStaticParticle(particle_puff_small, 100, x + math.random(32) - 16, y + math.random(32) - 16, drawLevels.DL_PartLow)
	end
end

function ParticlePillarSmoke(x, y)
	addSmokeParticle(particle_light_smoke, 150, x, y, 7 + math.random(5), -15 - math.random(10), drawLevels.DL_PartGround)
end

function ParticleBuildingSmoke(x, y)
	addSmokeParticle(pickRandom(particle_building_smoke_light), 150, x + math.random(4) - 2, y + math.random(4) - 2, 2 + math.random(8), -15 - math.random(15), drawLevels.DL_PartGround)
end

function ParticleVehicleSmoke(x, y)
	addSmokeParticle(pickRandom(particle_building_smoke_light), 150, x + math.random(4) - 2, y + math.random(4) - 2, 2 + math.random(8), -15 - math.random(15), drawLevels.DL_PartLow)
end

function ParticleWellEffect(x, y) 
	addChunkParticles(3 + math.random(5), nullgraphics, particle_welleffect, 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 150, 250, 88, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
end

function ParticleImpBallTrail(x, y)
	addStaticParticle(particle_impball_trail, 20, x, y, drawLevels.DL_PartGround)
end

function ParticleCacoBallTrail(x, y)
	addStaticParticle(particle_cacoball_trail, 20, x, y, drawLevels.DL_PartLow)
end

function ParticleBFGBallTrail(x, y)
	addStaticParticle(particle_bfgball_trail, 20, x, y, drawLevels.DL_PartLow)
	addRadialParticles(20, particle_bfgeffect, 100, x + math.random(8) - 4, y + math.random(8) - 4, 35, drawLevels.DL_PartLow)
end

function ParticleBFGBallExplode(x, y)
	addRadialParticles(40, particle_bfgeffect2, 350, x + math.random(16) - 8, y + math.random(16) - 8, 100, drawLevels.DL_PartLow)
	addRadialParticles(40, particle_bfgeffect2, 350, x + math.random(16) - 8, y + math.random(16) - 8, 50, drawLevels.DL_PartLow)
end

function ParticleRaiderLaser(x, y)
	addChunkParticles(15 + math.random(8), nullgraphics, particle_raider_laser, 1000, 250, x, y, 250, 350, 70, 250, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
end

function ParticleFighterLaser(x, y)
	addChunkParticles(20 + math.random(10), nullgraphics, particle_fighter_laser, 1000, 250, x, y, 250, 350, 70, 200, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartGround, drawLevels.DL_PartGround)
end

function ParticleBarrelPart(x, y)
	addChunkParticles(1 + math.random(3), rocket_smoke, particle_barrel_part, 150, 66, x + math.random(6) - 3, y + math.random(6) - 3, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
end

function ParticleBarrelsPart(x, y)
	addChunkParticles(3 + math.random(6), rocket_smoke, particle_barrel_part, 150, 66, x + math.random(6) - 3, y + math.random(6) - 3, 0, 400, 77, 0, nil, 0, drawLevels.DL_PartGround, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
end

function ParticleUnmakerImpact(x, y)
	addStaticParticle(particle_unmaker, 1, x + math.random(8) - 4, y + math.random(8) - 4, drawLevels.DL_PartGround)
end

function ParticleLavaBall(x, y)
	addChunkParticles(1, particle_rocket_smoke_tiny, particle_lava_chunk, 33, 66, x, y, 150, 400, 66, 0, particle_lava_chunk_exp, 66, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartGround)
end

function ParticleFighterLaserRay(x, y)
	addStaticParticle(particle_fighter_laser_red, 33, x, y - 1, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_red, 33, x - 1, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_red, 33, x, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_red, 33, x + 1, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_red, 33, x, y + 1, drawLevels.DL_PartGround)
end

function ParticleFighterSuperLaserRay(x, y)
	addStaticParticle(particle_fighter_laser_red, 66, x - 2, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_red, 66, x + 2, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_red, 66, x, y - 2, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_red, 66, x, y + 2, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_purple, 66, x - 1, y - 1, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_blue, 66, x, y - 1, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_purple, 66, x + 1, y - 1, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_blue, 66, x - 1, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_blue, 66, x, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_blue, 66, x + 1, y, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_purple, 66, x - 1, y + 1, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_blue, 66, x, y + 1, drawLevels.DL_PartGround)
	addStaticParticle(particle_fighter_laser_purple, 66, x + 1, y + 1, drawLevels.DL_PartGround)
end

function ParticleSuperBallTrail(x, y)
	addStaticParticle(particle_superball_trail, 16, x, y, drawLevels.DL_MissileSpace)
end

function SuperBallImpact(x, y)
	addRadialParticles(24, particle_superball_impact, 350, x, y, 60, drawLevels.DL_PartLow)
	addRadialParticles(40, rail_center_graphic, 250, x, y, 60, drawLevels.DL_PartLow)
	addRadialParticles(32, rail_graphic, 350, x, y, 60, drawLevels.DL_PartLow)
	addChunkParticles(32, rail_graphic, nil, 350, 1, x, y, 150, 600, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	addChunkParticles(32, rail_center_graphic,  nil, 350, 1, x, y, 150, 600, 77, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
end

function ParticleDestroyArmor(x, y)
	for i = 1,20 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_red_gibs), 1000, 66, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
	for i = 1,45 do
		addChunkParticles(1, nullgraphics, pickRandom(particle_red_meat), 1000, 170, x + math.random(5) - 2, y + math.random(5) - 2, 200, 300, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleCacolichFireTrail(x, y)
	addStaticParticle(particle_cacolich_trail, 33, x, y, drawLevels.DL_PartLow)
end

function ParticleBelialSpot(x, y)
	addStaticParticle(particle_belial_spot, 500, x, y, drawLevels.DL_OnLand)
	addSmokeParticle(pickRandom(particle_building_smoke_light), 150, x, y, 7 + math.random(5), -15 - math.random(10), drawLevels.DL_OnLand)
end

function ParticleBelialSmoke(x, y)
	addSmokeParticle(pickRandom(particle_building_smoke_light), 150, x, y, 7 + math.random(5), -15 - math.random(10), drawLevels.DL_OnLand)
end

function ParticleTeleportFlashOnUnit(unit, goal, x, y)
	CreateMissile("missile-teleport-fog", {GetUnitVariable(unit, "PosX")*32 + 16, GetUnitVariable(unit, "PosY")*32 + 16}, {GetUnitVariable(unit, "PosX")*32 + 16, GetUnitVariable(unit, "PosY")*32 + 16}, unit, -1, false, true)
end

function ParticleTeleportFlashOnGate(unit, goal, x, y)
	CreateMissile("missile-teleport-fog", {GetUnitVariable(goal, "PosX")*32 + 16, GetUnitVariable(goal, "PosY")*32 + 16}, {GetUnitVariable(goal, "PosX")*32 + 16, GetUnitVariable(goal, "PosY")*32 + 16}, goal, -1, false, true)
end

function ParticleAcidSphereEffect(x, y)
	addSmokeParticle(particle_acid_sphere_effect, 200, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_acid_sphere_trail,  200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleAbsoluteSphereEffect(x, y)
	addSmokeParticle(particle_absolute_sphere_effect, 160, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_absolute_sphere_trail,  200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleCorruptionSphereEffect(x, y)
	addSmokeParticle(particle_corruption_sphere_effect, 160, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_corruption_sphere_trail, 200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleLifeSphereEffect(x, y)
	addSmokeParticle(particle_life_sphere_effect, 160, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_life_sphere_trail, 200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleShieldSphereEffect(x, y)
	addSmokeParticle(particle_shield_sphere_effect, 160, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_shield_sphere_trail, 200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleRegenerationSphereEffect(x, y)
	addSmokeParticle(particle_regeneration_sphere_effect, 160, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_regeneration_sphere_trail, 200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleSkullSphereEffect(x, y)
	addSmokeParticle(particle_skull_sphere_effect, 160, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_skull_sphere_trail, 200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

function ParticleVampirismSphereEffect(x, y)
	addSmokeParticle(particle_vampirism_sphere_effect, 160, x, y - 10, 0, -32, drawLevels.DL_PartHigh)
	for i = 1,90 do
		addChunkParticles(1, nullgraphics, particle_vampirism_sphere_trail, 200, 200, x + math.random(5) - 2, y - math.random(30), 100, 400, 74, 0, nil, 0, drawLevels.DL_PartLow, drawLevels.DL_PartLow, drawLevels.DL_PartLow)
	end
end

----------------------------------
-- Common missiles ---------------
----------------------------------

DefineMissileType("missile-green-cross",
  { File = "graphics/missiles/cross.png", Size = {32, 32}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_Interface, Class = "missile-class-stay", Sleep = 2, Speed = 16, Range = 1 } )

DefineMissileType("missile-none",
  { Size = {32, 32}, DrawLevel = drawLevels.DL_NULL,
  Class = "missile-class-none", Sleep = 1, Speed = 16, Range = 1 } )

DefineMissileType("missile-hit",
  { Size = {15, 15}, DrawLevel = drawLevels.DL_Interface,
  Class = "missile-class-hit", Sleep = 1, Speed = 1, Range = 16 } )

DefineMissileType("missile-hit2",
  { Size = {0, 0}, DrawLevel = drawLevels.NULL,
  Class = "missile-class-hit", Sleep = 1, Speed = 32, Range = 1 } )

DefineMissileType("missile-superball-sound",
  { ImpactSound = "orbital charge", AlwaysFire = true,
  Class = "missile-class-stay", Sleep = 1, Speed = 1, Range = 16 } )

DefineMissileType("missile-lava-ball",
  { DrawLevel = 50, Frames = 1, NumDirections = 1, Transparency = 100,
  DrawLevel = drawLevels.DL_PartHigh, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleLavaBall } )

local function SetPoison8(attacker, target, damage)
	if (target ~= attacker and GetUnitBoolFlag(target, "Building") == false) then
		SetUnitVariable(target, "Poison", 240, "Value")
		SetUnitVariable(target, "Slow", GetUnitVariable(target, "Slow", "Value") + 150, "Value")
	end
end

local function VampirismSphere(attacker, target, damage)
	if (attacker ~= -1 and GetUnitBoolFlag(target, "organic") == true and GetUnitBoolFlag(attacker, "SphereMarine") == true) then
		local bitset = bit.tobits(GetUnitVariable(attacker, "UsedSpheres", "Value"))
		if bitset[8] == 1 then
			local dam = math.max(1, math.ceil(damage / 5))
			SetUnitVariable(attacker, "HitPoints", GetUnitVariable(attacker, "HitPoints") + dam)
			if (GetUnitVariable(attacker, "VampirismSphereMaxDamage", "Value") - dam > 0) then
				SetUnitVariable(attacker, "VampirismSphereMaxDamage", GetUnitVariable(attacker, "VampirismSphereMaxDamage", "Value") - dam, "Value")
			else
				SetUnitVariable(attacker, "VampirismSphereMaxDamage", 0, "Value")
				SetUnitVariable(attacker, "UsedSpheres", GetUnitVariable(attacker, "UsedSpheres", "Value") - marineSpheres.S_Vampirism, "Value")
			end
		end
	end
end

DefineMissileType("missile-fountain-ball",
  { DrawLevel = 50, Frames = 1,
  NumDirections = 1, Transparency = 100, SmokeMissile = "missile-fountain-ball-trail", ParabolCoefficient = 1024,
  SmokeParticle = ParticleCrusherMissilePuff, ImpactMissile = "missile-fountain-ball-exp",
  SmokePrecision = 2, OnImpact = SetPoison8,
  DrawLevel = drawLevels.DL_PartLow, Class = "missile-class-parabolic", Sleep = 1, Speed = 4, Range = 2, SplashFactor = 3} )

DefineMissileType("missile-fountain-ball-trail",
  { File = "graphics/missiles/particles/acidball.png", Size = {12, 12}, DrawLevel = drawLevels.DL_PartLow, 
  Frames = 2, NumDirections = 1,
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1 } )

DefineMissileType("missile-fountain-ball-exp",
  { File = "graphics/missiles/particles/acidball-exp.png", Size = {24, 24}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_PartLow, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

DefineMissileType("missile-vehicle-smoke",
  { DrawLevel = 50, Frames = 1, NumDirections = 1, Transparency = 100,
  DrawLevel = drawLevels.DL_PartHigh, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleVehicleSmoke } )

DefineMissileType("missile-superball",
  { File = "graphics/missiles/superball.png", Size = {48, 48}, Frames = 20, NumDirections = 9, SmokeParticle = ParticleSuperBallTrail,
  SmokePrecision = 24,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 32, Range = 6, ImpactParticle = SuperBallImpact, AlwaysFire = true,
  DrawLevel = drawLevels.DL_MissileSpace, ImpactMissile = "missile-superball-exp", ImpactSound = "spb exp", SplashFactor = 2 } )

DefineMissileType("missile-superball-exp",
  { File = "graphics/missiles/superball-exp.png", Size = {159, 159}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

DefineMissileType("missile-cyber-summon",
  { File = "graphics/missiles/cybersummon.png", Size = {128, 128}, Frames = 8, NumDirections = 1,
  Class = "missile-class-stay", Sleep = 4, Speed = 16, Range = 1,
  DrawLevel = drawLevels.DL_LowMissile } )

DefineMissileType("missile-destroy-armor",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleDestroyArmor, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-extreme-gibs",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = RedExtremeGibsParticle, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-green-extreme-gibs",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = GreenExtremeGibsParticle, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-gibs",
  { Frames = 1, NumDirections = 1, Transparency = 100, 
  DrawLevel = drawLevels.DL_PartLow, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1, ImpactParticle = RedGibsParticle } )

DefineMissileType("missile-blue-gibs",
  { Frames = 1, NumDirections = 1, Transparency = 100, 
  DrawLevel = drawLevels.DL_PartLow, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1, ImpactParticle = BlueGibsParticle } )

DefineMissileType("missile-brown-gibs",
  { Frames = 1, NumDirections = 1, Transparency = 100, 
  DrawLevel = drawLevels.DL_PartLow, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1, ImpactParticle = GreenGibsParticle } )

DefineMissileType("missile-red-shell-meat",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleRedShellMeat, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )
  
DefineMissileType("missile-red-melee-meat",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleRedMeleeMeat, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-green-shell-meat",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleGreenShellMeat, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )
  
DefineMissileType("missile-green-melee-meat",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleGreenMeleeMeat, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-blue-shell-meat",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleBlueShellMeat, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )
  
DefineMissileType("missile-blue-melee-meat",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleBlueMeleeMeat, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-chain-bullet",
  { DrawLevel = drawLevels.DL_LowMissile, Frames = 1, NumDirections = 1, IgnoreWalls = false, SmokePrecision = 8,
	Transparency = 100, AlwaysFire = true, CorrectSphashDamage = true, ImpactParticle = ParticleChaingunPuff, OnImpact = VampirismSphere,
  Class = "missile-class-point-to-point", ImpactSound = "ricoshet", Sleep = 1, Speed = 128, Range = 1 } )

DefineMissileType("missile-claw-bite",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 0 } )

DefineMissileType("missile-saw-hit",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100, OnImpact = VampirismSphere,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 0 } )

DefineMissileType("missile-eat",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 0 } )

DefineMissileType("missile-shotgun-shot",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, CorrectSphashDamage = true, IgnoreWalls = false, SmokePrecision = 8,
  Class = "missile-class-point-to-point", ImpactParticle = ParticleShotgunPuff, AlwaysFire = true, Transparency = 100, OnImpact = VampirismSphere,
  ImpactSound = "ricoshet", Sleep = 1, Speed = 128, Range = 1 } )

local function SSGConfusion(attacker, target, damage)
	VampirismSphere(attacker, target, damage)
	if GetUnitVariable(attacker, "Veterancy") == 4 then
		if SyncRand(100) > 50 then
			if (GetUnitBoolFlag(target, "organic") == true and GetUnitBoolFlag(target, "AirUnit") == false) then
				SetUnitVariable(target, "Confusion", 90, "Value")
				SetUnitVariable(target, "ConfusionReduce", 30, "Value")
			end
		end
	else
		if SyncRand(100) >= 80 then
			if (GetUnitBoolFlag(target, "organic") == true and GetUnitBoolFlag(target, "AirUnit") == false) then
				SetUnitVariable(target, "Confusion", 90, "Value")
				SetUnitVariable(target, "ConfusionReduce", 30, "Value")
			end
		end
	end
end

local function HeroSSGConfusion(attacker, target, damage)
	if SyncRand(100) > 60 then
		if (GetUnitBoolFlag(target, "organic") == true and GetUnitBoolFlag(target, "AirUnit") == false) then
			SetUnitVariable(target, "Confusion", 120, "Value")
			SetUnitVariable(target, "ConfusionReduce", 20, "Value")
		end
	end
end

DefineMissileType("missile-shotgun-shot2",
  { DrawLevel = drawLevels.DL_NULL,Frames = 1, NumDirections = 1, CorrectSphashDamage = true, IgnoreWalls = false, SmokePrecision = 8,
  Class = "missile-class-point-to-point", ImpactParticle = ParticleSuperShotgunPuff, AlwaysFire = true, Transparency = 100,
  OnImpact = SSGConfusion, ImpactSound = "ricoshet", Sleep = 1, Speed = 128, Range = 1 } )


DefineMissileType("missile-shotgun-shot3",
  { DrawLevel = drawLevels.DL_NULL,Frames = 1, NumDirections = 1, CorrectSphashDamage = true, IgnoreWalls = false, SmokePrecision = 8,
  Class = "missile-class-point-to-point", ImpactParticle = ParticleQuadShotgunPuff, AlwaysFire = true, Transparency = 100,
  OnImpact = HeroSSGConfusion, ImpactSound = "ricoshet", Sleep = 1, Speed = 128, Range = 1 } )

DefineMissileType("missile-rocket-explosion",
  { File = "graphics/missiles/rocket-exp.png", Size = {80, 67}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-stay", Sleep = 3, Speed = 8, Range = 0  } )

DefineMissileType("missile-teleport-fog",
  { File = "graphics/missiles/teleport-fog.png", Size = {56, 56}, Frames = 10, NumDirections = 1, FiredSound = "teleport",
  DrawLevel = drawLevels.DL_OverLandUnit, Class = "missile-class-stay", Sleep = 3, Speed = 8, Range = 0} )
  
DefineMissileType("missile-spark",
  { DrawLevel = drawLevels.DL_LowMissile, Frames = 1, NumDirections = 1, Transparency = 100,
  ImpactParticle = SmallSpark, Class = "missile-class-stay",  Sleep = 1, Speed = 128, Range = 0 } )

DefineMissileType("missile-spark2",
  { DrawLevel = drawLevels.DL_PartLow, Frames = 1, NumDirections = 1, Transparency = 100,
  ImpactParticle = RepairSpark, Class = "missile-class-stay",  Sleep = 1, Speed = 128, Range = 0 } )

DefineMissileType("missile-barrel-death",
  { DrawLevel = drawLevels.DL_PartLow, Frames = 1, NumDirections = 1, Transparency = 100,
  ImpactParticle = ParticleBarrelPart, Class = "missile-class-stay",  Sleep = 1, Speed = 16, Range = 2, SplashFactor = 2,
  } )

DefineMissileType("missile-barrels-death",
  { DrawLevel = drawLevels.DL_PartLow, Frames = 1, NumDirections = 1, Transparency = 100,
  ImpactParticle = ParticleBarrelsPart, Class = "missile-class-stay",  Sleep = 1, Speed = 16, Range = 2, SplashFactor = 2,
  } )

----------------------------------
-- UAC missiles ------------------
----------------------------------

DefineMissileType("missile-grenade",
  { File = "graphics/missiles/grenade.png", Size = {10, 10}, Frames = 5, NumDirections = 9,
  ImpactSound = "rocket explode", AlwaysFire = true, CorrectSphashDamage = true, OnImpact = VampirismSphere,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-parabolic", Sleep = 1, Speed = 16, Range = 1,
	ImpactMissile = "missile-cannon-explosion"} )

DefineMissileType("missile-mine-explode",
  { Frames = 1, NumDirections = 1, Transparency = 100,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 2, SplashFactor = 3} )

DefineMissileType("missile-charge-explode",
  { Frames = 1, NumDirections = 1, Transparency = 100, AlwaysFire = true,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1} )

DefineMissileType("missile-rocket",
  { File = "graphics/missiles/missile.png", Size = {32, 32}, Frames = 17, NumDirections = 32,
  DrawLevel = drawLevels.DL_LowMissile, ImpactSound = "rocket explode", Flip = false, CorrectSphashDamage = true,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 2, AlwaysFire = true, IgnoreWalls = false, OnImpact = VampirismSphere,
  ImpactMissile = "missile-rocket-exp", SmokeParticle = ParticleRocketPuff,  SplashFactor = 3, ImpactParticle = RocketExplosion,
  CanHitOwner = true } )

DefineMissileType("missile-homing-rocket",
  { File = "graphics/missiles/missile.png", Size = {32, 32}, Frames = 17, NumDirections = 32,
  DrawLevel = drawLevels.DL_LowMissile, ImpactSound = "rocket explode", Flip = false, CorrectSphashDamage = true,
  Class = "missile-class-tracer", Sleep = 1, Speed = 16, Range = 2, AlwaysFire = true, OnImpact = VampirismSphere,
  ImpactMissile = "missile-rocket-exp", SmokeParticle = ParticleRocketPuff,  SplashFactor = 3, ImpactParticle = RocketExplosion,
  CanHitOwner = true } )
  
DefineMissileType("missile-rocket-exp",
  { File = "graphics/missiles/rocket-exp2.png", Size = {64, 64}, Frames = 15, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 2, Speed = 16, Range = 0  } )

DefineMissileType("missile-plasmaball",
  { File = "graphics/missiles/plasmaball.png", Size = {15, 14}, Frames = 10, NumDirections = 9,
  ImpactSound = "plasma explode1", AlwaysFire = true, CorrectSphashDamage = true, IgnoreWalls = false, OnImpact = VampirismSphere,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 32, Range = 1,
  ImpactMissile = "missile-plasmaball-exp"} )

DefineMissileType("missile-plasmaball-exp",
  { File = "graphics/missiles/plasmaball-exp.png", Size = {30, 32}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

DefineMissileType("missile-bfgball",
  { File = "graphics/missiles/bfgball.png", Size = {40, 40}, Frames = 2, NumDirections = 1, IgnoreWalls = false,
  ImpactSound = "bfg explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleBFGBallTrail, OnImpact = VampirismSphere,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 3, ImpactParticle = ParticleBFGBallExplode,
  ImpactMissile = "missile-bfgball-exp" , SplashFactor = 3} )

DefineMissileType("missile-super-bfgball",
  { File = "graphics/missiles/bfgball.png", Size = {40, 40}, Frames = 2, NumDirections = 1, IgnoreWalls = false,
  ImpactSound = "bfg explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleBFGBallTrail, OnImpact = VampirismSphere,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 4, ImpactParticle = ParticleBFGBallExplode,
  ImpactMissile = "missile-bfgball-exp" , SplashFactor = 2} )

DefineMissileType("missile-hero-bfgball",
  { File = "graphics/missiles/bfgball.png", Size = {40, 40}, Frames = 2, NumDirections = 1, IgnoreWalls = false,
  ImpactSound = "bfg explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleBFGBallTrail,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 4, ImpactParticle = ParticleBFGBallExplode,
  ImpactMissile = "missile-bfgball-exp" , SplashFactor = 2} )

local function UnmakerLifeDrain(attacker, target, damage)
	if (attacker == -1) then
		return
	else
		SetUnitVariable(attacker, "HitPoints", GetUnitVariable(attacker, "HitPoints") + damage / 3)
	end
end

DefineMissileType("missile-unmaker",
  { Frames = 1, NumDirections = 1, Transparency = 100,
  CorrectSphashDamage = true,
  DrawLevel = drawLevels.DL_NULL, Class = "missile-class-point-to-point", Sleep = 1, Speed = 128, Range = 1, OnImpact = UnmakerLifeDrain,
	ImpactParticle = ParticleUnmakerImpact} )

DefineMissileType("missile-bfgball-exp",
  { File = "graphics/missiles/bfgball-exp.png", Size = {132, 105}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 2, Speed = 16, Range = 1 } )

DefineMissileType("missile-raider-laser",
  { File = "graphics/missiles/raider-laser.png", Size = {32, 32}, Frames = 17, NumDirections = 32,
  ImpactSound = "laser hit", Transparency = 20, ImpactParticle = ParticleRaiderLaser, IgnoreWalls = false,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 32, Range = 1,
  DrawLevel = drawLevels.DL_LowMissile } )

DefineMissileType("missile-fighter-laser",
  { Frames = 1, NumDirections = 1,
  ImpactSound = "laser hit", AlwaysFire = true, CorrectSphashDamage = true, 
  SmokeParticle = ParticleFighterLaserRay, ImpactParticle = ParticleFighterLaser,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 1024, Range = 1, SmokePrecision = 2,
  DrawLevel = drawLevels.DL_MissileAir } )

DefineMissileType("missile-fighter-superlaser",
  { Frames = 1, NumDirections = 1,
  ImpactSound = "cannon explode", AlwaysFire = true, CorrectSphashDamage = true, 
  SmokeParticle = ParticleFighterSuperLaserRay, ImpactMissile = "missile-crusher-shell-exp",
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 1024, Range = 1, SmokePrecision = 2,
  DrawLevel = drawLevels.DL_MissileAir } )

DefineMissileType("missile-crusher-shell",
  { File = "graphics/missiles/tank-missile.png", Size = {8, 9}, Frames = 17, NumDirections = 32, CorrectSphashDamage = true,
  ImpactSound = "cannon explode", ImpactMissile = "missile-crusher-shell-exp", IgnoreWalls = false,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 24, Range = 1, AlwaysFire = true,
  DrawLevel = drawLevels.DL_LowMissile } )

DefineMissileType("missile-crusher-shell-exp",
  { File = "graphics/missiles/rocket-exp3.png", Size = {32, 32}, Frames = 15, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 1, Speed = 32, Range = 0  } )
  
DefineMissileType("missile-crusher-missile",
  { File = "graphics/missiles/crusher-missile.png", Size = {23, 23}, Frames = 17, NumDirections = 32, CorrectSphashDamage = true,
  ImpactSound = "rocket explode", ImpactMissile = "missile-crusher-missile-exp", SmokeParticle = ParticleCrusherMissilePuff,
  Class = "missile-class-tracer", Sleep = 1, Speed = 24, Range = 1, AlwaysFire = true, IgnoreWalls = false,
  DrawLevel = drawLevels.DL_LowMissile } )

DefineMissileType("missile-crusher-missile-exp",
  { File = "graphics/missiles/missile-exp.png", Size = {44, 40}, Frames = 3, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 0  } )

DefineMissileType("missile-thor-rail",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1,
	Transparency = 100, AlwaysFire = true, CorrectSphashDamage = true, Pierce = true, PierceOnce = true, FriendlyFire = true,
  Class = "missile-class-point-to-point-bounce", SmokeParticle = RailParticles, NumBounces = 3, ReduceFactor = 50,
  --ImpactParticle = ImpactRailParticles,
  Sleep = 1, Speed = 1024, Range = 1, SmokePrecision = 8} )

DefineMissileType("missile-thermo-explode",
  { Frames = 1, NumDirections = 1, Transparency = 100,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 6, SplashFactor = 2} )

DefineMissileType("missile-tower-rocket",
  { File = "graphics/missiles/tower-missile.png", Size = {16, 16}, Frames = 17, NumDirections = 32,
  DrawLevel = drawLevels.DL_LowMissile, ImpactSound = "rocket explode", Flip = false,
  Class = "missile-class-tracer", Sleep = 1, Speed = 24, Range = 0, IgnoreWalls = false,
  ImpactMissile = "missile-cannon-explosion", SmokeParticle = ParticleRocketPuff } )

DefineMissileType("missile-cannon-explosion",
  { File = "graphics/missiles/missile-exp.png", Size = {44, 40}, Frames = 3, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

DefineMissileType("missile-tank-track",
  { Size = {16, 16}, DrawLevel = drawLevels.DL_OnLand, File = "graphics/missiles/tanktrack.png", Frames = 25, NumDirections = 8,
  Class = "missile-class-stay", Sleep = 32, Speed = 16, Range = 1, Flip = false} )

DefineMissileType("missile-anomaly-acid-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleAcidSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-anomaly-absolute-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleAbsoluteSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-anomaly-vampirism-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleVampirismSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-anomaly-corruption-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleCorruptionSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-anomaly-skull-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleSkullSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-anomaly-regeneration-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleRegenerationSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-anomaly-life-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleLifeSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

DefineMissileType("missile-anomaly-shield-sphere",
  { Frames = 1, NumDirections = 1, 
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleShieldSphereEffect, Transparency = 100,
  DrawLevel = drawLevels.DL_PartLow } )

----------------------------------
-- Hell missiles -----------------
----------------------------------

DefineMissileType("missile-demonic-storm-explode",
  { Frames = 1, NumDirections = 1, Transparency = 100, AlwaysFire = true,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 4, SplashFactor = 2} )

DefineMissileType("missile-belial-spot",
  {  Transparency = 100, ImpactParticle = ParticleBelialSpot,
   Class = "missile-class-stay", Sleep = 1, Speed = 1, Range = 1} )

DefineMissileType("missile-belial-smoke",
  {  Transparency = 100, Class = "missile-class-continious", Sleep = 16, Speed = 1, Range = 1, TTL = 48,
  ImpactParticle = ParticleBelialSmoke} )

DefineMissileType("missile-bomber-explode",
  { ImpactSound = "rocket explode", Frames = 1, NumDirections = 1, 
  Transparency = 100,
  DrawLevel = drawLevels.DL_NULL, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 2, SplashFactor = 1} )

DefineMissileType("missile-imp-ball",
  { File = "graphics/missiles/imp-ball.png", Size = {15, 15}, Frames = 10, NumDirections = 9, IgnoreWalls = false,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleImpBallTrail,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 1,
	ImpactMissile = "missile-imp-exp"} )

DefineMissileType("missile-imp-ball-elite",
  { File = "graphics/missiles/imp-ball.png", Size = {15, 15}, Frames = 10, NumDirections = 9, IgnoreWalls = false,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleImpBallTrail,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 2, SplashFactor = 2,
	ImpactMissile = "missile-imp-exp"} )

DefineMissileType("missile-burn-ball",
  { File = "graphics/missiles/imp-ball.png", Size = {15, 15}, Frames = 10, NumDirections = 9, IgnoreWalls = false,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleImpBallTrail,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 2, SplashFactor = 2,
	ImpactMissile = {"missile-imp-exp", "missile-archvile-inferno-fire"}} )

DefineMissileType("missile-imp-exp",
  { File = "graphics/missiles/imp-ball-exp.png", Size = {50, 44}, Frames = 3, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

local function DemonBiteElite(attacker, target, damage)
	if (attacker == -1) then
		return
	else
		SetUnitVariable(attacker, "HitPoints", GetUnitVariable(attacker, "HitPoints") + damage / 4)
	end
end

DefineMissileType("missile-demon-bite",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 0 } )

DefineMissileType("missile-demon-bite-elite",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 0, OnImpact = DemonBiteElite } )

local function BelialDrain(attacker, target, damage)
	if (attacker == -1) then
		return
	else
		if (GetUnitBoolFlag(target, "organic") == true) then
			SetUnitVariable(attacker, "HitPoints", GetUnitVariable(attacker, "HitPoints") + 7 + 3 * GetUnitVariable(attacker, "Veterancy"))
			SetUnitVariable(attacker, "Mana", GetUnitVariable(attacker, "Mana") + 2 + GetUnitVariable(attacker, "Veterancy"))
		end
	end
end

DefineMissileType("missile-belial-vampirism",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, Transparency = 100, OnImpact = BelialDrain,
  Class = "missile-class-point-to-point",  Sleep = 1, Speed = 128, Range = 0 } )

DefineMissileType("missile-devil-ball",
  { File = "graphics/missiles/devilball.png", Size = {20, 20}, Frames = 17, NumDirections = 32,  IgnoreWalls = false,
  ImpactSound = "fire explosion", CorrectSphashDamage = true, SmokeMissile = "missile-devil-trail",
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-tracer", Sleep = 1, Speed = 16, Range = 0,
  ImpactMissile = "missile-devil-exp"} )

DefineMissileType("missile-devil-ball-elite",
  { File = "graphics/missiles/devilball.png", Size = {20, 20}, Frames = 17, NumDirections = 32,  IgnoreWalls = false,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeMissile = "missile-devil-trail",
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-tracer", Sleep = 1, Speed = 16, Range = 2, SplashFactor = 5,
  ImpactMissile = "missile-devil-exp"} )

DefineMissileType("missile-devil-trail",
  { File = "graphics/missiles/devilball-trail.png", Size = {20, 20}, Frames = 85, NumDirections = 32, Flip = true, Transparency = 70,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1} )

DefineMissileType("missile-devil-exp",
  { File = "graphics/missiles/devilball-exp.png", Size = {44, 44}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

DefineMissileType("missile-baronball",
  { File = "graphics/missiles/baronball.png", Size = {36, 36}, Frames = 17, NumDirections = 32,
  ImpactSound = "fire explosion", Flip = true, AlwaysFire = true, CorrectSphashDamage = true,  IgnoreWalls = false,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 20, Range = 1, OnImpact = SetPoison,
  ImpactMissile = "missile-baronball-exp"} )

local function SetPoison(attacker, target, damage)
	local bitset = bit.tobits(GetUnitVariable(attacker, "UnitFlags", "Value"))
	if (bitset[unitFlagsIndex.UFI_UpgradeAcid] == 1 and GetUnitBoolFlag(target, "Building") == false) then
		SetUnitVariable(target, "Poison", 450, "Value")
	end
end

local function SetBelialPoison(attacker, target, damage)
	local bitset = bit.tobits(GetUnitVariable(attacker, "UnitFlags", "Value"))
	SetUnitVariable(target, "Slow", 150, "Max")
	SetUnitVariable(target, "Slow", 150, "Value")
	SetUnitVariable(target, "Slow", 1, "Enable")
	if (bitset[unitFlagsIndex.UFI_UpgradeAcid] == 1 and GetUnitBoolFlag(target, "Building") == false) then
		SetUnitVariable(target, "Poison", 450, "Value")
	end
end

DefineMissileType("missile-slowball",
  { File = "graphics/missiles/baronball.png", Size = {36, 36}, Frames = 17, NumDirections = 32,
  ImpactSound = "fire explosion", Flip = true, AlwaysFire = true, CorrectSphashDamage = true, IgnoreWalls = false,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 20, Range = 1, 
  OnImpact = SetBelialPoison, ImpactMissile = "missile-baronball-exp"} )

DefineMissileType("missile-baronball-exp",
  { File = "graphics/missiles/baronball-exp.png", Size = {45, 40}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp,
  Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

DefineMissileType("missile-arachnotron-plasma",
  { File = "graphics/missiles/arachplasma.png", Size = {15, 15}, Frames = 10, NumDirections = 9,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 32, Range = 1, IgnoreWalls = false,
  DrawLevel = drawLevels.DL_LowMissile, ImpactMissile = "missile-arachnotron-plasma-exp"} )

DefineMissileType("missile-arachnotron-plasma-exp",
  { File = "graphics/missiles/arachplasma-exp.png", Size = {37, 37}, Frames = 5, NumDirections = 1,
  Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1,
  DrawLevel = drawLevels.DL_LowMissileExp } )

DefineMissileType("missile-revenant-missile",
  { File = "graphics/missiles/rev-missile.png", Size = {32, 32}, Frames = 17, NumDirections = 32,
  ImpactSound = "rocket explode", Flip = false, IgnoreWalls = false,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 1,
  DrawLevel = drawLevels.DL_LowMissile, ImpactMissile = "missile-revenant-missile-exp" } )

DefineMissileType("missile-revenant-tracer",
  { File = "graphics/missiles/rev-missile.png", Size = {32, 32}, Frames = 17, NumDirections = 32,
  ImpactSound = "rocket explode", Flip = false, IgnoreWalls = false,
  Class = "missile-class-tracer", Sleep = 1, Speed = 16, Range = 0,
  DrawLevel = drawLevels.DL_LowMissile, ImpactMissile = "missile-revenant-missile-exp", SmokeParticle = ParticleRocketPuff } )

DefineMissileType("missile-revenant-missile-exp",
  { File = "graphics/missiles/revenant-missile-exp.png", Size = {45, 40}, Frames = 5, NumDirections = 1,
  Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1,
  DrawLevel = drawLevels.DL_LowMissileExp } )

DefineMissileType("missile-mancubus-fire",
  { File = "graphics/missiles/man-fire.png", Size = {55, 55}, Frames = 17, NumDirections = 32,
  ImpactSound = "fire explosion", Flip = false, AlwaysFire = true, CorrectSphashDamage = true,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 2, SplashFactor = 6, IgnoreWalls = false,
  DrawLevel = drawLevels.DL_LowMissile, ImpactMissile = "missile-rocket-explosion", CanHitOwner = false} )

DefineMissileType("missile-mancubus-fire-elite",
  { File = "graphics/missiles/man-fire.png", Size = {55, 55}, Frames = 17, NumDirections = 32,
  ImpactSound = "fire explosion", Flip = false, AlwaysFire = true, CorrectSphashDamage = true,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 2, SplashFactor = 6, IgnoreWalls = false,
  DrawLevel = drawLevels.DL_LowMissileExp, ImpactMissile = {"missile-rocket-explosion", "missile-archvile-inferno-fire"}, CanHitOwner = false} )

DefineMissileType("missile-archvile-fire",
  { File = "graphics/missiles/fire.png", Size = {40, 40}, Frames = 30, NumDirections = 1,
  Class = "missile-class-clip-to-target", Sleep = 2, Speed = 1, Range = 0, SplashFactor = 4,
  DrawLevel = drawLevels.DL_MissileAir,  CanHitOwner = false} )

DefineMissileType("missile-archvile-inferno-fire",
  { Frames = 1, NumDirections = 1, Transparency = 100, TTL = 66,
  Class = "missile-class-continious", Sleep = 3, Speed = 3, Range = 2, Damage = 1, AlwaysFire = true, SplashFactor = 2,
  ImpactParticle = InfernoParticle, DrawLevel = drawLevels.DL_LowMissile,  CanHitOwner = false} )

DefineMissileType("missile-cyber-rocket",
  { File = "graphics/missiles/missile.png", Size = {32, 32}, Frames = 17, NumDirections = 32,
  DrawLevel = drawLevels.DL_LowMissile, ImpactSound = "rocket explode", Flip = false, CorrectSphashDamage = true,
  Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 2, AlwaysFire = true, IgnoreWalls = false,
  ImpactMissile = "missile-rocket-exp", SmokeParticle = ParticleRocketPuff,  SplashFactor = 3, ImpactParticle = RocketExplosion,
  CanHitOwner = false } )

local function SetHellfirePoison(attacker, target, damage)
	if (GetUnitBoolFlag(target, "Building") == false) then
		SetUnitVariable(target, "Poison", 600, "Value")
	end
end

DefineMissileType("missile-hellfire",
  { File = "graphics/missiles/hellfire.png", Size = {40, 40}, Frames = 51, NumDirections = 32,
  ImpactSound = "bfg explosion", AlwaysFire = true, CorrectSphashDamage = true, IgnoreWalls = false,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-tracer", SmokeMissile = "missile-hellfire-trail",
  Sleep = 2, Speed = 32, Range = 2, OnImpact = SetHellfirePoison,
  ImpactMissile = "missile-hellfire-exp", SplashFactor = 3} )

DefineMissileType("missile-hellfire-exp",
  { File = "graphics/missiles/hellfire-exp.png", Size = {60, 60}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 2, Speed = 16, Range = 1 } )

DefineMissileType("missile-hellfire-trail",
  { File = "graphics/missiles/hellfire-trail.png", Size = {30, 30}, Frames = 6, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1 } )

DefineMissileType("missile-spider-bullet",
  { DrawLevel = drawLevels.DL_NULL, Frames = 1, NumDirections = 1, CanHitOwner = false, IgnoreWalls = false, SmokePrecision = 8,
  Class = "missile-class-point-to-point", ImpactSound = "ricoshet",  AlwaysFire = true, Transparency = 100, CorrectSphashDamage = true,
  ImpactParticle = ParticleChaingunPuff, Sleep = 1, Speed = 128, Range = 2,SplashFactor = 2 } )

DefineMissileType("missile-caco-ball",
  { File = "graphics/missiles/caco-ball.png", Size = {16, 16}, Frames = 1, NumDirections = 1,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true, SmokeParticle = ParticleCacoBallTrail,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", Sleep = 1, Speed = 16, Range = 1,
	ImpactMissile = "missile-caco-exp"} )

DefineMissileType("missile-caco-ball-air",
  { File = "graphics/missiles/caco-ball.png", Size = {16, 16}, Frames = 1, NumDirections = 1,
  ImpactSound = "fire explosion", CorrectSphashDamage = true, SmokeParticle = ParticleCacoBallTrail,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-tracer", Sleep = 1, Speed = 16, Range = 0,
	ImpactMissile = "missile-caco-exp"} )

DefineMissileType("missile-caco-exp",
  { File = "graphics/missiles/caco-ball-exp.png", Size = {53, 48}, Frames = 5, NumDirections = 1,
  DrawLevel = drawLevels.DL_LowMissileExp, Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1 } )

DefineMissileType("missile-soul",
  { File = "graphics/missiles/soulmissile.png", Size = {48, 31}, Frames = 10, NumDirections = 9,
  ImpactSound = "fire explosion",
  Class = "missile-class-tracer", Sleep = 1, Speed = 16, Range = 0,
  ChangeVariable = "SoulHarvesting",
  ChangeAmount = 3, ChangeMax = false,
  DrawLevel = drawLevels.DL_MissileAir, ImpactMissile = "missile-soul-exp" } )

local function ChanceZombie(attacker, target, damage)
	if (GetUnitBoolFlag(target, "UAC") == true) then
		SetUnitVariable(target, "ZombificationTime", GetUnitVariable(target, "ZombificationTime") + 5)
		if (attacker ~= -1) then
			SetUnitVariable(target, "VeteranOfPain", GetUnitVariable(attacker, "Veterancy"))
			SetUnitVariable(target, "RessurectPlayerPain", GetUnitVariable(attacker, "Player"))
		end
	end
end

DefineMissileType("missile-zombie-soul",
  { File = "graphics/missiles/soulmissile.png", Size = {48, 31}, Frames = 10, NumDirections = 9,
  Class = "missile-class-tracer", Sleep = 1, Speed = 16, Range = 0,
  ChangeVariable = "SoulHarvesting",
  ChangeAmount = 3, ChangeMax = false,
  OnImpact = ChanceZombie,
  DrawLevel = drawLevels.DL_MissileAir, ImpactMissile = "missile-soul-exp" } )

DefineMissileType("missile-soul-exp",
  { File = "graphics/missiles/soul-exp.png", Size = {48, 48}, Frames = 30, NumDirections = 9,
  Class = "missile-class-stay", Sleep = 3, Speed = 16, Range = 1,
  DrawLevel = drawLevels.DL_MissileAirExp } )

DefineMissileType("missile-cacolich-fire",
  { File = "graphics/missiles/cacolich-fire.png", Size = {16, 16}, Frames = 2, NumDirections = 1,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point", SmokeParticle = ParticleCacolichFireTrail,
  Sleep = 1, Speed = 28, SmokePrecision = 8, Range = 1, ImpactMissile = "missile-cacolich-fire-exp"} )

DefineMissileType("missile-cacolich-fire-exp",
  { File = "graphics/missiles/cacolich-fire-exp.png", Size = {45, 45}, Frames = 5, NumDirections = 1,
  Class = "missile-class-stay", Sleep = 2, Speed = 32, Range = 1,
  DrawLevel = drawLevels.DL_LowMissileExp} )

DefineMissileType("missile-cacolich-flame",
  { File = "graphics/missiles/lich-flame.png", Size = {34, 23}, Frames = 1, NumDirections = 1,
  ImpactSound = "fire explosion", AlwaysFire = true, CorrectSphashDamage = true,
  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-point-to-point",
  Sleep = 1, Speed = 28, Range = 1, ImpactMissile = "missile-cacolich-flame-exp"} )

DefineMissileType("missile-cacolich-flame-exp",
  { File = "graphics/missiles/lich-flame.png", Size = {34, 23}, Frames = 16, NumDirections = 1,
  ImpactSound = "fire explosion",
  Range = 1,  DrawLevel = drawLevels.DL_LowMissile, Class = "missile-class-stay",
  Sleep = 1, Speed = 3} )

DefineMissileType("missile-well-effect",
  { DrawLevel = 50, Frames = 1, NumDirections = 1, Transparency = 100,
  Class = "missile-class-stay", Sleep = 1, Speed = 16, Range = 1, ImpactParticle = ParticleWellEffect,
  DrawLevel = drawLevels.DL_NULL} )