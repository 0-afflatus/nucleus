-- dye/init.lua

dye = {}

-- Load translation support.
local S = minetest.get_translator("dye")

--- Make dye names, descriptions and colorstrings available globally

dye.dyes = {
	{"black",      "Black",      {dye=1, basecolor_black=1,   excolor_black=1,      unicolor_black=1},			"#333333"},
	{"blue",       "Blue",       {dye=1, basecolor_blue=1,    excolor_blue=1,       unicolor_blue=1},			"#3333bb"},
	{"brown",      "Brown",      {dye=1, basecolor_brown=1,   excolor_orange=1,     unicolor_dark_orange=1},	"#664422"},
	{"cyan",       "Cyan",       {dye=1, basecolor_cyan=1,    excolor_cyan=1,       unicolor_cyan=1},			"#33bbbb"},
	{"green",      "Green",      {dye=1, basecolor_green=1,   excolor_green=1,      unicolor_green=1},			"#339933"},
	{"grey",       "Grey",       {dye=1, basecolor_grey=1,    excolor_grey=1,       unicolor_grey=1},			"#888888"},
	{"magenta",    "Magenta",    {dye=1, basecolor_magenta=1, excolor_red_violet=1, unicolor_red_violet=1},		"#cc33cc"},
	{"orange",     "Orange",     {dye=1, basecolor_orange=1,  excolor_orange=1,     unicolor_orange=1},			"#cc7733"},
	{"pink",       "Pink",       {dye=1, basecolor_red=1,     excolor_red=1,        unicolor_light_red=1},		"#cc8899"},
	{"red",        "Red",        {dye=1, basecolor_red=1,     excolor_red=1,        unicolor_red=1},			"#993333"},
	{"violet",     "Violet",     {dye=1, basecolor_magenta=1, excolor_violet=1,     unicolor_violet=1},			"#9933cc"},
	{"white",      "White",      {dye=1, basecolor_white=1,   excolor_white=1,      unicolor_white=1},			"#ffffff"},
	{"yellow",     "Yellow",     {dye=1, basecolor_yellow=1,  excolor_yellow=1,     unicolor_yellow=1},			"#ffdd33"},
	{"dark_grey",  "Dark Grey"},
	{"dark_green", "Dark Green"},
}

function dye.get_color( nodename )
	for _, row in ipairs( dye.dyes ) do
		local colourname = row[1]
		local blob = colourname.match( nodename, colourname )
		if blob then
			return blob
		end
	end
	return false
end

-- Define items

for _, row in ipairs(dye.dyes) do
	local name = row[1]
	local description = row[2]
	local groups = {dye = 1}
	groups["color_" .. name] = 1

	minetest.register_craftitem("dye:" .. name, {
		inventory_image = "dye_" .. name .. ".png",
		description = S(description .. " Dye"),
		groups = groups
	})

	minetest.register_craft({
		output = "dye:" .. name .. " 4",
		recipe = {
			{"group:flower,color_" .. name}
		},
	})
end

-- Manually add coal -> black dye

minetest.register_craft({
	output = "dye:black 4",
	recipe = {
		{"group:coal"}
	},
})

-- Manually add blueberries->violet dye

minetest.register_craft({
	output = "dye:violet 2",
	recipe = {
		{"default:blueberries"}
	},
})

-- Mix recipes

local dye_recipes = {
	-- src1, src2, dst
	-- RYB mixes
	{"red", "blue", "violet"}, -- "purple"
	{"yellow", "red", "orange"},
	{"yellow", "blue", "green"},
	-- RYB complementary mixes
	{"yellow", "violet", "dark_grey"},
	{"blue", "orange", "dark_grey"},
	-- CMY mixes - approximation
	{"cyan", "yellow", "green"},
	{"cyan", "magenta", "blue"},
	{"yellow", "magenta", "red"},
	-- other mixes that result in a color we have
	{"red", "green", "brown"},
	{"magenta", "blue", "violet"},
	{"green", "blue", "cyan"},
	{"pink", "violet", "magenta"},
	-- mixes with black
	{"white", "black", "grey"},
	{"grey", "black", "dark_grey"},
	{"green", "black", "dark_green"},
	{"orange", "black", "brown"},
	-- mixes with white
	{"white", "red", "pink"},
	{"white", "dark_grey", "grey"},
	{"white", "dark_green", "green"},
}

for _, mix in pairs(dye_recipes) do
	minetest.register_craft({
		type = "shapeless",
		output = "dye:" .. mix[3] .. " 2",
		recipe = {"dye:" .. mix[1], "dye:" .. mix[2]},
	})
end

-- Dummy calls to S() to allow translation scripts to detect the strings.
-- To update this run:
-- for _,e in ipairs(dye.dyes) do print(("S(%q)"):format(e[2].." Dye")) end

--[[
S("White Dye")
S("Grey Dye")
S("Dark Grey Dye")
S("Black Dye")
S("Violet Dye")
S("Blue Dye")
S("Cyan Dye")
S("Dark Green Dye")
S("Green Dye")
S("Yellow Dye")
S("Brown Dye")
S("Orange Dye")
S("Red Dye")
S("Magenta Dye")
S("Pink Dye")
--]]
