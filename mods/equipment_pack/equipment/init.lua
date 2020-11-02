-- Nucleus 0.1 --
-- mods/equipment/ --

-- Definitions made by this mod that other mods can use too
equipment = {}

-- Load files
dofile(minetest.get_modpath("equipment").."/books.lua")
dofile(minetest.get_modpath("equipment").."/chest.lua")
dofile(minetest.get_modpath("equipment").."/fence.lua")
dofile(minetest.get_modpath("equipment").."/furnace.lua")
dofile(minetest.get_modpath("equipment").."/ladder.lua")
dofile(minetest.get_modpath("equipment").."/torch.lua")
dofile(minetest.get_modpath("equipment").."/bonfire.lua")
dofile(minetest.get_modpath("equipment").."/aliases.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")
