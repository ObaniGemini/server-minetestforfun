minetest.log("action", "[BobBlocks By minetest@rabbibob.com] Version 0.0.8 loading....")
dofile(minetest.get_modpath("bobblocks") .. "/blocks.lua")
minetest.log("action", "[BobBlocks] loaded Blocks")
dofile(minetest.get_modpath("bobblocks") .. "/health.lua")
minetest.log("action", "[BobBlocks] loaded Health")
dofile(minetest.get_modpath("bobblocks") .. "/trap.lua")
minetest.log("action", "[BobBlocks] loaded Traps")
minetest.log("action", "[BobBlocks By minetest@rabbibob.com] Version 0.0.8 loaded!")