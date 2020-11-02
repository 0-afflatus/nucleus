-- Nucleus 0.1 --
-- mods/material/blocks.lua --

-- Load translation support.
local S = minetest.get_translator("material")

-- Coloured blocks --

for _, row in ipairs(dye.dyes) do
	local colour = row[1]
	local desc = row[2]
	local colourdef = row[4]
	
	minetest.register_node("material:clay_"..colour, {
		description = desc..S(" Block"),
		groups = { crumbly = 2, oddly_breakable_by_hand = 1},
		tiles = { "element_clay.png^[multiply:"..colourdef },
		sounds = base.node_sound_defaults(),
	})
	
	minetest.register_node("material:"..colour.."_wood", {
		description = colour..S(" Wood"),
		tiles = { "material_wood.png^[multiply:"..colourdef },
		is_ground_content = false,
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = base.node_sound_defaults(),
	})
	
	minetest.register_node("material:stone_brick_"..colour, {
		description = colour..S(" Stone Brick"),
		tiles = { "material_stone_brick.png^[brighten^[multiply:"..colourdef },
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {cracky=2, stone=1},
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:stone_tile_"..colour, {
		description = colour..S(" Stone Tile"),
		tiles = { "material_stone_tile.png^[multiply:"..colourdef },
		groups = {cracky=3},
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:stone_tile_split_"..colour, {
		description = colour..s(" Split Stone Tile"),
		tiles = { "material_stone_tile_split.png^[multiply:"..colourdef },
		groups = {cracky=3},
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:glass_"..colour, {
		description = colour..S(" Glass"),
		drawtype = "glasslike",
		tiles = {"material_trans.png^[multiply:"..colourdef},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		light_source = 2,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		sounds = base.node_sound_defaults(),
	})
end

