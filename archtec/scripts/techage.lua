if not minetest.get_modpath("techage") then return end
local S = archtec.S

local old_on_place = minetest.registered_nodes["techage:forceload"].on_place or function() end
minetest.override_item("techage:forceload", {
    on_place = function(itemstack, placer, pointed_thing)
        local pname = placer:get_player_name()

        if not minetest.check_player_privs(pname, "forceload") then
            minetest.chat_send_player(pname, minetest.colorize("#FF0000", S("[Forceload Restriction]: 'forceload' priv required to use this node")))
            return
        else
            return old_on_place(itemstack, placer, pointed_thing)
        end
    end
})

local old_on_place = minetest.registered_nodes["techage:forceloadtile"].on_place or function() end
minetest.override_item("techage:forceloadtile", {
    on_place = function(itemstack, placer, pointed_thing)
        local pname = placer:get_player_name()

        if not minetest.check_player_privs(pname, "forceload") then
            minetest.chat_send_player(pname, minetest.colorize("#FF0000", S("[Forceload Restriction]: 'forceload' priv required to use this node")))
            return
        else
            return old_on_place(itemstack, placer, pointed_thing)
        end
    end
})

local old_on_place = minetest.registered_nodes["techage:ta3_drillbox_pas"].on_place or function() end
minetest.override_item("techage:ta3_drillbox_pas", {
    on_place = function(itemstack, placer, pointed_thing)
        local pname = placer:get_player_name()

        if not minetest.check_player_privs(pname, "forceload") then
            archtec.grant_priv(pname, "forceload")
            minetest.chat_send_player(pname, minetest.colorize("#00BD00", S("Congratulations! You have been granted the 'forceload' privilege")))
            notifyTeam("[techage] Granted '" .. pname .. "' the 'forceload' priv")
            return old_on_place(itemstack, placer, pointed_thing)
        else
            return old_on_place(itemstack, placer, pointed_thing)
        end
    end
})

-- fix flowers. thx ethereal...
local flowers = {
    "flowers:rose",
    "flowers:tulip",
    "flowers:dandelion_yellow",
    "flowers:chrysanthemum_green",
    "flowers:geranium",
    "flowers:viola",
    "flowers:dandelion_white",
    "flowers:tulip_black",
    "flowers:mushroom_brown",
    "flowers:mushroom_red"
}

minetest.after(1, function()
    for _, flowers in pairs(flowers) do
        techage.register_flower(flowers)
        signs_bot.register_flower(flowers)
    end
end)

-- Disable titanium drops
techage.register_ore_for_gravelsieve("titanium:titanium", 99999)