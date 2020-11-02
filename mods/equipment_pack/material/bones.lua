-- Nucleus 0.1 --
-- mods/material/bones.lua --

-- Load translation support.
local S = minetest.get_translator("material")

minetest.register_node("material:bones", {
	description = S("Bones"),
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"bones_front.png"
	},
	paramtype2 = "facedir",
	place_param2 = nil,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})
