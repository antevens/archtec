local function move_to_spawn(name)
	local player = minetest.get_player_by_name(name)
	if player ~= nil then
		player:set_pos({x = 236.5, y = 17, z = -2033.5})
	end
end

local function move_to_old_spawn(name)
	local player = minetest.get_player_by_name(name)
	if player ~= nil then
		player:set_pos({x = 325, y = 12, z = 1120})
	end
end

minetest.register_chatcommand("spawn", {
	description = "Teleport to spawn",
	privs = {interact = true},
	func = move_to_spawn
})
archtec.register_chatcommand_alias("spawn", "s")

minetest.register_chatcommand("spawn_old", {
	description = "Teleport to old spawn",
	privs = {interact = true},
	func = move_to_old_spawn
})
archtec.register_chatcommand_alias("spawn_old", "s_o")