unused_args = false
allow_defined_top = true

ignore = {
	"431", -- Shadowing an upvalue
	"432", -- Shadowing an upvalue argument
	"411", -- Redefining a local variable
}

globals = {
	"archtec",
	"notifyTeam",
	"archtec_pvp",
	"archtec_teleport",
	"vote",
	"archtec_vpn_blocker",
	"player_api",
	"ranks",
	"biome_lib",
	"stairs",
	"choppy",
	"archtec_matterbridge",
	"discord"
}

read_globals = {
	"core",
	"DIR_DELIM",
	"dump",
	"dump2",
	"minetest",
	"xban",
	"homedecor",
	"vector",
	"mesecon",
	"unified_inventory",
	"default",
	"techage",
	"signs_bot",
	"auroras",
	"font_api",
	"anvil",
	"unifieddyes",
	"ItemStack",
	"mtt",

	string = {fields = {"split"}},
	table = {fields = {"copy"}},
}

files["archtec/scripts/status.lua"] = {
	globals = { "minetest.get_server_status" },
}

files["archtec_pvp/pvp.lua"] = {
	globals = { "minetest.calculate_knockback" },
}

files["archtec/scripts/privs_cache.lua"] = {
	globals = { "minetest.set_player_privs", "minetest.get_player_privs" },
}

files["stamina/init.lua"] = {
	globals = { "minetest.do_item_eat" },
}

files["archtec/scripts/mvps_stopper.lua"] = {
	globals = { "mesecon" },
}

files["archtec_matterbridge/tx.lua"] = {
	globals = { "minetest.send_join_message", "minetest.send_leave_message" },
}

files["archtec_matterbridge/rx.lua"] = {
	globals = { "minetest.chat_send_player" },
}

files["archtec/scripts/common.lua"] = {
	globals = { "core.kick_player" },
}

files["archtec/scripts/overrides.lua"] = {
	globals = { "minetest.registered_entities" },
}