-- Nucleus 0.1 --
-- mods/tool/ --

-- Load translation support.
local S = minetest.get_translator("tool")

--
-- Tool definitions

minetest.register_tool("tool:spork", {
	description = S("Runcible Nerf Spork"),
	inventory_image = "tool_spork.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[3]=3.50}, uses=10, maxlevel=1},
			fleshy = {times={[3]=3.50}, uses=10, maxlevel=1},
			snappy = {times={[3]=3.50}, uses=10, maxlevel=1},
			crumbly = {times={[3]=3.50}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=1},
	},
})

--
-- Axes
--

minetest.register_tool("tool:axe_wood", {
	description = S("Wooden Axe"),
	inventory_image = "tool_axe_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=3.00, [3]=2.00}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("tool:axe_stone", {
	description = S("Stone Axe"),
	inventory_image = "tool_axe_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:axe_mithril", {
	description = S("Mithril Axe"),
	inventory_image = "tool_axe_mithril.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.75, [2]=0.45, [3]=0.45}, uses=50, maxlevel=3},
			fleshy={times={[2]=0.95, [3]=0.30}, uses=100, maxlevel=2}
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("tool:axe_diamond", {
	description = S("Diamond Axe"),
	inventory_image = "tool_axe_diamond.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.80, [2]=1.40, [3]=0.80}, uses=25, maxlevel=3},
			fleshy={times={[2]=1.00, [3]=0.50}, uses=100, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("tool:axe_silver", {
	description = S("Silver Axe"),
	inventory_image = "tool_axe_silver.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[2]=0.80, [3]=0.50}, uses=10, maxlevel=1},
			fleshy={times={[2]=1.10, [3]=0.60}, uses=10, maxlevel=1}
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:axe_bronze", {
	description = S("Bronze Axe"),
	inventory_image = "tool_axe_bronze.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.30, [2]=1.80, [3]=1.10}, uses=15, maxlevel=2},
			fleshy={times={[2]=1.30, [3]=0.70}, uses=40, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("tool:axe_copper", {
	description = S("Copper Axe"),
	inventory_image = "tool_axe_copper.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=2.00, [3]=1.50}, uses=15, maxlevel=2},
			fleshy={times={[2]=1.50, [3]=1.00}, uses=40, maxlevel=1}
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:axe_steel", {
	description = S("Steel Axe"),
	inventory_image = "tool_axe_steel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.00, [2]=1.60, [3]=1.00}, uses=10, maxlevel=2},
			fleshy={times={[2]=1.10, [3]=0.60}, uses=40, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
})

--
-- Hoes
--
-- turns nodes with group soil=1 into soil
local function hoe_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)
	
	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	
	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end
	
	-- check if pointing at dirt
	if minetest.get_item_group(under.name, "soil") < 1 then
		return
	end
	
	-- turn the node into soil, wear out item and play sound
	minetest.set_node(pt.under, {name="element:soil"})
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})
	itemstack:add_wear(65535/(uses-1))
	return itemstack
end

minetest.register_tool("tool:hoe_wood", {
	description = S("Wooden Hoe"),
	inventory_image = "tool_hoe_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[3]=2.00}, uses=10, maxlevel=1},
			crumbly = {times={[3]=2.00}, uses=10, maxlevel=1},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 30)
	end,
})

minetest.register_tool("tool:hoe_stone", {
	description = S("Stone Hoe"),
	inventory_image = "tool_hoe_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[3]=1.00}, uses=20, maxlevel=1},
			crumbly = {times={[3]=1.00}, uses=20, maxlevel=1},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 60)
	end,
})

minetest.register_tool("tool:hoe_mithril", {
	description = S("Mithril Hoe"),
	inventory_image = "tool_hoe_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=2,
		groupcaps={
			snappy = {times={[3]=0.35}, uses=50, maxlevel=1},
			crumbly = {times={[3]=0.35}, uses=50, maxlevel=1},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 250)
	end,
})

minetest.register_tool("tool:hoe_silver", {
	description = S("Silver Hoe"),
	inventory_image = "tool_hoe_silver.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy = {times={[3]=0.5}, uses=10, maxlevel=1},
			crumbly = {times={[3]=0.5}, uses=10, maxlevel=1},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 30)
	end,
})

minetest.register_tool("tool:hoe_copper", {
	description = S("Copper Hoe"),
	inventory_image = "tool_hoe_copper.png",
	tool_capabilities = {
		full_punch_interval = 0.35,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[3]=1.00}, uses=15, maxlevel=1},
			crumbly = {times={[3]=1.00}, uses=15, maxlevel=1},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 123)
	end,
})

minetest.register_tool("tool:hoe_bronze", {
	description = S("Bronze Hoe"),
	inventory_image = "tool_hoe_bronze.png",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=1,
		groupcaps={
			snappy = {times={[3]=1.10}, uses=15, maxlevel=1},
			crumbly = {times={[3]=1.10}, uses=15, maxlevel=1},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 230)
	end,
})

minetest.register_tool("tool:hoe_steel", {
	description = S("Steel Hoe"),
	inventory_image = "tool_hoe_steel.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy = {times={[3]=1.00}, uses=10, maxlevel=1},
			crumbly = {times={[3]=1.00}, uses=10, maxlevel=1},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 150)
	end,
})

--
-- Picks
--

minetest.register_tool("tool:pick_wood", {
	description = S("Wooden Pickaxe"),
	inventory_image = "tool_pick_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("tool:pick_stone", {
	description = S("Stone Pickaxe"),
	inventory_image = "tool_pick_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.20}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:pick_mithril", {
	description = S("Mithril Pickaxe"),
	inventory_image = "tool_pick_mithril.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=2.25, [2]=0.55, [3]=0.35}, uses=50, maxlevel=3}
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("tool:pick_diamond", {
	description = S("Diamond Pickaxe"),
	inventory_image = "tool_pick_diamond.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.00, [2]=1.50, [3]=0.75}, uses=25, maxlevel=3}
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("tool:pick_silver", {
	description = S("Silver Pickaxe"),
	inventory_image = "tool_pick_silver.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=2.60, [2]=1.00, [3]=0.60}, uses=10, maxlevel=1}
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:pick_bronze", {
	description = S("Bronze Pickaxe"),
	inventory_image = "tool_pick_bronze.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=4.50, [2]=1.80, [3]=1.10}, uses=15, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("tool:pick_steel", {
	description = S("Steel Pickaxe"),
	inventory_image = "tool_pick_steel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=4.00, [2]=1.60, [3]=1.00}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

--
-- Shovels
--

minetest.register_tool("tool:shovel_wood", {
	description = S("Wooden Shovel"),
	inventory_image = "tool_shovel_wood.png",
	wield_image = "tool_shovel_wood.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("tool:shovel_stone", {
	description = S("Stone Shovel"),
	inventory_image = "tool_shovel_stone.png",
	wield_image = "tool_shovel_stone.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("tool:shovel_mithril", {
	description = S("Mithril Shovel"),
	inventory_image = "tool_shovel_mithril.png",
	wield_image = "tool_shovel_mithril.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=0.70, [2]=0.35, [3]=0.20}, uses=60, maxlevel=3}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("tool:shovel_bronze", {
	description = S("Bronze Shovel"),
	inventory_image = "tool_shovel_bronze.png",
	wield_image = "tool_shovel_bronze.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.30, [2]=0.90, [3]=0.70}, uses=15, maxlevel=2}
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:shovel_copper", {
	description = S("Copper Shovel"),
	inventory_image = "tool_shovel_bronze.png",
	wield_image = "tool_shovel_bronze.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=1.00, [3]=0.80}, uses=15, maxlevel=2}
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("tool:shovel_steel", {
	description = S("Steel Shovel"),
	inventory_image = "tool_shovel_steel.png",
	wield_image = "tool_shovel_steel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.00, [2]=0.70, [3]=0.60}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=3},
	},
})

--
-- Swords
--

minetest.register_tool("tool:sword_mithril", {
	description = S("Mithril Sword"),
	inventory_image = "tool_sword_mithril.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=0.65, [3]=0.25}, uses=50, maxlevel=3},
			snappy={times={[2]=0.70, [3]=0.25}, uses=100, maxlevel=2},
			choppy={times={[3]=0.65}, uses=100, maxlevel=1}
		},
		damage_groups = {fleshy=7},
	}
})

minetest.register_tool("tool:sword_silver", {
	description = S("Silver Sword"),
	inventory_image = "tool_sword_silver.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=0.70, [3]=0.30}, uses=10, maxlevel=1},
			snappy={times={[2]=0.70, [3]=0.30}, uses=10, maxlevel=1},
			choppy={times={[3]=0.80}, uses=10, maxlevel=0}
		},
		damage_groups = {fleshy=4},
	}
})

minetest.register_tool("tool:sword_bronze", {
	description = S("Bronze Sword"),
	inventory_image = "tool_sword_bronze.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.50, [2]=1.00, [3]=0.70}, uses=15, maxlevel=2},
			snappy={times={[2]=0.90, [3]=0.50}, uses=50, maxlevel=1},
			choppy={times={[3]=0.80}, uses=50, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("tool:sword_steel", {
	description = S("Steel Sword"),
	inventory_image = "tool_sword_steel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=10, maxlevel=2},
			snappy={times={[2]=0.70, [3]=0.30}, uses=40, maxlevel=1},
			choppy={times={[3]=0.70}, uses=40, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("tool:sword_diamond", {
	description = S("Diamond Sword"),
	inventory_image = "tool_sword_diamond.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	}
})

minetest.register_tool("tool:paintbrush", {
	description = S("Paint Brush"),
	inventory_image = "tool_paintbrush.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 0,
		groupcaps = {},
		damage_groups = {},
	},
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing and pointed_thing.under then
			
			local cnode = minetest.get_node( pointed_thing.under )
			local blob = dye.get_color( cnode.name )
			local inv = user:get_inventory()
			local next_item = inv:get_stack("main", user:get_wield_index()+1):get_name()
			
			if blob then
				local newnode = ""
				if next_item:match( "dye" ) then
					if not minetest.settings:getbool("creative_mode") then
						inv:remove_item("main", next_item)
					end
					newnode = cnode.name:gsub( blob, dye.get_color( next_item ) )
					if minetest.registered_nodes[ newnode ] then
						minetest.swap_node(pointed_thing.under, { name = newnode, param1 = cnode.param1, param2 = cnode.param2 })
					end
				else
					minetest.chat_send_all( "No dye found next to paintbrush!" )
				end
			else
				minetest.chat_send_all( "This can't be painted!" )
			end
		
		end
	return itemstack
	end,
})

-- Flint and Steel
minetest.register_tool("tool:flint_and_steel", {
	description = S("Flint and Steel"),
	inventory_image = "tool_flint_steel.png",
	sound = {breaks = "base_tool_breaks"},

	on_use = function(itemstack, user, pointed_thing)
		local sound_pos = pointed_thing.above or user:get_pos()
		minetest.sound_play("tool_flint_and_steel",
			{pos = sound_pos, gain = 0.5, max_hear_distance = 8}, true)
		local player_name = user:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if minetest.is_protected(pointed_thing.under, player_name) then
				minetest.chat_send_player(player_name, "This area is protected")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointed_thing.under, user)
			elseif minetest.get_item_group(node_under, "flammable") >= 1
					and minetest.get_node(pointed_thing.above).name == "air" then
				minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then
			-- Wear tool
			local wdef = itemstack:get_definition()
			itemstack:add_wear(1000)

			-- Tool break sound
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks,
					{pos = sound_pos, gain = 0.5}, true)
			end
			return itemstack
		end
	end
})

minetest.register_craft({
	output = "tool:flint_and_steel",
	recipe = {
		{"element:flint", "mineral:steel_ingot"}
	}
})

dofile(minetest.get_modpath("tool").."/crafting.lua")
dofile(minetest.get_modpath("tool").."/aliases.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")
