-- doors/doors.lua

-- Load support for MT game translation.
local S = minetest.get_translator("doors")

doors.register("door_wood", {
		tiles = {{ name = "doors_door_wood.png", backface_culling = true }},
		description = S("Wooden Door"),
		inventory_image = "doors_item_wood.png",
		groups = {node = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		recipe = {
			{"group:wood", "group:wood"},
			{"group:wood", "group:wood"},
			{"group:wood", "group:wood"},
		}
})

doors.register("door_steel", {
		tiles = {{name = "doors_door_steel.png", backface_culling = true}},
		description = S("Steel Door"),
		inventory_image = "doors_item_steel.png",
		protected = true,
		groups = {node = 1, cracky = 1, level = 2},
		sounds = base.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		recipe = {
			{"mineral:steel_ingot", "mineral:steel_ingot"},
			{"mineral:steel_ingot", "mineral:steel_ingot"},
			{"mineral:steel_ingot", "mineral:steel_ingot"},
		}
})

doors.register("door_glass", {
		tiles = {"doors_door_glass.png"},
		description = S("Glass Door"),
		inventory_image = "doors_item_glass.png",
		groups = {node = 1, cracky=3, oddly_breakable_by_hand=3},
		sounds = base.node_sound_glass_defaults(),
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		recipe = {
			{"material:glass", "material:glass"},
			{"material:glass", "material:glass"},
			{"material:glass", "material:glass"},
		}
})

doors.register("door_obsidian_glass", {
		tiles = {"doors_door_obsidian_glass.png"},
		description = S("Obsidian Glass Door"),
		inventory_image = "doors_item_obsidian_glass.png",
		groups = {node = 1, cracky=3},
		sounds = base.node_sound_glass_defaults(),
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		recipe = {
			{"material:obsidian_glass", "material:obsidian_glass"},
			{"material:obsidian_glass", "material:obsidian_glass"},
			{"material:obsidian_glass", "material:obsidian_glass"},
		},
})

-- Trapdoors

doors.register_trapdoor("doors:trapdoor", {
	description = S("Wooden Trapdoor"),
	inventory_image = "doors_trapdoor.png",
	wield_image = "doors_trapdoor.png",
	tile_front = "doors_trapdoor.png",
	tile_side = "doors_trapdoor_side.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1},
})

doors.register_trapdoor("doors:trapdoor_steel", {
	description = S("Steel Trapdoor"),
	inventory_image = "doors_trapdoor_steel.png",
	wield_image = "doors_trapdoor_steel.png",
	tile_front = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	protected = true,
	sounds = base.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 1, level = 2, door = 1},
})

minetest.register_craft({
	output = "doors:trapdoor 2",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "doors:trapdoor_steel",
	recipe = {
		{"mineral:steel_ingot", "mineral:steel_ingot"},
		{"mineral:steel_ingot", "mineral:steel_ingot"},
	}
})

-- Fence gates

doors.register_fencegate("doors:gate_wood", {
	description = S("Apple Wood Fence Gate"),
	texture = "material_wood.png",
	material = "material:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_acacia_wood", {
	description = S("Acacia Wood Fence Gate"),
	texture = "tree_acacia_wood.png",
	material = "tree:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_jungle_wood", {
	description = S("Jungle Wood Fence Gate"),
	texture = "tree_jungle_wood.png",
	material = "tree:jungle_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_pine_wood", {
	description = S("Pine Wood Fence Gate"),
	texture = "tree_pine_wood.png",
	material = "tree:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

doors.register_fencegate("doors:gate_aspen_wood", {
	description = S("Aspen Wood Fence Gate"),
	texture = "tree_aspen_wood.png",
	material = "tree:aspen_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

----fuels----

minetest.register_craft({
	type = "fuel",
	recipe = "doors:trapdoor",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood",
	burntime = 14,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_closed",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_acacia_wood_closed",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_junglewood_closed",
	burntime = 9,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_pine_wood_closed",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_aspen_wood_closed",
	burntime = 5,
})
