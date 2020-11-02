-- Nucleus 0.1 --
-- mods/material/ --

-- Load translation support.
local S = minetest.get_translator("material")

-- Global namespace

material = {}

--
-- Node definitions
--

-- Brick

minetest.register_node("material:brick", {
	description = S("Brick"),
	tiles = {"material_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_brick", {
	description = S("Stone Brick"),
	tiles = {"material_stone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2, stone=1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:desert_stone_brick", {
	description = S("Desert Stone Brick"),
	tiles = {"material_desert_stone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:sandstone_brick", {
	description = S("Sandstone Brick"),
	tiles = {"material_sandstone_brick.png"},
	is_ground_content = true,
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:adobe_brick", {
	description = S("Adobe Brick"),
	tiles = {"material_adobe.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {stone = 3, cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_brick", {
	description = S("Basalt Brick"),
	tiles = {"material_basalt_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=1, stone=1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:bluestone_brick", {
	description = S("Bluestone Brick"),
	tiles = {"material_bluestone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2, stone=1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:greenstone_brick", {
	description = S("Greenstone Brick"),
	tiles = {"material_greenstone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=1, stone=1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:whitestone_brick", {
	description = S("Whitestone Brick"),
	tiles = {"material_whitestone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

-- Shingles

minetest.register_node("material:shingles_clay", {
	description = S("Roof Tiles"),
	tiles = {"material_clay_tiles.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:shingles_wood", {
	description = S("Wooden Shingles"),
	tiles = {"material_shingles_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:shingles_slate", {
	description = S("Roof Slates"),
	tiles = {"material_slate.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

-- Tiles

minetest.register_node("material:wood_tile", {
	description = S("Wood Tile"),
	tiles = {"material_wood_tile.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {choppy = 1, wood = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

minetest.register_node("material:stone_tile", {
	description = S("Stone Tile"),
	tiles = {"material_stone_tile.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_tile_split", {
	description = S("Split Stone Tile"),
	tiles = {"material_stone_tile_split_top.png",
		"material_stone_tile_split.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_chequer", {
	description = S("Stone Chequer"),
	tiles = {"material_stone_chequer.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:white_stone_tile", {
	description = S("White Stone Tile"),
	tiles = {"material_white_stone_tile.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:white_stone_tile_split", {
	description = S("Split White Stone Tile"),
	tiles = {"material_white_stone_tile_split_top.png",
		"material_stone_tile_split.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:green_stone_tile", {
	description = S("Greenstone Tile"),
	tiles = {"material_green_stone_tile.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:green_stone_tile_split", {
	description = S("Split Greenstone Tile"),
	tiles = {"material_green_stone_tile_split_top.png",
		"material_green_stone_tile_split.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:green_stone_chequer", {
	description = S("Greenstone Chequer"),
	tiles = {"material_green_stone_chequer.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:blue_stone_tile", {
	description = S("Bluestone Tile"),
	tiles = {"material_blue_stone_tile.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:blue_stone_tile_split", {
	description = S("Split Bluestone Tile"),
	tiles = {"material_blue_stone_tile_split_top.png",
		"material_blue_stone_tile_split.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:blue_stone_chequer", {
	description = S("Bluestone Chequer"),
	tiles = {"material_blue_stone_chequer.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_tile", {
	description = S("Basalt Tile"),
	tiles = {"material_basalt_tile.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_tile_split", {
	description = S("Split Basalt Tile"),
	tiles = {"material_basalt_tile_split_top.png",
		"material_basalt_tile_split.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_chequer", {
	description = S("Basalt Chequer"),
	tiles = {"material_basalt_chequer.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:red_stone_tile", {
	description = S("Red stone Tile"),
	tiles = {"material_red_stone_tile.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:red_stone_tile_split", {
	description = S("Split red stone Tile"),
	tiles = {"material_red_stone_tile_split_top.png",
		"material_red_stone_tile_split.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:red_stone_chequer", {
	description = S("Red stone Chequer"),
	tiles = {"material_red_stone_chequer.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_rune", {
	description = S("Stone Rune"),
	tiles = {"material_stone_rune.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {cracky=3},
	sounds = base.node_sound_stone_defaults(),
})


-- Glass

minetest.register_node("material:glass", {
	description = S("Glass"),
	drawtype = "glasslike",
	tiles = {"material_glass.png"},
	inventory_image = minetest.inventorycube("material_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = base.node_sound_glass_defaults(),
})

minetest.register_node("material:glass_obsidian", {
	description = S("Obsidian Glass"),
	drawtype = "glasslike",
	tiles = {"material_glass_obsidian.png"},
	inventory_image = minetest.inventorycube("material_glass_obsidian.png"),
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = base.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})

-- Straw (Cob actually)

minetest.register_node("material:cob", {
    description = S("Cob Block"),
    tiles = {"material_cob.png"},
	walkable = true,
	groups = {crumbly = 2},
	sounds = base.node_sound_dirt_defaults()     
})

-- Fabric

material = {}

-- This uses a trick: you can first define the recipes using all of the base
-- colors, and then some recipes using more specific colors for a few non-base
-- colors available. When crafting, the last recipes will be checked first.
material.dyes = {
	{"white",      "White",      nil},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}

dofile(minetest.get_modpath("material").."/bones.lua")
--dofile(minetest.get_modpath("material").."/blocks.lua")
dofile(minetest.get_modpath("material").."/shapes.lua")
dofile(minetest.get_modpath("material").."/crafting.lua")
dofile(minetest.get_modpath("material").."/aliases.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")
