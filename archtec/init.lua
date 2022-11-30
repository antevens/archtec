local before = minetest.get_us_time()
local modPath = minetest.get_modpath(minetest.get_current_modname())
local scriptsPath = modPath..DIR_DELIM.."scripts"..DIR_DELIM

archtec = {}

dofile(scriptsPath.."discord_fallback.lua")
--dofile(scriptsPath.."online_players.lua")
dofile(scriptsPath.."notifyTeam.lua")
dofile(scriptsPath.."privs.lua")
dofile(scriptsPath.."userlimit.lua")
dofile(scriptsPath.."stats.lua")
dofile(scriptsPath.."shutdown.lua")
dofile(scriptsPath.."mapfix.lua")
dofile(scriptsPath.."prejoin.lua")
--dofile(scriptsPath.."disallow_new_players.lua")
dofile(scriptsPath.."aliases.lua")
dofile(scriptsPath.."unregister.lua")
dofile(scriptsPath.."spawn.lua")
dofile(scriptsPath.."skybox.lua")
dofile(scriptsPath.."lua_mem.lua")
dofile(scriptsPath.."homedecor_wardrobe.lua")
dofile(scriptsPath.."mvps_stopper.lua")
dofile(scriptsPath.."death_messages.lua")
dofile(scriptsPath.."zipper_detect.lua")
dofile(scriptsPath.."buckets.lua")
dofile(scriptsPath.."redef.lua")
dofile(scriptsPath.."run_lua_code.lua")
dofile(scriptsPath.."idlekick.lua")
dofile(scriptsPath.."shutdown.lua")
dofile(scriptsPath.."discord.lua")
dofile(scriptsPath.."crafting.lua")
dofile(scriptsPath.."df_detect.lua")
dofile(scriptsPath.."overrides.lua")
dofile(scriptsPath.."cheat_log.lua")
dofile(scriptsPath.."playtime.lua")
dofile(scriptsPath.."join_ratelimit.lua")
dofile(scriptsPath.."status.lua")
dofile(scriptsPath.."random_messages.lua")
dofile(scriptsPath.."split_long_msg.lua")
dofile(scriptsPath.."privs_cache.lua")
dofile(scriptsPath.."item_drop.lua")
dofile(scriptsPath.."abm.lua")
dofile(scriptsPath.."first_join.lua")
dofile(scriptsPath.."random_things.lua")
dofile(scriptsPath.."watch.lua")

if minetest.get_modpath("caverealms") then
    dofile(scriptsPath.."caverealms.lua")
end

if minetest.get_modpath("techage") then
    dofile(scriptsPath.."techage.lua")
end

local http = minetest.request_http_api()
if http then
    assert(loadfile(scriptsPath.."/report_webhook.lua"))(http)
end

local http = minetest.request_http_api()
if http then
    assert(loadfile(scriptsPath.."/geoip.lua"))(http)
end

dofile(scriptsPath.."pairs_by_key.lua")
dofile(scriptsPath.."count_objects.lua")
dofile(scriptsPath.."instrument_mod.lua")

local after = minetest.get_us_time()

print("Archtec: loaded. Loading took " .. (after - before) / 1000 .. " ms")