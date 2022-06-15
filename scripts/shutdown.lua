local function requestShutdown(playerName, params)
    minetest.chat_send_all(minetest.colorize("#FF0000", (playerName.." möchte den Server in 10 Sekunden Herunterfahren")))
    minetest.sound_play("teleport.ogg")
    minetest.after(10, function()
        minetest.request_shutdown("Please click 'Reconect' in 1 minute.",true,0)
    end)
    minetest.log("warning", "/sd command used! The server shuts down")
end

minetest.register_chatcommand("sd", {
    description = "Shuts the server down.",
    privs = { server = true },
    func = requestShutdown
})
