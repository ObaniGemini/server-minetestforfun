--[[
Map Tools: unbreakable default nodes

Copyright (c) 2012-2015 Calinou and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

local S = maptools.intllib

maptools.creative = maptools.config["hide_from_creative_inventory"]

minetest.register_node("maptools:stone", {
	description = S("Unbreakable Stone"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_stone.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:stonebrick", {
	description = S("Unbreakable Stone Brick"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_stone_brick.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:tree", {
	description = S("Unbreakable Tree"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("maptools:jungletree", {
	description = S("Unbreakable Jungle Tree"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("maptools:cactus", {
	description = S("Unbreakable Cactus"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_cactus_top.png", "default_cactus_top.png", "default_cactus_side.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("maptools:papyrus", {
	description = S("Unbreakable Papyrus"),
	drawtype = "plantlike",
	range = 12,
	stack_max = 10000,
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}
	},
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("maptools:dirt", {
	description = S("Unbreakable Dirt"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_dirt.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("maptools:wood", {
	description = S("Unbreakable Wooden Planks"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_wood.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("maptools:junglewood", {
	description = S("Unbreakable Junglewood Planks"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_junglewood.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("maptools:glass", {
	description = S("Unbreakable Glass"),
	range = 12,
	stack_max = 10000,
	drawtype = "glasslike",
	tiles = {"default_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("maptools:leaves", {
	description = S("Unbreakable Leaves"),
	range = 12,
	stack_max = 10000,
	drawtype = "allfaces_optional",
	tiles = {"default_leaves.png"},
	paramtype = "light",
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("maptools:sand", {
	description = S("Unbreakable Sand"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_sand.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("maptools:gravel", {
	description = S("Unbreakable Gravel"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_gravel.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.35},
		dug = {name="default_gravel_footstep", gain=0.6},
	}),
})

minetest.register_node("maptools:clay", {
	description = S("Unbreakable Clay"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_clay.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("maptools:desert_sand", {
	description = S("Unbreakable Desert Sand"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_desert_sand.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("maptools:sandstone", {
	description = S("Unbreakable Sandstone"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_sandstone.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:sandstone_brick", {
	description = S("Unbreakable Sandstone Brick"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_sandstone_brick.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})
-- Compatibility for change made there ^
minetest.register_alias("maptools:sandstone_brick","maptools:sandstonebrick")

minetest.register_node("maptools:desert_stone", {
	description = S("Unbreakable Desert Stone"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_desert_stone.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:desert_cobble", {
	description = S("Unbreakable Desert Cobble"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_desert_cobble.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:desert_stonebrick", {
	description = S("Unbreakable Desert Stone Brick"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_desert_stone_brick.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:grass", {
	description = S("Unbreakable Dirt with Grass"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^default_grass_side.png"},
	paramtype2 = "facedir",
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("maptools:fullgrass", {
	description = S("Unbreakable Full Grass"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_grass.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

for slab_num = 1,3,1 do
	minetest.register_node("maptools:slab_grass_" .. slab_num * 4, {
		description = S("Grass Slab"),
		range = 12,
		stack_max = 10000,
		tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^maptools_grass_side_" .. slab_num * 4 .. ".png"},
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.5 + slab_num * 0.25, 0.5},
		},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		drop = "",
		groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
		sounds = default.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain = 0.4}}),
	})
end

minetest.register_node("maptools:cobble", {
	description = S("Unbreakable Cobblestone"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_cobble.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:mossycobble", {
	description = S("Unbreakable Mossy Cobblestone"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_mossycobble.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:brick", {
	description = S("Unbreakable Brick"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_brick.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:coalblock", {
	description = S("Unbreakable Coal Block"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_coal_block.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("maptools:steelblock", {
	description = S("Unbreakable Steel Block"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_steel_block.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:goldblock", {
	description = S("Unbreakable Gold Block"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_gold_block.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:copperblock", {
	description = S("Unbreakable Copper Block"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_copper_block.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:bronzeblock", {
	description = S("Unbreakable Bronze Block"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_bronze_block.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("maptools:diamondblock", {
	description = S("Unbreakable Diamond Block"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_diamond_block.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

-- Farming:

minetest.register_node("maptools:soil_wet", {
	description = "Wet Soil",
	range = 12,
	stack_max = 10000,
	tiles = {"farming_soil_wet.png", "farming_soil_wet_side.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative, soil = 3, wet = 1, grassland = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("maptools:desert_sand_soil_wet", {
	description = "Wet Desert Sand Soil",
	range = 12,
	stack_max = 10000,
	drop = "",
	tiles = {"farming_desert_sand_soil_wet.png", "farming_desert_sand_soil_wet_side.png"},
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative, soil = 3, wet = 1, desert = 1},
	sounds = default.node_sound_sand_defaults(),
})

-- Fence:

local function dockable(nodename)
    if nodename == "default:wood" or nodename == "default:brick" or nodename == "default:cobble" or nodename == "default:dirt" or nodename == "default:sandstone" or nodename == "default:stone" or string.find(nodename, "fences:fence_wood") or string.find(nodename, "fences:fencegate") then
        return true
    end
end
local function find_dock(pos, second)
	if pos == nil then
		return false
	end

	local h1 = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z})
	local v1 = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z})
	local r1 = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1})
	local l1 = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1})
	local code = 0
	if dockable(l1.name) then
		code = code+1
		if second < 2 then
			minetest.punch_node({x=pos.x, y=pos.y, z=pos.z-1})
		end
	end
	if dockable(r1.name) then
		code = code+2
		if second < 2 then
			minetest.punch_node({x=pos.x, y=pos.y, z=pos.z+1})
		end
	end
	if dockable(v1.name) then
		code = code+11
		if second < 2 then
			minetest.punch_node({x=pos.x-1, y=pos.y, z=pos.z})
		end
	end
	if dockable(h1.name) then
		code = code+21
		if second < 2 then
			minetest.punch_node({x=pos.x+1, y=pos.y, z=pos.z})
		end
	end
		local me = minetest.get_node(pos)
		if code > 0 then
			local tmp_name = "fences:fence_wood_"..code
			--minetest.chat_send_all(tmp_name)
			local tmp_node = {name=tmp_name, param1=me.param1, param2=me.param2}
			if second > 0 then
				local tmp_node = {name=tmp_name, param1=me.param1, param2=me.param2}
				minetest.set_node(pos, tmp_node)
			end
		elseif code == 0 then
			if second == 2 then
				local tmp_node = {name="fences:fence_wood", param1=me.param1, param2=me.param2}
				minetest.set_node(pos, tmp_node)
			end
		end

end


local p0 = {-2/16, -1/2, -2/16, 2/16, 1/2, 2/16}
local p1 = {-2/16, 1/2, -2/16, -2/16, 1/2+8/16, -2/16}
local p2 = {-2/16, 1/2, 2/16, -2/16, 1/2+8/16, 2/16}
local p3 = {0, 0, 0, 0, 0, 0}
local p4 = {2/16, 1/2, -2/16, 2/16, 1/2+8/16, -2/16}
local p5 = {2/16, 1/2, 2/16, 2/16, 1/2+8/16, 2/16}


minetest.register_node(":fences:fence_wood", {
	description = S("Unbreakable Wooden Fence"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_wood.png"},
	inventory_image = "default_wood.png",
	wield_image = "default_wood.png",
	paramtype = "light",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_wood_defaults(),
	drop = "",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {p0,p1,p2,p3,p4,p5,}
	},
	selection_box = {
		type = "fixed",
		fixed = {-2/16, -1/2, -2/16, 2/16, 1/2, 2/16},
	},
	on_construct = function(pos)
		find_dock(pos, 1)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		find_dock(pos, -1)
	end
})



-- carts:

minetest.register_node(":maptools:unbreakable_rail", {
	description = "Unbreakable Rail",
	drawtype = "raillike",
	tiles = {"default_rail.png", "default_rail_curved.png", "default_rail_t_junction.png", "default_rail_crossing.png"},
	inventory_image = "default_rail.png",
	wield_image = "default_rail.png",
	paramtype = "light",
	stack_max = 10000,
	sunlight_propagates = true,
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {snappy = 1, rail = 1, connect_to_raillike = 1, unbreakable = 1, not_in_creative_inventory = maptools.creative},
	mesecons = {
		effector = {
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
			end,

			action_on = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
})

minetest.register_node(":maptools:unbreakable_rail_copper", {
	description = "Unbreakable Copper Rail",
	drawtype = "raillike",
	tiles = {"carts_rail_cp.png", "carts_rail_curved_cp.png", "carts_rail_t_junction_cp.png", "carts_rail_crossing_cp.png"},
	inventory_image = "carts_rail_cp.png",
	wield_image = "carts_rail_cp.png",
	paramtype = "light",
	stack_max = 10000,
	sunlight_propagates = true,
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {rail = 1, connect_to_raillike = 1, unbreakable = 1, not_in_creative_inventory = maptools.creative},

	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
		end
	end,

	mesecons = {
		effector = {
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
			end,

			action_on = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
})

minetest.register_node("maptools:unbreakable_rail_power", {
	description = "Unbreakable Powered Rail",
	drawtype = "raillike",
	tiles = {"carts_rail_pwr.png", "carts_rail_curved_pwr.png", "carts_rail_t_junction_pwr.png", "carts_rail_crossing_pwr.png"},
	inventory_image = "carts_rail_pwr.png",
	wield_image = "carts_rail_pwr.png",
	paramtype = "light",
	stack_max = 10000,
	sunlight_propagates = true,
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {rail = 1, connect_to_raillike = 1, unbreakable = 1, not_in_creative_inventory = maptools.creative},

	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
		end
	end,

	mesecons = {
		effector = {
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
			end,

			action_on = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
})

local chestdef = minetest.registered_nodes["default:chest"]

minetest.register_node("maptools:chest",{
	description = "Chest",
	tiles = chestdef.tiles,
	stack_max = 1000,
	paramtype2 = "facedir",
	on_construct = chestdef.on_construct,
	on_metadata_inventory_move = chestdef.on_metadata_inventory_move,
	on_metadata_inventory_put  = chestdef.on_metadata_inventory_put,
	on_metadata_inventory_take = chestdef.on_metadata_inventory_take,
	groups = {unbreakable = 1, not_in_creative_inventory = 1},
})