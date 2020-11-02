-- Nucleus 0.1 --
-- mods/plant/ --

-- Definitions made by this mod that other mods can use too
plant = {}
plant.registered_plants = {}

plant.sel = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.3, 0.3, -0.1, 0.2}
	}

plant.sel0 = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.4, 0.4, -0.3, 0.4}
	}

plant.sel1 = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, -0.2, 0.3}
	}

plant.sel2 = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	}

plant.sel3 = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	}

-- Temporary location for vines --	
minetest.register_node("plant:ivy", {
	description = "Ivy",
	drawtype = "signlike",
	tiles = {"plant_ivy.png"},
	inventory_image = "plant_ivy.png",
	wield_image = "plant_ivy.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	groups = {dig_immediate = 3, flammable = 3, plant = 1},
	selection_box = {type="wallmounted"},
	legacy_wallmounted = true,
	sounds = base.node_sound_leaves_defaults()
})

minetest.register_craft({
	output = "plant:ivy 4",
	recipe = {
		{"group:leaves"},
		{"group:leaves"}
	}
})

-- Load files

dofile(minetest.get_modpath("plant").."/api.lua")
dofile(minetest.get_modpath("plant").."/grasses.lua")
dofile(minetest.get_modpath("plant").."/cacti.lua")
dofile(minetest.get_modpath("plant").."/jungle.lua")
dofile(minetest.get_modpath("plant").."/vegetables.lua")
dofile(minetest.get_modpath("plant").."/sealife.lua")
dofile(minetest.get_modpath("plant").."/aliases.lua")
dofile(minetest.get_modpath("plant").."/crafts.lua")

-- Log message
minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")
