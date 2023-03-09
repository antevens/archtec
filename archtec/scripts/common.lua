function archtec.get_target(name, param)
    local target = param:trim()
    if target == "" or target == nil or type(target) ~= "string" then
        target = name
    end
    return target
end

function archtec.is_online(name)
    local player = minetest.get_player_by_name(name)
    if not player then
        return false
    end
    return true
end

function archtec.grant_priv(name, priv)
    local privs = minetest.get_player_privs(name)
    privs[priv] = true
    minetest.set_player_privs(name, privs)
end

function archtec.revoke_priv(name, priv)
    local privs = minetest.get_player_privs(name)
    privs[priv] = nil
    minetest.set_player_privs(name, privs)
end

function core.kick_player(player_name, reason)
    if type(reason) == "string" then
        reason = "Kicked: " .. reason
    else
        reason = "Kicked."
    end
    if archtec.is_online(player_name) then -- xban kicks also offline players
        minetest.chat_send_all(minetest.colorize("#FF0000", player_name .. " got kicked! Reason: " .. reason))
        discord.send(nil, ":bangbang: " .. player_name .. " got kicked! Reason: " .. reason)
    end
    return core.disconnect_player(player_name, reason)
end

function archtec.get_modname_by_itemname(itemname)
    local delimpos = string.find(itemname, ":")
    if delimpos then
        return string.sub(itemname, 1,  delimpos - 1)
    else
        return nil
    end
end
