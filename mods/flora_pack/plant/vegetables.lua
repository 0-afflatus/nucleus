-- Nucleus 0.1 --
-- mods/plant/vegetables.lua --

-- translation support.
local S = minetest.get_translator("plant")

-- Beetroot --

plant.register_plant("plant:beetroot", {
	description = S("Beetroot"),
	harvest_description = "beetroot_leaves",
	paramtype2 = "meshoptions",
	inventory_image = "plant_beetroot.png",
	steps = 4,
	grow_time = 237,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_beetroot = 1, flammable = 2},
	place_param2 = 3,
})

-- Garlic --

plant.register_plant("plant:garlic", {
	description = S("Garlic"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_garlic.png",
	steps = 5,
	grow_time = 275,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_garlic = 1, flammable = 2},
	place_param2 = 3,
})

-- Turnip --

plant.register_plant("plant:turnip", {
	description = S("Turnip"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_turnip.png",
	steps = 5,
	grow_time = 242,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_turnip = 1, flammable = 2},
	place_param2 = 3,
})

-- Potato --

plant.register_plant("plant:potato", {
	description = S("Potato"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_potato.png",
	steps = 4,
	grow_time = 285,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_potato = 1, flammable = 2},
	place_param2 = 3,
})

-- Carrot --

plant.register_plant("plant:carrot", {
	description = S("Carrot"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_carrot.png",
	steps = 4,
	grow_time = 286,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_carrot = 1, flammable = 2},
	place_param2 = 3,
})

-- Onion --

plant.register_plant("plant:onion", {
	description = S("Onion"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_onion.png",
	steps = 5,
	grow_time = 242,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_onion = 1, flammable = 2},
	place_param2 = 3,
})

-- Spinach --

plant.register_plant("plant:spinach", {
	description = S("Spinach"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_spinach.png",
	steps = 5,
	grow_time = 242,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_spinach = 1, flammable = 2},
	place_param2 = 3,
})

--
-- Mapgen --
--

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:dirt_with_grass"},
	sidelen = 80,
	noise_params = {
		offset = 0, 
		scale = 0.02, 
		spread = {x = 128, y = 128, z = 128}, 
		seed = 709, 
		octaves = 3, 
		persist = 0.66
	},
	biomes = {"grassland", "woodland"},
	y_min = 5,
	y_max = 50,
	decoration = {"plant:beetroot_4", "plant:spinch_5", "plant:turnip_5"},
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:dirt_with_grass_light"},
	sidelen = 80,
	noise_params = {
		offset = 0, 
		scale = 0.02, 
		spread = {x = 128, y = 128, z = 128}, 
		seed = 709, 
		octaves = 3, 
		persist = 0.66
	},
	biomes = {"chapparal", "mediterranean"},
	y_min = 5,
	y_max = 50,
	decoration = {"plant:carrot_4", "plant:onion_5", "plant:garlic_5", "plant:potato_4"},
})

