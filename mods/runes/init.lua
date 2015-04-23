-- Rune mod by Mg
-- License GPLv3

local modpath = minetest.get_modpath("runes")

-- API first
dofile(modpath.."/api.lua")

-- Then the rune themselves
dofile(modpath.."/registration.lua")

-- And the handlers
dofile(modpath.."/handlers.lua")

minetest.log("action","[runes] Mod loaded")
