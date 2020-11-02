-- Nucleus ----
-- base mod --
-- version 0.1 --
-- See README for licensing and other information.

-- Load translation support.
local S = minetest.get_translator("base")

-- Global namespace
base = {}

base.LIGHT_MAX = 14
base.get_translator = S

-- Files

dofile(minetest.get_modpath("base").."/player.lua")
dofile(minetest.get_modpath("base").."/tools.lua")
dofile(minetest.get_modpath("base").."/functions.lua")
dofile(minetest.get_modpath("base").."/chatcommands.lua")

minetest.log("info", "<==={**^**}===>")
minetest.log("info", " n u c l e u s ")
minetest.log("info", "<==={**v**}===>")
minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")
