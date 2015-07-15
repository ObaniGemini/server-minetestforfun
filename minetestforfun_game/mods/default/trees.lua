--
-- Grow trees
--

local random = math.random

local function can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	return true
end

-- Sapling ABMs

minetest.register_abm({
	nodenames = {"default:sapling"},
	interval = 10,
	chance = 50,
	action = function(pos, node)
		if not can_grow(pos) then
			return
		end

		minetest.log("action", "A sapling grows into a tree at "..
				minetest.pos_to_string(pos))
		default.grow_tree(pos, random(1, 4) == 1)
	end
})

minetest.register_abm({
	nodenames = {"default:junglesapling"},
	interval = 11,
	chance = 50,
	action = function(pos, node)
		if not can_grow(pos) then
			return
		end

		minetest.log("action", "A jungle sapling grows into a tree at "..
				minetest.pos_to_string(pos))
		default.grow_jungle_tree(pos)
	end
})

minetest.register_abm({
	nodenames = {"default:pine_sapling"},
	interval = 12,
	chance = 50,
	action = function(pos, node)
		if not can_grow(pos) then
			return
		end

		minetest.log("action", "A pine sapling grows into a tree at "..
				minetest.pos_to_string(pos))
		default.grow_pine_tree(pos)
	end
})

-- Appletree, jungletree function

local function add_trunk_and_leaves(data, a, pos, tree_cid, leaves_cid,
		height, size, iters, is_apple_tree)
	local x, y, z = pos.x, pos.y, pos.z
	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_apple = minetest.get_content_id("default:apple")

	-- Trunk
	for y_dist = 0, height - 1 do
		local vi = a:index(x, y + y_dist, z)
		local node_id = data[vi]
		if y_dist == 0 or node_id == c_air or node_id == c_ignore
		or node_id == leaves_cid then
			data[vi] = tree_cid
		end
	end

	-- Force leaves near the trunk
	for z_dist = -1, 1 do
	for y_dist = -size, 1 do
		local vi = a:index(x - 1, y + height + y_dist, z + z_dist)
		for x_dist = -1, 1 do
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
			vi = vi + 1
		end
	end
	end

	-- Randomly add leaves in 2x2x2 clusters.
	for i = 1, iters do
		local clust_x = x + random(-size, size - 1)
		local clust_y = y + height + random(-size, 0)
		local clust_z = z + random(-size, size - 1)

		for xi = 0, 1 do
		for yi = 0, 1 do
		for zi = 0, 1 do
			local vi = a:index(clust_x + xi, clust_y + yi, clust_z + zi)
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
		end
		end
		end
	end
end

-- Appletree

function default.grow_tree(pos, is_apple_tree, bad)
	--[[
		NOTE: Tree-placing code is currently duplicated in the engine
		and in games that have saplings; both are deprecated but not
		replaced yet
	--]]
	if bad then
		error("Deprecated use of default.grow_tree")
	end

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(4, 5)
	local c_tree = minetest.get_content_id("default:tree")
	local c_leaves = minetest.get_content_id("default:leaves")

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 1, z = pos.z + 2}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_tree, c_leaves, height, 2, 8, is_apple_tree)

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Jungletree

function default.grow_jungle_tree(pos, bad)
	--[[
		NOTE: Jungletree-placing code is currently duplicated in the engine
		and in games that have saplings; both are deprecated but not
		replaced yet
	--]]
	if bad then
		error("Deprecated use of default.grow_jungle_tree")
	end

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(8, 12)
	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_jungletree = minetest.get_content_id("default:jungletree")
	local c_jungleleaves = minetest.get_content_id("default:jungleleaves")

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 1, z = pos.z + 3}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_jungletree, c_jungleleaves, height, 3, 30, false)

	-- Roots
	for z_dist = -1, 1 do
		local vi_1 = a:index(x - 1, y - 1, z + z_dist)
		local vi_2 = a:index(x - 1, y, z + z_dist)
		for x_dist = -1, 1 do
			if random(1, 3) >= 2 then
				if data[vi_1] == c_air or data[vi_1] == c_ignore then
					data[vi_1] = c_jungletree
				elseif data[vi_2] == c_air or data[vi_2] == c_ignore then
					data[vi_2] = c_jungletree
				end
			end
			vi_1 = vi_1 + 1
			vi_2 = vi_2 + 1
		end
	end

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Pinetree from mg mapgen mod, design by sfan5, pointy top added by paramat

local function add_pine_needles(data, vi, c_air, c_ignore, c_snow, c_pine_needles)
	if data[vi] == c_air or data[vi] == c_ignore or data[vi] == c_snow then
		data[vi] = c_pine_needles
	end
end

local function add_snow(data, vi, c_air, c_ignore, c_snow)
	if data[vi] == c_air or data[vi] == c_ignore then
		data[vi] = c_snow
	end
end

function default.grow_pine_tree(pos)
	local x, y, z = pos.x, pos.y, pos.z
	local maxy = y + random(9, 13) -- Trunk top

	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_pinetree = minetest.get_content_id("default:pinetree")
	local c_pine_needles  = minetest.get_content_id("default:pine_needles")
	local c_snow = minetest.get_content_id("default:snow")
	local c_snowblock = minetest.get_content_id("default:snowblock")
	local c_dirtsnow = minetest.get_content_id("default:dirt_with_snow")

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = x - 3, y = y - 1, z = z - 3},
		{x = x + 3, y = maxy + 3, z = z + 3}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	-- Scan for snow nodes near sapling
	local snow = false
	for yy = y - 1, y + 1 do
	for zz = z - 1, z + 1 do
		local vi  = a:index(x - 1, yy, zz)
		for xx = x - 1, x + 1 do
			local nodid = data[vi]
			if nodid == c_snow
			or nodid == c_snowblock
			or nodid == c_dirtsnow then
				snow = true
			end
			vi  = vi + 1
		end
	end
	end

	-- Upper branches layer
	local dev = 3
	for yy = maxy - 1, maxy + 1 do
		for zz = z - dev, z + dev do
			local vi = a:index(x - dev, yy, zz)
			local via = a:index(x - dev, yy + 1, zz)
			for xx = x - dev, x + dev do
				if random() < 0.95 - dev * 0.05 then
					add_pine_needles(data, vi, c_air, c_ignore, c_snow,
							c_pine_needles)
					if snow then
						add_snow(data, via, c_air, c_ignore, c_snow)
					end
				end
				vi  = vi + 1
				via = via + 1
			end
		end
		dev = dev - 1
	end

	-- Centre top nodes
	add_pine_needles(data, a:index(x, maxy + 1, z), c_air, c_ignore, c_snow,
			c_pine_needles)
	add_pine_needles(data, a:index(x, maxy + 2, z), c_air, c_ignore, c_snow,
			c_pine_needles) -- Paramat added a pointy top node
	if snow then
		add_snow(data, a:index(x, maxy + 3, z), c_air, c_ignore, c_snow)
	end

	-- Lower branches layer
	local my = 0
	for i = 1, 20 do -- Random 2x2 squares of needles
		local xi = x + random(-3, 2)
		local yy = maxy + random(-6, -5)
		local zi = z + random(-3, 2)
		if yy > my then
			my = yy
		end
		for zz = zi, zi+1 do
			local vi = a:index(xi, yy, zz)
			local via = a:index(xi, yy + 1, zz)
			for xx = xi, xi + 1 do
				add_pine_needles(data, vi, c_air, c_ignore, c_snow,
						c_pine_needles)
				if snow then
					add_snow(data, via, c_air, c_ignore, c_snow)
				end
				vi  = vi + 1
				via = via + 1
			end
		end
	end

	local dev = 2
	for yy = my + 1, my + 2 do
		for zz = z - dev, z + dev do
			local vi = a:index(x - dev, yy, zz)
			local via = a:index(x - dev, yy + 1, zz)
			for xx = x - dev, x + dev do
				if random() < 0.95 - dev * 0.05 then
					add_pine_needles(data, vi, c_air, c_ignore, c_snow,
							c_pine_needles)
					if snow then
						add_snow(data, via, c_air, c_ignore, c_snow)
					end
				end
				vi  = vi + 1
				via = via + 1
			end
		end
		dev = dev - 1
	end

	-- Trunk
	for yy = y, maxy do
		local vi = a:index(x, yy, z)
		data[vi] = c_pinetree
	end

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- From BFD:

minetest.register_node("default:mg_cherry_sapling", {
	description = "Impossible to get node.",
	drawtype = "airlike",
	paramtype = "light",
	tiles = {"xfences_space.png"},
	groups = {not_in_creative_inventory=1},
})

local c_mg_cherry_sapling = minetest.get_content_id("default:mg_cherry_sapling")

minetest.register_on_generated(function(minp, maxp, seed)
	if minp.y < -19600 then return end -- no generate in nether
	local timer = os.clock()
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local data = vm:get_data()
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local trees_grown = 0
	for z=minp.z, maxp.z, 1 do
		for y=minp.y, maxp.y, 1 do
			for x=minp.x, maxp.x, 1 do
				local p_pos = area:index(x,y,z)
				local content_id = data[p_pos]
				if content_id == c_mg_cherry_sapling then
					minetest.after(1, default.grow_cherry_tree,
						{x=x, y=y, z=z},
						false,
						"default:cherry_tree",
						"default:cherry_blossom_leaves")
					trees_grown = trees_grown + 1
				else
					-- nope
				end
			end
		end
	end
	local geninfo = string.format(" trees grown after: %.2fs", os.clock() - timer)
	minetest.log("action", trees_grown..geninfo)
end)

function default.grow_cherry_tree(pos, is_apple_tree, trunk_node, leaves_node)
	--[[
		NOTE: Tree-placing code is currently duplicated in the engine
		and in games that have saplings; both are deprecated but not
		replaced yet
	--]]

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(4, 5)
	local c_tree = minetest.get_content_id(trunk_node)
	local c_leaves = minetest.get_content_id(leaves_node)

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 1, z = pos.z + 2}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_tree, c_leaves, height, 2, 8, is_apple_tree)

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

minetest.register_abm({
	nodenames = {"default:cherry_sapling"},
	interval = 80,
	chance = 3,
	action = function(pos, node)

		local nu =  minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local is_soil = minetest.get_item_group(nu, "soil")

		if is_soil == 0 then
			return
		end


		minetest.remove_node({x=pos.x, y=pos.y, z=pos.z})
		default.grow_cherry_tree(pos, false, "default:cherry_tree", "default:cherry_blossom_leaves")
	end,
})

minetest.register_biome({
	name = "cherry_blossom_forest",
	node_shore_filler = "default:sand",
	node_top = "default:grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_dust = "air",
	node_underwater = "default:gravel",
	y_min = 1,
	y_max = 40,
	heat_point = 50,
	humidity_point = 55,
})

minetest.register_biome({
	name = "cherry_blossom_forest_floral",
	node_shore_filler = "default:sand",
	node_top = "default:grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_dust = "air",
	node_underwater = "default:gravel",
	y_min = 1,
	y_max = 40,
	heat_point = 47,
	humidity_point = 50,
})

minetest.register_biome({
	name = "cherry_blossom_forest_grassy",
	node_shore_filler = "default:sand",
	node_top = "default:grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_dust = "air",
	node_underwater = "default:gravel",
	y_min = 1,
	y_max = 42,
	heat_point = 55,
	humidity_point = 55,
})
